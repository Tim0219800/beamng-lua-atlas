# `controller_braking_brakedDifferentialSteering`

*Fichier : `lua/vehicle/controller/braking/brakedDifferentialSteering.lua` · VM : Véhicule · 68 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `braking/brakedDifferentialSteering` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de direction par freinage différentiel (engins à chenilles ou skid-steer) : selon l'entrée de volant `steering_input`, il freine la roue gauche (volant à gauche) ou droite (volant à droite) en ajoutant un couple de freinage au `desiredBrakingTorque` des rotateurs de roue, sans dépasser leur `brakeTorque`.

## Remarques

- Clés jbeam lues par init : `steeringPlay` (jeu mort du volant, 0..1, défaut 0), `leftBrakeName` ("brake_L"), `rightBrakeName` ("brake_R") : noms de rotateurs de `wheels.wheelRotators`, `maxSteeringBrakeTorque` (limite facultative, bornée par le brakeTorque de la roue).
- L'effet est atténué à très basse vitesse : coefficient linéaire de 0 à 1 pour `wheelspeed` de 0 à 0.2 m/s.
- Si une des deux roues est introuvable, init log une erreur et remplace updateGFX et updateWheelsIntermediate par `nop` (le contrôleur est inerte).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_braking_brakedDifferentialSteering.init(jbeamData)` | Retrouve les roues gauche/droite, calcule les couples de freinage de direction maximaux. *(interne)* | 40 |
| `controller_braking_brakedDifferentialSteering.reset(jbeamData)` | Remet les niveaux de freinage à 0. *(interne)* | 35 |
| `controller_braking_brakedDifferentialSteering.updateGFX(dt)` | Chaque frame : calcule le niveau de freinage gauche/droit à partir de `steering_input` et de la vitesse. *(interne)* | 26 |
| `controller_braking_brakedDifferentialSteering.updateWheelsIntermediate(dt)` | Étape physique intermédiaire : ajoute le couple de freinage de direction (frein × couple max) au couple demandé de chaque roue, borné à son brakeTorque. *(interne)* | 21 |

### Détail des paramètres

#### `controller_braking_brakedDifferentialSteering.init(jbeamData)`

Retrouve les roues gauche/droite, calcule les couples de freinage de direction maximaux.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_braking_brakedDifferentialSteering.reset(jbeamData)`

Remet les niveaux de freinage à 0.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_braking_brakedDifferentialSteering.updateGFX(dt)`

Chaque frame : calcule le niveau de freinage gauche/droit à partir de `steering_input` et de la vitesse.

- `dt` (*number*) : Pas de temps en secondes.

#### `controller_braking_brakedDifferentialSteering.updateWheelsIntermediate(dt)`

Étape physique intermédiaire : ajoute le couple de freinage de direction (frein × couple max) au couple demandé de chaque roue, borné à son brakeTorque.

- `dt` (*number*) : Pas de temps en secondes (non utilisé).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/braking/brakedDifferentialSteering.lua`.*
