---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/ezObjectSelect/selectionCache.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Cache de sélection de l'outil Easy Select. Il ne reconstruit les données de sélection (liste de « proxies » projetés) qu'une fois la caméra immobile depuis 0,12 s, ou après une invalidation ou un changement de configuration. États possibles : waiting, moving, building, ready.
--- Accès : extension `editor_ezObjectSelect_selectionCache` : `extensions.load("editor_ezObjectSelect_selectionCache")`, puis la globale `editor_ezObjectSelect_selectionCache`
---@class editor_ezObjectSelect_selectionCache
editor_ezObjectSelect_selectionCache = {}

--- Réinitialise complètement l'état du cache (statut waiting).
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionCache.lua:45
function editor_ezObjectSelect_selectionCache.activate() end

--- Renvoie un instantané de l'état du cache pour le debug.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionCache.lua:97
---@return table  {status, reason, targetCount (nombre de proxies), buildTime, classificationTime}
function editor_ezObjectSelect_selectionCache.getStatus() end

--- Supprime les données en cache et relance le délai de stabilisation.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionCache.lua:49
---@param reason string|nil Raison, stockée pour le debug (défaut « invalidated »)
function editor_ezObjectSelect_selectionCache.invalidate(reason) end

--- Enregistre la durée de classification pour l'affichage de debug.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionCache.lua:93
---@param milliseconds number|nil Durée en ms (0 si nil)
function editor_ezObjectSelect_selectionCache.setClassificationTime(milliseconds) end

--- À appeler à chaque frame. Renvoie nil tant que la caméra bouge, que la configuration vient de changer ou que le délai de 0,12 s n'est pas écoulé ; ensuite appelle build() une seule fois et renvoie ses données, puis les renvoie telles quelles.
---Source : lua/ge/extensions/editor/ezObjectSelect/selectionCache.lua:56
---@param camera table Contexte caméra (pos, rangeOrigin, forward, up, halfTan, width, height)
---@param configKey any Clé de configuration ; si elle change, le cache est invalidé (raison « settings »)
---@param build function Fonction sans argument qui construit les données (attend une table pouvant contenir proxies)
---@return table|nil  Données construites ou nil si non prêtes
function editor_ezObjectSelect_selectionCache.update(camera, configKey, build) end

