# `controller_pneumatics_airbrakes`

*Fichier : `lua/vehicle/controller/pneumatics/airbrakes.lua` · VM : Véhicule · 439 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `pneumatics/airbrakes` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de freins pneumatiques (poids lourds). Simule la pression des cylindres de frein de service et des freins à ressort (parking) alimentés par un réservoir d'air (energyStorage), convertit la pression en couple de frein via des courbes jbeam et remplace la mise à jour du frein des roues listées dans brakedWheels (avec ou sans ABS). Applique automatiquement le frein de parking si la pression d'alimentation tombe sous un seuil. Joue un son de purge lors du relâchement. Publie la pression des cylindres dans electrics.values.<nom>_pressure_service et <nom>_pressure_parking.

## Remarques

- Clés jbeam lues dans init : airTankName ("mainAirTank"), brakeTorque (table d'en-tête {pressure, torqueCoef}, obligatoire), springBrakeTorque (idem, obligatoire), springBrakeAutoApplyThresholdPressure (275790 Pa = 40 psi), springBrakeAutoReleaseThresholdPressure (413685 Pa = 60 psi), brakePipeRadius (0.0075 m), brakeValveRadius (0.2 x brakePipeRadius), brakeActuatorDiameter (0.16 m), brakeActuatorStroke (0.0635 m), numBrakeActuators (4), quickReleaseFlowRate (0.01 m3/s), brakedWheels (liste de noms de roues), serviceBrakeElectricsName ("brake"), parkingBrakeElectricsName ("parkingbrake"), soundNode_nodes (premier élément = nœud du son), soundEvent ("event:>Vehicle>Pneumatics>Air_Brakes"), soundCoolDown (0.75 s).
- Pressions en pascals. Les courbes sont indexées par pression en kPa entière (floor(p/1000)).
- Si le réservoir n'existe pas, un réservoir factice (isDummy) est utilisé : le frein de parking est alors appliqué en permanence et aucun son n'est joué.
- L'application automatique du frein de parking passe par controller.mainController.smartParkingBrake(1, FILTER_DIRECT, true) ou, à défaut, input.event("parkingbrake", 1, FILTER_KBD).
- M.name est utilisé pour construire les noms electrics ; il est fourni par le chargeur de contrôleurs (non défini dans ce fichier).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_pneumatics_airbrakes.init(jbeamData)` | Lit les clés jbeam, construit les courbes pression -> coefficient de couple, calcule les volumes/sections du circuit, installe les fonctions de frein sur les roues listées et initialise le son. *(interne)* | 328 |
| `controller_pneumatics_airbrakes.reset()` | Ramène les pressions à la pression ambiante, réinstalle les fonctions de frein des roues et remet les états de son à zéro. *(interne)* | 303 |
| `controller_pneumatics_airbrakes.updateFixedStep(dt)` | Pas physique : met à jour la pression des cylindres de service (selon electrics brake et le régulateur) et des freins à ressort (selon parkingbrake et la pression d'alimentation), prélève l'énergie dans le réservoir. *(interne)* | 286 |
| `controller_pneumatics_airbrakes.updateGFX(dt)` | Chaque frame : détecte un relâchement rapide du frein de service ou de parking et joue le son de purge. *(interne)* | 291 |

### Détail des paramètres

#### `controller_pneumatics_airbrakes.init(jbeamData)`

Lit les clés jbeam, construit les courbes pression -> coefficient de couple, calcule les volumes/sections du circuit, installe les fonctions de frein sur les roues listées et initialise le son.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_pneumatics_airbrakes.updateFixedStep(dt)`

Pas physique : met à jour la pression des cylindres de service (selon electrics brake et le régulateur) et des freins à ressort (selon parkingbrake et la pression d'alimentation), prélève l'énergie dans le réservoir.

- `dt` (*number*) : Pas physique en secondes.

#### `controller_pneumatics_airbrakes.updateGFX(dt)`

Chaque frame : détecte un relâchement rapide du frein de service ou de parking et joue le son de purge.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `playSFXOnce`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/pneumatics/airbrakes.lua`.*
