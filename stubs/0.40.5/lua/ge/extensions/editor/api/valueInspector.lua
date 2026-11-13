---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/valueInspector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet inspecteur renvoyé par le constructeur du module (require(...)()). Méthodes d'instance.
---@class editor_api_valueInspector
local editor_api_valueInspector = {}

--- Vide le cache des textures d'aperçu utilisées dans le sélecteur de matériaux.
---Source : lua/ge/extensions/editor/api/valueInspector.lua:504
function editor_api_valueInspector:deleteTexObjs() end

--- Comme displaySimSetPopupList mais pour les matériaux : popup avec aperçu des textures (cache texObjs) et filtre par nom ou tag.
---Source : lua/ge/extensions/editor/api/valueInspector.lua:299
---@param objectSet table Liste d'objets matériau.
---@param fieldName string Nom du champ.
---@param fieldNameId string Id ImGui du champ.
---@param fieldValue string Valeur actuelle.
---@param selectedIds table Ids des objets sélectionnés.
---@param val any customData transmis au callback (déduit du code).
---@param arrayIndex integer|nil Index dans un champ tableau.
---@param className string|nil Classe (déduit du code).
function editor_api_valueInspector:displayMaterialPopupList(objectSet, fieldName, fieldNameId, fieldValue, selectedIds, val, arrayIndex, className) end

--- Affiche un bouton « ... » et la valeur actuelle, et au clic une popup filtrable listant les objets des SimSet donnés pour en choisir un.
---Source : lua/ge/extensions/editor/api/valueInspector.lua:212
---@param objectSetArray table Liste de SimSet/groupes à parcourir.
---@param fieldName string Nom du champ.
---@param fieldNameId string Id ImGui du champ.
---@param fieldValue string Valeur actuelle.
---@param selectedIds table Ids des objets sélectionnés.
---@param val any customData transmis au callback (déduit du code).
---@param arrayIndex integer|nil Index dans un champ tableau.
---@param className string|nil Classe d'objets à lister (déduit du code).
function editor_api_valueInspector:displaySimSetPopupList(objectSetArray, fieldName, fieldNameId, fieldValue, selectedIds, val, arrayIndex, className) end

--- Initialise les tampons ImGui (texte, entiers, flottants, booléen, combo) et les champs par défaut. Appelé automatiquement par le constructeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/api/valueInspector.lua:426
function editor_api_valueInspector:init() end

--- Construit (une seule fois, sauf force) les tables globales d'annotations et de datablocks utilisées par les sélecteurs.
---Source : lua/ge/extensions/editor/api/valueInspector.lua:492
---@param force boolean|nil true pour reconstruire même si déjà initialisé.
function editor_api_valueInspector:initializeTables(force) end

--- Marque les tables globales comme à reconstruire au prochain initializeTables.
---Source : lua/ge/extensions/editor/api/valueInspector.lua:488
function editor_api_valueInspector:reinitializeTables() end

--- Définit l'id du champ dont la fenêtre popup de sélection SimSet est ouverte (nil pour la fermer).
---Source : lua/ge/extensions/editor/api/valueInspector.lua:500
---@param id string|nil Id du champ (« ##nomChamp »).
function editor_api_valueInspector:setSimSetWindowFieldId(id) end

--- Dessine un champ complet : libellé (avec tooltip fieldDesc, menu copier/coller) et widget d'édition choisi selon fieldTypeName puis fieldType. Appelle un éditeur personnalisé s'il est enregistré pour (classe de sélection, fieldName). Toute modification est envoyée à self.setValueCallback.
---Source : lua/ge/extensions/editor/api/valueInspector.lua:565
---@param fieldName string Nom technique du champ.
---@param fieldValue any Valeur actuelle (chaîne, nombre, table selon le type).
---@param arrayIndex integer|nil Index si champ tableau.
---@param fieldLabel string Libellé affiché.
---@param fieldDesc string|nil Description affichée en tooltip.
---@param fieldType string Type du champ : 'float', 'int', 'bool', 'filename', 'Point3F', 'ColorF', 'string', etc.
---@param fieldTypeName string Nom de type moteur : 'TypeMaterialName', 'TypeShapeFilename', 'TypeCommand', etc.
---@param customData any Données opaques renvoyées au callback.
---@param pasteCallback function|nil pasteCallback(fieldName, value, arrayIndex, customData) appelé lors d'un collage.
---@param contextMenuUI function|nil Contenu additionnel du menu contextuel (déduit du code).
---@param indeterminateFlags integer|nil Drapeaux de valeur indéterminée (0 par défaut).
function editor_api_valueInspector:valueEditorGui(fieldName, fieldValue, arrayIndex, fieldLabel, fieldDesc, fieldType, fieldTypeName, customData, pasteCallback, contextMenuUI, indeterminateFlags) end

