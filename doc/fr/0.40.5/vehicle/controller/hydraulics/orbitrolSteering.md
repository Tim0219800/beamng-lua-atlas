# `controller_hydraulics_orbitrolSteering`

*Fichier : `lua/vehicle/controller/hydraulics/orbitrolSteering.lua` · VM : Véhicule · 71 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `hydraulics/orbitrolSteering` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Régulateur de direction hydraulique de type orbitrol (type "auxiliary"). Un PID compare la position moyenne des vérins de direction (normalisée -1..1) à l'entrée de direction (electrics.values.steering_input par défaut) et écrit la commande de vanne dans electrics.values.

## Remarques

- Clés jbeam (défaut) : steeringPositionCylinders (liste de noms de vérins), inputElectricsName ("steering_input"), steeringValveElectricsName ("steerCylinder"), steeringPositionMin (0), steeringPositionMax (1), steeringPIDKp (0.5), steeringPIDKi (0.3), steeringPIDKd (0.01).
- La position de chaque vérin est multipliée par cylinder.direction avant la moyenne.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_hydraulics_orbitrolSteering.init(jbeamData)` | Crée le PID et retrouve les vérins. *(interne)* | 40 |
| `controller_hydraulics_orbitrolSteering.reset(jbeamData)` | Remet la vanne et le PID à zéro. *(interne)* | 35 |
| `controller_hydraulics_orbitrolSteering.updateFixedStep(dt)` | Calcule et écrit la commande de vanne de direction. *(interne)* | 19 |

### Détail des paramètres

#### `controller_hydraulics_orbitrolSteering.init(jbeamData)`

Crée le PID et retrouve les vérins.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_hydraulics_orbitrolSteering.reset(jbeamData)`

Remet la vanne et le PID à zéro.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_hydraulics_orbitrolSteering.updateFixedStep(dt)`

Calcule et écrit la commande de vanne de direction.

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/hydraulics/orbitrolSteering.lua`.*
