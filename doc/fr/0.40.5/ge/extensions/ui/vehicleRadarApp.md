# `ui_vehicleRadarApp`

*Fichier : `lua/ge/extensions/ui/vehicleRadarApp.lua` · VM : Game Engine (GE) · 306 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_vehicleRadarApp` : `extensions.load("ui_vehicleRadarApp")`, puis la globale `ui_vehicleRadarApp`

Partie Lua de l'application d'interface « vehicle radar » (radar de proximité des véhicules). À chaque frame GUI, elle sélectionne les véhicules visibles proches du véhicule joueur, calcule pour chacun centre, taille, orientation, type (vehicle, traffic, parked, trailer), couleur de peinture, points d'attelage (fifthwheel) et distance minimale entre boîtes englobantes orientées (OOBB), puis envoie le tout dans le flux 'vehicleRadar'. Elle charge et sauvegarde les réglages de l'application.

## Remarques

- Les réglages sont stockés dans settings/ui_apps/appsSettings/vehicleRadarSettings.json. Clés par défaut : rangeMeters=13, rangeSeconds=0.8, foreAftOffsetPct=0, rangeType='distance', minimalLook=false, coloredCars=true.
- Avec rangeType='time', la portée vaut la vitesse du joueur (m/s) multipliée par rangeSeconds, bornée entre 5 et 30 m.
- Les véhicules sont filtrés en deux étapes (rapide par position, précise par OOBB) ; la distance OOBB n'est calculée que si l'écart entre les boîtes est d'au plus 2,5 m environ.
- Les tailles envoyées (sizeX/Y/Z) sont les dimensions complètes (2 × demi-étendues) ; rotX est l'angle atan2 de l'axe 0 de la boîte, en radians.
- Les couleurs sont corrigées en gamma (puissance 1/2,2) et envoyées en entiers 0 à 255.
- Les caches (attelages, objets, peintures, nom jbeam) sont vidés à chaque changement ou apparition de véhicule.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_vehicleRadarApp.onExtensionLoaded()` | Hook appelé au chargement : lit le fichier de réglages et envoie les réglages à l'UI par 'VehicleRadarSettingsLoaded'. *(interne)* *(hook)* | 58 |
| `ui_vehicleRadarApp.onGuiUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque frame GUI : construit {playerVehicleId, playerVehicleSpeed, objects} et l'envoie via guihooks.queueStream('vehicleRadar', data). Les objets sont indexés par id de véhicule. *(interne)* *(hook)* | 153 |
| `ui_vehicleRadarApp.onVehicleSpawned()` | Hook appelé à l'apparition d'un véhicule : vide les caches. *(interne)* *(hook)* | 296 |
| `ui_vehicleRadarApp.onVehicleSwitched()` | Hook appelé au changement de véhicule contrôlé : vide les caches. *(interne)* *(hook)* | 292 |
| `ui_vehicleRadarApp.updateSetting(key, value)` | Modifie un réglage existant et sauvegarde le fichier de réglages. Ne fait rien si la clé n'existe pas ou si la valeur est inchangée. | 63 |

### Détail des paramètres

#### `ui_vehicleRadarApp.onGuiUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque frame GUI : construit {playerVehicleId, playerVehicleSpeed, objects} et l'envoie via guihooks.queueStream('vehicleRadar', data). Les objets sont indexés par id de véhicule.

- `dtReal` (*number*) : Durée réelle de la frame (s).
- `dtSim` (*number*) : Durée simulée de la frame (s).
- `dtRaw` (*number*) : Durée brute de la frame (s).

#### `ui_vehicleRadarApp.updateSetting(key, value)`

Modifie un réglage existant et sauvegarde le fichier de réglages. Ne fait rien si la clé n'existe pas ou si la valeur est inchangée.

- `key` (*string*) : Nom du réglage (rangeMeters, rangeSeconds, foreAftOffsetPct, rangeType, minimalLook, coloredCars).
- `value` (*any*) : Nouvelle valeur.

**Globales affectées :** `i`

**Évènements UI (guihooks.trigger) :** `VehicleRadarSettingsLoaded`

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`
- `be:` `getObject`, `getObjectByID`, `getObjectCount`, `getObjectOOBBHalfExtentsXYZ`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/vehicleRadarApp.lua`.*
