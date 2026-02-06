$item replace entity @s container.0 from entity @p[tag=mk.invisible_armor.active] armor.$(slot)
data modify entity @s item.components.'minecraft:custom_data'.mk_hidden set value false
data remove entity @s item.components.'minecraft:equippable'
data modify entity @s item.components.'minecraft:equippable' set from entity @s item.components.'minecraft:custom_data'.mk_equippable
data remove entity @s item.components.'minecraft:custom_data'.mk_equippable
$item replace entity @p[tag=mk.invisible_armor.active] armor.$(slot) from entity @s container.0
function micahcraft:util/remove