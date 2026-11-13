---@meta
-- tim19Atlas stub generated from lua/ge/serverConnection.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Déconnexion de la session locale (arrêt de la simulation, nettoyage) et passage de l'état de monde prêt. Il sert quand on quitte un niveau pour revenir au menu : arrêt de la physique, restauration du curseur, arrêt de l'éclairage de mission, destruction du serveur local et vidage du nom de mission. Il fait aussi passer worldReadyState de 0 à 1 une fois la première caméra définie.
--- Accès : globale `serverConnection`
---@class serverConnection
serverConnection = {}

--- Quitte la session en cours : affiche l'écran de chargement (par défaut), puis arrête la physique, restaure le curseur, coupe l'éclairage de mission, détruit le serveur (server.destroy), vide le nom de mission, quitte l'écran de chargement et appelle callback.
---Source : lua/ge/serverConnection.lua:63
---@param callback function|nil Fonction appelée à la fin de la déconnexion ; sa valeur de retour est ignorée (disconnectWrapper ne renvoie rien).
---@param loadingScreen boolean|nil true par défaut (nil compte comme true). false : déconnecte tout de suite sans écran de chargement.
---@param p table|nil Profileur optionnel (objet avec :add(label)) pour mesurer les étapes.
function serverConnection.disconnect(callback, loadingScreen, p) end

--- Déconnexion immédiate sans écran de chargement et sans callback (disconnect(nop, false, p)). Utilisée depuis du code externe (commentaire '.cs').
---Source : lua/ge/serverConnection.lua:79
---@param p table|nil Profileur optionnel.
function serverConnection.noLoadingScreenDisconnect(p) end

--- Hook appelé quand la première caméra/objet de contrôle est défini par le serveur. Si worldReadyState vaut 0, active le masquage du curseur inactif, met worldReadyState à 1 et diffuse le hook onWorldReadyState(1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/serverConnection.lua:8
function serverConnection.onCameraHandlerSetInitial() end

