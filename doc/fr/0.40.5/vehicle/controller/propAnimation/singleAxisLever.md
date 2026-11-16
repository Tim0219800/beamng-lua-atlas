# `controller_propAnimation_singleAxisLever`

*Fichier : `lua/vehicle/controller/propAnimation/singleAxisLever.lua` · VM : Véhicule · 89 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `propAnimation/singleAxisLever` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire d'animation d'un levier de vitesses à un seul axe (levier de boîte automatique). Convertit electrics.values.gearModeIndex en position de levier lissée (électrique de sortie) grâce à une table de coordonnées par index de mode, et joue un son de levier au début de chaque déplacement.

## Remarques

- Clés jbeam lues : gearCoordinates (table d'en-tête avec colonnes gearIndex, value), electricsNamePosition ("gearModeIndex" par défaut : attention, le défaut écrase l'electric lu en entrée), shiftSoundNode_nodes (premier élément = nœud du son ; sinon nœud 0 et log W), shiftSoundEventSingleAxisLever ("event:>Vehicle>Interior>Gearshift>automatic_01_in"), shiftSoundVolumeSingleAxisLever (0.5).
- Lit electrics.values.gearModeIndex (alimenté par vehicleController à partir de getGearPosition du module de boîte).
- Un index absent de la table utilise la coordonnée du plus grand ou du plus petit index existant.
- Piège : avec electricsNamePosition par défaut identique à l'entrée, le contrôleur réécrit gearModeIndex avec la position du levier, ce qui perturbe sa propre lecture au frame suivant. Définir un autre nom en jbeam.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_propAnimation_singleAxisLever.init(jbeamData)` | Lit la table de coordonnées, le nœud/évènement du son et le nom de l'electric de sortie. *(interne)* | 55 |
| `controller_propAnimation_singleAxisLever.reset(jbeamData)` | Remet la position du levier à 0 et le lisseur à zéro. *(interne)* | 47 |
| `controller_propAnimation_singleAxisLever.updateGFX(dt)` | Chaque frame : lisse la position vers la coordonnée du mode courant, joue le son au début du mouvement et publie la position. *(interne)* | 28 |

### Détail des paramètres

#### `controller_propAnimation_singleAxisLever.init(jbeamData)`

Lit la table de coordonnées, le nœud/évènement du son et le nom de l'electric de sortie.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_propAnimation_singleAxisLever.reset(jbeamData)`

Remet la position du levier à 0 et le lisseur à zéro.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_propAnimation_singleAxisLever.updateGFX(dt)`

Chaque frame : lisse la position vers la coordonnée du mode courant, joue le son au début du mouvement et publie la position.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `playSFXOnceCT`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/propAnimation/singleAxisLever.lua`.*
