data modify entity @s view_range set value 0
data modify entity @s text set value [\
    {\
        "translate": "settings.micahcraft.world.trim_particles_enabled"\
    },\
    ": ",\
    {\
        "storage": "micahcraft:settings",\
        "nbt": "display.world.trim_particles_enabled",\
        "interpret": true\
    },\
    "\n",\
    {\
        "translate": "settings.micahcraft.world.trim_particles_self"\
    },\
    ": ",\
    {\
        "storage": "micahcraft:settings",\
        "nbt": "display.world.trim_particles_self",\
        "interpret": true\
    },\
    "\n",\
    {\
        "translate": "settings.micahcraft.world.drop_player_head"\
    },\
    ": ",\
    {\
        "storage": "micahcraft:settings",\
        "nbt": "display.world.drop_player_head",\
        "interpret": true\
    },\
    "\n",\
    {\
        "translate": "settings.micahcraft.world.invisible_armor"\
    },\
    ": ",\
    {\
        "storage": "micahcraft:settings",\
        "nbt": "display.world.invisible_armor",\
        "interpret": true\
    }\
]
execute if score #mk.invisible_armor mk.math matches 1 run function micahcraft:settings/dialogs/resolve/world/invisible_elytra
data modify storage micahcraft:settings _dialog.body[0].contents set from entity @s text
function micahcraft:util/remove
