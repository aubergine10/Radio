-- luacheck: globals data

do--sandbox

  local placeable = {}

  local function add( item )
    local name, subgroup, stack, order = unpack( item )
    local id = name == 'blue-wire' and name or 'radio-'..name

    data:extend {{
      type         = 'item',
      name         = id,
      icon         = '__radio__/graphics/item/'..name..'.png',
      flags        = { 'goes-to-quickbar' },
      subgroup     = subgroup,
      order        = order,
      place_result = placeable[id] and id or nil,
      stack_size   = stack
    }}

    return add
  end

  add { 'blue-wire'    , 'circuit-network' , 200, 'a[wires]-c[blue-wire]' } -- blue (multiplex) wire
      { 'wire-pack'    , 'circuit-network' , 30 , 'a[wires]-d[wire-pack]' } -- red and green wire combo
      { 'mast-guide'   , 'circuit-network' , 10  } -- support wires for masts
      { 'mast-antenna' , 'circuit-network' , 5   } -- antenna for masts
      { 'mast-segment' , 'circuit-network' , 3   } -- segment of a mast
      { 'main-mast'    , 'circuit-network' , 2   } -- main radio mast
      { 'small-mast'   , 'circuit-network' , 3   } -- receive-only mast
      { 'modulator'    , 'module'          , 5   } -- for masts
      { 'digital'      , 'module'          , 10  } -- for masts and snoopers
      { 'mux'          , 'circuit-network' , 15  } -- muliplex circuits in to single circuit
      { 'demux'        , 'circuit-network' , 15  } -- opposite of mux
      { 'wifi-wan'     , 'module'          , 5   } -- for main mast
      { 'wifi-hub'     , 'circuit-network' , 10  } -- wire <--> wifi gateway
      { 'wifi-card'    , 'module'          , 50  } -- wifi-enable any entity that takes modules
      { 'encrypt'      , 'module'          , 25  } -- for masts
      { 'geodesic'     , 'circuit-network' , 40  } -- geodesic panels
      { 'snooping'     , 'circuit-network' , 1   } -- snooper building
      { 'passive'      , 'module'          , 25  } -- for snooper and masts
      { 'decrypt'      , 'module'          , 25  } -- for snooper and receiver mast

end--sandbox