---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/objectTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode d'édition principal du World Editor, « Manipulate Object(s) » (editor.editModes.objectSelect, icône crayon). Il gère la sélection d'objets (clic, rectangle, survol), le gizmo d'axes (déplacement, rotation, échelle, alignement local/monde, snapping, glisser-dupliquer avec Shift, alignement sur surface avec Ctrl+Alt), les boîtes englobantes dessinées (orange, rouge si verrouillé ; pour un véhicule, la sphère et les axes du nœud de référence), copier/coller/dupliquer/supprimer avec annulation (editor.history), ainsi que l'enregistrement des préférences « gizmos » (général, pinceau, icônes d'objets) et « snapping » (général, terrain, grille). Il ajoute aussi au menu de l'arbre de scène « Move Selection At Camera » et « Align Objects Individually To The Grid ». À l'initialisation il enregistre des fonctions sur la table globale editor (voir classe « editor »).
--- Accès : extension `editor_objectTool` : `extensions.load("editor_objectTool")`, puis la globale `editor_objectTool`
---@class editor_objectTool
editor_objectTool = {}

--- Hook appelé quand l'alignement du gizmo change (nom avec faute dans le jeu : « Aligment »). Si le mode d'édition courant est « Manipulate Object(s) », replace le gizmo sur la sélection.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/objectTool.lua:1134
function editor_objectTool.onEditorAxisGizmoAligmentChanged() end

--- Hook appelé quand un mode d'édition est activé : restaure l'état de gizmo (editMode.axisGizmoRestoreState) mémorisé à sa dernière désactivation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/objectTool.lua:1503
---@param editMode table Mode d'édition activé.
function editor_objectTool.onEditorEditModeActivated(editMode) end

--- Hook appelé quand un mode d'édition est désactivé : mémorise l'état du gizmo dans editMode.axisGizmoRestoreState.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/objectTool.lua:1520
---@param editMode table Mode d'édition désactivé.
function editor_objectTool.onEditorEditModeDeactivated(editMode) end

--- Hook appelé à l'initialisation de l'éditeur : crée editor.editModes.objectSelect (action map ObjectTool, raccourcis de copie, collage, duplication, suppression), enregistre l'API sur editor, applique l'alignement local par défaut si la préférence est active et ajoute deux entrées au menu contextuel de l'arbre de scène.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/objectTool.lua:1427
function editor_objectTool.onEditorInitialized() end

--- Hook appelé quand un champ de l'inspecteur est modifié. Ne traite que le champ startTime d'un TimeOfDay.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/objectTool.lua:1489
---@param selectedIds integer[] Identifiants des objets sélectionnés ; seul le premier est examiné.
---@param fieldName string Nom du champ modifié.
---@param fieldValue any Nouvelle valeur (non utilisée).
---@param arrayIndex integer|nil Indice dans un champ tableau (non utilisé).
function editor_objectTool.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex) end

--- Hook appelé quand une préférence change : répercute les réglages gizmos.* (icônes d'objets, couleurs, échelles, snapping fin, etc.) vers worldEditorCppApi.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/objectTool.lua:1258
---@param path string Chemin de la préférence, par ex. « gizmos.general.drawObjectIcons ».
---@param value any Nouvelle valeur.
function editor_objectTool.onEditorPreferenceValueChanged(path, value) end

--- Hook d'enregistrement des préférences : crée les catégories gizmos et snapping et leurs préférences (surbrillance de la sélection, icônes d'objets, couleurs, tailles de gizmo, grille, etc.).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/objectTool.lua:1326
---@param prefsRegistry table Registre de préférences de l'éditeur.
function editor_objectTool.onEditorRegisterPreferences(prefsRegistry) end

--- Pas une classe : fonctions que ce module ajoute à la table globale editor lors de onEditorInitialized (registerApi).
---@class editor_objectTool_editor
local editor_objectTool_editor = {}

--- Dessine la boîte englobante d'un objet de scène (ignore les objets sans getTransform). Pour un BeamNGVehicle, dessine à la place une sphère magenta et trois cylindres (axes rouge, bleu, vert) au nœud de référence, dont la taille suit la distance caméra sauf si gizmos.general.fixedRefnodeVisualization est actif.
---Source : lua/ge/extensions/editor/objectTool.lua:72
---@param obj userdata Objet de scène (SimObject).
---@param color ColorF Couleur de la boîte (non utilisée pour un véhicule).
function editor_objectTool_editor.drawSelectedObjectBBox(obj, color) end

--- Dessine avec debugDrawer:drawLineInstance les 12 arêtes d'une boîte unité transformée par la matrice donnée.
---Source : lua/ge/extensions/editor/objectTool.lua:47
---@param objMat MatrixF Matrice de transformation (position, rotation, échelle de la boîte).
---@param color ColorF Couleur des lignes.
function editor_objectTool_editor.drawSelectionBBox(objMat, color) end

--- Duplique la sélection : si le bouton gauche de la souris est enfoncé, colle immédiatement une copie des objets manipulables et passe en glisser-dupliquer ; sinon enregistre une action annulable « DuplicateObjects ».
---Source : lua/ge/extensions/editor/objectTool.lua:1198
function editor_objectTool_editor.duplicateSceneObjects() end

--- Crée, avec annulation possible (action « DuplicateObjectsAtCamera »), une copie de la sélection déplacée pour que le gizmo se retrouve à 10 m devant la caméra.
---Source : lua/ge/extensions/editor/objectTool.lua:238
function editor_objectTool_editor.duplicateSelectionAtCamera() end

--- Déplace la sélection (hors SimGroup) à 10 m devant la caméra, avec annulation possible (action « MoveSelectionAtCamera »).
---Source : lua/ge/extensions/editor/objectTool.lua:272
function editor_objectTool_editor.moveSelectionAtCamera() end

--- Place le gizmo d'axes sur la sélection d'objets : orientation du dernier objet en mode local, position du dernier objet, du centre de la boîte de sélection ou du centroïde selon les préférences (snapping et gizmos.general.useObjectBoxCenter).
---Source : lua/ge/extensions/editor/objectTool.lua:108
function editor_objectTool_editor.updateObjectSelectionAxisGizmo() end

