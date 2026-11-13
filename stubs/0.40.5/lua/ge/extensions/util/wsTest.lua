---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/wsTest.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de développement : démarre un serveur web/WebSocket (port 8083, protocole « bng-test », page ./ui/entrypoints/util_wsTest/) écoutant sur toutes les adresses. Un client distant peut exécuter du code Lua GE, recharger le Lua, recharger l'interface CEF, ouvrir la console de développement CEF et mesurer la bande passante. Sert aux tests d'outils externes.
--- Accès : extension `util_wsTest` : `extensions.load("util_wsTest")`, puis la globale `util_wsTest`
---@class util_wsTest
util_wsTest = {}

--- Crée (ou récupère) le serveur WebSocket via utils/wsUtils sur le port 8083 et affiche son adresse dans la console.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/wsTest.lua:17
function util_wsTest.onExtensionLoaded() end

--- Détruit le serveur WebSocket (BNGWebWSServer.destroy) s'il existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/wsTest.lua:23
function util_wsTest.onExtensionUnloaded() end

--- Chaque image : lit les évènements des clients, répond au ping, décode les commandes JSON et les traite, puis met à jour le serveur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/wsTest.lua:73
function util_wsTest.onUpdate() end

