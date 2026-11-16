# `controller_beaconSpin`

*Fichier : `lua/vehicle/controller/beaconSpin.lua` · VM : Véhicule · 27 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `beaconSpin` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire minimal qui anime les éléments rotatifs d'une rampe lumineuse : tant que `electrics.values.lightbar` est supérieur à 0, il fait tourner une valeur electrics (angle en degrés, modulo 360) ; sinon il la remet à 0.

## Remarques

- Clés jbeam lues par init : `spinSpeed` (320 degrés par seconde par défaut) et `electricsName` ("beaconSpin" par défaut).
- Le commentaire du code précise que la valeur doit revenir à 0 quand la rampe est éteinte, sinon les projecteurs restent allumés.
- updateGFX lit `electrics.values.lightbar` sans test de nil : il faut que la valeur existe (sinon erreur de comparaison).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_beaconSpin.init(jbeamData)` | Lit `spinSpeed` et `electricsName` et initialise la valeur electrics à 1. *(interne)* | 17 |
| `controller_beaconSpin.updateGFX(dt)` | Chaque frame : avance l'angle de dt × spinSpeed (modulo 360) si la rampe est active, sinon met la valeur à 0. *(interne)* | 13 |

### Détail des paramètres

#### `controller_beaconSpin.init(jbeamData)`

Lit `spinSpeed` et `electricsName` et initialise la valeur electrics à 1.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_beaconSpin.updateGFX(dt)`

Chaque frame : avance l'angle de dt × spinSpeed (modulo 360) si la rampe est active, sinon met la valeur à 0.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/beaconSpin.lua`.*
