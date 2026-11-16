# `core_cameraModes_fallback`

*Fichier : `lua/ge/extensions/core/cameraModes/fallback.lua` · VM : Game Engine (GE) · 28 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/fallback")` (fichier sous extensions/ mais pas une extension classique)

Caméra-filtre globale (isGlobal, isFilter, hidden, runningOrder 0.6) qui garantit que data.res.pos et data.res.rot sont définis : si aucune caméra n'a donné de position ou de rotation, elle prend la position du véhicule (data.pos) et la direction vers data.pos. Le module renvoie un constructeur : local cam = require('core/cameraModes/fallback')(options).

## Remarques

- Tous les modes de caméra suivent ce schéma : constructeur renvoyant un objet de classe C avec C:init() et C:update(data) ; data est la table camData construite par core_cameraUpdate (data.res = résultat pos/rot/fov/targetPos/nearClip, data.dt, data.veh, data.pos...).

## Classe `C`

Classe du mode de caméra fallback.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_fallback")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Définit isGlobal=true, runningOrder=0.6, isFilter=true, hidden=true. | 8 |
| `C:update(data)` | Complète data.res.pos et data.res.rot s'ils sont nil. | 15 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/fallback.lua`.*
