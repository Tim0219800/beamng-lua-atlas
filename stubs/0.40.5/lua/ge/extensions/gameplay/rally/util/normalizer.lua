---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/util/normalizer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit utilitaire de normalisation de texte pour les notes du rallye : applique successivement une liste de remplacements (motif, remplacement) à une chaîne.
--- Accès : extension `gameplay_rally_util_normalizer` : `extensions.load("gameplay_rally_util_normalizer")`, puis la globale `gameplay_rally_util_normalizer`
---@class gameplay_rally_util_normalizer
gameplay_rally_util_normalizer = {}

--- Applique dans l'ordre chaque paire {from, to} de word_map à la note via gsub et renvoie la note transformée. Si note vaut nil, la renvoie telle quelle.
---Source : lua/ge/extensions/gameplay/rally/util/normalizer.lua:7
---@param word_map table<integer, string[]> Liste de paires {motif, remplacement}.
---@param note string|nil Texte à normaliser.
---@return string|nil  Texte après remplacements, ou nil si note était nil.
function gameplay_rally_util_normalizer.replaceWords(word_map, note) end

