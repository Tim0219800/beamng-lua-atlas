---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/styles/english/enthusiast.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Rally note style 'English enthusiast': full English co-driver, with 1 to 6 numbering (one_to_six), distance calls enabled (english/distance), corner lengths, shapes (opens, tightens, over crest, etc.), descriptors (flat, square, hairpin, open/tight hairpin, bare), cautions and all the modifiers of the english/modifiers file. Assembles the modules of the english folder; M.composite and M.enumerate point to compositorUtil.
--- Access: extension `gameplay_rally_compositors_styles_english_enthusiast`: `extensions.load("gameplay_rally_compositors_styles_english_enthusiast")`, then the global `gameplay_rally_compositors_styles_english_enthusiast`
---@class gameplay_rally_compositors_styles_english_enthusiast
---@field componentTypes table corner (one_to_six numbering, left/right direction, shapes, descriptors), caution (english/caution) and modifiers (english/modifiers).
---@field composite function compositorUtil.compositeFromPhrases.
---@field distance table Distance config (english/distance), distance calls enabled.
---@field enumerate function compositorUtil.enumerateConcise.
---@field system table Localized system notes (english/systemPacenotes).
---@field visualGeneral table General colors of the visual notes (english/visual).
gameplay_rally_compositors_styles_english_enthusiast = {}

