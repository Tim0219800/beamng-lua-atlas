# `core_repository`

*Fichier : `lua/ge/extensions/core/repository.lua` · VM : Game Engine (GE) · 655 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_repository` : `extensions.load("core_repository")`, puis la globale `core_repository`

Client du dépôt de mods en ligne (repository BeamNG) côté GE. Il interroge l'API (core_online.apiCall, routes s1/v4 et s2/v4), gère les abonnements aux mods, tient une file de téléchargement/mise à jour (mods installés dans /mods/repo/) et pousse l'état à l'UI par guihooks (ModListReceived, ModReceived, UpdateQueueState, downloadStatesChanged, etc.). Il dépend de core_modmanager pour monter ou supprimer les mods.

## Exemple

```lua
-- depuis l'UI JS : bngApi.engineLua('extensions.core_repository.requestMods(' + bngApi.serializeToLua({query='drift'}) + ')')
core_repository.modSubscribe('1234')
```

## Remarques

- Les résultats des requêtes ne sont pas retournés : ils sont envoyés à l'UI par guihooks.trigger (requestMods -> ModListReceived, requestMod -> ModReceived sauf si un callback est fourni, requestMyMods -> MyModsReceived).
- Les pages de l'UI commencent à 1 : requestMods et requestMyMods envoient page - 1 au serveur.
- Si le réglage onlineFeatures n'est pas 'enable', requestMod passe en mode hors ligne (requestModOffline, données locales du mod manager).
- File de mises à jour : chaque élément a un état (waiting, updating, downloading, downloaded, done). Le nombre de téléchargements simultanés vient du réglage modNumParallelDownload (3 par défaut). Quand tout est fini, le serveur est informé (s2/v4/modUpdateSuccess) et UpdateFinished est émis.
- modSubscribe consigne aussi un opt-out dans /settings/cloud/mods-optout.json ; modUnsubscribe y inscrit le mod (désabonnement volontaire). Si le gestionnaire de mods n'est pas prêt ou qu'on n'est pas authentifié, l'abonnement est mis en attente (subList) puis rejoué par runSubscription.
- BUG : M.requestSubscriptions = requestSubscriptions référence une variable locale non définie, donc le champ vaut nil.
- BUG probable : dans installMod, 'completeCallback' est une variable globale jamais définie dans ce fichier ; son test 'if completeCallback' est toujours faux. De plus requestMyMods utilise v.id pour 'pending' là où requestMods utilise v.tagid.
- Dans installMod, un fichier du même nom à la racine /mods/ est supprimé avant le téléchargement.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_repository.addUpdateQueue(data)` | Ajoute un mod à la file de téléchargement (sans doublon par id). Complète les champs : dirname '/mods/repo/', outfile, uri '<id>/<ver>/<filename>', icon, état initial (updating pour une subscription, waiting sinon). | 486 |
| `core_repository.changeStateUpdateQueue(fname, nstate)` | Change l'état d'un élément de la file (par nom de fichier), puis notifie l'UI (UpdateQueueState et RepoModChangeStatus). | 139 |
| `core_repository.installMod(uri, filename, localPath, callback)` | Télécharge un mod (s1/v4/download/mods/<uri>) vers localPath..filename et gère la fin : erreurs (notification toastr), suppression d'un ancien fichier du même mod hors du dossier repo, mise à jour de la file, rapport au serveur et lancement du téléchargement suivant. | 152 |
| `core_repository.modSubscribe(mod_id, useOptOut)` | Abonne l'utilisateur à un mod : l'ajoute à la file en tant que 'subscription' et lance le téléchargement. Peut être ignoré si l'utilisateur s'est désabonné volontairement (useOptOut). | 388 |
| `core_repository.modUnsubscribe(mod_id)` | Désabonne l'utilisateur : inscrit le mod dans la liste d'opt-out, le retire de la file (refusé s'il est en téléchargement), supprime le mod local via core_modmanager.deleteMod et prévient le serveur (s2/v4/modUnsubscribe) si besoin. | 441 |
| `core_repository.onModManagerReady()` | Hook appelé quand le gestionnaire de mods est prêt : rejoue les abonnements en attente, puis applique les ordres de repoCmd (installer, supprimer, désactiver des mods) et les efface. *(interne)* *(hook)* | 567 |
| `core_repository.onOnlineStateChanged(connected)` | Hook appelé quand l'état de connexion change : appelle runSubscription. *(interne)* *(hook)* | 621 |
| `core_repository.onUpdate(dt)` | Hook de mise à jour : si la progression des téléchargements a changé, envoie 'downloadStatesChanged' à l'UI. *(interne)* *(hook)* | 46 |
| `core_repository.requestMod(mod_id, callback)` | Demande les détails d'un mod (s1/v4/getMod/<id>). Résultat passé au callback s'il est fourni, sinon envoyé par 'ModReceived'. Hors ligne ou en cas d'échec avec des données locales, utilise requestModOffline. | 324 |
| `core_repository.requestModOffline(mod_id)` | Envoie à l'UI ('ModReceived') les informations locales d'un mod installé ; ok = 1 si trouvé, 0 sinon. | 299 |
| `core_repository.requestMods(query, order_by, order, page, categories)` | Demande la liste des mods au serveur (s1/v4/getMods). Chaque entrée est enrichie de pending, unpacked et downState. Résultat envoyé à l'UI par 'ModListReceived'. | 262 |
| `core_repository.requestMyMods(query, order_by, order, page, categories)` | Comme requestMods mais limité aux mods de l'utilisateur (own = 1). Résultat envoyé par 'MyModsReceived'. | 352 |
| `core_repository.runSubscription()` | Rejoue les abonnements mis en attente si le gestionnaire de mods est prêt et si l'utilisateur est authentifié. | 612 |
| `core_repository.setRepoCmd(cmddata)` | Mémorise les ordres du serveur (forceInstall, forceRemove, forceDisable) appliqués à onModManagerReady. | 559 |
| `core_repository.setRepoMsg(data)` | Mémorise le message du dépôt, inclus ensuite dans les listes envoyées à l'UI. | 555 |
| `core_repository.setrepoAutomationMsg(data)` | Mémorise un message d'automatisation, inclus dans les listes envoyées à l'UI (automationMsg). | 563 |
| `core_repository.uiShowMod(modId)` | Demande à l'UI d'afficher la fiche d'un mod (évènement 'ShowMod'). | 605 |
| `core_repository.uiShowRepo()` | Affiche le menu des mods (état UI 'menu.mods.local') après MenuHide. | 600 |
| `core_repository.uiUpdateQueue()` | Envoie à l'UI 'UpdateQueueState' avec les listes updatingList, doneList, missingList et le drapeau updating. | 53 |
| `core_repository.updateAllMissing()` | Passe tous les éléments d'action 'missing' en mise à jour et relance la file. | 542 |
| `core_repository.updateAllMods()` | Désactive le montage auto, marque tous les éléments d'action 'update' pour mise à jour et relance la file. | 516 |
| `core_repository.updateOneMod(id)` | Met à jour un seul mod de la file. | 529 |

### Détail des paramètres

#### `core_repository.addUpdateQueue(data)`

Ajoute un mod à la file de téléchargement (sans doublon par id). Complète les champs : dirname '/mods/repo/', outfile, uri '<id>/<ver>/<filename>', icon, état initial (updating pour une subscription, waiting sinon).

- `data` (*table*) : Données du mod : id, ver, filename, reason (ex. 'subscription').

#### `core_repository.changeStateUpdateQueue(fname, nstate)`

Change l'état d'un élément de la file (par nom de fichier), puis notifie l'UI (UpdateQueueState et RepoModChangeStatus).

- `fname` (*string*) : Nom de fichier du mod.
- `nstate` (*string*) : Nouvel état (waiting, updating, downloading, downloaded, done).

#### `core_repository.installMod(uri, filename, localPath, callback)`

Télécharge un mod (s1/v4/download/mods/<uri>) vers localPath..filename et gère la fin : erreurs (notification toastr), suppression d'un ancien fichier du même mod hors du dossier repo, mise à jour de la file, rapport au serveur et lancement du téléchargement suivant.

- `uri` (*string*) : '<id>/<version>/<nomdefichier>'.
- `filename` (*string*) : Nom du fichier zip à écrire.
- `localPath` (*string|nil*) : Dossier cible, '/mods/repo/' par défaut.
- `callback` (*function|nil*) : Appelé avec la réponse de téléchargement si le code HTTP est 200.

#### `core_repository.modSubscribe(mod_id, useOptOut)`

Abonne l'utilisateur à un mod : l'ajoute à la file en tant que 'subscription' et lance le téléchargement. Peut être ignoré si l'utilisateur s'est désabonné volontairement (useOptOut).

- `mod_id` (*string*) : Identifiant du mod.
- `useOptOut` (*boolean|nil*) : Si vrai, ignore la demande si le mod figure dans la liste d'opt-out.

#### `core_repository.modUnsubscribe(mod_id)`

Désabonne l'utilisateur : inscrit le mod dans la liste d'opt-out, le retire de la file (refusé s'il est en téléchargement), supprime le mod local via core_modmanager.deleteMod et prévient le serveur (s2/v4/modUnsubscribe) si besoin.

- `mod_id` (*string*) : Identifiant du mod.

#### `core_repository.onOnlineStateChanged(connected)`

Hook appelé quand l'état de connexion change : appelle runSubscription.

- `connected` (*boolean*) : Non utilisé.

#### `core_repository.onUpdate(dt)`

Hook de mise à jour : si la progression des téléchargements a changé, envoie 'downloadStatesChanged' à l'UI.

- `dt` (*number*) : Durée de l'image (non utilisée).

#### `core_repository.requestMod(mod_id, callback)`

Demande les détails d'un mod (s1/v4/getMod/<id>). Résultat passé au callback s'il est fourni, sinon envoyé par 'ModReceived'. Hors ligne ou en cas d'échec avec des données locales, utilise requestModOffline.

- `mod_id` (*string*) : Identifiant du mod sur le dépôt.
- `callback` (*function|nil*) : Reçoit request.responseData.

#### `core_repository.requestModOffline(mod_id)`

Envoie à l'UI ('ModReceived') les informations locales d'un mod installé ; ok = 1 si trouvé, 0 sinon.

- `mod_id` (*string*) : Identifiant du mod.

#### `core_repository.requestMods(query, order_by, order, page, categories)`

Demande la liste des mods au serveur (s1/v4/getMods). Chaque entrée est enrichie de pending, unpacked et downState. Résultat envoyé à l'UI par 'ModListReceived'.

- `query` (*string|nil*) : Texte de recherche.
- `order_by` (*string|nil*) : Champ de tri.
- `order` (*string|nil*) : Sens du tri.
- `page` (*integer*) : Numéro de page, à partir de 1.
- `categories` (*any*) : Filtre de catégories (transmis tel quel).

#### `core_repository.requestMyMods(query, order_by, order, page, categories)`

Comme requestMods mais limité aux mods de l'utilisateur (own = 1). Résultat envoyé par 'MyModsReceived'.

- `query` (*string|nil*) : Recherche.
- `order_by` (*string|nil*) : Champ de tri.
- `order` (*string|nil*) : Sens du tri.
- `page` (*integer*) : Numéro de page, à partir de 1.
- `categories` (*any*) : Filtre de catégories.

#### `core_repository.setRepoCmd(cmddata)`

Mémorise les ordres du serveur (forceInstall, forceRemove, forceDisable) appliqués à onModManagerReady.

- `cmddata` (*table*) : Listes d'identifiants de mods par clé.

#### `core_repository.setRepoMsg(data)`

Mémorise le message du dépôt, inclus ensuite dans les listes envoyées à l'UI.

- `data` (*table*) : Message.

#### `core_repository.setrepoAutomationMsg(data)`

Mémorise un message d'automatisation, inclus dans les listes envoyées à l'UI (automationMsg).

- `data` (*table*) : Message.

#### `core_repository.uiShowMod(modId)`

Demande à l'UI d'afficher la fiche d'un mod (évènement 'ShowMod').

- `modId` (*string*) : Identifiant du mod.

#### `core_repository.updateOneMod(id)`

Met à jour un seul mod de la file.

- `id` (*string*) : Identifiant du mod.

## Champs

| Champ | Type | Description |
|---|---|---|
| `requestSubscriptions` | nil | Vaut nil : référence à une variable non définie dans le fichier. ⚠ référence `requestSubscriptions` non définie dans le fichier (vaut probablement nil) |

**Évènements UI (guihooks.trigger) :** `MenuHide`, `ModDownloaded`, `ModListReceived`, `ModReceived`, `ModSubscribed`, `ModUnsubscribed`, `MyModsReceived`, `RepoModChangeStatus`, `ShowMod`, `UpdateFinished`, `UpdateQueueState`, `downloadStateChanged`, `downloadStatesChanged`, `repoError`, `toastrMsg`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/repository.lua`.*
