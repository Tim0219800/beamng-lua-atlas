---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/jato.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de propulseurs JATO (fusées d'appoint, type "auxiliary", defaultOrder 1100). Quand electrics.values.jatoInput > 0, ou quand l'accélérateur est à fond en mode manette/direct et en avant, il consomme du carburant (fuel), émet des particules aux nœuds des tuyères et joue un son de boucle. Écrit electrics.values.jato (0..1) et jatofuel (carburant restant, ratio 0..1). Un bouton « JATO » est ajouté au panneau de contrôle simplifié du groupe motopropulseur.
--- Accès : contrôleur `jato` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_jato
---@field defaultOrder number 1100.
---@field fuelCoef number Coefficient de consommation de carburant (1 normal, 0 = infini).
---@field type string "auxiliary".
local controller_jato = {}

--- Renvoie fuel et fuelCoef pour la sauvegarde.
---Source : lua/vehicle/controller/jato.lua:148
---@return table  Table d'état (réutilisée).
function controller_jato.getState() end

--- Lit fuel et les nœuds de tuyères, initialise electrics.values.jatoInput/jato et enregistre le code secret.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/jato.lua:114
---@param jbeamData table Données jbeam du contrôleur.
function controller_jato.init(jbeamData) end

--- Appelé par inputAnalyzer quand le code secret est saisi : alterne fuelCoef entre 1 et 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/jato.lua:34
---@param string string Chaîne saisie.
function controller_jato.inputStringCallback(string) end

--- Remet le carburant au niveau initial, arrête les sons et remet jatoInput/jato à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/jato.lua:100
function controller_jato.reset() end

--- Restaure fuel (borné 0..fuel initial) et fuelCoef (0..1).
---Source : lua/vehicle/controller/jato.lua:154
---@param data table|nil Table d'état.
function controller_jato.setState(data) end

--- Consomme le carburant, émet particules et sons, écrit electrics.values.jato et jatofuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/jato.lua:45
---@param dt number Pas de temps (s).
function controller_jato.updateGFX(dt) end

--- (Re)crée le bouton « JATO » du panneau simplifié avec le ratio de carburant restant.
---Source : lua/vehicle/controller/jato.lua:41
function controller_jato.updateSimpleControlButtons() end

return controller_jato
