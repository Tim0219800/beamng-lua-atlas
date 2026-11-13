# `editor_toolUtilities_uiRows`

*Fichier : `lua/ge/extensions/editor/toolUtilities/uiRows.lua` · VM : Game Engine (GE) · 121 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_toolUtilities_uiRows` : `extensions.load("editor_toolUtilities_uiRows")`, puis la globale `editor_toolUtilities_uiRows`

Formes de lignes ImGui dont sont faits les panneaux des outils d'éditeur : un slider précédé de son bouton de réinitialisation, un libellé devant une rangée de boutons d'option, et un sous-onglet qui se ferme sur une ligne de séparation. Partagé pour que les fenêtres se ressemblent (colonne de 30 px pour le reset, libellés sur 118 px). Utilise la palette 'crystal' et util.beginSubTab/endSubTab.

## Exemple

```lua
local rows = require('editor/toolUtilities/uiRows')
rows.beginSliderRow('w', width == 4, function() width = 4 end)
im.SliderFloat('##w', widthPtr, 1, 10)
rows.endSliderRow()
```

## Remarques

- beginSliderRow pousse un style (GrabMinSize 20), ouvre 2 colonnes et un PushItemWidth(-1) ; endSliderRow doit toujours suivre pour tout refermer.
- optIcon retombe sur l'icône crop_square pour un nom inconnu, car uiIconImageButton plante sur une icône nil.
- mixRow accepte des lignes { id, tip, icon } ou des tableaux { id, tip, icon } positionnels.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_toolUtilities_uiRows.beginSliderRow(id, atDefault, onReset)` | Icône de réinitialisation à gauche du slider (espace vide si déjà à la valeur par défaut). L'appelant dessine le slider entre beginSliderRow et endSliderRow. | 31 |
| `editor_toolUtilities_uiRows.beginSubTab(label, flags)` | Ouvre un sous-onglet via util.beginSubTab et réinitialise la mémoire de séparateur. | 92 |
| `editor_toolUtilities_uiRows.endSliderRow()` | Referme la ligne de slider (largeur, colonnes, style). | 45 |
| `editor_toolUtilities_uiRows.endSubTab()` | Ferme un sous-onglet par une ligne de séparation, sauf si la dernière chose dessinée en était déjà une ou s'il n'y a plus de place verticale. | 99 |
| `editor_toolUtilities_uiRows.markSep()` | Dessine la ligne de fin d'une liste et retient sa position, pour que le sous-onglet qui la contient n'en dessine pas une seconde juste dessous. | 87 |
| `editor_toolUtilities_uiRows.mixRow(opts, id, has, offCol)` | Rangée de boutons dont plusieurs peuvent être allumés à la fois, pour un choix qui est un mélange. `has(id)` dit lesquels sont allumés. L'infobulle précise « In the mix » ou non. | 70 |
| `editor_toolUtilities_uiRows.optIcon(name)` | Renvoie l'icône de l'éditeur de ce nom, ou un carré simple si elle est inconnue. | 63 |
| `editor_toolUtilities_uiRows.rowLabel(label, tip, col)` | Libellé à gauche d'une rangée de boutons, suivi d'un SameLine à X fixe (au moins la largeur du libellé). | 53 |

### Détail des paramètres

#### `editor_toolUtilities_uiRows.beginSliderRow(id, atDefault, onReset)`

Icône de réinitialisation à gauche du slider (espace vide si déjà à la valeur par défaut). L'appelant dessine le slider entre beginSliderRow et endSliderRow.

- `id` (*string*) : Identifiant ImGui de base.
- `atDefault` (*boolean*) : Vrai : valeur par défaut, pas de bouton.
- `onReset` (*function*) : Appelée au clic sur le bouton de réinitialisation.

#### `editor_toolUtilities_uiRows.beginSubTab(label, flags)`

Ouvre un sous-onglet via util.beginSubTab et réinitialise la mémoire de séparateur.

- `label` (*string*) : Titre.
- `flags` (*integer|nil*) : Drapeaux ImGui transmis à util.beginSubTab.
- **renvoie** : boolean Vrai si l'onglet est ouvert (déduit du code).

#### `editor_toolUtilities_uiRows.mixRow(opts, id, has, offCol)`

Rangée de boutons dont plusieurs peuvent être allumés à la fois, pour un choix qui est un mélange. `has(id)` dit lesquels sont allumés. L'infobulle précise « In the mix » ou non.

- `opts` (*table*) : Liste d'options { id, tip, icon } ou de triplets positionnels.
- `id` (*string*) : Préfixe d'identifiant ImGui.
- `has` (*function*) : has(optId) renvoie vrai si l'option est allumée.
- `offCol` (*ImVec4*) : Couleur du bouton éteint.
- **renvoie** : string|nil Identifiant de l'option cliquée, nil sinon.

#### `editor_toolUtilities_uiRows.optIcon(name)`

Renvoie l'icône de l'éditeur de ce nom, ou un carré simple si elle est inconnue.

- `name` (*string*) : Nom dans editor.icons.
- **renvoie** : any Icône.

#### `editor_toolUtilities_uiRows.rowLabel(label, tip, col)`

Libellé à gauche d'une rangée de boutons, suivi d'un SameLine à X fixe (au moins la largeur du libellé).

- `label` (*string*) : Texte.
- `tip` (*string|nil*) : Infobulle.
- `col` (*ImVec4|nil*) : Couleur (greenB par défaut).

## Champs

| Champ | Type | Description |
|---|---|---|
| `LABEL_COL_W` | number | Largeur de la colonne de libellés (118), pour aligner les rangées de boutons empilées. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/toolUtilities/uiRows.lua`.*
