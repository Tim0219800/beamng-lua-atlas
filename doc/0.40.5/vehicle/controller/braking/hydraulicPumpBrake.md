# `controller_braking_hydraulicPumpBrake`

*Fichier : `lua/vehicle/controller/braking/hydraulicPumpBrake.lua` · VM : Véhicule · 197 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `braking/hydraulicPumpBrake` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire pour un freinage hydraulique alimenté par la pompe du moteur (véhicules lourds ou anciens). Les freins avant et arrière (`brakeF`, `brakeR`) ne fonctionnent que moteur tournant ; sans pression ou si des poutres de dommage sont cassées, le frein de stationnement est serré automatiquement. Propose une assistance en côte (frein arrière résiduel sans accélérateur) et un blocage des freins avant. Ordre d'appel : `defaultOrder = 50` (tôt).

## Remarques

- Clés jbeam lues par init : `relevantEngineName` ("mainEngine"), `frontDamageBeamTag`, `rearDamageBeamTag` (tags de poutres de `beamstate.tagBeamMap` ; leur casse coupe le frein avant ou arrière).
- Le moteur est considéré en marche si `outputAV1` > 10 rad/s ; le coefficient est lissé.
- Electrics écrits : brakeF, brakeR, frontBrakeLockOut (1/0), hillAssist (0..1). Lit electrics throttle et brake.
- Assistance en côte : tant que le coefficient est > 0 et que l'accélérateur est <= 0, ajoute jusqu'à 0.8 au frein arrière.
- Le frein de stationnement est serré via `controller.mainController.smartParkingBrake` s'il existe, sinon via `input.event("parkingbrake", 1, FILTER_KBD)`.
- Attention : updateGFX suppose que les tags jbeam sont définis ; avec un tag nil, `beamstate.tagBeamMap[nil]` est lu (renvoie nil, donc table vide).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_braking_hydraulicPumpBrake.beamBroken(id, energy)` | Hook de rupture de poutre : si la poutre est dans les tags de dommage avant ou arrière, désactive le frein correspondant jusqu'au reset. *(interne)* | 75 |
| `controller_braking_hydraulicPumpBrake.changeHillAssistCoef(change)` | Ajoute une variation au coefficient d'assistance en côte. | 111 |
| `controller_braking_hydraulicPumpBrake.getState()` | Renvoie l'assistance en côte et le blocage avant pour la sauvegarde d'état. | 159 |
| `controller_braking_hydraulicPumpBrake.init(jbeamData)` | Retrouve le moteur et les listes de poutres de dommage (via les tags jbeam). *(interne)* | 140 |
| `controller_braking_hydraulicPumpBrake.reset(jbeamData)` | Réinitialise le lisseur du moteur, les coefficients de dommage et le frein de stationnement automatique. *(interne)* | 133 |
| `controller_braking_hydraulicPumpBrake.setFrontLockOutEnabled(enabled, silent)` | Active ou désactive le blocage du frein avant (le frein avant est coupé quand actif). | 115 |
| `controller_braking_hydraulicPumpBrake.setHillAssistCoef(coef, silent)` | Fixe le coefficient d'assistance en côte (0 à 1, remis à 0 s'il est <= 0.01) et affiche un message UI sauf si silent. | 94 |
| `controller_braking_hydraulicPumpBrake.setState(data)` | Restaure ces deux valeurs (silencieusement). | 165 |
| `controller_braking_hydraulicPumpBrake.toggleFrontLockOutEnabled()` | Inverse l'état du blocage du frein avant. | 129 |
| `controller_braking_hydraulicPumpBrake.updateGFX(dt)` | Chaque frame : calcule brakeF/brakeR en tenant compte du moteur en marche, de l'assistance en côte, du blocage avant et des poutres cassées ; gère le frein de stationnement automatique et publie les electrics. *(interne)* | 31 |

### Détail des paramètres

#### `controller_braking_hydraulicPumpBrake.beamBroken(id, energy)`

Hook de rupture de poutre : si la poutre est dans les tags de dommage avant ou arrière, désactive le frein correspondant jusqu'au reset.

- `id` (*integer*) : cid de la poutre.
- `energy` (*number*) : Énergie de rupture (non utilisée).

#### `controller_braking_hydraulicPumpBrake.changeHillAssistCoef(change)`

Ajoute une variation au coefficient d'assistance en côte.

- `change` (*number*) : Variation (peut être négative).

#### `controller_braking_hydraulicPumpBrake.getState()`

Renvoie l'assistance en côte et le blocage avant pour la sauvegarde d'état.

- **renvoie** : table Clés `<nom>_hillAssistCoef` et `<nom>_frontLockOutEnabled`.

#### `controller_braking_hydraulicPumpBrake.init(jbeamData)`

Retrouve le moteur et les listes de poutres de dommage (via les tags jbeam).

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_braking_hydraulicPumpBrake.reset(jbeamData)`

Réinitialise le lisseur du moteur, les coefficients de dommage et le frein de stationnement automatique.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_braking_hydraulicPumpBrake.setFrontLockOutEnabled(enabled, silent)`

Active ou désactive le blocage du frein avant (le frein avant est coupé quand actif).

- `enabled` (*boolean*) : true pour couper le frein avant.
- `silent` (*boolean|nil*) : true pour ne pas afficher de message.

#### `controller_braking_hydraulicPumpBrake.setHillAssistCoef(coef, silent)`

Fixe le coefficient d'assistance en côte (0 à 1, remis à 0 s'il est <= 0.01) et affiche un message UI sauf si silent.

- `coef` (*number*) : Coefficient 0 à 1.
- `silent` (*boolean|nil*) : true pour ne pas afficher de message.

#### `controller_braking_hydraulicPumpBrake.setState(data)`

Restaure ces deux valeurs (silencieusement).

- `data` (*table|nil*) : Table d'état.

#### `controller_braking_hydraulicPumpBrake.updateGFX(dt)`

Chaque frame : calcule brakeF/brakeR en tenant compte du moteur en marche, de l'assistance en côte, du blocage avant et des poutres cassées ; gère le frein de stationnement automatique et publie les electrics.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultOrder` | number | 50 : rang d'appel par défaut, tôt dans la liste triée. |
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/braking/hydraulicPumpBrake.lua`.*
