-- luacheck: globals data

do--sandbox

  local sub = 'vs-radio' -- subgroup id
  local ord = 'z['..sub..']' -- subgroup order

  data:extend {{
    type  = 'item-subgroup',
    group = 'signals', -- parent group
    name  = sub,
    order = ord
  }}

  local function add( signal )
    local name, image, pos = unpack( signal )
    data:extend {{
      type     = 'virtual-signal',
      name     = name,
      icon     = '__radio__/graphics/signal/'..image..'.png',
      subgroup = sub,
      order    = ord..'-'..pos -- item order
    }}
    return add
  end

      -- from snoopers and masts
  add { 'radio_masts'   ; '_mast'      ; 'a' } -- hold: number of connected masts
      { 'radio±masts'   ; 'mast'       ; 'b' } -- pulse: ± delta since last update

      { 'radio_radar'   ; '_radar'     ; 'c' } -- hold: number of detected radars
      { 'radio±radar'   ; 'radar'      ; 'd' } -- pulse: ± delta since last update

      -- from masts only
      { 'radio_wifi'    ; '_wifi'      ; 'e' } -- hold: number of connected wifi devices
      { 'radio±wifi'    ; 'wifi'       ; 'f' } -- pulse: ± delta since last update

      { 'radio_snoop'   ; '_snooper'   ; 'g' } -- hold: number of detected snoopers
      { 'radio±snoop'   ; 'snooper'    ; 'h' } -- pulse: ± delta since last update

      -- from snoopers only
      { 'radio_phase'   ; '_phase'     ; 'i' } -- hold: enemy using phase modulation
      { 'radio_digital' ; '_digital'   ; 'j' } -- hold: enemy using digital radio
      { 'radio_encrypt' ; '_encrypt'   ; 'k' } -- hold: enemy using encryption

      { 'radio_peek'    ; '_espionage' ; 'l' } -- pulse: espionage attempt (0 = fail, 1 = success)

end--sandbox