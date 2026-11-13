---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/aeroDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de débogage aérodynamique pour l'établi (workbench) : mesure la force et le moment aérodynamiques totaux du véhicule autour de son centre de gravité, les exprime dans le repère du véhicule (droite, avant, haut) et estime la répartition de la portance (appui) entre essieu avant et arrière à partir des noms de roues fournis.
--- Accès : extension `aeroDebug` : `extensions.load (VM véhicule)("aeroDebug")`, puis la globale `aeroDebug`
---@class aeroDebug
aeroDebug = {}

--- Désactive le calcul et efface wheelNameStrings.
---Source : lua/vehicle/extensions/aeroDebug.lua:142
function aeroDebug.disable() end

--- Active le calcul et remplit wheelNameStrings avec les noms de toutes les roues si ce n'est pas déjà fait.
---Source : lua/vehicle/extensions/aeroDebug.lua:132
function aeroDebug.enable() end

--- Renvoie la table aeroData courante (voir notes pour ses champs).
---Source : lua/vehicle/extensions/aeroDebug.lua:121
---@return table  Données aérodynamiques.
function aeroDebug.getAeroData() end

--- Hook d'initialisation : désactive le calcul.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/aeroDebug.lua:17
function aeroDebug.onInit() end

--- Indique les noms des quatre roues pour la répartition par essieu.
---Source : lua/vehicle/extensions/aeroDebug.lua:125
---@param FL string Nom de la roue avant gauche.
---@param FR string Roue avant droite.
---@param RL string Roue arrière gauche.
---@param RR string Roue arrière droite.
function aeroDebug.setWheelNames(FL, FR, RL, RR) end

--- Appelé chaque frame : si activé, calcule forces et moments aérodynamiques et la répartition d'appui avant/arrière.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/aeroDebug.lua:21
---@param dt number Pas de temps en secondes (non utilisé).
function aeroDebug.updateGFX(dt) end

