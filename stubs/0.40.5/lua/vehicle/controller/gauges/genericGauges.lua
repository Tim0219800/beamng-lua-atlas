---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/gauges/genericGauges.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire qui affiche un tableau de bord HTML sur un matériau 3D (htmlTexture) et lui envoie en continu des données : valeurs electrics, propriétés de dispositifs de powertrain et données de modules personnalisés (contrôleurs dans gauges/customModules/). Un moddeur l'utilise pour créer un combiné d'instruments HTML en déclarant le contrôleur dans le jbeam avec materialName, htmlPath, displayWidth/displayHeight et displayData. Les données ne sont envoyées que si un joueur est assis dans le véhicule et que le drapeau de mise à jour UI du moteur est levé.
--- Accès : contrôleur `gauges/genericGauges` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_gauges_genericGauges
---@field init function Alias de nop (rien à faire à l'init).
---@field type string "auxiliary".
local controller_gauges_genericGauges = {}

--- Supprime tous les messages popup (appel JS messageClearAll).
---Source : lua/vehicle/controller/gauges/genericGauges.lua:54
function controller_gauges_genericGauges.clearAllPopupMessages() end

--- Supprime un message popup par identifiant (appel JS messageClearById).
---Source : lua/vehicle/controller/gauges/genericGauges.lua:47
---@param msgId string Identifiant renvoyé par displayPopupMessage.
function controller_gauges_genericGauges.clearPopupMessage(msgId) end

--- Met en file un message popup dans la page HTML (appel JS messageQueue). Sans effet si hasPopupMessageSupport est faux.
---Source : lua/vehicle/controller/gauges/genericGauges.lua:30
---@param message string Texte du message.
---@param iconId string Identifiant de l'icône (déduit du code).
---@param timeout number Durée d'affichage en secondes (durationSec).
---@param highlightColor string Couleur de mise en avant (déduit du code).
---@return string|nil  Identifiant du message ("test" + nombre aléatoire), nil si les popups ne sont pas supportés.
function controller_gauges_genericGauges.displayPopupMessage(message, iconId, timeout, highlightColor) end

--- Lit la configuration, crée la texture HTML (htmlTexture.new à 60 FPS), prépare les listes electrics/powertrain/customModules et envoie la configuration (unités de l'UI + configuration jbeam) à la page via callJS("setup").
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/genericGauges.lua:164
---@param jbeamData table Données jbeam (voir notes).
function controller_gauges_genericGauges.initSecondStage(jbeamData) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/genericGauges.lua:161
function controller_gauges_genericGauges.reset() end

--- Si parameters contient modeName et modeColor, transmet les paramètres à la page HTML (appel JS updateMode).
---Source : lua/vehicle/controller/gauges/genericGauges.lua:229
---@param parameters table Table avec au moins modeName et modeColor.
function controller_gauges_genericGauges.setParameters(parameters) end

--- À chaque image graphique : si un joueur est assis et que l'UI doit être mise à jour, rafraîchit les données electrics, powertrain et modules puis les envoie à la page HTML.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/gauges/genericGauges.lua:81
---@param dt number Pas de temps graphique (s).
function controller_gauges_genericGauges.updateGFX(dt) end

return controller_gauges_genericGauges
