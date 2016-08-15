-- luacheck: globals data

do--sandbox

  local isWire = { ['blue-wire'] = true, ['radio-wire-pack'] = true }

  local function add( recipe )
    local count = table.remove( recipe, 1 )
    local id    = table.remove( recipe, 1 )

    if id ~= 'blue-wire' then id = 'radio-'..id end

    data:extend {{
      type         = 'recipe',
      name         = id,
      enabled      = false,
      category     = "crafting",
      ingredients  = recipe,
      result       = id,
      result_count = count,
      requester_paste_multiplier = isWire[id] and 10 or nil
    }}

    return add
  end

  add { 1, 'blue-wire', -- for wire packs and mux signal wires
        { 'copper-cable'      , 1   };
        { 'plastic-bar'       , 1   };
      }
      { 1, 'wire-pack', -- common ingredient for RF recipes
        { 'copper-cable'      , 1   };
        { 'red-wire'          , 1   };
        { 'green-wire'        , 1   };
      }
      { 1, 'mast-guide', -- guy ropes for masts
        { 'iron-stick'        , 20  };
        { 'iron-plate'        , 2   };
      }
      { 1, 'mast-antenna', -- antennae for masts
        { 'copper-cable'      , 10  };
        { 'small-lamp'        , 1   };
      }
      { 1, 'mast-segment', -- segment for masts
        { 'radio-mast-antenna', 1   };
        { 'iron-stick'        , 16  };
        { 'iron-plate'        , 4   };
        { 'steel-plate'       , 1   };
      }
      { 1, 'main-mast', -- main radio mast (transmit & receive)
        { 'radio-mast-segment', 3   };
        { 'electronic-circuit', 2   };
        { 'concrete'          , 12  };
        { 'radio-mast-guide'  , 8   };
      }
      { 1, 'small-mast', -- smaller radio mast (receive only)
        { 'radio-mast-segment', 2   };
        { 'electronic-circuit', 1   };
        { 'stone-brick'       , 4   };
        { 'radio-mast-guide'  , 4   };
      }
      { 1, 'modulator', -- phase modulator module for radio mast
        { 'radio-wire-pack'   , 1   };
        { 'electronic-circuit', 1   };
      }
      { 1, 'digital', -- digital radio module for radio mast
        { 'radio-wire-pack'   , 4   };
        { 'advanced-circuit'  , 1   };
        { 'plastic-bar'       , 2   };
        { 'iron-stick'        , 2   };
      }
      { 1, 'mux', -- multiplexes several circuits in to a single curcuit
        { 'radio-wire-pack'   , 4   };
        { 'electronic-circuit', 1   };
        { 'plastic-bar'       , 1   };
        { 'iron-plate'        , 2   };
      }
      { 1, 'demux', -- opposite of mux
        { 'radio-wire-pack'   , 4   };
        { 'advanced-circuit'  , 1   };
        { 'plastic-bar'       , 1   };
        { 'iron-plate'        , 2   };
      }
      { 1, 'wifi-wan', -- wifi network module for radio mast
        { 'radio-wire-pack'   , 4   };
        { 'iron-stick'        , 8   };
        { 'iron-plate'        , 4   };
        { 'plastic-bar'       , 4   };
        { 'processing-unit'   , 1   };
      }
      { 1, 'wifi-hub', -- wire circuit <--> wifi gateway
        { 'radio-wire-pack'   , 6   };
        { 'processing-unit'   , 1   };
        { 'plastic-bar'       , 1   };
        { 'iron-plate'        , 1   };
      }
      { 1, 'wifi-card', -- module that connects parent to wifi network
        { 'radio-wire-pack'   , 2   };
        { 'advanced-circuit'  , 1   };
        { 'plastic-bar'       , 1   };
      }
      { 1, 'encrypt', -- encryption module for radio masts and receivers
        { 'radio-wire-pack'   , 2   };
        { 'advanced-circuit'  , 1   };
        { 'processing-unit'   , 2   };
      }
      { 5, 'geodesic', -- pack of panels for a geodesic dome
        { 'iron-stick'        , 30  };
        { 'iron-plate'        , 2   };
        { 'plastic-bar'       , 15  };
      }
      { 1, 'snooping', -- snooping building
        { 'radio-geodesic'    , 50  };
        { 'radio-wire-pack'   , 6   };
        { 'advanced-circuit'  , 3   };
        { 'processing-unit'   , 1   };
        { 'small-lamp'        , 2   };
      }
      { 1, 'passive', -- passive module for snoopers
        { 'radio-wire-pack'   , 2   };
        { 'advanced-circuit'  , 1   };
        { 'processing-unit'   , 2   };
      }
      { 1, 'decrypt', -- decryption module for snoopers
        { 'radio-wire-pack'   , 10  };
        { 'advanced-circuit'  , 4   };
        { 'processing-unit'   , 8   };
      }

end--sandbox
