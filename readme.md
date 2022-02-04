# orichalcum
This is Chinchow's orichalcum mod for Minetest. This repo preserves versions that aren't gone forever as separate commits.

Authors: (c) 2013 Chinchow, (c) 2022 Poikilos

License: See license.txt (The original license said I could do whatever I want, and I want to change the license to a legally-viable license.)


## Differences in Poikilos' fork:
- There is a better license (See parenthesis after "License:" above for why it is allowable).
- Unused textures are in "projects" instead of textures so they aren't transferred to the client and don't cause confusion for developers (see "Developer Notes").
- There is a [changelog](changelog.md).


## Developer Notes
(Poikilos)

### Testing

#### Ore generation

(exposed: the ore is exposed to air without digging)

##### Seed: orichalcum
- tested using amhi_game

Conclusions:
- In the last Chinchow version (4), orichalcum ore is about as rare as diamond or possibly less rare, so the rarity is pretty good (but maybe it should be more rare than diamond).
- See also "Remove ore generation" under "Planning".

Samples:
- mapgen type: Carpathian
- mese: near -7,-1000,43 (rare, none found easily near y=-150)
- gold: near -7,-1008,-2 (somewhat rare, none found easily near y=-150)
- cave 1: (large, but near bottom so look up) -7,-1008,79
  - copper: near -29,-1017,76 (somewhat rare, not found until went in cave 1 but exposed)
  - diamond: near -16,-1014,72 (rare, found only after digging inside cave 1 but there is some exposed after exploring thoroughly)
  - orichalcum: (somewhat rare, not found until went in cave 1, more after exploring thoroughly, exposed in all cases below)
    - near -15,-1012,74
    - near 13,-1101,66
    - near 31,-1093,67
    - near 24,-1077,74
    - near 39,-1070,28
  - mese crystal: near 23,-1064,79 (very rare, not found until explored cave 1 thoroughly)

### Planning

#### Remove ore generation
Removing ore generation is planned since the material is an alloy according to recently discovered ingot (IRL) that match the description of orichalcum.
- <https://www.ancient-origins.net/myths-legends-europe/orichalcum-legendary-metal-atlantis-or-just-common-ore-003318>
  - "mixture of copper and zinc, with small traces of nickel and iron"
- Add a recipe first (consider requiring an alloy furnace).
  - Consider making the recipe optional in case the only way to get it is through story-based means (or more generally, drops from rare/boss mobs).

#### Corrupt versions
(deferred)
- Chinchow appeared to have been planning corrupt versions (See "*corrupt*" moved to the projects folder).

#### 32x32 versions
(deferred)
- Chinchow appeared to have been planning 32x32 versions (See "orichalcum_pick (2).png" moved to the projects folder).
