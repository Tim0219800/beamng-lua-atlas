# `core_cameraModes_onboard`

*Fichier : `lua/ge/extensions/core/cameraModes/onboard.lua` · VM : Game Engine (GE) · 132 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/onboard")` (fichier sous extensions/ mais pas une extension classique)

Caméra embarquée (cockpit, capot, rider...) définie dans le jbeam du véhicule (section camera) : se fixe sur le nœud refNodes.ref (ou camNodeID) avec un décalage offset, oriente la vue selon les nœuds de référence et laisse tourner la tête (yaw ±, pitch limité à ±85 degrés) si canRotate (vrai par défaut). Regarder en arrière (data.lookBack) place la caméra à l'arrière de la boîte englobante. Intègre un manualzoom. Renvoie un constructeur.

## Remarques

- Le nom de la caméra détermine l'icône : onboard.driver -> personSolid, onboard.hood -> vehicleHood, autre -> info. « driver » est masquée mais ses données restent utilisées par d'autres caméras. rider/onboard.rider active canUseVehicleTriggerCrosshair.
- `self.canRotate = self.canRotate ~= nil and self.canRotate or true` vaut toujours true (si canRotate est false, l'expression redonne true) : bug, canRotate=false du jbeam est ignoré.
- Si rotation (jbeam) a z nul, ses x,y s'ajoutent à la rotation courante à chaque image et le clamp ±85 n'est pas appliqué.

## Classe `C`

Caméra embarquée. Champs jbeam : refNodes{ref,left,back}, offset{x,y,z}, rotation, fov, name, idRef/idUp/idBack, canRotate.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_onboard")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Crée le manualzoom, applique la configuration véhicule et réinitialise. | 22 |
| `C:onVehicleCameraConfigChanged()` | Hook : recalcule hidden, icône et canUseVehicleTriggerCrosshair d'après le nom. | 30 |
| `C:reset()` | Remet la rotation de tête à zéro et le zoom par défaut. | 46 |
| `C:setRefNodes(centerNodeID, leftNodeID, backNodeID)` | Définit les nœuds de référence. | 117 |
| `C:update(data)` | Place la caméra et applique rotation et zoom à data.res. | 53 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/onboard.lua`.*
