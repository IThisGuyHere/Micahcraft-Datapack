data modify entity @s text.extra append value "\n"
data modify entity @s text.extra append value {translate:"settings.micahcraft.world.invisible_elytra"}
data modify entity @s text.extra append value ": "
data modify entity @s text.extra append value {storage:"micahcraft:settings",nbt:"display.world.invisible_elytra",interpret:true}
data modify storage micahcraft:settings _dialog.actions append value \
{\
    "label": {\
        "translate": "settings.micahcraft.world.invisible_elytra"\
    },\
    "action": {\
        "type": "run_command",\
        "command": "trigger mk.settings.world.trigger set 16"\
    }\
}