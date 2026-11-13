---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/sitesEditor/tags.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet renvoyé par le constructeur. Champs : sitesEditor, key, sites, tag, tags, sortedTags, hasTag, noTag.
---@class editor_sitesEditor_tags
local editor_sitesEditor_tags = {}

--- Dessine l'onglet (appelle drawGeneralInfo). Appelée avec mouseInfo par sitesEditor mais la méthode l'ignore.
---Source : lua/ge/extensions/editor/sitesEditor/tags.lua:35
function editor_sitesEditor_tags:draw() end

--- Dessine la liste des tags et les deux colonnes de gestion du tag choisi.
---Source : lua/ge/extensions/editor/sitesEditor/tags.lua:52
function editor_sitesEditor_tags:drawGeneralInfo() end

--- Constructeur (appelé par le module).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/sitesEditor/tags.lua:9
---@param sitesEditor table Module editor_sitesEditor.
---@param key string 'locations', 'zones' ou 'parkingSpots'.
function editor_sitesEditor_tags:init(sitesEditor, key) end

--- Choisit un tag et répartit les éléments en hasTag et noTag.
---Source : lua/ge/extensions/editor/sitesEditor/tags.lua:39
---@param tag string Nom du tag.
function editor_sitesEditor_tags:selectTag(tag) end

--- Appelé quand l'onglet devient actif : relit et trie tous les tags des éléments.
---Source : lua/ge/extensions/editor/sitesEditor/tags.lua:18
function editor_sitesEditor_tags:selected() end

--- Définit les sites édités.
---Source : lua/ge/extensions/editor/sitesEditor/tags.lua:14
---@param sites table Objet sites.
function editor_sitesEditor_tags:setSites(sites) end

--- Appelé quand l'onglet est quitté ; ne fait rien.
---Source : lua/ge/extensions/editor/sitesEditor/tags.lua:33
function editor_sitesEditor_tags:unselect() end

