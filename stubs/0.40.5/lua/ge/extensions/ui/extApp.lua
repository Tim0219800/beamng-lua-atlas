---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/extApp.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Serveur web/WebSocket pour afficher l'interface du jeu sur un appareil externe (téléphone). Au chargement, il démarre via utils/wsUtils un serveur sur le port 8084 (protocole 'bng-ext-app-v1', page /ui/entrypoints/main/index.html), en HTTPS/WSS pour que les capteurs de mouvement du téléphone soient accessibles, et publie l'URL à l'UI par guihooks.trigger('externalUIURL', url). Usage : extensions.load('ui_extApp').
--- Accès : extension `ui_extApp` : `extensions.load("ui_extApp")`, puis la globale `ui_extApp`
---@class ui_extApp
ui_extApp = {}

--- Hook de chargement : crée ou récupère le serveur WebSocket/HTTPS, journalise l'URL et la publie à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/extApp.lua:26
function ui_extApp.onExtensionLoaded() end

--- Hook de déchargement : détruit le serveur (BNGWebWSServer.destroy) et efface l'URL côté UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/extApp.lua:32
function ui_extApp.onExtensionUnloaded() end

--- Hook par frame : lit les évènements des pairs WebSocket, décode les messages JSON de type 'D' et les passe à _handleData (qui journalise une erreur car tout est géré en C++).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/extApp.lua:45
function ui_extApp.onUpdate() end

--- Renvoie à l'UI l'URL du serveur (guihooks.trigger('externalUIURL', url)). Alias de updateUIData.
---Source : lua/ge/extensions/ui/extApp.lua:21
function ui_extApp.requestUIData() end

