---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries/textures.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournit à l'interface des livrées le catalogue des textures de décalcomanies dynamiques, classées par tags (digit, gradient, letter, logo, noise, pattern, shape, textureFill, Team Offroad) plus une catégorie « others » pour les textures sans tag. Le scan des textures tourne dans un job (editor_api_dynamicDecals_textures.setupAsync) avec un flux de progression, et les résultats sont envoyés à l'UI par guihooks. Mémorise aussi l'élément choisi dans le sélecteur.
--- Accès : extension `ui_liveries_textures` : `extensions.load("ui_liveries_textures")`, puis la globale `ui_liveries_textures`
---@class ui_liveries_textures
---@field dependencies table<integer, string> Extensions chargées avant : editor_api_dynamicDecals_textures.
ui_liveries_textures = {}

--- Oublie l'élément choisi.
---Source : lua/ge/extensions/ui/liveries/textures.lua:227
function ui_liveries_textures.clearSelectedItem() end

--- Renvoie l'élément mémorisé par setSelectorItem.
---Source : lua/ge/extensions/ui/liveries/textures.lua:223
---@return table|nil  Élément choisi ou nil.
function ui_liveries_textures.getSelectedItem() end

--- Construit les métadonnées du sélecteur : catégorie par défaut « all », puis liste triée des catégories (tags connus, « others » s'il existe des textures sans tag), « all » en tête.
---Source : lua/ge/extensions/ui/liveries/textures.lua:165
---@return table  {defaultCategory = "all", categories = {{value, label}, ...}}.
function ui_liveries_textures.getSelectorMetadata() end

--- Renvoie la clé de traduction (ui.liveries.edit.decalCategories.*) associée à un tag de texture.
---Source : lua/ge/extensions/ui/liveries/textures.lua:98
---@param tag string Identifiant de tag, par exemple « logo ».
---@return string|nil  Clé de traduction, nil si le tag est inconnu.
function ui_liveries_textures.getTagLabel(tag) end

--- Lance dans un job (cadence 1/30) le scan asynchrone des textures si elles ne sont pas déjà chargées, publie la progression, puis déclenche liveries_textureSelectorDataLoaded avec getSelectorMetadata().
---Source : lua/ge/extensions/ui/liveries/textures.lua:139
---@return string  « startLoading », « alreadyLoading » (job en cours, la progression est renvoyée) ou « unavailable » (API absente).
function ui_liveries_textures.loadTextures() end

--- Prépare les groupes de textures d'une catégorie (« all » : tous les tags plus « others » ; « others » : textures sans tag ; ou un tag précis) et les envoie à l'UI par l'événement liveries_textureCategoryData. Chaque élément a name, label, value (nom de fichier) et preview (chemin).
---Source : lua/ge/extensions/ui/liveries/textures.lua:190
---@param category string Catégorie demandée ; une valeur non string est remplacée par « all ».
---@param requestId number Identifiant renvoyé tel quel dans l'événement (0 par défaut).
function ui_liveries_textures.requestSelectorCategory(category, requestId) end

--- Mémorise l'élément de catalogue choisi, conservé pendant la navigation vers l'écran de transformation.
---Source : lua/ge/extensions/ui/liveries/textures.lua:219
---@param item table|nil Élément choisi.
function ui_liveries_textures.setSelectorItem(item) end

