---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/driveModes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de modes de conduite (Eco, Sport, Neige, etc., ou modes de différentiel/gamme pour un 4x4). Chaque mode est un ensemble de réglages typés qui sont appliqués d'un coup quand on change de mode : échappement, turbo, compresseur, boîte automatique, paramètres d'un autre contrôleur (`setParameters`), mode d'un périphérique powertrain, valeur electrics, entrée de menu radial et bouton du panneau de contrôle simplifié. On peut en instancier plusieurs (un par fonction : conduite, différentiel, gamme...). Le mode par défaut est appliqué dans initLastStage.
--- Accès : contrôleur `driveModes` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_driveModes
---@field type string "auxiliary".
local controller_driveModes = {}

--- Restaure le mode actif depuis serialize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/driveModes.lua:237
---@param data table|nil Données de serialize.
function controller_driveModes.deserialize(data) end

--- Renvoie la clé du mode actif.
---Source : lua/vehicle/controller/driveModes.lua:208
---@return string|nil  Clé du mode actif, nil si aucun.
function controller_driveModes.getCurrentDriveModeKey() end

--- Renvoie les données d'un mode (key, name, order, settings, settingsOrder).
---Source : lua/vehicle/controller/driveModes.lua:214
---@param modeKey string|nil Clé du mode.
---@return table|nil  Données du mode, nil si inconnu.
function controller_driveModes.getDriveModeData(modeKey) end

--- Renvoie la clé du mode actif sous `<nom>ActiveMode`.
---Source : lua/vehicle/controller/driveModes.lua:246
---@return table  Table d'état.
function controller_driveModes.getState() end

--- Lit les modes (clés `modes*`), les modes activés (`enabledModes*`) et les réglages par défaut depuis le jbeam, trie les modes et enregistre l'entrée du menu radial.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/driveModes.lua:295
---@param jbeamData table Données jbeam du contrôleur.
function controller_driveModes.init(jbeamData) end

--- Choisit le mode par défaut (`defaultMode` s'il est activé, sinon le premier) et l'applique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/driveModes.lua:409
---@param jbeamData table Données jbeam du contrôleur.
function controller_driveModes.initLastStage(jbeamData) end

--- Passe au mode activé suivant, avec retour au premier à la fin.
---Source : lua/vehicle/controller/driveModes.lua:190
function controller_driveModes.nextDriveMode() end

--- Passe au mode activé précédent, avec retour au dernier au début.
---Source : lua/vehicle/controller/driveModes.lua:199
function controller_driveModes.previousDriveMode() end

--- Restaure le titre et l'icône du menu radial lus dans le jbeam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/driveModes.lua:220
---@param jbeamData table Données jbeam.
function controller_driveModes.reset(jbeamData) end

--- Réapplique le mode actif après le reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/driveModes.lua:225
function controller_driveModes.resetLastStage() end

--- Renvoie le mode actif pour la sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/driveModes.lua:231
---@return table|nil  {activeDriveModeKey, activeDriveModeIndex}, nil si aucun mode.
function controller_driveModes.serialize() end

--- Active le mode de clé donnée : retrouve son index parmi les modes activés, applique tous ses réglages et affiche un message UI sauf si silent. Clé inconnue ou nil : ne fait rien.
---Source : lua/vehicle/controller/driveModes.lua:164
---@param modeKey string|nil Clé du mode.
---@param silent boolean|nil true pour ne pas afficher de message.
function controller_driveModes.setDriveMode(modeKey, silent) end

--- Crée, met à jour ou supprime un bouton du panneau de contrôle simplifié (`ui_simplePowertrainControl`). Le clic par défaut appelle `nextDriveMode()` de ce contrôleur.
---Source : lua/vehicle/controller/driveModes.lua:75
---@param id string Identifiant du bouton.
---@param buttonUIName string Nom affiché.
---@param icon string Icône.
---@param color string Couleur (hexadécimal) quand actif.
---@param offColor string|nil Couleur éteinte (défaut "343434").
---@param offColorElectric string|nil Nom d'electrics : à 1 ou plus, le bouton prend `offColor`.
---@param onClick string|nil Code Lua exécuté au clic.
---@param remove boolean|nil true pour supprimer le bouton.
function controller_driveModes.setSimpleControlButton(id, buttonUIName, icon, color, offColor, offColorElectric, onClick, remove) end

--- Active silencieusement le mode donné s'il existe et diffère du mode actif.
---Source : lua/vehicle/controller/driveModes.lua:253
---@param data table|nil Table d'état.
function controller_driveModes.setState(data) end

--- Chaque frame : met à jour la couleur (active ou éteinte) des boutons de contrôle simplifié selon leur electrics `offColorElectric`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/driveModes.lua:154
---@param dt number Pas de temps en secondes.
function controller_driveModes.updateGFX(dt) end

--- Renvoie l'état de tous les boutons au panneau de contrôle simplifié (appelée par controller.updateSimpleControlButtons).
---Source : lua/vehicle/controller/driveModes.lua:94
function controller_driveModes.updateSimpleControlButtons() end

return controller_driveModes
