---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/jbeamStats.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Calcule des statistiques sur l'ensemble des fichiers .jbeam accessibles au jeu (y compris mods montés) : nombre de fichiers, de parts, de lignes, de parts racines (slotType « main »), nombre d'occurrences de chaque section et de lignes de données par section. Sert aux développeurs pour la documentation (voir docCreator) et à un moddeur curieux de l'ampleur des données JBeam.
--- Accès : extension `util_jbeamStats` : `extensions.load("util_jbeamStats")`, puis la globale `util_jbeamStats`
---@class util_jbeamStats
util_jbeamStats = {}

--- Parcourt tous les .jbeam et renvoie une table de statistiques.
---Source : lua/ge/extensions/util/jbeamStats.lua:13
---@return table  Champs : totalJbeamFiles, partCount, sectionCount (nom -> nombre), sectionCountOrdered (liste de paires {section, nombre} triée décroissante), sectionRowCount (nom -> lignes hors en-tête), totalLineCount, totalRootParts, totalModifiersCount
function util_jbeamStats.getStats() end

