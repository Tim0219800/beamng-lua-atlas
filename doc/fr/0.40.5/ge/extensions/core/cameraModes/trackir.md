# `core_cameraModes_trackir`

*Fichier : `lua/ge/extensions/core/cameraModes/trackir.lua` · VM : Game Engine (GE) · 67 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/trackir")` (fichier sous extensions/ mais pas une extension classique)

Filtre global (runningOrder 0.5) qui applique le suivi de tête TrackIR : décale la position (nx, ny, nz * 0.00005) et tourne la caméra (yaw, pitch, roll * 0.01 degré). S'initialise via TrackIR.init()/start() ; sans TrackIR disponible, il ne fait rien. Désactivé pendant une session OpenXR. Renvoie un constructeur.

## Classe `C`

Filtre TrackIR. Champ working : vrai si TrackIR a pu démarrer.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_trackir")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Marque le mode global/filtre/masqué et démarre TrackIR s'il est disponible. | 20 |
| `C:update(data)` | Lit TrackIR.getData et applique translation et rotation à data.res. | 39 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/trackir.lua`.*
