# `controller_airplaneSurfaces`

*Fichier : `lua/vehicle/controller/airplaneSurfaces.lua` · VM : Véhicule · 130 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `airplaneSurfaces` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire pour les avions : combine les entrées du pilote (gouverne de direction, ailerons, profondeur) avec les trims, et gère les volets (flap) et becs (slat). Il écrit les résultats dans `electrics.values` (rudder, aileron, elevator, slat, flap) qu'utilisent ensuite les actionneurs jbeam, et affiche des messages UI quand une valeur change.

## Remarques

- Clés jbeam lues par init : `flapStart`, `slatStart`, `rudderTrimmingStart`, `aileronTrimmingStart`, `elevatorTrimmingStart` (valeurs de départ, 0 par défaut), `trimSpeed` (0.05), `flapSpeed` (0.1), `slatSpeed` (0.1) ; vitesses exprimées en fraction par seconde.
- Entrées lues dans `input` : rudder, aileron, elevator, trimChange, trimRudder, trimAileron, trimElevator, flap, slat, flapChange, slatChange. Le trim relatif (`trimChange`) agit sur l'axe choisi par toggleTrimMode (elevator, aileron, rudder, cycle dans cet ordre).
- Sorties : rudder/aileron/elevator = entrée + trim (non limitées à [-1,1] dans ce fichier) ; trim, flap et slat sont bornés (trim -1..1, flap et slat 0..1 pour les entrées relatives).
- Aucune fonction `reset` n'existe : controller.reset rappelle init. updateGFX suppose que init a déjà initialisé `trimming`.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_airplaneSurfaces.init(jbeamData)` | Initialise les electrics, les valeurs de départ de volets/becs/trims et les vitesses depuis le jbeam. *(interne)* | 91 |
| `controller_airplaneSurfaces.setTrimValue(input, value)` | Fixe directement la valeur de trim d'un axe (sans effet si l'axe est inconnu). | 85 |
| `controller_airplaneSurfaces.toggleTrimMode()` | Passe à l'axe de trim suivant (elevator, aileron, rudder) et l'annonce par un message UI. | 75 |
| `controller_airplaneSurfaces.updateGFX(dt)` | Chaque frame : applique les entrées et trims aux electrics rudder, aileron, elevator, met à jour flap et slat (valeur absolue d'entrée si elle a changé, sinon ajustement relatif), et affiche un message UI quand un trim, les volets ou les becs varient de plus de 0,005. *(interne)* | 32 |

### Détail des paramètres

#### `controller_airplaneSurfaces.init(jbeamData)`

Initialise les electrics, les valeurs de départ de volets/becs/trims et les vitesses depuis le jbeam.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_airplaneSurfaces.setTrimValue(input, value)`

Fixe directement la valeur de trim d'un axe (sans effet si l'axe est inconnu).

- `input` (*string*) : "rudder", "aileron" ou "elevator".
- `value` (*number*) : Valeur de trim (normalement -1 à 1).

#### `controller_airplaneSurfaces.updateGFX(dt)`

Chaque frame : applique les entrées et trims aux electrics rudder, aileron, elevator, met à jour flap et slat (valeur absolue d'entrée si elle a changé, sinon ajustement relatif), et affiche un message UI quand un trim, les volets ou les becs varient de plus de 0,005.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary" (paramètre obligatoire de contrôleur). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/airplaneSurfaces.lua`.*
