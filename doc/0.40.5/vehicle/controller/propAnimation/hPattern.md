# `controller_propAnimation_hPattern`

*Fichier : `lua/vehicle/controller/propAnimation/hPattern.lua` · VM : Véhicule · 229 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `propAnimation/hPattern` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire d'animation d'un levier de vitesses en H (boîte manuelle). Suit le rapport engagé du device « gearbox » et déplace un levier virtuel sur deux axes (electrics hPatternAxisX / hPatternAxisY) en passant par la grille : en engagement, il se déplace d'abord en X puis en Y ; en dégagement, d'abord en Y puis en X. Joue un son d'engagement et de dégagement avec l'agressivité de passage. Les changements de rapport rapides sont mis en file (dequeue) pour être animés l'un après l'autre.

## Remarques

- Clés jbeam lues : gearCoordinates (table d'en-tête avec colonnes gearIndex, x, y), electricsNameXAxis ("hPatternAxisX"), electricsNameYAxis ("hPatternAxisY"), supportedGearboxTypes ({"manualGearbox"}), relevantGearboxName ("gearbox"), shiftSoundNode_nodes (premier élément = nœud du son, sinon 0 + log W), shiftSoundEventHPatternGearIn ("event:>Vehicle>Interior>Gearshift>manual_modern_01_in"), shiftSoundEventHPatternGearOut ("..._01_out"), shiftSoundVolumeHPatternGearIn / GearOut (0.5), demoMode (false).
- Lit controller.mainController.shiftingAggression (vitesse d'animation entre 0.3 et 1 fois la vitesse de base) et electrics.values.isShifting.
- Si le device est introuvable ou d'un type non supporté, log E et updateGFX devient nop ; demoMode réactive updateGFX et parcourt les rapports automatiquement (démonstration).
- Au point mort, après la fin du passage, X est recentré sur la coordonnée du rapport 0.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_propAnimation_hPattern.init(jbeamData)` | Lit les coordonnées de la grille en H, vérifie le device de boîte et initialise sons et file de rapports. *(interne)* | 159 |
| `controller_propAnimation_hPattern.reset(jbeamData)` | Remet le levier à (0, 0), vide la file de rapports et réinitialise lisseurs et démo. *(interne)* | 142 |
| `controller_propAnimation_hPattern.updateGFX(dt)` | Chaque frame : met en file les changements de rapport, déplace le levier en X/Y, joue les sons et publie les electrics. *(interne)* | 72 |

### Détail des paramètres

#### `controller_propAnimation_hPattern.init(jbeamData)`

Lit les coordonnées de la grille en H, vérifie le device de boîte et initialise sons et file de rapports.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_propAnimation_hPattern.reset(jbeamData)`

Remet le levier à (0, 0), vide la file de rapports et réinitialise lisseurs et démo.

- `jbeamData` (*table*) : Données jbeam.

#### `controller_propAnimation_hPattern.updateGFX(dt)`

Chaque frame : met en file les changements de rapport, déplace le levier en X/Y, joue les sons et publie les electrics.

- `dt` (*number*) : Pas de temps en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |

## Appels vers le moteur (C++)

- `obj:` `playSFXOnceCT`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/propAnimation/hPattern.lua`.*
