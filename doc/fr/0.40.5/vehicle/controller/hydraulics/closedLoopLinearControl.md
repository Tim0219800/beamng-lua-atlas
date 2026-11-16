# `controller_hydraulics_closedLoopLinearControl`

*Fichier : `lua/vehicle/controller/hydraulics/closedLoopLinearControl.lua` · VM : Véhicule · 82 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `hydraulics/closedLoopLinearControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Régulateur en boucle fermée de vérin hydraulique linéaire (type "auxiliary"). Un PID compare l'extension moyenne des vérins (hydraulic consumers du powertrain) à une cible et écrit la commande de vanne dans electrics.values. Un moddeur fixe la cible avec setCylinderTargetExtendPercent.

## Exemple

```lua
local c = controller.getControllerSafe('hydraulics/closedLoopLinearControl')
c.setCylinderTargetExtendPercent(0.5)
```

## Remarques

- Clés jbeam (défaut) : cylinders (liste de noms de consommateurs hydrauliques), cylinderValveElectricsName ("cylinderValve"), cylinderPositionMin (0), cylinderPositionMax (1), targetExtendPercentInitial (0), cylinderPIDKp (0.5), cylinderPIDKi (0.3), cylinderPIDKd (0.01).
- Sortie du PID bornée à -1..1 et remise à 0 sous 0.001. Si aucun vérin n'est trouvé, updateFixedStep est mis à nil.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_hydraulics_closedLoopLinearControl.init(jbeamData)` | Crée le PID, retrouve les vérins et lit les paramètres. *(interne)* | 47 |
| `controller_hydraulics_closedLoopLinearControl.reset(jbeamData)` | Remet la vanne à 0, la cible à la valeur initiale et le PID à zéro. *(interne)* | 41 |
| `controller_hydraulics_closedLoopLinearControl.setCylinderTargetExtendPercent(extendPercent)` | Fixe l'extension cible des vérins. | 20 |
| `controller_hydraulics_closedLoopLinearControl.updateFixedStep(dt)` | Calcule la commande de vanne à partir de l'extension moyenne des vérins et l'écrit dans electrics.values. *(interne)* | 24 |

### Détail des paramètres

#### `controller_hydraulics_closedLoopLinearControl.init(jbeamData)`

Crée le PID, retrouve les vérins et lit les paramètres.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_hydraulics_closedLoopLinearControl.reset(jbeamData)`

Remet la vanne à 0, la cible à la valeur initiale et le PID à zéro.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_hydraulics_closedLoopLinearControl.setCylinderTargetExtendPercent(extendPercent)`

Fixe l'extension cible des vérins.

- `extendPercent` (*number*) : Extension 0..1, bornée par cylinderPositionMin/Max.

#### `controller_hydraulics_closedLoopLinearControl.updateFixedStep(dt)`

Calcule la commande de vanne à partir de l'extension moyenne des vérins et l'écrit dans electrics.values.

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/hydraulics/closedLoopLinearControl.lua`.*
