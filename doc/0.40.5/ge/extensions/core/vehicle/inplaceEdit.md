# `core_vehicle_inplaceEdit`

*Fichier : `lua/ge/extensions/core/vehicle/inplaceEdit.lua` · VM : Game Engine (GE) · 424 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_vehicle_inplaceEdit` : `extensions.load("core_vehicle_inplaceEdit")`, puis la globale `core_vehicle_inplaceEdit`

Extension GE `core_vehicle_inplaceEdit` : éditeur de pièces « en jeu » rudimentaire (« ingame vehicle editor ») : masque l'interface CEF, affiche en texte debug (debugDrawer:drawTextAdvanced) l'arbre de slots/pièces du véhicule du joueur 0 et permet de naviguer au clavier (haut/bas/gauche/droite), de choisir une pièce pour un slot et de respawn le véhicule avec la nouvelle config. Ouvert par core_vehicle_manager.toggleModifyKey. C'est un outil de développement, pas une API de gameplay.

## Remarques

- Les touches arrivent par onInput(type, value) avec type parmi 'up', 'down', 'left', 'right', 'select' (e), 'back' (r) ; seules les valeurs égales à 1 (appui) sont traitées. La sortie se fait avec la touche g (via les actions d'entrée du mode).
- Le code contient de nombreux dump{...} de debug et un commentaire « the crude UI » : l'outil est visiblement brut. L'aide affichée à l'écran est en anglais.
- La fenêtre n'est active que si le véhicule du joueur 0 existe (onUpdate retourne sinon) ; une courte animation (0,1 s) précède et suit l'activation, et l'interface CEF est masquée pendant l'édition puis rétablie.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_vehicle_inplaceEdit.onInput(type, value)` | Hook d'entrée : reçoit les touches de navigation de l'éditeur ('up', 'down', 'left', 'right', 'select', 'back') et déplace la sélection, descend/remonte dans les pièces ou applique le choix d'une pièce pour un slot (respawn du véhicule avec la config modifiée). *(interne)* *(hook)* | 361 |
| `core_vehicle_inplaceEdit.onUpdate(dtReal, dtSim, dtRaw)` | Hook par frame : charge les données du véhicule au besoin, anime l'activation et, si l'éditeur est actif, dessine à l'écran les infos et la liste des slots/pièces. *(interne)* *(hook)* | 210 |
| `core_vehicle_inplaceEdit.setShowWindow(val)` | Active ou désactive l'éditeur (change de mode : masque/affiche l'interface CEF). | 345 |
| `core_vehicle_inplaceEdit.toggleShowWindow()` | Inverse l'état de l'éditeur et bascule le mode d'édition (toggleEditMode) du véhicule du joueur 0. | 350 |

### Détail des paramètres

#### `core_vehicle_inplaceEdit.onInput(type, value)`

Hook d'entrée : reçoit les touches de navigation de l'éditeur ('up', 'down', 'left', 'right', 'select', 'back') et déplace la sélection, descend/remonte dans les pièces ou applique le choix d'une pièce pour un slot (respawn du véhicule avec la config modifiée).

- `type` (*string*) : nom de l'action
- `value` (*number*) : 1 = appui ; les autres valeurs sont ignorées

#### `core_vehicle_inplaceEdit.onUpdate(dtReal, dtSim, dtRaw)`

Hook par frame : charge les données du véhicule au besoin, anime l'activation et, si l'éditeur est actif, dessine à l'écran les infos et la liste des slots/pièces.

- `dtReal` (*number*) : temps réel (s)
- `dtSim` (*number*) : temps de simulation (s)
- `dtRaw` (*number*) : temps brut (s)

#### `core_vehicle_inplaceEdit.setShowWindow(val)`

Active ou désactive l'éditeur (change de mode : masque/affiche l'interface CEF).

- `val` (*boolean*) : true pour afficher

## Appels vers le moteur (C++)

- `debugDrawer:` `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/vehicle/inplaceEdit.lua`.*
