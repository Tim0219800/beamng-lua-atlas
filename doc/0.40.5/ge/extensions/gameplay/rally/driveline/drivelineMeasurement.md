# `gameplay_rally_driveline_drivelineMeasurement`

*Fichier : `lua/ge/extensions/gameplay/rally/driveline/drivelineMeasurement.lua` · VM : Game Engine (GE) · 16 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/driveline/drivelineMeasurement")` (fichier sous extensions/ mais pas une extension classique)

Classe vide (squelette) prévue pour les mesures sur une driveline de rallye. Le constructeur require(...)(driveline) appelle C:init, qui ne fait rien. Aucune donnée n'est stockée.

## Classe `C`

Objet renvoyé par le constructeur du module ; sans attribut ni autre méthode.

Le module renvoie un constructeur : `local obj = require("gameplay_rally_driveline_drivelineMeasurement")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init(driveline)` | Ne fait rien (le paramètre driveline n'est pas mémorisé). | 7 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/driveline/drivelineMeasurement.lua`.*
