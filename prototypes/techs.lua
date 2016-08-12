--luacheck: globals data

do--sandbox

  -- science pack requirements
  local basic    = { {'science-pack-1', 1}, {'science-pack-2', 1} }
  local advanced = { {'science-pack-1', 2}, {'science-pack-2', 2},  {'science-pack-3', 1} }

  local function add( tech )
    local name, parent, packs, recipe, order = unpack( tech )

    if recipe then
      if type( recipe ) == 'string' then recipe = { recipe } end
      for i=1, #recipe do
        recipe[i] = { type = 'unlock-recipe', recipe = 'radio-'..recipe[i] }
      end
    end

    if type( parent ) ~= 'table' then
      parent = parent and { 'radio-'..parent } or { 'circuit-network' }
    end

    data:extend {{
      type = 'technology',
      name = 'radio-'..name,
      icon = '__radio__/graphics/tech/'..name..'.png',
      icon_size = 128,
      prerequisites = parent,
      effects = recipe,
      unit = {
        count = packs >= 150 and math.floor( packs/2 ) or packs,
        ingredients = packs >= 150 and advanced or basic,
        time = math.floor( 15 * packs/40 )
      },
      order = order,
    }}

    return add
  end

  -- masts: enables radio masts
    -- phase: phase modulation module = reduce packet loss & make snooping harder
      -- digital: packet naming, packet splitter, reduces packet loss
        -- wifi: transmit/receive signals in range of mast via wifi
        -- advanced: stop packet loss, additional module slot
        -- encrypt: make snooping very difficult
    -- snooping: snooping station, detect enemy RF sources
      -- triangulate: expose location of enemy RF sources
      -- espionage: log module = record enemy packets, extra module slot
        -- decrypt: decrypt module = allow some decryption
        -- passive: passive module = make snooper impossible to detect

  -- advanced prerequisites
  local toDigital = { 'radio-phase'     , 'advanced-electronics' }
  local forSpying = { 'radio-espionage' , 'advanced-electronics' }

  -- extended effects
  local masts   = { 'mast', 'receiver' }
  local digital = { 'digital', 'splitter' }
  local wifi    = { 'wifi-wan', 'wifi-hub', 'wifi-card' }

  add { 'mast'        ,  nil        , 40  ,  masts      ; 'a-d-e'       }
      { 'phase'       , 'mast'      , 50  , 'modulator' ; 'a-d-e-a'     }
      { 'digital'     ,  toDigital  , 75  ,  digital    ; 'a-d-e-a-a'   }
      { 'wifi'        , 'digital'   , 100 ,  wifi       ; 'a-d-e-a-a-a' }
      { 'advanced'    , 'digital'   , 80  ,  nil        ; 'a-d-e-a-a-b' }
      { 'encrypt'     , 'digital'   , 150 , 'encrypt'   ; 'a-d-e-a-a-c' }
      { 'snooping'    , 'mast'      , 50  , 'snooping'  ; 'a-d-e-b'     }
      { 'triangulate' , 'snooping'  , 100 ,  nil        ; 'a-d-e-b-a'   }
      { 'espionage'   , 'snooping'  , 80  ,  nil        ; 'a-d-e-b-b'   }
      { 'passive'     ,  forSpying  , 100 , 'passive'   ; 'a-d-e-b-b-a' }
      { 'decrypt'     ,  forSpying  , 150 , 'decrypt'   ; 'a-d-e-b-b-b' }

end--sandbox