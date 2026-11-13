---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/mechanics/beamChain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur de mécanique (type "auxiliary") qui relie deux poutres en série : à chaque pas physique, si la somme de leurs longueurs dépasse leur longueur combinée initiale, l'excès est retiré à parts égales des deux (obj:setBeamLength). Utile pour simuler une chaîne ou un câble à deux tronçons. Si l'une des poutres casse, l'autre est cassée aussi et le système se désactive.
--- Accès : contrôleur `mechanics/beamChain` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_mechanics_beamChain
---@field type string "auxiliary".
local controller_mechanics_beamChain = {}

--- Hook : appelé quand une poutre casse ; si c'est l'une des deux, casse l'autre et désactive la chaîne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/mechanics/beamChain.lua:34
---@param id integer Identifiant (cid) de la poutre cassée.
---@param energy number Énergie de rupture.
function controller_mechanics_beamChain.beamBroken(id, energy) end

--- Retrouve les deux poutres du tag et mémorise leur longueur combinée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/mechanics/beamChain.lua:48
---@param jbeamData table Données jbeam du contrôleur.
function controller_mechanics_beamChain.init(jbeamData) end

--- Réactive la chaîne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/mechanics/beamChain.lua:44
---@param jbeamData table Données jbeam du contrôleur.
function controller_mechanics_beamChain.reset(jbeamData) end

--- Chaque pas physique : retire l'excès de longueur à parts égales des deux poutres. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/mechanics/beamChain.lua:dyn
---@param dt number Pas de temps (s).
function controller_mechanics_beamChain.update(dt) end

--- Ne fait rien. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/mechanics/beamChain.lua:dyn
---@param dt number Pas de temps (s).
function controller_mechanics_beamChain.updateGFX(dt) end

return controller_mechanics_beamChain
