execute align xyz positioned ~0.5 ~0.5 ~0.5 \
    run summon marker ~ ~ ~ {Tags:[mk.misc.glowing,Fresh]}
scoreboard players set @n[type=marker,tag=Fresh] mk.misc.lifetime 15
execute as @n[type=marker,tag=Fresh] at @s run kill @e[type=marker,tag=mk.misc.glowing,tag=!Fresh,distance=0..0.2]
tag @n[type=marker,tag=Fresh] remove Fresh