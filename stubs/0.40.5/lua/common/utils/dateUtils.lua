---@meta
-- tim19Atlas stub generated from lua/common/utils/dateUtils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petits utilitaires de dates : conversion d'une chaîne ISO 8601 en timestamp Unix et calcul du temps écoulé depuis une date. Se charge avec require('utils/dateUtils'). Utile pour comparer des dates reçues d'une API ou d'un fichier.
--- Accès : `require("utils/dateUtils")`
---@class utils_dateUtils
local utils_dateUtils = {}

--- Convertit une date-heure ISO 8601 (se terminant par Z) en timestamp Unix via os.time. Retourne l'heure courante en cas d'échec de lecture.
---Source : lua/common/utils/dateUtils.lua:8
---@param datetime string Ex. '2025-01-31T12:00:00Z'
---@return integer  Timestamp Unix en secondes
function utils_dateUtils.parseIso8601(datetime) end

--- Calcule le nombre de secondes écoulées entre la date donnée et maintenant (UTC).
---Source : lua/common/utils/dateUtils.lua:38
---@param datetime string Date ISO 8601
---@return number  Différence en secondes (os.difftime)
function utils_dateUtils.timeSince(datetime) end

return utils_dateUtils
