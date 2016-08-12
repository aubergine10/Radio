-- luacheck: globals data

do--sandbox

  local function add( recipe )
    local id = 'radio-'..table.remove( recipe, 1 )

    data:extend {{
      type        = 'recipe',
      name        = id,
      enabled     = false,
      category    = "crafting",
      ingredients = recipe,
      result      = id
    }}

    return add
  end

  add { 'wire-pack', -- common ingredient for RF recipes
        { 'red-wire'          , 1   };
        { 'green-wire'        , 1   };
      }
      { 'mast-guide', -- guy ropes for masts
        { 'iron-stick'        , 20  };
        { 'iron-plate'        , 2   };
      }
      { 'mast-antenna', -- antennae for masts
        { 'copper-cable'      , 10  };
        { 'radio-wire-pack'   , 2   };
        { 'small-lamp'        , 1   };
      }
      { 'mast-segment', -- segment for masts
        { 'radio-mast-antenna', 1   };
        { 'iron-stick'        , 16  };
        { 'iron-plate'        , 4   };
        { 'steel-plate'       , 1   };
      }
      { 'mast', -- main radio mast (transmit & receive)
        { 'radio-mast-segment', 3   };
        { 'electronic-circuit', 2   };
        { 'concrete'          , 12  };
        { 'radio-mast-guide'  , 8   };
      }
      { 'receiver', -- smaller radio mast (receive only)
        { 'radio-mast-segment', 2   };
        { 'electronic-circuit', 1   };
        { 'stone-brick'       , 4   };
        { 'radio-mast-guide'  , 4   };
      }
      { 'modulator', -- phase modulator module for radio mast
        { 'radio-wire-pack'   , 1   };
        { 'electronic-circuit', 1   };
      }
      { 'digital', -- digital radio module for radio mast
        { 'radio-wire-pack'   , 1   };
        { 'advanced-circuit'  , 1   };
        { 'processing-unit'   , 1   };
      }
      { 'mux', -- multiplexes several circuits in to a single curcuit
        { 'radio-wire-pack'   , 4   };
        { 'electronic-circuit', 1   };
        { 'plastic-bar'       , 1   };
        { 'iron-plate'        , 2   };
      }
      { 'demux', -- opposite of mux
        { 'radio-wire-pack'   , 4   };
        { 'advanced-circuit'  , 1   };
        { 'plastic-bar'       , 1   };
        { 'iron-plate'        , 2   };
      }
      { 'wifi-wan', -- wifi network module for radio mast
        { 'radio-wire-pack'   , 4   };
        { 'iron-stick'        , 8   };
        { 'iron-plate'        , 4   };
        { 'plastic-bar'       , 4   };
        { 'processing-unit'   , 1   };
      }
      { 'wifi-hub', -- wire circuit <--> wifi gateway
        { 'radio-wire-pack'   , 6   };
        { 'copper-cable'      , 2   };
        { 'advanced-circuit'  , 1   };
        { 'plastic-bar'       , 1   };
        { 'iron-plate'        , 1   };
      }
      { 'wifi-card', -- module that connects parent to wifi network
        { 'radio-wire-pack'   , 2   };
        { 'advanced-circuit'  , 1   };
        { 'copper-cable'      , 1   };
        { 'plastic-bar'       , 1   };
      }
      { 'encrypt', -- encryption module for radio masts and receivers
        { 'radio-wire-pack'   , 2   };
        { 'advanced-circuit'  , 1   };
        { 'processing-unit'   , 2   };
      }
      { 'snooping', -- snooping building
        { 'radio-wire-pack'   , 6   };
        { 'advanced-circuit'  , 3   };
        { 'processing-unit'   , 1   };
        { 'small-lamp'        , 2   };
      }
      { 'passive', -- passive module for snoopers
        { 'radio-wire-pack'   , 2   };
        { 'advanced-circuit'  , 1   };
        { 'processing-unit'   , 2   };
      }
      { 'decrypt', -- decryption module for snoopers
        { 'radio-wire-pack'   , 10  };
        { 'advanced-circuit'  , 4   };
        { 'processing-unit'   , 8   };
      }

end--sandbox
