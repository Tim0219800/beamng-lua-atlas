---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/powertrainControl/antiLag.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire d'anti-lag (ALS) pour moteur turbocompressé. Machine à états off / idle / armed / manualOverride / timeout : en idle il s'arme après quelques secondes de plein gaz à haut régime ; armé, quand le véhicule roule, que les gaz sont levés (ou le frein appuyé) et que le moteur tourne assez, il pilote par PID le coefficient d'anti-lag du moteur (engine:setAntilagCoef) pour maintenir le turbo à turboTargetRPM. Un temps maximal continu évite la surchauffe. Publie electrics.values.alsActive (booléen) et alsState (chaîne).
--- Accès : contrôleur `powertrainControl/antiLag` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_powertrainControl_antiLag
---@field type string "auxiliary".
local controller_powertrainControl_antiLag = {}

--- État sauvegardable : mode distant (off / automatic / manualOverride).
---Source : lua/vehicle/controller/powertrainControl/antiLag.lua:204
---@return table  Table d'état.
function controller_powertrainControl_antiLag.getState() end

--- Récupère le moteur et son turbocompresseur, lit les seuils jbeam et crée le PID de régime turbo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/powertrainControl/antiLag.lua:134
---@param jbeamData table Données jbeam du contrôleur.
function controller_powertrainControl_antiLag.init(jbeamData) end

--- Remet timeout, PID et état (idle) à zéro et les electrics alsActive/alsState.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/powertrainControl/antiLag.lua:126
---@param jbeamData table Données jbeam.
function controller_powertrainControl_antiLag.reset(jbeamData) end

--- Force l'état interne de la machine à états (off, idle, armed, manualOverride, timeout).
---Source : lua/vehicle/controller/powertrainControl/antiLag.lua:47
---@param newState string Nom de l'état.
function controller_powertrainControl_antiLag.setAntilagState(newState) end

--- Restaure le mode depuis la table (modes inconnus ignorés).
---Source : lua/vehicle/controller/powertrainControl/antiLag.lua:209
---@param data table|nil Table produite par getState.
function controller_powertrainControl_antiLag.setState(data) end

--- Chaque frame : fait avancer la machine à états et applique le coefficient d'anti-lag au moteur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/powertrainControl/antiLag.lua:51
---@param dt number Pas de temps en secondes.
function controller_powertrainControl_antiLag.updateGFX(dt) end

return controller_powertrainControl_antiLag
