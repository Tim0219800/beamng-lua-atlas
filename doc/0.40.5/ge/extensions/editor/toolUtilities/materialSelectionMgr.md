# `editor_toolUtilities_materialSelectionMgr`

*Fichier : `lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua` · VM : Game Engine (GE) · 143 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_materialSelectionMgr` : `extensions.load("editor_toolUtilities_materialSelectionMgr")`, puis la globale `editor_toolUtilities_materialSelectionMgr`

Fenêtre imgui « Material Selector » (300 x 500) pour choisir un matériau, avec vignettes et barre de recherche. Utilisée par les outils de décalques de l'éditeur. Elle liste les matériaux de Sim.getMaterialSet() filtrés par tag (decal pour les patchs de décalque, RoadAndPath pour les routes de décalque) et appelle un callback avec le nom du matériau choisi.

## Exemple

```lua
local msm = require('editor/toolUtilities/materialSelectionMgr')
msm.registerWindow()  -- à l'initialisation
msm.openWindow()
-- à chaque frame imgui :
msm.handleMaterialSelectionSubWindow(false, function(matName) ... end)
```

## Remarques

- La liste des matériaux est calculée une seule fois (au premier affichage) puis gardée.
- Au plus 5 textures de vignette sont chargées par frame (loadedTextures remis à 0 à chaque affichage) ; les autres apparaissent aux frames suivantes. Un échec de chargement est mémorisé (false).
- Le filtre : isDecal vrai garde les matériaux tagués 'decal', faux garde ceux tagués 'RoadAndPath' (tags lus avec getField('materialTag', 0..2)). Les noms vides sont ignorés.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_materialSelectionMgr.closeWindow()` | Masque la fenêtre de sélection de matériau. | 63 |
| `editor_toolUtilities_materialSelectionMgr.getTexObj(absPath)` | Renvoie l'objet texture pour un chemin absolu, en le chargeant via editor.texObj si besoin (limité à 5 chargements par frame). Renvoie false si le chargement a échoué, nil si la limite est atteinte avant le premier essai. | 43 |
| `editor_toolUtilities_materialSelectionMgr.handleMaterialSelectionSubWindow(isDecal, onSelectMaterialFunct)` | À appeler à chaque frame : dessine la fenêtre (recherche + liste défilante de matériaux avec vignette de la diffuseMap) et appelle onSelectMaterialFunct(nomMatériau) au clic. Masque la fenêtre s'il n'y a aucun matériau. | 66 |
| `editor_toolUtilities_materialSelectionMgr.openWindow()` | Affiche la fenêtre de sélection de matériau. | 60 |
| `editor_toolUtilities_materialSelectionMgr.registerWindow()` | Enregistre la fenêtre 'materialSelect' dans l'éditeur (editor.registerWindow). | 57 |

### Détail des paramètres

#### `editor_toolUtilities_materialSelectionMgr.getTexObj(absPath)`

Renvoie l'objet texture pour un chemin absolu, en le chargeant via editor.texObj si besoin (limité à 5 chargements par frame). Renvoie false si le chargement a échoué, nil si la limite est atteinte avant le premier essai.

- `absPath` (*string*) : Chemin absolu de l'image.
- **renvoie** : table|boolean|nil Objet texture (avec .tex), false ou nil.

#### `editor_toolUtilities_materialSelectionMgr.handleMaterialSelectionSubWindow(isDecal, onSelectMaterialFunct)`

À appeler à chaque frame : dessine la fenêtre (recherche + liste défilante de matériaux avec vignette de la diffuseMap) et appelle onSelectMaterialFunct(nomMatériau) au clic. Masque la fenêtre s'il n'y a aucun matériau.

- `isDecal` (*boolean*) : true : patchs de décalque (tag 'decal') ; false : routes de décalque (tag 'RoadAndPath').
- `onSelectMaterialFunct` (*function|nil*) : Callback appelé avec le nom du matériau choisi.

## Appels vers le moteur (C++)

- `Sim.` `getMaterialSet`
- `obj:` `getField`, `getName`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/materialSelectionMgr.lua`.*
