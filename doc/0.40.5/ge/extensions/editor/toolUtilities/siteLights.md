# `editor_toolUtilities_siteLights`

*Fichier : `lua/ge/extensions/editor/toolUtilities/siteLights.lua` · VM : Game Engine (GE) · 162 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_siteLights` : `extensions.load("editor_toolUtilities_siteLights")`, puis la globale `editor_toolUtilities_siteLights`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_siteLights.apply(obj, lt)` | Point an existing light at a record. `lt` is { px, py, pz, glow or col, brightness, radius } for a bulb, plus<br>{ dx, dy, dz, cone } for a flood; the class (PointLight / SpotLight) is fixed at creation, so it has to match. | 108 |
| `editor_toolUtilities_siteLights.flush()` | Called every frame by each tool that spawns lights. Cheap until something is owed. | 57 |
| `editor_toolUtilities_siteLights.markDirty(obj)` | The environment switches night lights off a scan it caches, and that scan walks every static in the level: seconds, on a<br>built-up map. So a light just spawned (or a lit lens just marked) is not handed to it. Given the object, it is set to the<br>environment's day or night here, and kept in step with it until a rescan takes it in. Without one, the cache is<br>rescanned once the edits have settled -- which a light being deleted does not need: the environment skips one that has gone. | 49 |
| `editor_toolUtilities_siteLights.spawn(folder, name, lt)` | One light object for a record. A nil name leaves it unnamed, which registers ~3 ms faster; the environment's dusk pass<br>keys lights by id, so an unnamed one still switches. A record carrying a direction gets a SpotLight, one without gets a PointLight.<br>A record with `always` is lit day and night (a tunnel is dark at noon) and kept out of all day/night switching. | 135 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `TONES` | table | Public interface. |

## Appels vers le moteur (C++)

- `core_environment.` `getLightState`, `refreshnightLightsObjects`
- `obj:` `getField`, `isSubClassOf`, `postApply`, `preApply`, `registerObject`, `setField`, `setLightEnabled`, `setPosition`, `updateInstanceRenderData`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/siteLights.lua`.*
