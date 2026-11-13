---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/viscousClutch.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Coupleur visqueux placé derrière un moteur : transmet un couple proportionnel à l'écart de vitesse angulaire entre entrée et sortie (viscousCoef, en N·m par rad/s), plafonné à viscousTorque. Peut être « engagé » progressivement au-dessus d'un régime cutInRPM (cutInRPM, stallRPM). Sert d'embrayage simple automatique (ex. petits véhicules, boîtes sans embrayage piloté). Catégories clutchlike et viscouscoupling ; un port de sortie.
--- Accès : type de composant powertrain `viscousClutch` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_viscousClutch
---@field deviceCategories table<string, boolean> {clutchlike=true, viscouscoupling=true}.
---@field outputPorts table<integer, boolean> {[1]=true}.
---@field requiredExternalInertiaOutputs table<integer, integer> {1}.
local powertrain_viscousClutch = {}

--- Construit le coupleur visqueux à partir du jbeam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/viscousClutch.lua:89
---@param jbeamData table Données jbeam du composant.
---@return table  Objet device.
function powertrain_viscousClutch.new(jbeamData) end

--- Objet renvoyé par new(jbeamData). Champs : inputAV, outputAV1 (rad/s), outputTorque1 et torqueDiff (N·m), clutchRatio (0..1), viscousCoef, viscousTorque, cutInAV, stallAV (rad/s), isBroken, mode.
---@class powertrain_viscousClutch_device
local powertrain_viscousClutch_device = {}

--- Reprend inertie et rapports cumulés du premier enfant (le coupleur n'ajoute pas d'inertie).
---Source : lua/vehicle/powertrain/viscousClutch.lua:55
function powertrain_viscousClutch_device:calculateInertia() end

--- Remet à zéro vitesses, couple, clutchRatio=1, relit viscousCoef et réinitialise le lisseur.
---Source : lua/vehicle/powertrain/viscousClutch.lua:71
---@param jbeamData table Données jbeam.
function powertrain_viscousClutch_device:reset(jbeamData) end

--- Mémorise le mode et réinstalle velocityUpdate/torqueUpdate (le mode n'a pas d'autre effet ici).
---Source : lua/vehicle/powertrain/viscousClutch.lua:50
---@param mode any Mode (non interprété).
function powertrain_viscousClutch_device:setMode(mode) end

--- Pas de physique : calcule le couple visqueux (écart de vitesse), applique clutchRatio et l'engagement à cutInRPM, lisse et place le résultat dans torqueDiff et outputTorque1.
---Source : lua/vehicle/powertrain/viscousClutch.lua:20
---@param dt number Pas de physique (s). Non utilisé.
function powertrain_viscousClutch_device:torqueUpdate(dt) end

--- Vérifie que le parent est un moteur et fixe viscousTorque par défaut.
---Source : lua/vehicle/powertrain/viscousClutch.lua:38
---@return boolean  false si le parent n'est pas un moteur.
function powertrain_viscousClutch_device:validate() end

--- Pas de physique : inputAV = vitesse de sortie du parent (moteur).
---Source : lua/vehicle/powertrain/viscousClutch.lua:16
---@param dt number Pas de physique (s).
function powertrain_viscousClutch_device:velocityUpdate(dt) end

return powertrain_viscousClutch
