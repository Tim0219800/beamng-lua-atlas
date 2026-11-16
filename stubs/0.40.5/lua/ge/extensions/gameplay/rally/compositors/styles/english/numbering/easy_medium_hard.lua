---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/styles/english/numbering/easy_medium_hard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared English corner numbering in three levels: hard, medium, easy. Each level gives the spoken text, the measured physical diameter range (m) and the visual (corner icon, colors). Used by the english/casual style.
--- Access: extension `gameplay_rally_compositors_styles_english_numbering_easy_medium_hard`: `extensions.load("gameplay_rally_compositors_styles_english_numbering_easy_medium_hard")`, then the global `gameplay_rally_compositors_styles_english_numbering_easy_medium_hard`
---@class gameplay_rally_compositors_styles_english_numbering_easy_medium_hard
---@field id string System identifier: 'easy_medium_hard' (copied into corner.numberingSystem).
---@field intensity table[] Three entries {id, text, diameter={min,max}, visual={icon, text, colorBg, colorStroke, ...}}, from the tightest (hard, red) to the most open (easy, green).
gameplay_rally_compositors_styles_english_numbering_easy_medium_hard = {}

