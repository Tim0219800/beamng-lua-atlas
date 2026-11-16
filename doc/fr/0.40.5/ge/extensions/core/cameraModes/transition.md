# `core_cameraModes_transition`

*Fichier : `lua/ge/extensions/core/cameraModes/transition.lua` · VM : Game Engine (GE) · 116 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/transition")` (fichier sous extensions/ mais pas une extension classique)

Filtre global (runningOrder 0.2) qui adoucit les changements de caméra : mémorise la pose de l'image précédente (position relative au véhicule, rotation, FOV, nearClip) et, quand start() est appelé, mélange la nouvelle caméra avec l'ancienne pendant la durée configurée (réglages cameraTransitionTime, 300 ms par défaut, et cameraVehicleTransitionTime, 500 ms pour un changement de véhicule). Le mélange est quadratique (perc^2) avec nlerp de la rotation. Pas de fondu si les deux points ne se voient pas ou sont à plus de 100 m (pour les changements de caméra simples). Renvoie un constructeur.

## Remarques

- Utilisé aussi pour les transitions de chemin caméra : si camPathTransitionData est fourni, son callback reçoit une copie de data.res et la caméra reprend l'ancienne pose.
- Une demande reçue avant la première image enregistrée attend qu'une pose existe (camLastPosAbs différente de l'infini).
- La page extraite indique start(camPathTransitionData, duration) mais le code est start(isVehicleSwitch, camPathTransitionData, duration) ; canTransition(origin, target) a deux paramètres.

## Classe `C`

Filtre de transition.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_transition")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:canTransition(origin, target)` | Dit si le fondu est autorisé entre deux points : toujours pour une demande de type « caméra » (false), sinon seulement si distance <= 100 m et visibilité mutuelle (rayons statiques). | 29 |
| `C:init()` | isGlobal, isFilter, hidden, runningOrder 0.2, état initial et lecture des réglages. | 8 |
| `C:onSettingsChanged()` | Hook : relit cameraTransitionTime et cameraVehicleTransitionTime (millisecondes). | 22 |
| `C:start(isVehicleSwitch, camPathTransitionData, duration)` | Demande un fondu depuis la dernière pose ; il démarre à la prochaine image. | 102 |
| `C:update(data)` | Enregistre la pose ou applique le fondu à data.res. | 39 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/transition.lua`.*
