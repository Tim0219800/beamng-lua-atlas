---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/vivaceGauges.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire OBSOLÈTE (remplacé par le contrôleur 'genericGauges') qui alimente l'écran numérique du tableau de bord de la Vivace : il crée une texture HTML (1024x256) et lui envoie périodiquement des valeurs d'electrics (clignotants, voyants, régime, vitesse, ESC/TCS, puissance moyenne des moteurs électriques). Chargé via le jbeam ; ne pas utiliser pour de nouveaux véhicules.
--- Accès : contrôleur `vivaceGauges` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_vivaceGauges
---@field type string 'auxiliary' : type de contrôleur dans le système de contrôleurs.
local controller_vivaceGauges = {}

--- Appelé à l'initialisation du contrôleur : crée la texture HTML, récupère les moteurs électriques du powertrain et envoie la configuration à la page ('setup').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vivaceGauges.lua:63
---@param jbeamData table Données jbeam du contrôleur (materialName, htmlPath, ...).
function controller_vivaceGauges.init(jbeamData) end

--- Appelé au reset du véhicule ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vivaceGauges.lua:91
function controller_vivaceGauges.reset() end

--- Change le mode affiché (appel JS 'updateMode' avec {txt, col}) si modeName et modeColor sont présents.
---Source : lua/vehicle/controller/vivaceGauges.lua:98
---@param parameters table Table avec modeName (texte) et modeColor (couleur, format utilisé par la page HTML).
function controller_vivaceGauges.setParameters(parameters) end

--- Appelé chaque frame : envoie les valeurs du tableau de bord à la texture HTML quand l'UI doit être mise à jour. Vaut nop si la configuration est invalide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/vivaceGauges.lua:20
---@param dt number Pas de temps en secondes.
function controller_vivaceGauges.updateGFX(dt) end

return controller_vivaceGauges
