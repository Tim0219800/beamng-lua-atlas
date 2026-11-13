# `editor_meshEditor`

*Fichier : `lua/ge/extensions/editor/meshEditor.lua` · VM : Game Engine (GE) · 1081 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_meshEditor` : `extensions.load("editor_meshEditor")`, puis la globale `editor_meshEditor`

Code commun aux éditeurs d'objets à nœuds de type « mesh » (MeshRoad et River) du world editor. Ce n'est pas une extension chargée par extensions.load : meshRoadEditor.lua et riverEditor.lua le chargent avec dofile() puis fixent M.type, M.preferencesName et M.niceName avant de brancher ses fonctions suffixées « _ » sur leur mode d'édition. Il gère la sélection du mesh et de ses nœuds, la création par Alt+clic, l'insertion de nœuds, le glisser de largeur, la copie/collage des champs, la suppression, l'historique undo/redo, le surlignage et les préférences (largeur, profondeur, hauteur par défaut).

## Remarques

- Les variables de module (M.type, M.preferencesName, M.niceName) doivent être renseignées par l'éditeur appelant AVANT onActivate_ / onEditorRegisterPreferences_ ; sinon les chemins de préférences sont invalides.
- Comme dofile() réévalue le fichier, chaque éditeur (route, rivière) a sa propre copie isolée de l'état (nœud sélectionné, copie des champs).
- Alt maintenu = mode création : clic sur le vide crée un mesh ou ajoute un nœud ; clic sur le mesh sélectionné insère un nœud interpolé (largeur, profondeur, normale moyennes).
- Bug mineur : meshRoadEditor.lua et riverEditor.lua exportent M.onEditorGui_, M.deleteNodeAM et M.selectAllNodes de ce module, mais il ne les définit pas : ces champs valent nil côté éditeurs.
- Les fonctions de la liste exportée utilisent le suffixe « _ » pour ne pas être confondues avec les hooks de l'extension qui les enveloppe.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_meshEditor.copySettingsAM()` | Appelée par l'action map (copie) : mémorise les champs du mesh sélectionné (editor.copyFields) pour un collage ultérieur ou pour initialiser un nouveau mesh. Ne fait rien si aucun mesh n'est sélectionné. *(interne)* | 964 |
| `editor_meshEditor.onActivate_()` | Appelée à l'activation du mode d'édition : calcule le nom du mode (« Edit » .. M.type) et synchronise la sélection avec l'éditeur. *(interne)* *(hook)* | 1060 |
| `editor_meshEditor.onDeleteSelection()` | Supprime la sélection : les nœuds sélectionnés si le mesh en garde plus de 2, sinon le mesh entier. Passe par l'historique de l'éditeur (undo/redo). *(interne)* *(hook)* | 269 |
| `editor_meshEditor.onDeselect_()` | Appelée quand le mode d'édition est quitté : désélectionne le nœud et vide la sélection d'objets. *(interne)* *(hook)* | 1055 |
| `editor_meshEditor.onEditorAxisGizmoAligmentChanged_()` | Hook : quand l'alignement du gizmo d'axes change (et que ce mode est actif), repositionne le gizmo sur le nœud sélectionné. Le nom contient la faute « Aligment » du jeu. *(interne)* *(hook)* | 1040 |
| `editor_meshEditor.onEditorInspectorFieldChanged_(selectedIds, fieldName, fieldValue, arrayIndex)` | Hook : quand un champ de l'inspecteur change, régénère les meshes du type géré si le champ est segmentLength ou subdivideLength. *(interne)* *(hook)* | 1029 |
| `editor_meshEditor.onEditorInspectorHeaderGui_(inspectorInfo)` | Hook : dessine, dans l'en-tête de l'inspecteur, le panneau des propriétés des nœuds sélectionnés (largeur, profondeur, hauteur) quand ce mode est actif et qu'un mesh avec nœuds sélectionnés existe. *(interne)* *(hook)* | 354 |
| `editor_meshEditor.onEditorObjectSelectionChanged_()` | Hook : quand la sélection d'objets change (mode actif), retient l'id du premier objet de type M.type comme mesh courant. *(interne)* *(hook)* | 1047 |
| `editor_meshEditor.onEditorPreferenceValueChanged_(path, value)` | Hook : recalcule le décalage de hauteur (heightOffset) quand la préférence <preferencesName>.general.defaultHeight change. *(interne)* *(hook)* | 1011 |
| `editor_meshEditor.onEditorRegisterPreferences_(prefsRegistry)` | Hook : enregistre la catégorie de préférences M.preferencesName avec defaultWidth (10), defaultDepth (5), defaultHeight (2), dragWidth, highlightNearby et highlightNearbyDistance (100 m). *(interne)* *(hook)* | 1015 |
| `editor_meshEditor.onSelectAll()` | Sélectionne tous les nœuds du mesh courant (indices 0 à getNodeCount()-1). *(interne)* *(hook)* | 53 |
| `editor_meshEditor.onToolbar_()` | Dessine la barre d'outils du mode : largeur et profondeur par défaut, case « Highlight nearby » et distance de surlignage en mètres. Les valeurs sont écrites dans les préférences. *(interne)* *(hook)* | 984 |
| `editor_meshEditor.onUpdate_()` | Appelée à chaque image tant que le mode est actif : détecte le nœud ou le mesh survolé, gère le raycast souris, la création Alt+clic de meshes et de nœuds, le glisser de largeur, le surlignage et le dessin debugDrawer (sphères et textes d'aide). *(interne)* *(hook)* | 735 |
| `editor_meshEditor.pasteFieldsAM()` | Appelée par l'action map (coller) : applique les champs mémorisés au mesh sélectionné via une action d'historique « PasteMeshFields » (undo/redo possibles). Ne fait rien sans mesh sélectionné ou sans copie. *(interne)* | 129 |

### Détail des paramètres

#### `editor_meshEditor.onEditorInspectorFieldChanged_(selectedIds, fieldName, fieldValue, arrayIndex)`

Hook : quand un champ de l'inspecteur change, régénère les meshes du type géré si le champ est segmentLength ou subdivideLength.

- `selectedIds` (*integer[]*) : Identifiants des objets dont le champ a changé.
- `fieldName` (*string*) : Nom du champ modifié.
- `fieldValue` (*any*) : Nouvelle valeur (non utilisée ici).
- `arrayIndex` (*integer|nil*) : Indice dans un champ tableau (non utilisé ici).

#### `editor_meshEditor.onEditorInspectorHeaderGui_(inspectorInfo)`

Hook : dessine, dans l'en-tête de l'inspecteur, le panneau des propriétés des nœuds sélectionnés (largeur, profondeur, hauteur) quand ce mode est actif et qu'un mesh avec nœuds sélectionnés existe.

- `inspectorInfo` (*table*) : Informations de l'inspecteur fournies par l'éditeur.

#### `editor_meshEditor.onEditorPreferenceValueChanged_(path, value)`

Hook : recalcule le décalage de hauteur (heightOffset) quand la préférence <preferencesName>.general.defaultHeight change.

- `path` (*string*) : Chemin complet de la préférence modifiée.
- `value` (*number*) : Nouvelle valeur.

#### `editor_meshEditor.onEditorRegisterPreferences_(prefsRegistry)`

Hook : enregistre la catégorie de préférences M.preferencesName avec defaultWidth (10), defaultDepth (5), defaultHeight (2), dragWidth, highlightNearby et highlightNearbyDistance (100 m).

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur.

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLineInstance`, `drawSphere`, `drawTextAdvanced`, `setSolidTriCulling`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/meshEditor.lua`.*
