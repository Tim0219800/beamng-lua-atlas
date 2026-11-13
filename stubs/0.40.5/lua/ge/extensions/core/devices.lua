---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/devices.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pilote l'éclairage RGB des périphériques de jeu (volants, manettes) via l'objet C++ Device. Chaque périphérique assigné à un joueur prend la couleur de ce joueur (orange BeamNG 255,102,0 par défaut), sauf si le retour de force du volant demande le mode d'éclairage « default » et que les LED de changement de rapport du véhicule sont en service : dans ce cas la couleur est réinitialisée (Device.resetRGB).
--- Accès : extension `core_devices` : `extensions.load("core_devices")`, puis la globale `core_devices`
---@class core_devices
core_devices = {}

--- Hook : oublie l'état des LED du véhicule sur le point d'être remplacé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/devices.lua:74
---@param vehicleId integer id du véhicule
function core_devices.onBeforeVehicleReplaced(vehicleId) end

--- Hook : la configuration du retour de force a changé, recalcule l'éclairage des périphériques.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/devices.lua:86
function core_devices.onFFBConfigChanged() end

--- Hook : oublie l'état des LED du véhicule détruit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/devices.lua:70
---@param vehicleId integer id du véhicule
function core_devices.onVehicleDestroyed(vehicleId) end

--- Hook : un véhicule active ou désactive ses LED de changement de rapport ; si c'est un véhicule de joueur, l'éclairage est recalculé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/devices.lua:78
---@param vehicleId integer id du véhicule
---@param shiftLEDsInUse boolean vrai si les LED de rapport sont utilisées
function core_devices.onVehicleRPMledStateChanged(vehicleId, shiftLEDsInUse) end

--- Définit la couleur par numéro de joueur et rafraîchit immédiatement l'éclairage de tous les périphériques.
---Source : lua/ge/extensions/core/devices.lua:91
---@param colors table<integer, vec3>|nil Couleur RGB (composantes 0-255 dans x,y,z) indexée par numéro de joueur ; nil vide la table.
---@param assignments table<string, integer>|nil Remplace temporairement l'assignation nom de périphérique -> numéro de joueur (par exemple pour montrer des assignations pas encore appliquées) ; nil utilise core_input_bindings.assignedPlayers.
function core_devices.setPlayerColors(colors, assignments) end

