---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/styles/english/numbering/one_to_six.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Shared English corner numbering from 1 (very tight) to 6 (nearly flat), with for each level the spoken text, the physical diameter range (m), the visual (turn1 to turn6 icon, neon colors) and the arc length brackets (short, standard, half long, long, extra long). Used by english/enthusiast; the style files remain responsible for string and audio compatibility, this module serves newly composed styles and calibration tools.
--- Access: extension `gameplay_rally_compositors_styles_english_numbering_one_to_six`: `extensions.load("gameplay_rally_compositors_styles_english_numbering_one_to_six")`, then the global `gameplay_rally_compositors_styles_english_numbering_one_to_six`
---@class gameplay_rally_compositors_styles_english_numbering_one_to_six
---@field id string 'one_to_six'.
---@field intensity table[] Six entries {id, text, diameter, visual} ordered from one to six.
---@field lengthsByIntensity table<string, table[]> For each intensity id (one..six), five brackets {id, text, arcMeters={min,max}}; the last one (extraLong) has no max.
gameplay_rally_compositors_styles_english_numbering_one_to_six = {}

