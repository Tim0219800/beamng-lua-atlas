# `controller_propAnimation_dualAxisLever`

*Fichier : `lua/vehicle/controller/propAnimation/dualAxisLever.lua` · VM : Véhicule · 378 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** contrôleur `propAnimation/dualAxisLever` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`

Contrôleur auxiliaire d'animation d'un levier à deux axes (levier de boîte automatique type P R N D S M avec grille). Lit le nom du mode courant (electrics.values.gear par défaut), le met en file puis déplace le levier virtuel mode par mode (en passant par les modes intermédiaires), éventuellement via des coordonnées intermédiaires (modeChanges), et publie la position dans electrics dualAxisX / dualAxisY. Gère les modes S et M (avec modes impulsionnels M+ et M-).

## Remarques

- Clés jbeam lues : orderedModeCoordinates (table d'en-tête modeName, x, y ; l'ordre définit la position des modes), impulseModeCoordinates (modes impulsionnels dont le nom est le mode de base suivi d'un caractère, typiquement + ou -), modeChanges (mode1, mode2, intermediateCoordinates : chemin de la grille entre deux modes), electricsNameXAxis ("dualAxisX"), electricsNameYAxis ("dualAxisY"), electricsNameMode ("gear"), moveSoundNode_nodes (premier élément = nœud du son, sinon 0 + log W), moveSoundEventDualAxisDirectionChange ("event:>Vehicle>Interior>Gearshift>manual_modern_01_in"), moveSoundVolumeDualAxisDirectionChange (0.5), smootherRateX et smootherRateY (4), demoModes (table de noms pour animation de démonstration).
- Le nom de mode lu est ramené à « S » pour tout mode commençant par S, et à « M » (ou M+ / M-) pour M<n> selon que le numéro augmente ou diminue.
- Un nom d'impulsion de moins de 2 caractères ou sans mode de base fait un log E et arrête init (return) : les structures suivantes ne sont alors pas initialisées.
- Dans handleMSModes, les index de rapport M<n> sont comparés en tant que chaînes extraites du nom (la comparaison gearIndex > lastMModeGearIndex porte sur des chaînes), ce qui peut mal ordonner 9 et 10 (déduit du code).
- M.updateGFX est nop à la déclaration et n'est affecté à updateGFX qu'en fin d'init (dualAxisLever.init).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `controller_propAnimation_dualAxisLever.init(jbeamData)` | Lit coordonnées des modes, modes impulsionnels, changements de mode, sons et lisseurs ; démarre sur le premier mode de la liste. *(interne)* | 271 |
| `controller_propAnimation_dualAxisLever.reset(jbeamData)` | Remet position, file de modes, états de mouvement et lisseurs à zéro. *(interne)* | 249 |

### Détail des paramètres

#### `controller_propAnimation_dualAxisLever.init(jbeamData)`

Lit coordonnées des modes, modes impulsionnels, changements de mode, sons et lisseurs ; démarre sur le premier mode de la liste.

- `jbeamData` (*table*) : Données jbeam du contrôleur.

#### `controller_propAnimation_dualAxisLever.reset(jbeamData)`

Remet position, file de modes, états de mouvement et lisseurs à zéro.

- `jbeamData` (*table*) : Données jbeam.

## Champs

| Champ | Type | Description |
|---|---|---|
| `type` | string | "auxiliary". |
| `updateGFX` | function | nop au chargement, puis updateGFX interne après init. |

## Appels vers le moteur (C++)

- `obj:` `playSFXOnceCT`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/controller/propAnimation/dualAxisLever.lua`.*
