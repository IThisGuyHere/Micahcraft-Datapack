$execute if items entity @s armor.$(slot) *[minecraft:custom_data~{mk_hidden:false}] run return fail
tag @s add mk.invisible_armor.active
$execute summon item_display run function micahcraft:events/invisible_armor/show/summon {slot:'$(slot)'}
tag @s remove mk.invisible_armor.active