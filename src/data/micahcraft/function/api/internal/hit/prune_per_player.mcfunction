tag @s add mk.prune.active
execute at @s as @e[type=item_display,tag=mk.api.hit,distance=10..] \
    if score @s mk.misc.player.id = @p[tag=mk.prune.active] mk.misc.player.id \
    run function micahcraft:util/remove
tag @s remove mk.prune.active