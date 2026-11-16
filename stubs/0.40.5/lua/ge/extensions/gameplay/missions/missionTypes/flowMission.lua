---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Base class of a flowgraph mission. The object carries the mission fields (id, missionFolder, setupModules, missionTypeData, careerSetup, additionalAttributes, fgPath, fgVariables, progress, userSettings...) and, once started, self.mgr (the flowgraph manager).
---@class gameplay_missions_missionTypes_flowMission
local gameplay_missions_missionTypes_flowMission = {}

--- Changes the base value of an existing flowgraph variable. Accepted types: boolean, string, number, table of 3 (vec3) or 4 (quat) elements. If the variable does not exist in the flowgraph, it is ignored.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:569
---@param name string Variable name.
---@param value boolean|string|number|table New value.
---@return boolean|nil  true on error, nil otherwise.
function gameplay_missions_missionTypes_flowMission:addOrSetVariable(name, value) end

--- If the flowgraph contains a node for the onRequestAbandon hook, broadcasts it and returns true (the flowgraph handles the abandon); otherwise returns nil.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:560
---@return boolean|nil  true if the flowgraph handles the abandon request.
function gameplay_missions_missionTypes_flowMission:attemptAbandonMission() end

--- Builds the list of user settings common to all mission types: vehicle selection (setupModuleVehicles, with custom vehicle option), traffic (setupModuleTraffic) and time of day (setupModuleEnvironmentTime). While the default settings are being built (_buildingDefaultUserSettings), returns only {key, value} per enabled module.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:111
---@return table[]  List of setting definitions ({key, value, ...} or select type for vehicles).
function gameplay_missions_missionTypes_flowMission:getCommonSettingsData() end

--- Extension point for a star reward that depends on settings; empty in the base (returns nil).
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:420
---@param key string Star key.
---@param userSettings table|nil User settings.
function gameplay_missions_missionTypes_flowMission:getDynamicStarReward(key, userSettings) end

--- Returns the mission's entry fees (careerSetup.entryFee) as an attributeKey -> amount table, or nil if there are none. Accepts the old list format {attributeKey, rewardAmount}.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:409
---@param userSettings table|nil User settings (not used here).
---@return table<string, number>|nil  Fees per attribute, or nil.
function gameplay_missions_missionTypes_flowMission:getEntryFee(userSettings) end

--- Broadcasts the flowgraph hook onGatherGameContextUiButtons, merges the buttons by id (an active button wins over an inactive one) and sorts them by order then label.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:616
---@return table[]|nil  List of buttons {id, label, order, active, ...}; nil if the flowgraph is not created.
function gameplay_missions_missionTypes_flowMission:getGameContextUiButtons() end

--- Returns the translation key of a progress key, or the key itself if unknown.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:63
---@param progressKey string Progress key.
---@return string  Translation key or progressKey.
function gameplay_missions_missionTypes_flowMission:getProgressKeyTranslation(progressKey) end

--- Called when the mission is created. Defines missionTypeLabel, progressKeyTranslations, defaultPreviewFile (/gameplay/missionTypes/<type>/defaultPreview.jpg if it exists, result cached) and ignoreUserSettingsKeyForActiveStars. Also loads the type's progressSetup data but does not copy it (the copy is commented out).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:37
function gameplay_missions_missionTypes_flowMission:init() end

--- Relays the start of a flowgraph state to self.script (if it exists).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:491
---@param stateName string State name.
---@param state table State object.
---@param transData any Transition data.
function gameplay_missions_missionTypes_flowMission:onFlowgraphStateStarted(stateName, state, transData) end

--- Relays the stop of a flowgraph state to self.script.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:497
---@param stateName string State name.
---@param state table State object.
function gameplay_missions_missionTypes_flowMission:onFlowgraphStateStopped(stateName, state) end

--- Called when the mission screen (start or end) is ready. Relays to the script; in "startScreen" mode, resets the world time to the mission time if timeScale > 0.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:503
---@param mode string Screen mode, e.g. "startScreen".
function gameplay_missions_missionTypes_flowMission:onMissionScreenReady(mode) end

--- Starts the mission: logs the issues (logMissionIssues), calls onPreStart if it exists, creates the flowgraph if needed (optional preprocessMissionTypeData and getFgPath), injects the progress variables and user settings (then clears them), starts the flowgraph if it is stopped, and calls script:onStart.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:423
---@return boolean|nil  true if the flowgraph setup failed.
function gameplay_missions_missionTypes_flowMission:onStart() end

--- Stops the flowgraph (instantly if data.stopInstant), creates an "abandoned" attempt if data.abandoned, emits the onMissionProgressChanged hook, relays to script:onStop, then calls onPostStop if it exists.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:537
---@param data table|nil Fields used: stopInstant, abandoned, attempt.
function gameplay_missions_missionTypes_flowMission:onStop(data) end

--- Called every frame: relays to the script and reapplies the environment wind to all ready vehicles.
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:520
---@param dtReal number Real time (s).
---@param dtSim number Simulation time (s).
---@param dtRaw number Raw time (s).
function gameplay_missions_missionTypes_flowMission:onUpdate(dtReal, dtSim, dtRaw) end

--- Hook relayed to self.script.onVehicleReset if the script defines it (generated in a loop over the scriptHooks list).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:dyn
---@param ... any Hook arguments.
function gameplay_missions_missionTypes_flowMission:onVehicleReset(...) end

--- Applies the common settings chosen by the player to self.setupModules: chosen vehicle (index, custom vehicle, usePlayerVehicle, useCustomConfig), traffic (useTraffic) and environment time. Must not be called while a mission is active (otherwise an error is logged).
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:295
---@param flatSettings table<string, any> Flat key -> value settings.
function gameplay_missions_missionTypes_flowMission:processCommonSettings(flatSettings) end

--- Stores the user settings in self.userSettings; they are injected into the flowgraph at onStart.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:324
---@param settings table<string, any> Flat key -> value settings.
function gameplay_missions_missionTypes_flowMission:processUserSettings(settings) end

--- Rereads from the flowgraph the value of each progress variable and copies it into self.progress; logs an error for those not found.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:598
function gameplay_missions_missionTypes_flowMission:retrieveProgressFromFlowgraph() end

--- Converts old mission formats to the current setupModules: flowgraph variables presetVehicleActive/playerModel/..., old vehicle mode (own/choice/provided), numeric or object timeOfDay to environment, default values for cloudCover/cloudWindSpeed. Also generates the additionalAttributes.vehicle attribute (own/provided/choice) if missing.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:329
---@param keyAliases table<string, string>|nil Aliases of the missionTypeData variable names (presetVehicleActive, playerModel, playerConfig, playerConfigPath).
function gameplay_missions_missionTypes_flowMission:setBackwardsCompatibility(keyAliases) end

--- For each vehicle-selection select setting, completes the "custom" options (tied to setupModuleVehiclesCustom) with the thumbnail, the "Custom: <make model>" label and the vehicle class (gameplay_vehiclePerformance.getClassFromConfig). Shows "Custom: (None Selected)" if the model or config is not chosen.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:241
---@param userSettings table[]|nil List of user settings (modified in place).
function gameplay_missions_missionTypes_flowMission:setPreviewsForCustomVehicles(userSettings) end

--- Locates the flowgraph file (path relative to the mission folder, otherwise absolute path), loads it with core_flowgraphManager.loadManager (transient=true, activity=self), then sets the progress variables (saved value takes priority over the last attempt's value) and the variables from `variables`.
---Source: lua/ge/extensions/gameplay/missions/missionTypes/flowMission.lua:69
---@param fgFile string Flowgraph file name, relative to the mission folder or absolute.
---@param variables table<string, any>|nil Variables to inject (fgVariables).
---@return boolean|nil  true on error (file not found, reserved name, invalid variable), nil otherwise.
function gameplay_missions_missionTypes_flowMission:setupFlowgraphManager(fgFile, variables) end

