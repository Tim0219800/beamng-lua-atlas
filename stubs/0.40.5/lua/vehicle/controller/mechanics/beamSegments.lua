---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/mechanics/beamSegments.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur de mécanique (type "auxiliary") qui répartit la longueur d'une poutre « capteur » sur plusieurs poutres « segments » : à chaque image, chaque segment reçoit la longueur du capteur divisée par le nombre de segments, multipliée par un facteur. Sert à construire des éléments téléscopiques ou des chaînes de segments dont la longueur totale suit un capteur.
--- Accès : contrôleur `mechanics/beamSegments` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_mechanics_beamSegments
---@field type string "auxiliary".
local controller_mechanics_beamSegments = {}

--- Hook : appelé quand une poutre casse ; marque le contrôleur inactif si c'est un segment ou le capteur (voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/mechanics/beamSegments.lua:29
---@param id integer Identifiant (cid) de la poutre cassée.
---@param energy number Énergie de rupture.
function controller_mechanics_beamSegments.beamBroken(id, energy) end

--- Retrouve les poutres de segments et de capteur par tag.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/mechanics/beamSegments.lua:40
---@param jbeamData table Données jbeam du contrôleur.
function controller_mechanics_beamSegments.init(jbeamData) end

--- Réactive le contrôleur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/mechanics/beamSegments.lua:36
---@param jbeamData table Données jbeam du contrôleur.
function controller_mechanics_beamSegments.reset(jbeamData) end

--- Règle la longueur de chaque segment d'après celle du capteur. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/mechanics/beamSegments.lua:dyn
---@param dt number Pas de temps (s).
function controller_mechanics_beamSegments.updateGFX(dt) end

return controller_mechanics_beamSegments
