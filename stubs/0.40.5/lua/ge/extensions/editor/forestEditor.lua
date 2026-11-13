---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/forestEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil « Edit Forest » de l'éditeur de monde : peinture et édition des objets de la forêt (ForestItem) avec des pinceaux (brosses de ForestBrush/ForestBrushElement), outils de sélection, de déplacement, rotation, échelle et accrochage au terrain. Il gère aussi l'inspecteur des ForestItemData (aperçu du mesh via ShapePreview), la sauvegarde des brosses (main.forestbrushes4.json) et de la forêt à l'enregistrement du niveau. Un moddeur l'utilise surtout pour sélectionner des items par script ou changer la taille du pinceau.
--- Accès : extension `editor_forestEditor` : `extensions.load("editor_forestEditor")`, puis la globale `editor_forestEditor`
---@class editor_forestEditor
---@field dependencies string[] Extensions chargées avant ce module : {"core_forest"}.
editor_forestEditor = {}

--- Active la répétition automatique du redimensionnement du pinceau au clavier (touches [ ]) : remet le timer à 0 et mémorise la direction. L'update par frame appelle ensuite changeBrush à l'intervalle de la préférence brushSizeChangeIntervalWithKeys.
---Source : lua/ge/extensions/editor/forestEditor.lua:3215
---@param direction number Sens du changement (positif agrandit, négatif réduit) ; transmis tel quel à changeBrush
function editor_forestEditor.beginChangeBrushSizeWithKeys(direction) end

--- Modifie la taille du pinceau, ou sa pression (densité) si la touche Ctrl est enfoncée. Les valeurs sont bornées puis appliquées à l'outil de pinceau.
---Source : lua/ge/extensions/editor/forestEditor.lua:1425
---@param value number Direction/multiplicateur du changement (déduit du code)
---@param step number Pas appliqué (unités de la préférence correspondante)
function editor_forestEditor.changeBrush(value, step) end

--- Vide la sélection d'items de forêt, y compris la surbrillance dans le viewport : remet l'état « sélectionné » de chaque item à faux puis demande la reconstruction des données d'instances. Ne fait rien (aucune reconstruction) si rien n'est sélectionné.
---Source : lua/ge/extensions/editor/forestEditor.lua:208
function editor_forestEditor.clearForestItemsSelection() end

--- Debug : affiche dans la console la taille, la pression et la dureté du pinceau courant.
---Source : lua/ge/extensions/editor/forestEditor.lua:144
function editor_forestEditor.dumpBrushProperties() end

--- Debug : affiche dans la console la liste des brosses de forêt (var.forestBrushes).
---Source : lua/ge/extensions/editor/forestEditor.lua:132
function editor_forestEditor.dumpForestBrushes() end

--- Debug : affiche dans la console la table de correspondance des brosses de forêt (var.forestBrushesMap).
---Source : lua/ge/extensions/editor/forestEditor.lua:138
function editor_forestEditor.dumpForestBrushesMap() end

--- Arrête la répétition automatique du redimensionnement du pinceau au clavier et remet le timer à 0.
---Source : lua/ge/extensions/editor/forestEditor.lua:3216
function editor_forestEditor.endChangeBrushSizeWithKeys() end

--- Hook appelé après un rechargement Lua (reçoit les données renvoyées par onSerialize). Met simplement deserializeBrushes à false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/forestEditor.lua:3192
---@param data any Valeur renvoyée par onSerialize (true)
function editor_forestEditor.onDeserialize(data) end

--- Hook appelé après l'enregistrement du niveau. Sauve les ForestBrushGroup dans <niveau>/main.forestbrushes4.json si les brosses sont modifiées, sauve la forêt (saveForest) si editor.forestDirty, et enregistre les datablocks ForestItemData modifiés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/forestEditor.lua:3111
function editor_forestEditor.onEditorAfterSaveLevel() end

--- Hook appelé quand l'alignement du gizmo d'axes change (local/monde). Replace le gizmo sur l'item (alignement local, un seul item) ou sur le centroïde de la sélection. Le nom contient la faute « Aligment » telle que dans le moteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/forestEditor.lua:2881
function editor_forestEditor.onEditorAxisGizmoAligmentChanged() end

--- Hook appelé quand le mode du gizmo (déplacer/tourner/échelle) change. Si le mode d'édition actif est « Edit Forest » et que l'outil courant n'est pas « select », bascule sur l'outil « select ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/forestEditor.lua:3179
---@param mode integer Nouveau mode du gizmo (non utilisé)
function editor_forestEditor.onEditorAxisGizmoModeChanged(mode) end

--- Hook appelé chaque frame par l'éditeur : dessine la fenêtre de l'outil (barre d'outils, palettes de brosses et de ForestItemData, inspecteur), gère les entrées et le rendu des aides (lignes, sphères, boîtes englobantes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/forestEditor.lua:2040
function editor_forestEditor.onEditorGui() end

--- Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre « forestEditor », deux dialogues modaux, l'inspecteur de type forestItem, les éditeurs de champs personnalisés (shapeFile, ForestItemData) et le mode d'édition « Edit Forest » ; initialise ensuite pinceau, pression, dureté et tables de datablocks.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/forestEditor.lua:3073
function editor_forestEditor.onEditorInitialized() end

--- Hook appelé quand un champ de l'inspecteur est modifié. Marque les brosses comme modifiées (ForestBrush/ForestBrushElement) et met à jour l'aperçu du mesh quand shapeFile d'un ForestItemData ou forestItemData d'un ForestBrushElement change. Ne traite que le cas d'un seul objet sélectionné.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/forestEditor.lua:3133
---@param selectedIds integer[] Ids des objets sélectionnés dans l'inspecteur
---@param fieldName string Nom du champ modifié
---@param fieldValue any Nouvelle valeur
---@param arrayIndex integer|nil Index dans le champ tableau (non utilisé)
function editor_forestEditor.onEditorInspectorFieldChanged(selectedIds, fieldName, fieldValue, arrayIndex) end

--- Hook appelé pour déclarer les préférences de l'éditeur : catégorie forestEditor, sous-catégorie general (taille, pression/densité, dureté, décalage de profondeur, alignement forcé au terrain, accrochage de tous les types, distance de travail).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/forestEditor.lua:3159
---@param prefsRegistry table Registre de préférences de l'éditeur
function editor_forestEditor.onEditorRegisterPreferences(prefsRegistry) end

--- Hook appelé avant un rechargement Lua : vide la sélection d'items puis renvoie true pour que onDeserialize soit déclenché ensuite.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/forestEditor.lua:3196
---@return boolean  Toujours true
function editor_forestEditor.onSerialize() end

--- Reconstruit la liste var.forestItemData à partir de tous les objets de classe ForestItemData de la scène, en excluant les datablocks parallax window.
---Source : lua/ge/extensions/editor/forestEditor.lua:1459
function editor_forestEditor.refreshForestItemDataList() end

--- Sélectionne l'outil de pinceau d'indice donné dans var.brushes (indice Lua, à partir de 1).
---Source : lua/ge/extensions/editor/forestEditor.lua:3188
---@param index integer Indice dans la liste des brosses
function editor_forestEditor.selectBrushByIndex(index) end

--- Définit (ou complète) la sélection d'items de forêt de l'éditeur. Filtre les items parallax, met à jour la surbrillance, le centroïde, le gizmo d'axes et l'aperçu du mesh du dernier item.
---Source : lua/ge/extensions/editor/forestEditor.lua:219
---@param forestItems table|nil Liste d'items de forêt ; nil pour seulement désélectionner
---@param addToSelection boolean|nil true pour ajouter à la sélection existante, sinon elle est remplacée
function editor_forestEditor.selectForestItems(forestItems, addToSelection) end

--- Active un outil ou une brosse de la barre d'outils à partir de son libellé (par exemple « select »). Ne fait rien si aucun libellé ne correspond.
---Source : lua/ge/extensions/editor/forestEditor.lua:367
---@param toolName string Libellé (label) de l'outil ou de la brosse
function editor_forestEditor.selectToolByName(toolName) end

