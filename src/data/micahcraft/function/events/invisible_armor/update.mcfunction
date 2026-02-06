execute store result score #mk.invisible_armor mk.math run function micahcraft:settings/data/get/basic {namespace:"world",path:"invisible_armor"}
execute store result score #mk.invisible_elytra mk.math run function micahcraft:settings/data/get/basic {namespace:"world",path:"invisible_elytra"}

execute if data entity @s active_effects[{id:"minecraft:invisibility"}] run tag @s add mk.has_invisibility
execute if score #mk.invisible_armor mk.math matches 1 run tag @s[tag=!mk.has_invisibility] add mk.has_invisible_armor
execute if score #mk.invisible_elytra mk.math matches 0 run tag @s[tag=mk.has_invisible_armor] add mk.has_invisible_elytra
tag @s add mk.invisible_armor.update

# Hide
execute unless items entity @s[tag=mk.has_invisible_armor] armor.head *[minecraft:custom_data~{mk_hidden:true}] \
    run function micahcraft:events/invisible_armor/hide/trigger {slot:'head'}
execute unless items entity @s[tag=mk.has_invisible_armor] armor.chest *[minecraft:custom_data~{mk_hidden:true}] \
    unless items entity @s[tag=!mk.has_invisible_elytra] armor.chest elytra \
    run function micahcraft:events/invisible_armor/hide/trigger {slot:'chest'}
execute unless items entity @s[tag=mk.has_invisible_armor,tag=mk.has_invisible_elytra] armor.chest *[minecraft:custom_data~{mk_hidden:true}] \
    run function micahcraft:events/invisible_armor/hide/trigger {slot:'chest'}
execute unless items entity @s[tag=mk.has_invisible_armor] armor.legs *[minecraft:custom_data~{mk_hidden:true}] \
    run function micahcraft:events/invisible_armor/hide/trigger {slot:'legs'}
execute unless items entity @s[tag=mk.has_invisible_armor] armor.feet *[minecraft:custom_data~{mk_hidden:true}] \
    run function micahcraft:events/invisible_armor/hide/trigger {slot:'feet'}

# Show
execute if items entity @s[tag=!mk.has_invisible_armor] armor.head *[minecraft:custom_data~{mk_hidden:true}] \
    run function micahcraft:events/invisible_armor/show/trigger {slot:'head'}
execute if items entity @s[tag=!mk.has_invisible_armor] armor.chest *[minecraft:custom_data~{mk_hidden:true}] \
    run function micahcraft:events/invisible_armor/show/trigger {slot:'chest'}
execute if items entity @s[tag=mk.has_invisible_armor] armor.chest *[minecraft:custom_data~{mk_hidden:true}] \
    if items entity @s[tag=!mk.has_invisible_elytra] armor.chest elytra \
    run function micahcraft:events/invisible_armor/show/trigger {slot:'chest'}
execute if items entity @s[tag=!mk.has_invisible_armor] armor.legs *[minecraft:custom_data~{mk_hidden:true}] \
    run function micahcraft:events/invisible_armor/show/trigger {slot:'legs'}
execute if items entity @s[tag=!mk.has_invisible_armor] armor.feet *[minecraft:custom_data~{mk_hidden:true}] \
    run function micahcraft:events/invisible_armor/show/trigger {slot:'feet'}

tag @s remove mk.invisible_armor.needs_update
tag @s remove mk.invisible_armor.update
tag @s remove mk.has_invisibility
tag @s remove mk.has_invisible_armor
tag @s remove mk.has_invisible_elytra