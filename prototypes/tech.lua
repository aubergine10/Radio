--luacheck: globals data

do--sandbox

  -- science pack requirements
  local basic    = { {'science-pack-1', 1}, {'science-pack-2', 1} }
  local advanced = { {'science-pack-1', 2}, {'science-pack-2', 2},  {'science-pack-3', 1} }

  local function add( tech )
    local name, parent, packs, recipes, order = unpack( tech )

    if recipes then
      if type( recipes ) == 'string' then recipes = { recipes } end
      for i=1, #recipes do
        local recipe = recipes[i]
        if recipe == 'blue-wire' then
          recipes[i] = { type = 'unlock-recipe', recipe = recipe }
        else
          recipes[i] = { type = 'unlock-recipe', recipe = 'radio-'..recipe }
        end
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
      effects = recipes,
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

  -- extended prerequisites
  local forDigital = { 'radio-modulate'  , 'advanced-electronics' }
  local forSpying  = { 'radio-espionage' , 'advanced-electronics' }

  -- extended effects
  local masts    = { 'wire-pack', 'mast-guide', 'mast-antenna', 'mast-segment', 'main-mast', 'small-mast' }
  local digital  = { 'blue-wire', 'digital', 'mux', 'demux' }
  local wifi     = { 'wifi-wan', 'wifi-hub', 'wifi-card' }
  local snooping = { 'geodesic', 'snooping' }

  --    Technology     Prerequisites  Packs  Enable Items
  add { 'network'     ,  nil        , 40  ,  masts      ; 'c-d-c-d-e'       }
      { 'modulate'    , 'network'   , 50  , 'modulator' ; 'c-d-c-d-e-a'     }
      { 'digital'     ,  forDigital , 75  ,  digital    ; 'c-d-c-d-e-a-a'   }
      { 'wifi'        , 'digital'   , 100 ,  wifi       ; 'c-d-c-d-e-a-a-a' }
      { 'advanced'    , 'digital'   , 80  ,  nil        ; 'c-d-c-d-e-a-a-b' }
      { 'encrypt'     , 'digital'   , 150 , 'encrypt'   ; 'c-d-c-d-e-a-a-c' }
      { 'snooping'    , 'network'   , 50  ,  snooping   ; 'c-d-c-d-e-b'     }
      { 'triangulate' , 'snooping'  , 100 ,  nil        ; 'c-d-c-d-e-b-a'   }
      { 'espionage'   , 'snooping'  , 80  ,  nil        ; 'c-d-c-d-e-b-b'   }
      { 'passive'     ,  forSpying  , 100 , 'passive'   ; 'c-d-c-d-e-b-b-a' }
      { 'decrypt'     ,  forSpying  , 150 , 'decrypt'   ; 'c-d-c-d-e-b-b-b' }

end--sandbox