# `controller_hydraulics_truckCabTiltControl`

*Fichier : `lua/vehicle/controller/hydraulics/truckCabTiltControl.lua` · VM : Véhicule · 56 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `hydraulics/truckCabTiltControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire pour la bascule de cabine d'un camion : quand au moins un verrou de cabine (contrôleur de groupe) est « attached », les vérins de bascule sont en mode de vanne "float" ; sinon "closed" (modes réglables).

## Remarques

- Clés jbeam (défaut) : cabLatchControllers (noms de contrôleurs exposant getGroupState()), cabTiltCylinders (noms de vérins hydrauliques), tiltCylinderValveModeLatched ("float"), tiltCylinderValveModeUnlatched ("closed").

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_hydraulics_truckCabTiltControl.init(jbeamData)` | Lit les noms de contrôleurs de verrou, de vérins et les modes de vanne. *(interne)* | 43 |
| `controller_hydraulics_truckCabTiltControl.reset(jbeamData)` | Ne fait rien. *(interne)* | 40 |
| `controller_hydraulics_truckCabTiltControl.updateGFX(dt)` | Chaque image : règle le type de vanne des vérins selon l'état des verrous. *(interne)* | 16 |

### Détail des paramètres

#### `controller_hydraulics_truckCabTiltControl.init(jbeamData)`

Lit les noms de contrôleurs de verrou, de vérins et les modes de vanne.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_hydraulics_truckCabTiltControl.reset(jbeamData)`

Ne fait rien.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_hydraulics_truckCabTiltControl.updateGFX(dt)`

Chaque image : règle le type de vanne des vérins selon l'état des verrous.

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/hydraulics/truckCabTiltControl.lua`.*
