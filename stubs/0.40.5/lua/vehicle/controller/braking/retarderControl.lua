---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/braking/retarderControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire qui commande un ralentisseur (retarder) du powertrain. Une liste de réglages ordonnée (auto facultatif, off, puis niveaux manuels) détermine le coefficient envoyé à `retarder:setRetarderCoef`. En mode auto, le ralentisseur suit `brake_input` ; il est coupé quand l'ABS est actif, pendant un changement de rapport, ou (par défaut) quand l'accélérateur est appliqué. Ajoute un sous-menu au menu radial.
--- Accès : contrôleur `braking/retarderControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_braking_retarderControl
---@field type string "auxiliary".
local controller_braking_retarderControl = {}

--- Décale l'index de réglage (borné aux limites de la liste) et l'applique.
---Source : lua/vehicle/controller/braking/retarderControl.lua:83
---@param indexChange integer Variation d'index (+1, -1...).
function controller_braking_retarderControl.changeRetarderSettingIndex(indexChange) end

--- Renvoie l'index de réglage actif sous la clé `<nom>_settingIndex`.
---Source : lua/vehicle/controller/braking/retarderControl.lua:230
---@return table  Table d'état.
function controller_braking_retarderControl.getState() end

--- Retrouve le ralentisseur, construit la liste des réglages et le menu radial (une seule fois).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/retarderControl.lua:128
---@param jbeamData table Données jbeam du contrôleur.
function controller_braking_retarderControl.init(jbeamData) end

--- Force la prochaine transmission du coefficient au ralentisseur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/retarderControl.lua:124
---@param jbeamData table Données jbeam.
function controller_braking_retarderControl.reset(jbeamData) end

--- Cherche un réglage égal à `newMode` dans la liste et l'applique ; avertissement dans le log sinon.
---Source : lua/vehicle/controller/braking/retarderControl.lua:73
---@param newMode string|number "auto", "off" ou un niveau manuel de la liste.
function controller_braking_retarderControl.setRetarderMode(newMode) end

--- Applique le réglage situé à cet index de la liste (auto, off ou niveau manuel) ; ignoré si l'index n'existe pas.
---Source : lua/vehicle/controller/braking/retarderControl.lua:65
---@param settingIndex integer Index (1 = premier de la liste de réglages).
---@param silent boolean|nil true pour ne pas afficher de message.
function controller_braking_retarderControl.setRetarderSettingIndex(settingIndex, silent) end

--- Restaure l'index de réglage s'il est valide (silencieusement).
---Source : lua/vehicle/controller/braking/retarderControl.lua:237
---@param data table|nil Table d'état.
function controller_braking_retarderControl.setState(data) end

--- Chaque frame : calcule le coefficient (selon le mode, l'ABS, le passage de rapports et l'accélérateur), le transmet au ralentisseur quand il change et publie les electrics.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/braking/retarderControl.lua:88
---@param dt number Pas de temps en secondes.
function controller_braking_retarderControl.updateGFX(dt) end

return controller_braking_retarderControl
