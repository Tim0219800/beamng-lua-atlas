---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/online.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_online` : couche d'accès aux services en ligne de BeamNG (authentification, API du repository de mods, téléchargements). Elle n'est active que si le réglage 'onlineFeatures' vaut 'enable'. Elle envoie les requêtes HTTP via SecureComm côté moteur, suit chaque requête (état 'working' puis 'finished') et rappelle un callback Lua à la fin. Elle reçoit aussi des instructions du serveur (messages à afficher, mises à jour de mods). Un moddeur s'en sert très rarement ; core_modmanager et core_repository l'utilisent.
--- Accès : extension `core_online` : `extensions.load("core_online")`, puis la globale `core_online`
---@class core_online
core_online = {}

--- Appel d'API JSON : comme download mais demande une réponse JSON décodée dans responseData.
---Source : lua/ge/extensions/core/online.lua:143
---@param uri string Chemin d'API ('s1/v4/...') ou URL complète.
---@param finishCallback function|nil Appelé à la fin avec la table publique de la requête ; nil = requête sans callback.
---@param postDataTbl table|nil Données à envoyer, encodées en JSON.
---@param outfile string|nil Fichier où écrire la réponse.
---@param reqType string|nil Méthode HTTP, 'get' par défaut (mise en minuscules).
---@param progressCallback function|nil Appelé périodiquement avec la table publique (progression).
---@param postFileName string|nil Nom de fichier à envoyer en POST.
---@param authorizationHeader string|nil En-tête d'autorisation à ajouter.
---@return boolean|nil  false si refusé (désactivé ou non authentifié), nil sinon.
function core_online.apiCall(uri, finishCallback, postDataTbl, outfile, reqType, progressCallback, postFileName, authorizationHeader) end

--- Rappel du moteur à la fin d'une requête : remplit la table publique, la passe à l'état 'finished' et appelle le callback Lua de fin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/online.lua:148
---@param id integer Id de la requête.
---@param responseCode integer Code HTTP.
---@param responseBuffer string Corps de la réponse.
---@param responseHeaders string En-têtes de réponse.
---@param responseData table Réponse JSON décodée.
---@param postData any Données envoyées (non utilisées).
---@param curlCode integer Code d'erreur curl (0 = ok).
---@param curlErrorStr string Message d'erreur curl.
---@param effectiveURL string URL finale après redirections.
function core_online.callbackSecureCommCpp(id, responseCode, responseBuffer, responseHeaders, responseData, postData, curlCode, curlErrorStr, effectiveURL) end

--- Rappel du moteur pendant une requête : met à jour la progression (valeurs 0 ignorées) et appelle le callback de progression.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/online.lua:199
---@param id integer Id de la requête.
---@param dltotal number Octets à télécharger au total.
---@param dlnow number Octets téléchargés.
---@param ultotal number Octets à envoyer au total.
---@param ulnow number Octets envoyés.
---@param dlspeed number Vitesse de téléchargement.
---@param ulspeed number Vitesse d'envoi.
---@param time number Temps écoulé.
function core_online.callbackSecureCommCppProgress(id, dltotal, dlnow, ultotal, ulnow, dlspeed, ulspeed, time) end

--- Appelée par le moteur après une requête terminée : l'oublie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/online.lua:194
---@param id integer Id de la requête.
function core_online.clearRequest(id) end

--- Télécharge une URL ou un chemin du serveur (sans traiter la réponse comme du JSON).
---Source : lua/ge/extensions/core/online.lua:139
---@param uri string URL complète ou chemin.
---@param finishCallback function|nil Callback de fin.
---@param postDataTbl table|nil Données POST encodées en JSON.
---@param outfile string|nil Fichier de destination.
---@param reqType string|nil Méthode HTTP, 'get' par défaut.
---@param progressCallback function|nil Callback de progression.
---@return boolean|nil  false si refusé, nil sinon.
function core_online.download(uri, finishCallback, postDataTbl, outfile, reqType, progressCallback) end

--- Envoie à l'interface (guihooks 'OnlineRequestsState') la partie publique de toutes les requêtes en cours ou terminées.
---Source : lua/ge/extensions/core/online.lua:41
function core_online.getRequestsUI() end

--- Au chargement : lit le réglage onlineFeatures (onSettingsChanged).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/online.lua:248
function core_online.onExtensionLoaded() end

--- Appelé par le moteur avec des instructions envoyées par le serveur d'authentification (voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/online.lua:297
---@param data table { origin = 'gameauth', cmds = [ { type, ... } ] }
function core_online.onInstructions(data) end

--- Hook appelé par le moteur quand l'état de connexion change : prévient l'interface et envoie les infos du fournisseur de service.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/online.lua:22
---@param connected boolean true si authentifié.
function core_online.onOnlineStateChanged(connected) end

--- Hook appelé quand les réglages changent : active (et ouvre la session) ou désactive les fonctions en ligne selon onlineFeatures.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/online.lua:232
function core_online.onSettingsChanged() end

--- Appelé par l'interface pour masquer définitivement un message : ajoute son uid au réglage OnlineHiddenMessageIDs et sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/online.lua:282
---@param uid string Identifiant du message.
function core_online.onUIOnlineMessageHide(uid) end

--- Appelé par l'interface quand elle peut afficher les messages en ligne : envoie ceux déjà reçus.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/online.lua:276
function core_online.onUIOnlineMessageReady() end

--- Ouvre la session en ligne côté moteur (Engine.Online.openSession), une seule fois par lancement du jeu et seulement si les fonctions en ligne sont activées.
---Source : lua/ge/extensions/core/online.lua:50
function core_online.openSession() end

--- Demande à l'interface l'état de connexion : envoie 'OnlineStateChanged' et, si un fournisseur de service (ex. Steam) est connecté, 'SteamInfo'.
---Source : lua/ge/extensions/core/online.lua:37
function core_online.requestState() end

--- Exportée mais vaut nil : aucune fonction de ce nom n'est définie dans le fichier. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/online.lua:dyn
function core_online.requestSubscriptions() end

--- Exportée mais vaut nil : aucune fonction de ce nom n'est définie dans le fichier. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/online.lua:dyn
function core_online.testWebsocket() end

