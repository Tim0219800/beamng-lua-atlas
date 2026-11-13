---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/debug/advancedExternalDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de débogage qui envoie des paquets JSON par UDP à un outil externe (AED, 'Advanced External Debug') sur 127.0.0.1:43812, à 30 envois par seconde, avec un heartbeat prévu à 1 Hz. Les modules du véhicule y déposent leurs paquets via debugPacket ; l'extension y ajoute à chaque frame un paquet principal indiquant si ce véhicule est celui du joueur.
--- Accès : extension `debug_advancedExternalDebug` : `extensions.load (VM véhicule)("debug_advancedExternalDebug")`, puis la globale `debug_advancedExternalDebug`
---@class debug_advancedExternalDebug
debug_advancedExternalDebug = {}

--- Ajoute un paquet à la file d'envoi (vehicleID est ajouté automatiquement).
---Source : lua/vehicle/extensions/debug/advancedExternalDebug.lua:19
---@param packet table Table sérialisable en JSON, avec de préférence sourceType et packetType.
function debug_advancedExternalDebug.debugPacket(packet) end

--- Appelé au chargement de l'extension : appelle onInit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/debug/advancedExternalDebug.lua:127
function debug_advancedExternalDebug.onExtensionLoaded() end

--- Hook d'initialisation : crée la liaison UDP et signale un nouveau véhicule à l'outil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/debug/advancedExternalDebug.lua:106
function debug_advancedExternalDebug.onInit() end

--- Hook de reset : vide la file de paquets.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/debug/advancedExternalDebug.lua:102
function debug_advancedExternalDebug.onReset() end

--- Appelé chaque frame : ajoute le paquet principal puis envoie les paquets accumulés au rythme de 30 Hz.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/debug/advancedExternalDebug.lua:85
---@param dt number Pas de temps en secondes.
function debug_advancedExternalDebug.updateGFX(dt) end

