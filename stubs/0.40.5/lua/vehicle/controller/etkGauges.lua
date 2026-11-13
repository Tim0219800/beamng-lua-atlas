---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/etkGauges.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Ancien contrôleur d'instruments HTML (type "auxiliary"), déprécié : init journalise une erreur demandant de passer à genericGauges. Il crée une texture HTML (htmlTexture.create) et envoie 30 fois par seconde : rapport engagé, consommation moyenne, affichage de consommation, température extérieure, heure (HH:MM), vitesse de roue. À ne pas utiliser pour de nouveaux véhicules.
--- Accès : contrôleur `etkGauges` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_etkGauges
---@field type string "auxiliary".
local controller_etkGauges = {}

--- Journalise l'avertissement de dépréciation, remet à zéro les lisseurs et crée la texture HTML.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/etkGauges.lua:68
---@param jbeamData table Données jbeam du contrôleur.
function controller_etkGauges.init(jbeamData) end

--- À appeler quand la page HTML est chargée : envoie setUnits avec unitType et autorise les mises à jour.
---Source : lua/vehicle/controller/etkGauges.lua:96
function controller_etkGauges.uiReady() end

--- Envoie périodiquement les données au tableau de bord HTML via htmlTexture.call("updateData").
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/etkGauges.lua:28
---@param dt number Pas de temps (s).
function controller_etkGauges.updateGFX(dt) end

return controller_etkGauges
