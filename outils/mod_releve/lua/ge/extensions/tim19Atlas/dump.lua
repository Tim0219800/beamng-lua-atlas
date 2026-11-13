-- tim19Atlas : déclenche le relevé GE puis véhicule.
-- Automatique : 5 s après qu'une voiture du joueur existe. Manuel : tim19Atlas_dump.run()

local M = {}

local timer, done = 0, false

local function run()
  local core = require("tim19Atlas/dumpcore")
  core.write("ge", "atlas_dump/ge.json")
  local veh = getPlayerVehicle(0)
  if veh then
    veh:queueLuaCommand([[require("tim19Atlas/dumpcore").write("vehicle", "atlas_dump/vehicle.json")]])
  end
  guihooks.trigger("toastrMsg", { type = "info", title = "tim19Atlas", msg = "Releve ecrit dans atlas_dump/ (dossier utilisateur)" })
  done = true
end

local function onUpdate(dtReal)
  if done then return end
  if getPlayerVehicle(0) then
    timer = timer + dtReal
    if timer > 5 then run() end
  end
end

M.run = run
M.onUpdate = onUpdate
return M
