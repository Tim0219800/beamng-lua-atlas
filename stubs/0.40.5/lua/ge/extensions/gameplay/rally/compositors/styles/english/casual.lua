---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/styles/english/casual.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Rally note style 'English casual': a simplified English co-driver that calls corners as 'easy / medium / hard' (easy_medium_hard numbering) plus the flat, square and hairpin descriptors. It speaks no distance calls (distance.callsEnabled = false), no lengths and no corner shapes. It uses only a subset of modifiers (jumps, crests, splashes, surface changes, stop/finish, chicanes) and aliases that map the other variants to those modifiers. Reuses the distance, visual, caution, systemPacenotes and modifiers modules from the english folder.
--- Access: extension `gameplay_rally_compositors_styles_english_casual`: `extensions.load("gameplay_rally_compositors_styles_english_casual")`, then the global `gameplay_rally_compositors_styles_english_casual`
---@class gameplay_rally_compositors_styles_english_casual
---@field componentTypes table Component registry: corner (easy_medium_hard numbering, left/right direction, flat/square/hairpin descriptors), caution (english/caution), modifiers (subset) and modifierAliases.
---@field composite function compositorUtil.compositeFromPhrases: (config, structured, distBefore, distAfter, escapeVars) -> list of texts.
---@field distance table Distance config copied from the english/distance style but with callsEnabled = false (no spoken distance calls).
---@field enumerate function compositorUtil.enumerateConcise: (textCompositor, config) -> list of unique phrases.
---@field system table Localized system notes (english/systemPacenotes).
---@field visualGeneral table General colors of the visual notes (intoColor, distanceColor), from english/visual.
gameplay_rally_compositors_styles_english_casual = {}

