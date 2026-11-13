---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/remoteController.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Serveur UDP qui permet de piloter le jeu avec l'application mobile BeamNG « remote controller ». getQRCode ouvre le port UDP 4444 et renvoie un code à 5 chiffres que l'appli doit envoyer ; ensuite chaque appareil reconnu devient un périphérique virtuel (core_input_virtualInput, type bngremotectrlv1, 1 axe, 2 boutons) alimenté par les paquets d'orientation reçus. Les données d'interface du véhicule sont renvoyées à l'appli (port 4445) via l'extension outgauge du véhicule.
--- Accès : extension `core_remoteController` : `extensions.load("core_remoteController")`, puis la globale `core_remoteController`
---@class core_remoteController
---@field onFirstUpdate nil Vaut nil : référence à une variable non définie dans le fichier.
core_remoteController = {}

--- Indique si au moins un appareil distant est connecté.
---Source : lua/ge/extensions/core/remoteController.lua:182
---@return boolean  true s'il y a au moins un périphérique virtuel.
function core_remoteController.devicesConnected() end

--- Ouvre le socket UDP d'écoute (port 4444) s'il ne l'est pas, et renvoie le code d'appairage à afficher (sous forme de QR code par l'UI).
---Source : lua/ge/extensions/core/remoteController.lua:54
---@return integer|boolean  Code à 5 chiffres, ou false si le socket n'a pas pu être ouvert.
function core_remoteController.getQRCode() end

--- Hook de chargement : vérifie la présence de FFI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/remoteController.lua:164
---@return boolean  false si FFI est indisponible (chargement refusé).
function core_remoteController.onExtensionLoaded() end

--- Hook appelé quand les liaisons d'entrée changent : mémorise à quel joueur est assigné chaque appareil virtuel (clé 'vinput<instance>'), ou l'oublie si le joueur est négatif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/remoteController.lua:172
---@param players table<string, integer> Nom de périphérique -> index du joueur.
function core_remoteController.onInputBindingsChanged(players) end

--- Hook de mise à jour : supprime les appareils inactifs depuis plus de 10 s, lit les paquets UDP, crée les périphériques virtuels et émet leurs évènements (boutons, axe) vers core_input_virtualInput. Ne fait rien tant que le socket n'est pas ouvert.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/remoteController.lua:70
function core_remoteController.onUpdate() end

