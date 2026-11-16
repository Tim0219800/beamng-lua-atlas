---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/input.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Crawl editor mouse helper: on each updateMouseInfo call, computes the camera-mouse ray, the raycast on the scene (forest disabled during the cast) and the left button click/hold/release states. The other crawlEditor files read the result via getMouseInfo().
--- Access: extension `editor_crawlEditor_input`: `extensions.load("editor_crawlEditor_input")`, then the global `editor_crawlEditor_input`
---@class editor_crawlEditor_input
editor_crawlEditor_input = {}

--- Returns the current mouseInfo table.
---Source: lua/ge/extensions/editor/crawlEditor/input.lua:45
---@return table|nil  mouseInfo, or nil before the first updateMouseInfo
function editor_crawlEditor_input.getMouseInfo() end

--- Updates the mouseInfo table (camera position, mouse ray, raycast, left button states). Disables then re-enables forest collision around the raycast.
---Source: lua/ge/extensions/editor/crawlEditor/input.lua:10
function editor_crawlEditor_input.updateMouseInfo() end

