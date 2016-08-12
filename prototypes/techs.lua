--luacheck: globals data

do--sandbox

  local function add( tech )
    local name, parent, packs, recipe, order = unpack( tech )

    if recipe then
      recipe = { { type = 'unlock-recipe', recipe = 'recipe-radio-'..recipe } }
    end

    recipe = nil

    parent = parent and {'radio-'..parent} or {'circuit-network'}

    data:extend {{
      type = 'technology',
      name = 'radio-'..name,
      icon = '__radio__/graphics/tech/'..name..'.png',
      icon_size = 128,
      prerequisites = parent,
      effects = recipe,
      unit = {
        count = packs,
        ingredients = {
          {'science-pack-1', 1},
          {'science-pack-2', 1}
        },
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

  -- note: num science packs must be >= 40

  add { 'mast'        ,  nil        , 40  , 'mast'      ; 'a-d-e'       }
      { 'phase'       , 'mast'      , 50  , 'modulator' ; 'a-d-e-a'     }
      { 'digital'     , 'phase'     , 60  , 'digital'   ; 'a-d-e-a-a'   }
      { 'wifi'        , 'digital'   , 100 , 'wifi'      ; 'a-d-e-a-a-a' }
      { 'advanced'    , 'digital'   , 80  ,  nil        ; 'a-d-e-a-a-b' }
      { 'encrypt'     , 'digital'   , 150 , 'encrypt'   ; 'a-d-e-a-a-c' }
      { 'snooping'    , 'mast'      , 50  , 'snooping'  ; 'a-d-e-b'     }
      { 'triangulate' , 'snooping'  , 100 ,  nil        ; 'a-d-e-b-a'   }
      { 'espionage'   , 'snooping'  , 80  ,  nil        ; 'a-d-e-b-b'   }
      { 'passive'     , 'espionage' , 100 , 'passive'   ; 'a-d-e-b-b-a' }
      { 'decrypt'     , 'espionage' , 150 , 'decrypt'   ; 'a-d-e-b-b-b' }

end--sandbox