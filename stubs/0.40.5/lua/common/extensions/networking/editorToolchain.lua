---@meta
-- tim19Atlas stub generated from lua/common/extensions/networking/editorToolchain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Serveur TCP (port 7000, toutes interfaces) qui permet à un outil externe (éditeur JBeam, etc.) de dialoguer avec le jeu. Les clients envoient des commandes JSON (ping, init, getPlayerVehicleInfo, selectNodes, subscribe) et reçoivent des réponses (pong, siminfo, playerVehicleInfo, data). Il peut aussi surligner des nœuds du véhicule joueur dans le monde 3D et diffuser en continu positions de nœuds et vitesse. Non chargé par défaut (ligne commentée extensions.load('networking_editorToolchain')) ; une fois chargé, il reste en mémoire (unload mode 'manual').
--- Accès : extension `networking_editorToolchain` : `extensions.load("networking_editorToolchain")`, puis la globale `networking_editorToolchain`
---@class networking_editorToolchain
networking_editorToolchain = {}

--- Hook appelé au chargement de l'extension : crée le serveur TCPServer sur '*':7000.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions/networking/editorToolchain.lua:183
function networking_editorToolchain.onExtensionLoaded() end

--- Hook appelé au déchargement : détruit le serveur s'il existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions/networking/editorToolchain.lua:187
function networking_editorToolchain.onExtensionUnloaded() end

--- Hook d'initialisation : règle le mode de déchargement de l'extension sur 'manual'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions/networking/editorToolchain.lua:202
function networking_editorToolchain.onInit() end

--- Appelé chaque frame avant le rendu : lit les messages reçus et les traite, renvoie le contexte véhicule aux clients si le véhicule joueur a changé, dessine les nœuds sélectionnés puis envoie les données des abonnements (positions de nœuds, vitesse).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions/networking/editorToolchain.lua:126
---@param dtReal number Delta temps réel (s), non utilisé.
---@param dtSim number Delta temps simulation (s), non utilisé.
---@param dtRaw number Delta temps brut (s), non utilisé.
function networking_editorToolchain.onPreRender(dtReal, dtSim, dtRaw) end

--- Hook appelé à l'apparition d'un véhicule : si c'est le véhicule joueur 0, marque le contexte véhicule comme à renvoyer aux clients.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions/networking/editorToolchain.lua:194
---@param vehID integer Id du véhicule créé.
function networking_editorToolchain.onVehicleSpawned(vehID) end

--- Hook appelé quand le joueur change de véhicule : si le joueur est nil ou 0, marque le contexte véhicule à renvoyer aux clients.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/extensions/networking/editorToolchain.lua:198
---@param _ any Premier argument ignoré.
---@param _ any Premier argument ignoré.
---@param player integer|nil Index du joueur concerné.
function networking_editorToolchain.onVehicleSwitched(_, _, player) end

