---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/styles/english/caution.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- 'caution' component shared by the English styles: texts of the three warning levels ('care', 'caution', 'double caution') and colors of the matching visual notes (background, outline, icon, text) taken from compositors/helpers/colors.
--- Access: extension `gameplay_rally_compositors_styles_english_caution`: `extensions.load("gameplay_rally_compositors_styles_english_caution")`, then the global `gameplay_rally_compositors_styles_english_caution`
---@class gameplay_rally_compositors_styles_english_caution
---@field levelVisuals table<integer, table> Colors per level: {colorBg, colorStroke, colorNoteIcon, colorNoteText}. Level 1 yellow on black, levels 2 and 3 red on black.
---@field levels table<integer, string> Spoken text per level: [1]='care', [2]='caution', [3]='double caution'.
gameplay_rally_compositors_styles_english_caution = {}

