# `simpleload`

*Fichier : `lua/console/simpleload.lua` · VM : Console · 7 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("simpleload")`

Script de test de la console : il supprime tous les objets (BeamEngine:deleteAllObjects) puis fait apparaître le véhicule vehicles/pickup à l'origine (BeamEngine:spawnObject(1, ..., nil, vec3(0,0,0))). Rien n'est exporté.

## Appels vers le moteur (C++)

- `BeamEngine:` `deleteAllObjects`, `spawnObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/console/simpleload.lua`.*
