---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/api/genericInspector.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet inspecteur. Après `initialize` il contient valueInspector, fieldSetter, fieldNameFilter (ImGuiTextFilter), inspectorFieldModifiers, etc.
---@class editor_api_genericInspector
local editor_api_genericInspector = {}

--- Prépare l'inspecteur : crée un valueInspector (nom unique "genericInspectorN"), le filtre de recherche et les tampons ImGui, et branche `fieldSetter` comme callback de modification de valeur.
---Source : lua/ge/extensions/editor/api/genericInspector.lua:214
---@param fieldSetter function function(fieldName, fieldValue, arrayIndex, customData, editEnded) appelée quand l'utilisateur modifie un champ
function editor_api_genericInspector:initialize(fieldSetter) end

--- Dessine l'inspecteur pour la liste de champs donnée : barre de recherche, groupes, champs simples, tableaux de valeurs et tableaux de champs (type beginArray). Affiche "<No search matches>" si le filtre ne retient rien. À appeler à chaque frame dans la fenêtre ImGui.
---Source : lua/ge/extensions/editor/api/genericInspector.lua:37
---@param fields table|nil liste de champs {name, value, type, typeName, id, groupName, fieldDocs, hideInInspector, isArray…} ; nil = ne rien afficher
function editor_api_genericInspector:inspectorGui(fields) end

--- Construit la liste de champs en appelant `fieldCallback(i)` pour i = 1, 2, … jusqu'à un retour nil (maximum 1000), puis appelle `inspectorGui`.
---Source : lua/ge/extensions/editor/api/genericInspector.lua:23
---@param fieldCallback function function(index) -> table|nil, renvoie le champ numéro index ou nil à la fin
function editor_api_genericInspector:inspectorGuiWithFieldCallback(fieldCallback) end

