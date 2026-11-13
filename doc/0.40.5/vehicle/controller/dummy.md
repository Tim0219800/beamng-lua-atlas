# `controller_dummy`

*Fichier : `lua/vehicle/controller/dummy.lua` · VM : Véhicule · 84 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `dummy` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur principal (type "main") minimal pour les véhicules sans moteur (remorques, objets). Il fournit l'API obligatoire d'un contrôleur principal (changements de rapport, démarreur, etc., tous en nop) et écrit chaque image des valeurs electrics neutres : throttle, brake, clutch issus des entrées, gear "N", gearIndex 0, rpm/fuel/températures à 0, ignition false, gearboxMode "none".

## Remarques

- Aucune clé jbeam n'est lue. M.engineInfo est un tableau de 21 valeurs (index 3 et 4 = 1000, index 14 = "manual", index 15 = id de l'objet) dont l'index 11 est mis à jour avec la vitesse sol (obj:getGroundSpeed()) uniquement si le flux engineInfo est écouté.
- Champs throttle, brake, clutchRatio, fireEngineTemperature, drivingAggression, shiftingAggression : constantes à 0 pour l'API de contrôleur principal. nop = fonction globale du moteur qui ne fait rien.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_dummy.updateGFX(dt)` | Chaque image : copie les entrées throttle/brake/clutch (bornées 0..1) dans electrics.values et force les autres valeurs à leur état neutre. *(interne)* | 42 |

### Détail des paramètres

#### `controller_dummy.updateGFX(dt)`

Chaque image : copie les entrées throttle/brake/clutch (bornées 0..1) dans electrics.values et force les autres valeurs à leur état neutre.

- `dt` (*number*) : Pas de temps (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `brake` | number | 0. |
| `clutchRatio` | number | 0. |
| `cycleGearboxModes` | function | nop. |
| `drivingAggression` | number | 0. |
| `engineInfo` | table | Tableau d'info moteur de 21 valeurs statiques (voir notes). |
| `fireEngineTemperature` | number | 0. |
| `init` | function | nop. |
| `sendTorqueData` | function | nop. |
| `setEngineIgnition` | function | nop. |
| `setFreeze` | function | nop. |
| `setGearboxMode` | function | nop. |
| `setStarter` | function | nop. |
| `shiftDown` | function | nop. |
| `shiftToGearIndex` | function | nop. |
| `shiftUp` | function | nop. |
| `shiftingAggression` | number | 0. |
| `throttle` | number | 0. |
| `type` | string | "main". |
| `vehicleActivated` | function | nop. |

## Appels vers le moteur (C++)

- `obj:` `getGroundSpeed`, `getId`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/dummy.lua`.*
