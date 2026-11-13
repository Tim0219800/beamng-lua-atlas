---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/wendoverGauges.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire OBSOLÈTE (remplacé par 'genericGauges') pour l'écran numérique du tableau de bord de la Wendover : texture HTML (1024 x hauteur jbeam, 161 par défaut) alimentée avec des valeurs d'electrics et une consommation moyenne de carburant calculée.
--- Accès : contrôleur `wendoverGauges` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_wendoverGauges
---@field type string 'auxiliary' : type de contrôleur.
local controller_wendoverGauges = {}

--- Appelé à l'initialisation : crée la texture HTML et détermine le type de boîte de vitesses.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/wendoverGauges.lua:67
---@param jbeamData table Données jbeam du contrôleur.
function controller_wendoverGauges.init(jbeamData) end

--- Appelé au reset ; ne fait rien (les compteurs de consommation ne sont pas remis à zéro).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/wendoverGauges.lua:94
function controller_wendoverGauges.reset() end

--- Appelé chaque frame : envoie les valeurs du tableau de bord à la texture HTML environ 10 fois par seconde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/wendoverGauges.lua:26
---@param dt number Pas de temps en secondes.
function controller_wendoverGauges.updateGFX(dt) end

return controller_wendoverGauges
