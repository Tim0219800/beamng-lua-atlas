---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet renvoyé par le constructeur. Champs : key, index (id sélectionné en dernier), selections (liste d'ids), objects, sorted, elementEditor, activeTags, createByShift, selectByClick, windowDescription.
---@class editor_sitesEditor_sortedListDisplay
local editor_sitesEditor_sortedListDisplay = {}

--- Change la sélection de la liste sans appeler elementEditor:select, pour garder un glissement de gizmo en cours (utilisé après la duplication par Shift).
---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:112
---@param id integer Id de l'élément.
function editor_sitesEditor_sortedListDisplay:adoptElement(id) end

--- Dessine l'onglet ; traite les entrées souris si le gizmo est permis.
---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:139
---@param mouseInfo table Infos souris de sitesEditor.
function editor_sitesEditor_sortedListDisplay:draw(mouseInfo) end

--- Dessine le widget de champs personnalisés et les boutons Copy Fields / Paste Fields.
---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:288
---@param fields table customFields de l'élément.
function editor_sitesEditor_sortedListDisplay:drawCustomFields(fields) end

--- Dessine la liste filtrable à gauche et le panneau d'édition de l'élément à droite.
---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:194
function editor_sitesEditor_sortedListDisplay:drawList() end

--- Renvoie l'élément actuellement sélectionné.
---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:308
---@return table|nil  Élément ou nil.
function editor_sitesEditor_sortedListDisplay:getCurrentSelected() end

--- Constructeur : prépare la sélection (editor.selection[key]), les champs personnalisés et la zone de recherche.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:9
---@param sitesEditor table Module editor_sitesEditor.
---@param key string 'locations', 'zones' ou 'parkingSpots'.
---@param elementEditor table Sous-éditeur d'élément.
function editor_sitesEditor_sortedListDisplay:init(sitesEditor, key, elementEditor) end

--- Gère les clics dans le monde : création par Shift+clic, sélection par hitTest ou délégation à elementEditor:input.
---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:147
function editor_sitesEditor_sortedListDisplay:input() end

--- Sélectionne l'élément d'id donné (nil pour désélectionner), met à jour surbrillance, éditeur d'élément, tags et champs d'édition.
---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:66
---@param id integer|nil Id de l'élément.
---@param mode string|nil nil remplace la sélection ; 'toggle' ou 'add' l'étend (toggle retire un id déjà sélectionné).
function editor_sitesEditor_sortedListDisplay:selectElement(id, mode) end

--- Appelé quand l'onglet devient actif : vide la sélection et passe les objets en dessin 'normal'.
---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:45
function editor_sitesEditor_sortedListDisplay:selected() end

--- Modifie un champ (name, color...) de tous les éléments sélectionnés via une action annulable.
---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:187
---@param name string Nom du champ.
---@param value any Nouvelle valeur.
function editor_sitesEditor_sortedListDisplay:setField(name, value) end

--- Définit les sites édités, retient objects et sorted, les transmet à l'éditeur d'élément et recalcule les tags actifs.
---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:24
---@param sites table Objet sites.
function editor_sitesEditor_sortedListDisplay:setSites(sites) end

--- Appelé quand l'onglet est quitté : vide la sélection et passe les objets en dessin 'faded'.
---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:57
function editor_sitesEditor_sortedListDisplay:unselect() end

--- Recompte les tags utilisés par les éléments (table tag vers nombre).
---Source : lua/ge/extensions/editor/sitesEditor/sortedListDisplay.lua:32
function editor_sitesEditor_sortedListDisplay:updateActiveTags() end

