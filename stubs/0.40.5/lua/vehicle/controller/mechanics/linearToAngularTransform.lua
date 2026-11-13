---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/mechanics/linearToAngularTransform.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur de mécanique (type "auxiliary") qui convertit le déplacement d'une poutre capteur en rotation de poulie : la variation de longueur depuis le départ, divisée par un rayon effectif, donne un angle ; la fraction de tour (0..1, modulo 1) est multipliée par un facteur (360 par défaut) et écrite dans une valeur electrics pour animer une pièce rotative.
--- Accès : contrôleur `mechanics/linearToAngularTransform` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_mechanics_linearToAngularTransform
---@field type string "auxiliary".
local controller_mechanics_linearToAngularTransform = {}

--- Hook : appelé quand une poutre casse ; marque le contrôleur inactif si c'est le capteur (sans effet réel, voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/mechanics/linearToAngularTransform.lua:31
---@param id integer Identifiant (cid) de la poutre cassée.
---@param energy number Énergie de rupture.
function controller_mechanics_linearToAngularTransform.beamBroken(id, energy) end

--- Retrouve la poutre capteur et valide la configuration.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/mechanics/linearToAngularTransform.lua:46
---@param jbeamData table Données jbeam du contrôleur.
function controller_mechanics_linearToAngularTransform.init(jbeamData) end

--- Mémorise la longueur de départ du capteur et remet la sortie à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/mechanics/linearToAngularTransform.lua:38
---@param jbeamData table Données jbeam du contrôleur.
function controller_mechanics_linearToAngularTransform.reset(jbeamData) end

--- Écrit la fraction de tour convertie dans la valeur electrics de sortie. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/mechanics/linearToAngularTransform.lua:dyn
---@param dt number Pas de temps (s).
function controller_mechanics_linearToAngularTransform.updateGFX(dt) end

return controller_mechanics_linearToAngularTransform
