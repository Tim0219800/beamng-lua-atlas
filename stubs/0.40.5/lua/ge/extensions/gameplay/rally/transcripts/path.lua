---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/transcripts/path.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/gameplay/rally/transcripts/path.lua (instanciée par la fonction renvoyée par le module)
---@class gameplay_rally_transcripts_path
local gameplay_rally_transcripts_path = {}

---Source : lua/ge/extensions/gameplay/rally/transcripts/path.lua:75
---@param selected_id any
function gameplay_rally_transcripts_path:drawDebug(selected_id) end

--- helped me figure out quat rotation
---  test 1
---  local function toRadians(degrees)
---    return degrees * (math.pi / 180)
---  end
---  local theta = toRadians(45) / 2  -- Convert 45 degrees to radians and halve it
---  local testQ = quat({
---    w = math.cos(theta),
---    x = 0,
---    y = 0,
---    z = math.sin(theta)
---  })
---  print("Quaternion for 45-degree rotation around Z-axis:", testQ.w, testQ.x, testQ.y, testQ.z)
---  local testP = {x=-373.3353577, y=18.58174515, z=49.07889557}
---  local h = 2
---  local l = 5
---  testP = pos
---  testP = testP + vec3(0,0,20)
---  testQ = rot
---  local upVector = vec3(0, 0, 1)  -- 'up' in a Z-up system
---  local rotatedUpVector = testQ * upVector * h  -- Rotate and scale the up vector
---  local topOfCar = testP + rotatedUpVector  -- This gives the top point of the car
---  local forwardVector = vec3(0, 1, 0)
---  local rotatedForwardVector = testQ * forwardVector * l
---  local frontOfCar = testP + rotatedForwardVector
---  debugDrawer:drawSphere(testP, 1, ColorF(0,1,0,shapeAlpha)) -- green
---  debugDrawer:drawSphere(topOfCar, 1, ColorF(0,0,1,shapeAlpha)) -- blue
---  debugDrawer:drawSphere(frontOfCar, 1, ColorF(0,1,1,shapeAlpha)) -- aqua
---Source : lua/ge/extensions/gameplay/rally/transcripts/path.lua:119
---@param selected_id any
function gameplay_rally_transcripts_path:drawDebugTranscripts(selected_id) end

---Source : lua/ge/extensions/gameplay/rally/transcripts/path.lua:11
function gameplay_rally_transcripts_path:getNextUniqueIdentifier() end

---Source : lua/ge/extensions/gameplay/rally/transcripts/path.lua:19
---@param fname any
function gameplay_rally_transcripts_path:init(fname) end

---Source : lua/ge/extensions/gameplay/rally/transcripts/path.lua:32
function gameplay_rally_transcripts_path:load() end

---Source : lua/ge/extensions/gameplay/rally/transcripts/path.lua:67
---@param data any
function gameplay_rally_transcripts_path:onDeserialized(data) end

---Source : lua/ge/extensions/gameplay/rally/transcripts/path.lua:59
function gameplay_rally_transcripts_path:onSerialize() end

---Source : lua/ge/extensions/gameplay/rally/transcripts/path.lua:53
function gameplay_rally_transcripts_path:save() end

