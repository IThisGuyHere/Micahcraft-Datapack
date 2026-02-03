from beet import Context
import json
from urllib.request import urlopen
from typing import cast

from pydantic import BaseModel, RootModel, ConfigDict, Field


class MinecraftMeta:
    _version: str
    _item_ids: list[str] | None
    _block_information: dict[str, Block] | None

    def __init__(self, ctx: Context):
        self._version = ctx.minecraft_version
        self._item_ids = None
        self._block_information = None

    def item_ids(self) -> list[str]:
        if self._item_ids is not None:
            return self._item_ids
        else:
            url = f"https://raw.githubusercontent.com/misode/mcmeta/refs/tags/{self._version}-registries/item/data.min.json"
            with urlopen(url) as r:
                self._item_ids = cast(list[str], json.load(r))
            return self._item_ids

    def block_information(self) -> dict[str, Block]:
        if self._block_information is not None:
            return self._block_information
        else:
            url = f"https://raw.githubusercontent.com/mcbookshelf/mcdata/refs/tags/v1/{self._version}/blocks/data.min.json"
            with urlopen(url) as r:
                self._block_information = BlocksData.model_validate(json.load(r)).root
            return self._block_information



AABB = tuple[float, float, float, float, float, float]


class Sounds(BaseModel):
    model_config = ConfigDict(extra="forbid", populate_by_name=True)

    break_: str = Field(alias="break")
    fall: str
    hit: str
    place: str
    step: str

class State(BaseModel):
    model_config = ConfigDict(extra="forbid")

    luminance: int
    is_conductive: bool
    is_spawnable: bool
    shape: list[AABB]
    collision_shape: list[AABB]
    properties: dict[str, str]


class Block(BaseModel):
    model_config = ConfigDict(extra="forbid")

    item: str
    can_occlude: bool
    has_shape_offset: bool
    has_visual_offset: bool
    ignited_by_lava: bool

    blast_resistance: float
    friction: float
    hardness: float
    jump_factor: float
    speed_factor: float

    instrument: str
    sounds: Sounds
    default_properties: dict[str, str]
    possible_properties: dict[str, list[str]]
    states: list[State]


class BlocksData(RootModel[dict[str, Block]]):
    pass