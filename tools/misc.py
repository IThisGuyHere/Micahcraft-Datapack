from beet import Context, ItemTag
from tools.logger import Logger
from tools.meta.minecraft import MinecraftMeta
from collections import defaultdict

humanoid_slots = ("head", "chest", "legs", "feet")


def beet_default(ctx: Context):
    with ctx.inject(Logger).push("misc") as logger:
        minecraft_meta = ctx.inject(MinecraftMeta)
        equipment = {
            key: value
            for key, value in minecraft_meta.item_information().items()
            if value.get("minecraft:equippable") is not None
            and value["minecraft:equippable"]["slot"] in humanoid_slots
            and value["minecraft:equippable"].get("equip_sound") is not None
        }
        tags: defaultdict[str, set] = defaultdict(set)
        for item, components in equipment.items():
            equip_sound = components["minecraft:equippable"]["equip_sound"]
            simple_name = equip_sound.split("_")[-1]
            item_id = f"minecraft:{item}"
            tags[simple_name].add(item_id)
            tags["any"].add(item_id)
        for name, items in tags.items():
            ctx.data[f"micahcraft:equip_sound/{name}"] = ItemTag({"replace": False, "values": sorted(items)})
        logger.info(f"{len(tags)} equipment sound tags")