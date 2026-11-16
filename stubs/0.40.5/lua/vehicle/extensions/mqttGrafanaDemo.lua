---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/mqttGrafanaDemo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Demo: publishes the vehicle telemetry to an MQTT broker (127.0.0.1) on the topic 'car_data', as JSON, every frame, to display it for example in Grafana. Data: geometry and state of each wheel, dashboard electrics values, acceleration and steering wheel force sensors, position and attitude.
--- Access: extension `mqttGrafanaDemo`: `extensions.load (vehicle VM)("mqttGrafanaDemo")`, then the global `mqttGrafanaDemo`
---@class mqttGrafanaDemo
---@field reset any
mqttGrafanaDemo = {}

--- Called on load: creates the MQTT client and starts the connection.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/mqttGrafanaDemo.lua:142
function mqttGrafanaDemo.onExtensionLoaded() end

--- Called on unload: disconnects the MQTT client.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/mqttGrafanaDemo.lua:155
function mqttGrafanaDemo.onExtensionUnloaded() end

--- Called every frame: collects the data and publishes it on the topic 'car_data' if the client is connected.
---*(internal: called by the engine or the main loop)*
---Source: lua/vehicle/extensions/mqttGrafanaDemo.lua:116
---@param dt number Time step in seconds (unused).
function mqttGrafanaDemo.updateGFX(dt) end

