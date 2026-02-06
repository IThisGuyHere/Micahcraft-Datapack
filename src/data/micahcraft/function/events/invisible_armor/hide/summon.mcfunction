$item replace entity @s container.0 from entity @p[tag=mk.invisible_armor.active] armor.$(slot)
# I know I can do an item modifier, but it'd be a "sequence" modifier with exactly the same checks (plus slot checks), this is more readable and scalable imo
data modify entity @s item.components.'minecraft:custom_data'.mk_hidden set value true
data modify entity @s item.components.'minecraft:custom_data'.mk_equippable set from entity @s item.components.'minecraft:equippable'
$data modify entity @s item.components.'minecraft:equippable' set value {slot:'$(slot)',asset_id:'micahcraft:empty'}
execute if items entity @s container.0 #micahcraft:equip_sound/any run function micahcraft:events/invisible_armor/hide/sound
$item replace entity @p[tag=mk.invisible_armor.active] armor.$(slot) from entity @s container.0
function micahcraft:util/remove