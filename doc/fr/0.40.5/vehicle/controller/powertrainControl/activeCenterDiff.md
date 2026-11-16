# `controller_powertrainControl_activeCenterDiff`

*Fichier : `lua/vehicle/controller/powertrainControl/activeCenterDiff.lua` · VM : Véhicule · 146 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `powertrainControl/activeCenterDiff` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire de différentiel central piloté. Chaque pas physique, il combine plusieurs cartes jbeam (gaz, glissement entre essieux, frein, frein du pied gauche, braquage, frein à main) pour calculer un taux de blocage souhaité 0..1 et l'écrit dans centerDiff.activeLockCoef. En accélération la consigne mélange sous-virage/survirage (biasOversteerVsTraction) et traction ; en décélération elle dépend du frein et du braquage.

## Remarques

- Clés jbeam lues dans init : biasOversteerVsTraction (0.5), throttleLockMap, allowedSlipMap, slipLockMap, brakeLockMap, leftFootBrakeLockMap, steeringLockMap, handbrakeLockMap (cartes pour interpolatedMap : entrée x = pédale/braquage/glissement, y = vitesse en m/s), centerDiffName, axleDiff1Name, axleDiff2Name (noms de devices du powertrain).
- Lit electrics.values : wheelspeed, throttle_input, brake_input, parkingbrake, steering_input, absActive. Glissement = |AV_avant - AV_arrière| / max(|AV|, 0.1) avec les entrées inputAV des deux différentiels d'essieu.
- Le blocage est mis à 0 quand l'ABS est actif (facteur 1 - absActive) et multiplié par la carte du frein à main.
- Mode décélération si throttle_input - brake_input < -0.01, sinon accélération.
- Si un des trois différentiels est introuvable : print « Diff(s) not found » et updateFixedStep/updateGFX sont mis à nil.
- Les commentaires du source indiquent des fonctions initLastStage/resetLastStage non exportées dans M.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_powertrainControl_activeCenterDiff.init(jbeamData)` | Charge les sept cartes jbeam et récupère le différentiel central et les deux différentiels d'essieu. *(interne)* | 86 |
| `controller_powertrainControl_activeCenterDiff.reset(jbeamData)` | Ne fait rien. *(interne)* | 80 |
| `controller_powertrainControl_activeCenterDiff.updateFixedStep(dt)` | Pas physique : calcule le blocage souhaité et le fixe sur centerDiff.activeLockCoef. *(interne)* | 28 |
| `controller_powertrainControl_activeCenterDiff.updateGFX(dt)` | Ne fait rien. *(interne)* | 77 |

### Détail des paramètres

#### `controller_powertrainControl_activeCenterDiff.init(jbeamData)`

Charge les sept cartes jbeam et récupère le différentiel central et les deux différentiels d'essieu.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_powertrainControl_activeCenterDiff.reset(jbeamData)`

Ne fait rien.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_powertrainControl_activeCenterDiff.updateFixedStep(dt)`

Pas physique : calcule le blocage souhaité et le fixe sur centerDiff.activeLockCoef.

- `dt` (*number*) : Pas physique en secondes.

#### `controller_powertrainControl_activeCenterDiff.updateGFX(dt)`

Ne fait rien.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/powertrainControl/activeCenterDiff.lua`.*
