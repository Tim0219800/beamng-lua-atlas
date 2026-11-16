# `core_cameraModes_external`

*Fichier : `lua/ge/extensions/core/cameraModes/external.lua` · VM : Game Engine (GE) · 441 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/external")` (fichier sous extensions/ mais pas une extension classique)

Caméra externe « télé / fan » (désactivée par défaut) : place des caméras fixes aléatoires le long du trajet prévu du véhicule, change de point de vue toutes les 1,5 à ~4 s (ou si le véhicule est caché > 0,5 s, ou s'éloigne trop), et passe le résultat par une chaîne de filtres : predictor, autozoom, autopoint, noise, smooth, handheld, bobbing. Deux styles tirés au hasard : fan (caméra à hauteur d'homme, tremblée) ou TV (stable) ; la probabilité de fan vient du réglage 'cameraFanVsTV' (0.66 pour TV par défaut, voir notes). Vérifie la visibilité par rayons statiques (jusqu'à 40 essais). Renvoie un constructeur.

## Remarques

- Pas de caméra fan sous OpenXR (isFanMode = false) ; les décalages de visée sont ignorés en OpenXR.
- Bug : dans update, la ligne `self:applyOffset(nx, ny, nz, findRandomAttachedNodePosition(data.veh), openxrSessionRunning)` utilise une variable globale openxrSessionRunning (nil) au lieu de data.openxrSessionRunning.
- Incohérence : switchCamera écrit self.predictor.future alors que le filtre predictor lit dtFuture ; la valeur tirée au hasard n'a donc aucun effet (dtFuture reste 0.1).
- tvModeOdds = settings 'cameraFanVsTV' et le test est `math.random() > tvModeOdds` pour le mode fan : une valeur élevée donne donc plus de TV (déduit du code).
- Les signatures de la page extraite sont inexactes : switchCamera(carVel, carPos, veh, nx, ny, nz, carStopped, openxrSessionRunning), shouldSwitchCamera(carPos, carVel, dt), applyOffset(nx, ny, nz, offset, openxrSessionRunning), findNewCamPosVel(carPos, futureCarPos, velLength, chancesMultiplier, carStopped), randomizeOffsetSpeeds(paused, carStopped).

## Classe `C`

Mode externe. Champs : isFanMode, camPos, camVel, camChangeTimeMin/Base/Max, invisibleTime, et les filtres autozoom, autopoint, noise, smooth, bobbing, handheld, predictor.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_external")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:applyOffset(nx, ny, nz, offset, openxrSessionRunning)` | Définit le point visé par autopoint (décalage local au véhicule, ignoré en OpenXR). | 186 |
| `C:camTeleported()` | La caméra s'est téléportée : réinitialise autozoom et handheld. | 373 |
| `C:carTeleported()` | Le véhicule s'est téléporté : appelle reset. | 370 |
| `C:findNewCamPosVel(carPos, futureCarPos, velLength, chancesMultiplier, carStopped)` | Choisit une position de caméra près de la position future prédite du véhicule, et la vitesse de panoramique (nulle en mode fan). | 117 |
| `C:init()` | Initialise l'état, les temporisations et les filtres, puis appelle onSettingsChanged, onVehicleCameraConfigChanged et reset. | 19 |
| `C:onSettingsChanged()` | Hook : relit cameraFanVsTV et relaie au filtre bobbing. | 67 |
| `C:onVehicleCameraConfigChanged()` | Hook : transmet refNodes à autopoint. | 63 |
| `C:randomizeOffsetSpeeds(paused, carStopped)` | Tire la période de changement du point visé et le ressort d'autopoint. | 347 |
| `C:reset()` | Force le choix d'une nouvelle caméra à la prochaine image (« switch to a new camera »). | 96 |
| `C:setRefNodes(centerNodeID, leftNodeID, backNodeID)` | Définit les nœuds de référence du véhicule (aussi pour autopoint). | 72 |
| `C:shouldSwitchCamera(carPos, carVel, dt)` | Dit s'il faut changer de caméra : démarrage, ou délai minimal écoulé et (véhicule invisible trop longtemps ou trop loin après le délai maximal). | 306 |
| `C:switchCamera(carVel, carPos, veh, nx, ny, nz, carStopped, openxrSessionRunning)` | Choisit un nouveau point de vue : tire le style (fan/TV), les paliers de zoom et les durées, puis cherche un emplacement dégagé (40 essais), et règle handheld, noise, smooth. | 193 |
| `C:update(data)` | Boucle principale : gère les téléportations, le changement de point visé et de caméra, déplace la caméra, puis passe data par les filtres. | 380 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawSphere`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/external.lua`.*
