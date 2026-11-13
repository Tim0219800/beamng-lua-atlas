---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/4wd.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire qui donne au conducteur la commande du 4x4 sélectionnable : arbre 4WD (connecté/déconnecté), boîte de gamme (haute/basse) et différentiels. Il agit soit via des contrôleurs `driveModes` (si leurs noms sont listés dans le jbeam), soit directement via l'API `powertrain` pour les anciens véhicules. Il écrit `electrics.values.mode4WD` et `modeRangeBox` (1 ou 0) et ajoute des entrées au menu radial.
--- Accès : contrôleur `4wd` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_4wd
---@field relevantDevice string "transfercase" : nom du périphérique powertrain utilisé pour l'ordre d'appel.
---@field type string "auxiliary".
local controller_4wd = {}

--- Restaure les modes 4WD et gamme depuis les données de serialize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/4wd.lua:81
---@param data table|nil Données retournées par serialize.
function controller_4wd.deserialize(data) end

--- Retrouve les périphériques powertrain (`shaftName`, `rangeBoxName`), initialise les valeurs electrics et ajoute les entrées du menu radial (une seule fois).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/4wd.lua:92
---@param jbeamData table Données jbeam du contrôleur.
function controller_4wd.init(jbeamData) end

--- Retrouve les contrôleurs driveModes nommés dans `driveModesRangeNames`, `driveModesTransfercaseNames` et `driveModesDifferentialNames` (ceux qui existent).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/4wd.lua:171
---@param jbeamData table Données jbeam du contrôleur.
function controller_4wd.initLastStage(jbeamData) end

--- Renvoie l'état sauvegardé : {mode4WD, modeRange}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/4wd.lua:74
---@return table  {mode4WD = string|nil, modeRange = string|nil}.
function controller_4wd.serialize() end

--- Impose le mode de l'arbre 4WD, sauf s'il est physiquement déconnecté.
---Source : lua/vehicle/controller/4wd.lua:68
---@param mode string "connected" ou "disconnected".
function controller_4wd.set4WDMode(mode) end

--- Impose le mode de la boîte de gamme (powertrain.setDeviceMode). Sans effet s'il n'y a pas de boîte de gamme.
---Source : lua/vehicle/controller/4wd.lua:49
---@param mode string "low" ou "high" (valeurs vues dans le code).
function controller_4wd.setRangeMode(mode) end

--- Passe au mode suivant des contrôleurs driveModes de transfert ; sinon bascule l'arbre 4WD, sauf s'il est physiquement déconnecté (`isPhysicallyDisconnected`).
---Source : lua/vehicle/controller/4wd.lua:55
function controller_4wd.toggle4WD() end

--- Passe au mode suivant de chaque contrôleur driveModes de différentiels ; sinon appelle powertrain.toggleDefaultDiffs().
---Source : lua/vehicle/controller/4wd.lua:24
function controller_4wd.toggleDiffs() end

--- Passe au mode suivant des contrôleurs driveModes de gamme ; sinon bascule le mode de la boîte de gamme via powertrain.toggleDeviceMode.
---Source : lua/vehicle/controller/4wd.lua:36
function controller_4wd.toggleRange() end

--- Chaque frame : écrit electrics.values.modeRangeBox (1 si gamme basse) et mode4WD (1 si arbre connecté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/4wd.lua:19
---@param dt number Pas de temps en secondes (non utilisé).
function controller_4wd.updateGFX(dt) end

return controller_4wd
