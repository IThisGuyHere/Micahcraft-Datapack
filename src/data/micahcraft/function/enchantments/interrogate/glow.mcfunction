execute if data entity @s active_effects[{id:"minecraft:glowing",amplifier:1b}] \
    run effect give @e[type=#micahcraft:hostile,distance=..8] glowing 5 0 true
execute if data entity @s active_effects[{id:"minecraft:glowing",amplifier:2b}] \
    run effect give @e[type=#micahcraft:hostile,distance=..16] glowing 10 0 true
execute if data entity @s active_effects[{id:"minecraft:glowing",amplifier:3b}] \
    run effect give @e[type=#micahcraft:hostile,distance=..24] glowing 15 0 true