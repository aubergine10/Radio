-- luacheck: globals data

do--sandbox

  local function add( item )
    local name, subgroup, stack = unpack( item )
    local id = 'radio-'..name

    data:extend {{
      type         = 'item',
      name         = id,
      icon         = '__radio__/graphics/item/'..name..'.png',
      flags        = { 'goes-to-quickbar' },
      subgroup     = subgroup,
      -- place_result = id,
      stack_size   = stack
    }}

    return add
  end

  add { 'wire-pack'    , 'circuit-network' , 25 } -- red and green wire combo
      { 'mast-guide'   , 'circuit-network' , 10 } -- support wires for masts
      { 'mast-antenna' , 'circuit-network' , 5  } -- antenna for masts
      { 'mast-segment' , 'circuit-network' , 2  } -- segment of a mast
      { 'mast'         , 'circuit-network' , 2  } -- main radio mast
      { 'receiver'     , 'circuit-network' , 5  } -- radio receiver mast
      { 'modulator'    , 'module'          , 25 } -- for masts
      { 'digital'      , 'module'          , 25 } -- for masts and snoopers
      { 'mux'          , 'circuit-network' , 10 } -- muliplex circuits in to single circuit
      { 'demux'        , 'circuit-network' , 10 } -- opposite of mux
      { 'wifi-wan'     , 'module'          , 5  } -- for main mast
      { 'wifi-hub'     , 'circuit-network' , 10 } -- wire <--> wifi gateway
      { 'wifi-card'    , 'module'          , 25 } -- wifi-enable any entity that takes modules
      { 'encrypt'      , 'module'          , 25 } -- for masts
      { 'snooping'     , 'circuit-network' , 1  } -- snooper building
      { 'passive'      , 'module'          , 25 } -- for snooper
      { 'decrypt'      , 'module'          , 25 } -- for snooper and receiver mast

end--sandbox