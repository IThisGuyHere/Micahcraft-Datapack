# Cycles the HUD theme
scoreboard players operation #mk.settings.value mk.math = @s mk.settings.hud
execute store result score #mk.settings.flag mk.math run data get storage micahcraft:settings hud.theme
execute store result score #mk.settings.before_value mk.math run function micahcraft:settings/data/get/hud_theme
scoreboard players operation #mk.settings.after_value mk.math = #mk.settings.before_value mk.math
scoreboard players add #mk.settings.after_value mk.math 1
scoreboard players operation #mk.settings.after_value mk.math %= #5 mk.math

execute store result storage micahcraft:api/settings from int 1 run scoreboard players get #mk.settings.before_value mk.math
execute store result storage micahcraft:api/settings to int 1 run scoreboard players get #mk.settings.after_value mk.math

scoreboard players operation #mk.settings.before_value mk.math *= #mk.settings.flag mk.math
scoreboard players operation #mk.settings.after_value mk.math *= #mk.settings.flag mk.math
scoreboard players operation @s mk.settings.hud -= #mk.settings.before_value mk.math
scoreboard players operation @s mk.settings.hud += #mk.settings.after_value mk.math

data modify storage micahcraft:api/settings namespace set value "hud"
execute store result storage micahcraft:api/settings flag int 1 run scoreboard players get #mk.settings.flag mk.math

function #micahcraft:api/setting_changed