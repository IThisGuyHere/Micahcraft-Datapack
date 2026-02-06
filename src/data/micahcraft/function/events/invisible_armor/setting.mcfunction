execute unless data storage micahcraft:api/settings {namespace:'world'} run return fail
execute store result score #mk.test mk.math run data get storage micahcraft:api/settings flag
execute unless score #mk.test mk.math matches 8..16 run return fail
function micahcraft:events/invisible_armor/update