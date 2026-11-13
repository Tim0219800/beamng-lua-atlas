---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/multiseat/assignmentCache.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Cache en mémoire des affectations multi-sièges (multiseat). Il garde une copie profonde de la valeur passée à set et en renvoie une copie à get, en journalisant la raison de chaque accès. Son mode de déchargement est « manual », donc le cache survit au déchargement automatique des extensions.
--- Accès : extension `ui_multiseat_assignmentCache` : `extensions.load("ui_multiseat_assignmentCache")`, puis la globale `ui_multiseat_assignmentCache`
---@class ui_multiseat_assignmentCache
ui_multiseat_assignmentCache = {}

--- Renvoie une copie profonde des affectations mémorisées et journalise la raison.
---Source : lua/ge/extensions/ui/multiseat/assignmentCache.lua:16
---@param reason string|nil Raison, utilisée seulement pour le log.
---@return any  Copie des affectations, nil si rien n'a été défini.
function ui_multiseat_assignmentCache.get(reason) end

--- Hook d'initialisation de l'extension ; passe le mode de déchargement à « manual » via setExtensionUnloadMode et journalise.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/multiseat/assignmentCache.lua:6
function ui_multiseat_assignmentCache.onInit() end

--- Remplace les affectations mémorisées par une copie profonde de value et journalise la raison.
---Source : lua/ge/extensions/ui/multiseat/assignmentCache.lua:11
---@param value any Affectations à mémoriser (copiées avec deepcopy).
---@param reason string|nil Raison, utilisée seulement pour le log.
function ui_multiseat_assignmentCache.set(value, reason) end

