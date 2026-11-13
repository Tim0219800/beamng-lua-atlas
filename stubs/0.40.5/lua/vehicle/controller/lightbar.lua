---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/lightbar.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de rampe lumineuse (gyrophares) à modes configurables (type "auxiliary"). Chaque mode définit, par nom de valeur electrics, une séquence d'états (durée, valeur) répétée en boucle tant que l'électrique principale (par défaut "lightbar") est > 0 ; une séquence à un seul état devient une valeur statique. Les valeurs electrics produites sont multipliées par l'intensité de la valeur principale (0..1). Un menu radial « Lightbar Modes » permet de changer de mode.
--- Accès : contrôleur `lightbar` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_lightbar
---@field type string "auxiliary".
local controller_lightbar = {}

--- Renvoie l'indice de mode courant.
---Source : lua/vehicle/controller/lightbar.lua:231
---@return table  Table d'état (réutilisée).
function controller_lightbar.getState() end

--- Construit les modes (séquences animées et valeurs statiques), enregistre l'entrée du menu radial si plusieurs modes existent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/lightbar.lua:143
---@param jbeamData table Données jbeam du contrôleur.
function controller_lightbar.init(jbeamData) end

--- Rétablit le mode par défaut.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/lightbar.lua:138
---@param jbeamData table Données jbeam du contrôleur.
function controller_lightbar.reset(jbeamData) end

--- Active le mode d'indice donné : remet les séquences à zéro, applique les valeurs statiques et affiche un message. Ne fait rien si l'indice n'existe pas.
---Source : lua/vehicle/controller/lightbar.lua:96
---@param index integer Indice 1..n dans modes.
function controller_lightbar.setModeIndex(index) end

--- Applique l'indice de mode d'une table d'état si valide.
---Source : lua/vehicle/controller/lightbar.lua:236
---@param data table|nil Table d'état.
function controller_lightbar.setState(data) end

--- Passe au mode suivant (revient au premier après le dernier).
---Source : lua/vehicle/controller/lightbar.lua:129
function controller_lightbar.toggleMode() end

--- Avance les séquences de chaque électrique selon dt et écrit electrics.values.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/lightbar.lua:43
---@param dt number Pas de temps (s).
function controller_lightbar.updateGFX(dt) end

return controller_lightbar
