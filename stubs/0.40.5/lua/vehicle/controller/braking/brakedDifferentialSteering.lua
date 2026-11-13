---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/braking/brakedDifferentialSteering.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de direction par freinage différentiel (engins à chenilles ou skid-steer) : selon l'entrée de volant `steering_input`, il freine la roue gauche (volant à gauche) ou droite (volant à droite) en ajoutant un couple de freinage au `desiredBrakingTorque` des rotateurs de roue, sans dépasser leur `brakeTorque`.
--- Accès : contrôleur `braking/brakedDifferentialSteering` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_braking_brakedDifferentialSteering
---@field type string "auxiliary".
local controller_braking_brakedDifferentialSteering = {}

--- Retrouve les roues gauche/droite, calcule les couples de freinage de direction maximaux.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/brakedDifferentialSteering.lua:40
---@param jbeamData table Données jbeam du contrôleur.
function controller_braking_brakedDifferentialSteering.init(jbeamData) end

--- Remet les niveaux de freinage à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/brakedDifferentialSteering.lua:35
---@param jbeamData table Données jbeam.
function controller_braking_brakedDifferentialSteering.reset(jbeamData) end

--- Chaque frame : calcule le niveau de freinage gauche/droit à partir de `steering_input` et de la vitesse.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/brakedDifferentialSteering.lua:26
---@param dt number Pas de temps en secondes.
function controller_braking_brakedDifferentialSteering.updateGFX(dt) end

--- Étape physique intermédiaire : ajoute le couple de freinage de direction (frein × couple max) au couple demandé de chaque roue, borné à son brakeTorque.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/brakedDifferentialSteering.lua:21
---@param dt number Pas de temps en secondes (non utilisé).
function controller_braking_brakedDifferentialSteering.updateWheelsIntermediate(dt) end

return controller_braking_brakedDifferentialSteering
