---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/playerTags.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Floating name labels above players' vehicles (multiseat and split screen). Uses the Skia billboard system (WorldBillboardRenderer object registered "playerNameTags" in MissionGroup): each label is a static texture from a `.sktemplate.json` template, tinted with the player's color, turned toward the camera, following the car, growing with distance (up to a cap) and disappearing beyond 40 m. Driven by core_multiseat (rebuild, updatePositions, reset…). Global: render_playerTags.
--- Access: extension `render_playerTags`: `extensions.load("render_playerTags")`, then the global `render_playerTags`
---@class render_playerTags
render_playerTags = {}

--- Shows all hidden players again.
---Source: lua/ge/extensions/render/playerTags.lua:286
function render_playerTags.clearHiddenPlayers() end

--- Removes the forced colors and rebuilds.
---Source: lua/ge/extensions/render/playerTags.lua:298
function render_playerTags.clearPlayerColorOverrides() end

--- Destroys all current labels (billboards) and clears the local state, leaving the renderer in place.
---Source: lua/ge/extensions/render/playerTags.lua:186
function render_playerTags.destroy() end

--- Indicates whether at least one label exists.
---Source: lua/ge/extensions/render/playerTags.lua:208
---@return boolean  true if labels are active.
function render_playerTags.hasTags() end

--- Indicates whether the billboard renderer exists in the scene.
---Source: lua/ge/extensions/render/playerTags.lua:204
---@return boolean  true if the playerNameTags object exists.
function render_playerTags.isLive() end

--- Alias of reset called when the extension is unloaded. (dynamically assigned)
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/playerTags.lua:dyn
function render_playerTags.onExtensionUnloaded() end

--- Vehicle switch hook: updates the vehicle tracked by the player's labels; the label of the player who is looking is shown for 3 s.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/render/playerTags.lua:304
---@param oldId integer Old vehicle.
---@param newId integer New vehicle.
---@param player integer Player.
function render_playerTags.onVehicleSwitched(oldId, newId, player) end

--- Rebuilds all labels: stores the request (for reload and color overrides), destroys the old ones, creates the renderer if needed then one billboard per entry while keeping the previous smoothing state.
---Source: lua/ge/extensions/render/playerTags.lua:212
---@param tags table[] List of entries {player, label, color, icon?, key?, perspectivePlayer?, hideInViews?}.
---@param templateName string|nil 'default' or 'multiseat'.
---@return boolean  false if tags is not a table or if the renderer could not be created.
function render_playerTags.rebuild(tags, templateName) end

--- Clears the template and SVG icon path caches then rebuilds the last requested labels (useful for tuning a .sktemplate.json).
---Source: lua/ge/extensions/render/playerTags.lua:273
---@return boolean  false if there is nothing to rebuild.
function render_playerTags.reload() end

--- Destroys the labels, forgets the renderer reference and clears hidden players and color overrides. To be called before a Lua/GE reload that destroys the C++ object; also onExtensionUnloaded.
---Source: lua/ge/extensions/render/playerTags.lua:196
function render_playerTags.reset() end

--- Forces a color on a player and rebuilds the labels.
---Source: lua/ge/extensions/render/playerTags.lua:291
---@param player integer Player.
---@param color table {r,g,b} between 0 and 1.
function render_playerTags.setPlayerColorOverride(player, color) end

--- Hides or shows a player's label.
---Source: lua/ge/extensions/render/playerTags.lua:280
---@param player integer Player.
---@param hidden boolean true to hide.
function render_playerTags.setPlayerHidden(player, hidden) end

--- To be called every frame: computes position, (smoothed) scale and visibility of each label (grouping by vehicle, stacking, distance to the player's camera) and calls WorldBillboardRenderer:update.
---Source: lua/ge/extensions/render/playerTags.lua:473
---@param dt number Frame duration (s).
function render_playerTags.updatePositions(dt) end

