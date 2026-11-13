---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/sbrGauges.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire OBSOLÈTE (log E au chargement : à remplacer par genericGauges) qui alimente un écran HTML de tableau de bord (htmlTexture) pour un véhicule électrique : vitesse, rapport, capteurs, carte de navigation, consommation moyenne/instantanée (W, kWh/100 km) et autonomie estimée à partir de l'énergie des batteries des moteurs électriques.
--- Accès : contrôleur `sbrGauges` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_sbrGauges
---@field type string "auxiliary".
local controller_sbrGauges = {}

--- Crée la texture HTML, repère les batteries des moteurs électriques et initialise les lisseurs de consommation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/sbrGauges.lua:95
---@param jbeamData table Données jbeam du contrôleur.
function controller_sbrGauges.init(jbeamData) end

--- Renvoie l'unité de longueur à la page HTML.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/sbrGauges.lua:137
function controller_sbrGauges.reset() end

--- Applique des paramètres externes : si modeName et modeColor sont présents, appelle setUIMode.
---Source : lua/vehicle/controller/sbrGauges.lua:145
---@param parameters table Table {modeName, modeColor}.
function controller_sbrGauges.setParameters(parameters) end

--- Affiche le nom et la couleur du mode de conduite sur l'écran HTML (updateMode).
---Source : lua/vehicle/controller/sbrGauges.lua:141
---@param modeName string Texte du mode.
---@param modeColor string Couleur (déduit du code : valeur CSS passée telle quelle).
function controller_sbrGauges.setUIMode(modeName, modeColor) end

--- Chaque frame : calcule puissance et consommation et envoie les données à la page HTML.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/sbrGauges.lua:37
---@param dt number Pas de temps en secondes.
function controller_sbrGauges.updateGFX(dt) end

return controller_sbrGauges
