# `core_cameraModes_predictor`

*Fichier : `lua/ge/extensions/core/cameraModes/predictor.lua` · VM : Game Engine (GE) · 26 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/predictor")` (fichier sous extensions/ mais pas une extension classique)

Filtre qui anticipe le mouvement du véhicule : décale data.res.targetPos de dtFuture * data.vel (vitesse du véhicule) puis recalcule la rotation vers cette cible. Masqué. Renvoie un constructeur.

## Classe `C`

Filtre de prédiction de cible.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_predictor")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(dtFuture)` | Définit isFilter, hidden et dtFuture. | 8 |
| `C:update(data)` | Avance targetPos et met data.res.rot à jour. | 14 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/predictor.lua`.*
