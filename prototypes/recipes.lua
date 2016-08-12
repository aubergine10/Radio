-- luacheck: globals data

do--sandbox

  local function add( recipe, ... )
    local id = 'radio-'..table.remove( recipe, 1 )

    data:extend {{
      type        = 'recipe',
      name        = id,
      enabled     = false,
      category    = "crafting",
      ingredients = { ... },
      result      = 'copper-cable' -- id
    }}

    return add
  end

  add { 'mast', -- radio mast
        { 'copper-cable'      , 30  };
        { 'electronic-circuit', 2   };
        { 'iron-stick'        , 30  };
        { 'steel-plate'       , 20  };
        { 'concrete'          , 8   };
        { 'small-lamp'        , 3   };
      }
      { 'receiver', -- smaller radio mast (receive only)
        { 'copper-cable'      , 15  };
        { 'electronic-circuit', 1   };
        { 'iron-stick'        , 15  };
        { 'steel-plate'       , 4   };
        { 'stone-brick'       , 4   };
        { 'small-lamp'        , 1   };
      }
      { 'modulator', -- phase modulator module for radio mast
        { 'electronic-circuit', 1   };
      }
      { 'digital', -- digital radio module for radio mast
        { 'electronic-circuit', 1   };
        { 'advanced-circuit'  , 1   };
      }
      { 'splitter', -- signal splitter entity
        { 'electronic-circuit', 1   };
        { 'plastic-bar'       , 1   };
        { 'iron-plate'        , 2   };
        { 'battery'           , 1   };
      }
      { 'wifi-wan', -- wifi network module for radio mast
        { 'advanced-circuit'  , 1   };
        { 'processing-unit'   , 1   };
      }
      { 'wifi-hub', -- wire circuit <--> wifi gateway
        { 'advanced-circuit'  , 1   };
        { 'processing-unit'   , 1   };
        { 'plastic-bar'       , 1   };
        { 'iron-plate'        , 2   };
        { 'battery'           , 1   };
      }
      { 'wifi-card', -- module that connects parent to wifi network
        { 'advanced-circuit'  , 1   };
        { 'copper-cable'      , 1   };
        { 'plastic-bar'       , 1   };
      }
      { 'encrypt', -- encryption module for radio masts and receivers
        { 'advanced-circuit'  , 1   };
        { 'processing-unit'   , 2   };
      }
      { 'snooping', -- snooping building
        { 'green-wire'        , 5   };
        { 'red-wire'          , 5   };
        { 'advanced-circuit'  , 3   };
        { 'processing-unit'   , 1   };
        { 'small-lamp'        , 2   };
      }
      { 'passive', -- passive module for snoopers
        { 'advanced-circuit'  , 1   };
        { 'processing-unit'   , 2   };
      }
      { 'decrypt', -- decryption module for snoopers
        { 'advanced-circuit'  , 1   };
        { 'processing-unit'   , 2   };
      }

end--sandbox
