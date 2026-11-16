# `controller_propAnimation_sequentialLever`

*Fichier : `lua/vehicle/controller/propAnimation/sequentialLever.lua` · VM : Véhicule · 106 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `propAnimation/sequentialLever` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire d'animation d'un levier séquentiel : à chaque changement de rapport du device « gearbox » (rapport monté = levier poussé, rapport descendu = levier tiré), il fait osciller une valeur lissée entre -1, 0 et 1 publiée dans electrics.values.sequentialLeverY, et joue un son de levier (montée / descente) avec l'agressivité de passage comme paramètre.

## Remarques

- Clés jbeam lues : electricsNameYAxis ("sequentialLeverY"), supportedGearboxTypes (liste, {"sequentialGearbox"}), relevantGearboxName ("gearbox"), shiftSoundNode_nodes (premier élément = nœud du son, sinon 0 + log W), shiftSoundEventSequentialGearUp ("event:>Vehicle>Interior>Gearshift>sequential_01_in"), shiftSoundEventSequentialGearDown ("..._01_out"), shiftSoundVolumeSequentialGearUp / Down (0.5).
- Lit controller.mainController.shiftingAggression pour le paramètre du son.
- Si le device n'existe pas ou n'est pas d'un type supporté, log E et updateGFX devient nop.
- La direction du levier : impulsion = {-1 -> 1, 0 -> 0, 1 -> -1} selon le signe de (gearIndex - previousGearIndex) ; le son « down » est joué dès que l'impulsion est non nulle (la valeur de nom « shiftOut » correspond à tout changement de rapport, montée ou descente), le son « up » au retour à 0.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_propAnimation_sequentialLever.init(jbeamData)` | Récupère le device de boîte, vérifie son type et lit les sons. *(interne)* | 59 |
| `controller_propAnimation_sequentialLever.reset(jbeamData)` | Remet l'état du levier et le lisseur à zéro. *(interne)* | 52 |
| `controller_propAnimation_sequentialLever.updateGFX(dt)` | Chaque frame : détecte le changement de rapport, lisse l'impulsion, joue le son et publie la valeur. *(interne)* | 28 |

### Détail des paramètres

#### `controller_propAnimation_sequentialLever.init(jbeamData)`

Récupère le device de boîte, vérifie son type et lit les sons.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_propAnimation_sequentialLever.reset(jbeamData)`

Remet l'état du levier et le lisseur à zéro.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_propAnimation_sequentialLever.updateGFX(dt)`

Chaque frame : détecte le changement de rapport, lisse l'impulsion, joue le son et publie la valeur.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `playSFXOnceCT`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/propAnimation/sequentialLever.lua`.*
