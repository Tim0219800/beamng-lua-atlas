# `core_online`

*Fichier : `lua/ge/extensions/core/online.lua` · VM : Game Engine (GE) · 356 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_online` : `extensions.load("core_online")`, puis la globale `core_online`

Extension GE `core_online` : couche d'accès aux services en ligne de BeamNG (authentification, API du repository de mods, téléchargements). Elle n'est active que si le réglage 'onlineFeatures' vaut 'enable'. Elle envoie les requêtes HTTP via SecureComm côté moteur, suit chaque requête (état 'working' puis 'finished') et rappelle un callback Lua à la fin. Elle reçoit aussi des instructions du serveur (messages à afficher, mises à jour de mods). Un moddeur s'en sert très rarement ; core_modmanager et core_repository l'utilisent.

## Exemple

```lua
-- appel d'API JSON (exemple du code)
core_online.apiCall('s1/v4/getMods?query=&order_by=&order=&page=1', function(req)
  dump(req.responseData)
end)
-- téléchargement d'un fichier
core_online.download('https://exemple.org/x.zip', function(req) log('I','', req.state) end, nil, '/temp/x.zip')
```

## Remarques

- Si les fonctions en ligne sont désactivées (réglage 'onlineFeatures' différent de 'enable'), apiCall/download renvoient false sans rien envoyer ; désactiver le réglage met aussi le réglage 'telemetry' à 'disable'. Si le client n'est pas authentifié (Engine.Online.isAuthenticated()), l'appel est refusé avec une erreur dans le log et renvoie false.
- Une requête est suivie dans `requests` (id croissant unique). La table publique passée au callback contient : id, url ou uri, outfile, dirname/filename/fileext, state ('working'|'finished'), error/errorCode (si curlCode ~= 0), effectiveURL, responseCode, responseBuffer (texte), responseData (table JSON décodée, si non vide), dltotal, dlnow, ultotal, ulnow, dlspeed, ulspeed, time (progression). downloadURL ne renvoie rien (nil) en cas de succès : seul false indique un refus.
- Si l'adresse commence par http:// ou https:// elle est utilisée telle quelle (champ url), sinon elle est traitée comme un chemin relatif d'API (champ uri). reqType vaut 'get' par défaut. postDataTbl est encodé en JSON (lunajson) et envoyé comme corps. postFileName et authorizationHeader sont transmis seulement par apiCall.
- Le moteur rappelle callbackSecureCommCpp et callbackSecureCommCppProgress (noms enregistrés comme 'core_online.callbackSecureCommCpp...') : ne pas les supprimer. clearRequest(id) est appelée par le moteur ensuite pour libérer la requête.
- Bug probable dans callbackSecureCommCpp : le test utilise la variable `responseresponseHeadersBuffer` (faute de frappe, toujours nil), donc r.pub.responseHeaders n'est jamais rempli.
- Bug : M.requestSubscriptions et M.testWebsocket sont exportés mais aucune variable locale de ce nom n'existe : ils valent nil.
- Instructions serveur (onInstructions) : seules celles avec origin == 'gameauth' sont acceptées. Types gérés : message (affiché via guihooks 'OnlineMessage' sauf identifiants masqués dans le réglage OnlineHiddenMessageIDs), modUpdateAvailable (core_modmanager.check4Update), repomsg, repocmd, automationmsg (core_repository). Un autre type est loggé en erreur.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_online.apiCall(uri, finishCallback, postDataTbl, outfile, reqType, progressCallback, postFileName, authorizationHeader)` | Appel d'API JSON : comme download mais demande une réponse JSON décodée dans responseData. | 143 |
| `core_online.callbackSecureCommCpp(id, responseCode, responseBuffer, responseHeaders, responseData, postData, curlCode, curlErrorStr, effectiveURL)` | Rappel du moteur à la fin d'une requête : remplit la table publique, la passe à l'état 'finished' et appelle le callback Lua de fin. *(interne)* | 148 |
| `core_online.callbackSecureCommCppProgress(id, dltotal, dlnow, ultotal, ulnow, dlspeed, ulspeed, time)` | Rappel du moteur pendant une requête : met à jour la progression (valeurs 0 ignorées) et appelle le callback de progression. *(interne)* | 199 |
| `core_online.clearRequest(id)` | Appelée par le moteur après une requête terminée : l'oublie. *(interne)* | 194 |
| `core_online.download(uri, finishCallback, postDataTbl, outfile, reqType, progressCallback)` | Télécharge une URL ou un chemin du serveur (sans traiter la réponse comme du JSON). | 139 |
| `core_online.getRequestsUI()` | Envoie à l'interface (guihooks 'OnlineRequestsState') la partie publique de toutes les requêtes en cours ou terminées. | 41 |
| `core_online.onExtensionLoaded()` | Au chargement : lit le réglage onlineFeatures (onSettingsChanged). *(interne)* *(hook)* | 248 |
| `core_online.onInstructions(data)` | Appelé par le moteur avec des instructions envoyées par le serveur d'authentification (voir notes). *(interne)* *(hook)* | 297 |
| `core_online.onOnlineStateChanged(connected)` | Hook appelé par le moteur quand l'état de connexion change : prévient l'interface et envoie les infos du fournisseur de service. *(interne)* *(hook)* | 22 |
| `core_online.onSettingsChanged()` | Hook appelé quand les réglages changent : active (et ouvre la session) ou désactive les fonctions en ligne selon onlineFeatures. *(interne)* *(hook)* | 232 |
| `core_online.onUIOnlineMessageHide(uid)` | Appelé par l'interface pour masquer définitivement un message : ajoute son uid au réglage OnlineHiddenMessageIDs et sauvegarde. *(interne)* *(hook)* | 282 |
| `core_online.onUIOnlineMessageReady()` | Appelé par l'interface quand elle peut afficher les messages en ligne : envoie ceux déjà reçus. *(interne)* *(hook)* | 276 |
| `core_online.openSession()` | Ouvre la session en ligne côté moteur (Engine.Online.openSession), une seule fois par lancement du jeu et seulement si les fonctions en ligne sont activées. | 50 |
| `core_online.requestState()` | Demande à l'interface l'état de connexion : envoie 'OnlineStateChanged' et, si un fournisseur de service (ex. Steam) est connecté, 'SteamInfo'. | 37 |
| `core_online.requestSubscriptions()` | Exportée mais vaut nil : aucune fonction de ce nom n'est définie dans le fichier. (assignée dynamiquement) *(interne)* | dyn |
| `core_online.testWebsocket()` | Exportée mais vaut nil : aucune fonction de ce nom n'est définie dans le fichier. (assignée dynamiquement) *(interne)* | dyn |

### Détail des paramètres

#### `core_online.apiCall(uri, finishCallback, postDataTbl, outfile, reqType, progressCallback, postFileName, authorizationHeader)`

Appel d'API JSON : comme download mais demande une réponse JSON décodée dans responseData.

- `uri` (*string*) : Chemin d'API ('s1/v4/...') ou URL complète.
- `finishCallback` (*function|nil*) : Appelé à la fin avec la table publique de la requête ; nil = requête sans callback.
- `postDataTbl` (*table|nil*) : Données à envoyer, encodées en JSON.
- `outfile` (*string|nil*) : Fichier où écrire la réponse.
- `reqType` (*string|nil*) : Méthode HTTP, 'get' par défaut (mise en minuscules).
- `progressCallback` (*function|nil*) : Appelé périodiquement avec la table publique (progression).
- `postFileName` (*string|nil*) : Nom de fichier à envoyer en POST.
- `authorizationHeader` (*string|nil*) : En-tête d'autorisation à ajouter.
- **renvoie** : boolean|nil false si refusé (désactivé ou non authentifié), nil sinon.

#### `core_online.callbackSecureCommCpp(id, responseCode, responseBuffer, responseHeaders, responseData, postData, curlCode, curlErrorStr, effectiveURL)`

Rappel du moteur à la fin d'une requête : remplit la table publique, la passe à l'état 'finished' et appelle le callback Lua de fin.

- `id` (*integer*) : Id de la requête.
- `responseCode` (*integer*) : Code HTTP.
- `responseBuffer` (*string*) : Corps de la réponse.
- `responseHeaders` (*string*) : En-têtes de réponse.
- `responseData` (*table*) : Réponse JSON décodée.
- `postData` (*any*) : Données envoyées (non utilisées).
- `curlCode` (*integer*) : Code d'erreur curl (0 = ok).
- `curlErrorStr` (*string*) : Message d'erreur curl.
- `effectiveURL` (*string*) : URL finale après redirections.

#### `core_online.callbackSecureCommCppProgress(id, dltotal, dlnow, ultotal, ulnow, dlspeed, ulspeed, time)`

Rappel du moteur pendant une requête : met à jour la progression (valeurs 0 ignorées) et appelle le callback de progression.

- `id` (*integer*) : Id de la requête.
- `dltotal` (*number*) : Octets à télécharger au total.
- `dlnow` (*number*) : Octets téléchargés.
- `ultotal` (*number*) : Octets à envoyer au total.
- `ulnow` (*number*) : Octets envoyés.
- `dlspeed` (*number*) : Vitesse de téléchargement.
- `ulspeed` (*number*) : Vitesse d'envoi.
- `time` (*number*) : Temps écoulé.

#### `core_online.clearRequest(id)`

Appelée par le moteur après une requête terminée : l'oublie.

- `id` (*integer*) : Id de la requête.

#### `core_online.download(uri, finishCallback, postDataTbl, outfile, reqType, progressCallback)`

Télécharge une URL ou un chemin du serveur (sans traiter la réponse comme du JSON).

- `uri` (*string*) : URL complète ou chemin.
- `finishCallback` (*function|nil*) : Callback de fin.
- `postDataTbl` (*table|nil*) : Données POST encodées en JSON.
- `outfile` (*string|nil*) : Fichier de destination.
- `reqType` (*string|nil*) : Méthode HTTP, 'get' par défaut.
- `progressCallback` (*function|nil*) : Callback de progression.
- **renvoie** : boolean|nil false si refusé, nil sinon.

#### `core_online.onInstructions(data)`

Appelé par le moteur avec des instructions envoyées par le serveur d'authentification (voir notes).

- `data` (*table*) : { origin = 'gameauth', cmds = [ { type, ... } ] }

#### `core_online.onOnlineStateChanged(connected)`

Hook appelé par le moteur quand l'état de connexion change : prévient l'interface et envoie les infos du fournisseur de service.

- `connected` (*boolean*) : true si authentifié.

#### `core_online.onUIOnlineMessageHide(uid)`

Appelé par l'interface pour masquer définitivement un message : ajoute son uid au réglage OnlineHiddenMessageIDs et sauvegarde.

- `uid` (*string*) : Identifiant du message.

**Évènements UI (guihooks.trigger) :** `OnlineMessage`, `OnlineRequestsState`, `OnlineStateChanged`, `SteamInfo`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/online.lua`.*
