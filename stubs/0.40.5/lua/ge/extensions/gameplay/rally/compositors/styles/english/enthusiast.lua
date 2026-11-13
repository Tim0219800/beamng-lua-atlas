---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/styles/english/enthusiast.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Style de notes de rallye 'English enthusiast' : copilote anglais complet, avec numérotation 1 à 6 (one_to_six), appels de distance activés (english/distance), longueurs de virage, formes (opens, tightens, over crest, etc.), descripteurs (flat, square, hairpin, open/tight hairpin, bare), cautions et tous les modificateurs du fichier english/modifiers. Assemble les modules du dossier english ; M.composite et M.enumerate pointent vers compositorUtil.
--- Accès : extension `gameplay_rally_compositors_styles_english_enthusiast` : `extensions.load("gameplay_rally_compositors_styles_english_enthusiast")`, puis la globale `gameplay_rally_compositors_styles_english_enthusiast`
---@class gameplay_rally_compositors_styles_english_enthusiast
---@field componentTypes table corner (numérotation one_to_six, direction left/right, shapes, descriptors), caution (english/caution) et modifiers (english/modifiers).
---@field composite function compositorUtil.compositeFromPhrases.
---@field distance table Config de distance (english/distance), appels de distance activés.
---@field enumerate function compositorUtil.enumerateConcise.
---@field system table Notes système localisées (english/systemPacenotes).
---@field visualGeneral table Couleurs générales des notes visuelles (english/visual).
gameplay_rally_compositors_styles_english_enthusiast = {}

