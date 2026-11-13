---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/styles/english/distance.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Configuration des appels de distance des styles anglais : mots de liaison selon l'écart entre deux notes, unités parlées, règles d'arrondi et distance maximale énoncée. Lu par textCompositor (roundDistance, distanceToString, getDistanceCallShorthand...).
--- Accès : extension `gameplay_rally_compositors_styles_english_distance` : `extensions.load("gameplay_rally_compositors_styles_english_distance")`, puis la globale `gameplay_rally_compositors_styles_english_distance`
---@class gameplay_rally_compositors_styles_english_distance
---@field links table[] Liens ordonnés {threshold, text} aux seuils strictement croissants (5, 20, 40 m).
---@field max number Distance maximale énoncée : 2000 m.
---@field rounding table {small=10, medium=50, mediumThreshold=100, large=250, largeThreshold=1000} (mètres).
---@field units table {base='m', large='km', point='point'}.
gameplay_rally_compositors_styles_english_distance = {}

