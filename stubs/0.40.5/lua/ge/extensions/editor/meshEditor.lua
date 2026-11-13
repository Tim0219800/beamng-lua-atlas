---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Code commun aux éditeurs d'objets à nœuds de type « mesh » (MeshRoad et River) du world editor. Ce n'est pas une extension chargée par extensions.load : meshRoadEditor.lua et riverEditor.lua le chargent avec dofile() puis fixent M.type, M.preferencesName et M.niceName avant de brancher ses fonctions suffixées « _ » sur leur mode d'édition. Il gère la sélection du mesh et de ses nœuds, la création par Alt+clic, l'insertion de nœuds, le glisser de largeur, la copie/collage des champs, la suppression, l'historique undo/redo, le surlignage et les préférences (largeur, profondeur, hauteur par défaut).
--- Accès : extension `editor_meshEditor` : `extensions.load("editor_meshEditor")`, puis la globale `editor_meshEditor`
---@class editor_meshEditor
editor_meshEditor = {}

--- Appelée par l'action map (copie) : mémorise les champs du mesh sélectionné (editor.copyFields) pour un collage ultérieur ou pour initialiser un nouveau mesh. Ne fait rien si aucun mesh n'est sélectionné.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshEditor.lua:964
function editor_meshEditor.copySettingsAM() end

--- Appelée à l'activation du mode d'édition : calcule le nom du mode (« Edit » .. M.type) et synchronise la sélection avec l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshEditor.lua:1060
function editor_meshEditor.onActivate_() end

--- Supprime la sélection : les nœuds sélectionnés si le mesh en garde plus de 2, sinon le mesh entier. Passe par l'historique de l'éditeur (undo/redo).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshEditor.lua:269
function editor_meshEditor.onDeleteSelection() end

--- Appelée quand le mode d'édition est quitté : désélectionne le nœud et vide la sélection d'objets.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshEditor.lua:1055
function editor_meshEditor.onDeselect_() end

--- Hook : quand l'alignement du gizmo d'axes change (et que ce mode est actif), repositionne le gizmo sur le nœud sélectionné. Le nom contient la faute « Aligment » du jeu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshEditor.lua:1040
function editor_meshEditor.onEditorAxisGizmoAligmentChanged_() end

--- Hook : quand un champ de l'inspecteur change, régénère les meshes du type géré si le champ est segmentLength ou subdivideLength.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshEditor.lua:1029
---@param selectedIds integer[] Identifiants des objets dont le champ a changé.
---@param fieldName string Nom du champ modifié.
---@param fieldValue any Nouvelle valeur (non utilisée ici).
---@param arrayIndex integer|nil Indice dans un champ tableau (non utilisé ici).
function editor_meshEditor.onEditorInspectorFieldChanged_(selectedIds, fieldName, fieldValue, arrayIndex) end

--- Hook : dessine, dans l'en-tête de l'inspecteur, le panneau des propriétés des nœuds sélectionnés (largeur, profondeur, hauteur) quand ce mode est actif et qu'un mesh avec nœuds sélectionnés existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshEditor.lua:354
---@param inspectorInfo table Informations de l'inspecteur fournies par l'éditeur.
function editor_meshEditor.onEditorInspectorHeaderGui_(inspectorInfo) end

--- Hook : quand la sélection d'objets change (mode actif), retient l'id du premier objet de type M.type comme mesh courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshEditor.lua:1047
function editor_meshEditor.onEditorObjectSelectionChanged_() end

--- Hook : recalcule le décalage de hauteur (heightOffset) quand la préférence <preferencesName>.general.defaultHeight change.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshEditor.lua:1011
---@param path string Chemin complet de la préférence modifiée.
---@param value number Nouvelle valeur.
function editor_meshEditor.onEditorPreferenceValueChanged_(path, value) end

--- Hook : enregistre la catégorie de préférences M.preferencesName avec defaultWidth (10), defaultDepth (5), defaultHeight (2), dragWidth, highlightNearby et highlightNearbyDistance (100 m).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshEditor.lua:1015
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_meshEditor.onEditorRegisterPreferences_(prefsRegistry) end

--- Sélectionne tous les nœuds du mesh courant (indices 0 à getNodeCount()-1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshEditor.lua:53
function editor_meshEditor.onSelectAll() end

--- Dessine la barre d'outils du mode : largeur et profondeur par défaut, case « Highlight nearby » et distance de surlignage en mètres. Les valeurs sont écrites dans les préférences.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshEditor.lua:984
function editor_meshEditor.onToolbar_() end

--- Appelée à chaque image tant que le mode est actif : détecte le nœud ou le mesh survolé, gère le raycast souris, la création Alt+clic de meshes et de nœuds, le glisser de largeur, le surlignage et le dessin debugDrawer (sphères et textes d'aide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshEditor.lua:735
function editor_meshEditor.onUpdate_() end

--- Appelée par l'action map (coller) : applique les champs mémorisés au mesh sélectionné via une action d'historique « PasteMeshFields » (undo/redo possibles). Ne fait rien sans mesh sélectionné ou sans copie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshEditor.lua:129
function editor_meshEditor.pasteFieldsAM() end

