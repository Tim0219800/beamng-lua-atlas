# `editor_toolUtilities_triLive`

*Fichier : `lua/ge/extensions/editor/toolUtilities/triLive.lua` · VM : Game Engine (GE) · 271 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_triLive` : `extensions.load("editor_toolUtilities_triLive")`, puis la globale `editor_toolUtilities_triLive`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_triLive.get()` | live instanced tris, distance to the instance centroid, instances drawing, instances placed, shapes still to scan | 254 |
| `editor_toolUtilities_triLive.note(instances)` | Queue any shape in `instances` we have never measured. Cheap enough to call every rebuild. | 130 |
| `editor_toolUtilities_triLive.rescan()` |  | 258 |
| `editor_toolUtilities_triLive.scanStep()` | One shape per call. Called from the editor's own frame, so the cold scan shows as progress rather than as a freeze. | 148 |
| `editor_toolUtilities_triLive.update(instances)` | Total instanced triangles on screen, plus the distance the answer is for. Throttled, since it is a number a human is<br>reading, and walked SLICE instances a frame: a placed town is hundreds of thousands of them, and pricing every one in a<br>single frame four times a second was a frame in every fifteen taking most of a tenth of a second. | 197 |

## Appels vers le moteur (C++)

- `FS:` `stat`
- `scenetree.` `findClassObjects`, `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/triLive.lua`.*
