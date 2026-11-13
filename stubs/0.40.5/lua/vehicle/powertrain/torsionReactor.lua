---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/torsionReactor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Device « arbre fictif » qui sert de réacteur de torsion : il transmet le couple de son parent à ses enfants (multiplié par gearRatio) en conservant les noeuds de réaction du couple (torqueReactionNodes_nodes) qui permettent d'appliquer la réaction du couple moteur sur la carrosserie. Le powertrain l'utilise comme point d'ancrage des réactions de couple. Catégorie shaft, un seul port de sortie.
--- Accès : type de composant powertrain `torsionReactor` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_torsionReactor
---@field deviceCategories table<string, boolean> {shaft=true}.
---@field outputPorts table<integer, boolean> {[1]=true}.
local powertrain_torsionReactor = {}

--- Construit le device à partir du jbeam. Filtre torqueReactionNodes_nodes pour ne garder que les valeurs numériques.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/torsionReactor.lua:67
---@param jbeamData table Données jbeam du composant.
---@return table  Objet device.
function powertrain_torsionReactor.new(jbeamData) end

--- Objet renvoyé par new(jbeamData). Champs : gearRatio, inputAV, outputAV1 (rad/s), outputTorque1 (N·m), torqueReactionNodes (liste de 3 noeuds ou nil), cumulativeInertia (kg·m²), cumulativeGearRatio, parent/children (posés par le powertrain).
---@class powertrain_torsionReactor_device
local powertrain_torsionReactor_device = {}

--- Calcule l'inertie cumulée (celle de l'enfant divisée par gearRatio²), son inverse et les rapports cumulés à partir du premier enfant.
---Source : lua/vehicle/powertrain/torsionReactor.lua:37
function powertrain_torsionReactor_device:calculateInertia() end

--- Remet à zéro vitesses, couple et inerties ; relit gearRatio depuis le jbeam.
---Source : lua/vehicle/powertrain/torsionReactor.lua:54
---@param jbeamData table Données jbeam.
function powertrain_torsionReactor_device:reset(jbeamData) end

--- Pas de physique : outputTorque1 = couple de sortie du parent * gearRatio.
---Source : lua/vehicle/powertrain/torsionReactor.lua:15
function powertrain_torsionReactor_device:torqueUpdate() end

--- Vérifie la présence du parent et que torqueReactionNodes contient 3 noeuds (sinon avertissement et torqueUpdate désactivé en nom seulement).
---Source : lua/vehicle/powertrain/torsionReactor.lua:23
---@return boolean  Toujours true.
function powertrain_torsionReactor_device:validate() end

--- Pas de physique : inputAV = outputAV1 * gearRatio, puis recopie dans le champ du parent désigné par parentOutputAVName.
---Source : lua/vehicle/powertrain/torsionReactor.lua:10
---@param dt number Pas de physique (s).
function powertrain_torsionReactor_device:velocityUpdate(dt) end

return powertrain_torsionReactor
