---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/repository.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Client du dépôt de mods en ligne (repository BeamNG) côté GE. Il interroge l'API (core_online.apiCall, routes s1/v4 et s2/v4), gère les abonnements aux mods, tient une file de téléchargement/mise à jour (mods installés dans /mods/repo/) et pousse l'état à l'UI par guihooks (ModListReceived, ModReceived, UpdateQueueState, downloadStatesChanged, etc.). Il dépend de core_modmanager pour monter ou supprimer les mods.
--- Accès : extension `core_repository` : `extensions.load("core_repository")`, puis la globale `core_repository`
---@class core_repository
---@field requestSubscriptions nil Vaut nil : référence à une variable non définie dans le fichier.
core_repository = {}

--- Ajoute un mod à la file de téléchargement (sans doublon par id). Complète les champs : dirname '/mods/repo/', outfile, uri '<id>/<ver>/<filename>', icon, état initial (updating pour une subscription, waiting sinon).
---Source : lua/ge/extensions/core/repository.lua:486
---@param data table Données du mod : id, ver, filename, reason (ex. 'subscription').
function core_repository.addUpdateQueue(data) end

--- Change l'état d'un élément de la file (par nom de fichier), puis notifie l'UI (UpdateQueueState et RepoModChangeStatus).
---Source : lua/ge/extensions/core/repository.lua:139
---@param fname string Nom de fichier du mod.
---@param nstate string Nouvel état (waiting, updating, downloading, downloaded, done).
function core_repository.changeStateUpdateQueue(fname, nstate) end

--- Télécharge un mod (s1/v4/download/mods/<uri>) vers localPath..filename et gère la fin : erreurs (notification toastr), suppression d'un ancien fichier du même mod hors du dossier repo, mise à jour de la file, rapport au serveur et lancement du téléchargement suivant.
---Source : lua/ge/extensions/core/repository.lua:152
---@param uri string '<id>/<version>/<nomdefichier>'.
---@param filename string Nom du fichier zip à écrire.
---@param localPath string|nil Dossier cible, '/mods/repo/' par défaut.
---@param callback function|nil Appelé avec la réponse de téléchargement si le code HTTP est 200.
function core_repository.installMod(uri, filename, localPath, callback) end

--- Abonne l'utilisateur à un mod : l'ajoute à la file en tant que 'subscription' et lance le téléchargement. Peut être ignoré si l'utilisateur s'est désabonné volontairement (useOptOut).
---Source : lua/ge/extensions/core/repository.lua:388
---@param mod_id string Identifiant du mod.
---@param useOptOut boolean|nil Si vrai, ignore la demande si le mod figure dans la liste d'opt-out.
function core_repository.modSubscribe(mod_id, useOptOut) end

--- Désabonne l'utilisateur : inscrit le mod dans la liste d'opt-out, le retire de la file (refusé s'il est en téléchargement), supprime le mod local via core_modmanager.deleteMod et prévient le serveur (s2/v4/modUnsubscribe) si besoin.
---Source : lua/ge/extensions/core/repository.lua:441
---@param mod_id string Identifiant du mod.
function core_repository.modUnsubscribe(mod_id) end

--- Hook appelé quand le gestionnaire de mods est prêt : rejoue les abonnements en attente, puis applique les ordres de repoCmd (installer, supprimer, désactiver des mods) et les efface.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/repository.lua:567
function core_repository.onModManagerReady() end

--- Hook appelé quand l'état de connexion change : appelle runSubscription.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/repository.lua:621
---@param connected boolean Non utilisé.
function core_repository.onOnlineStateChanged(connected) end

--- Hook de mise à jour : si la progression des téléchargements a changé, envoie 'downloadStatesChanged' à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/repository.lua:46
---@param dt number Durée de l'image (non utilisée).
function core_repository.onUpdate(dt) end

--- Demande les détails d'un mod (s1/v4/getMod/<id>). Résultat passé au callback s'il est fourni, sinon envoyé par 'ModReceived'. Hors ligne ou en cas d'échec avec des données locales, utilise requestModOffline.
---Source : lua/ge/extensions/core/repository.lua:324
---@param mod_id string Identifiant du mod sur le dépôt.
---@param callback function|nil Reçoit request.responseData.
function core_repository.requestMod(mod_id, callback) end

--- Envoie à l'UI ('ModReceived') les informations locales d'un mod installé ; ok = 1 si trouvé, 0 sinon.
---Source : lua/ge/extensions/core/repository.lua:299
---@param mod_id string Identifiant du mod.
function core_repository.requestModOffline(mod_id) end

--- Demande la liste des mods au serveur (s1/v4/getMods). Chaque entrée est enrichie de pending, unpacked et downState. Résultat envoyé à l'UI par 'ModListReceived'.
---Source : lua/ge/extensions/core/repository.lua:262
---@param query string|nil Texte de recherche.
---@param order_by string|nil Champ de tri.
---@param order string|nil Sens du tri.
---@param page integer Numéro de page, à partir de 1.
---@param categories any Filtre de catégories (transmis tel quel).
function core_repository.requestMods(query, order_by, order, page, categories) end

--- Comme requestMods mais limité aux mods de l'utilisateur (own = 1). Résultat envoyé par 'MyModsReceived'.
---Source : lua/ge/extensions/core/repository.lua:352
---@param query string|nil Recherche.
---@param order_by string|nil Champ de tri.
---@param order string|nil Sens du tri.
---@param page integer Numéro de page, à partir de 1.
---@param categories any Filtre de catégories.
function core_repository.requestMyMods(query, order_by, order, page, categories) end

--- Rejoue les abonnements mis en attente si le gestionnaire de mods est prêt et si l'utilisateur est authentifié.
---Source : lua/ge/extensions/core/repository.lua:612
function core_repository.runSubscription() end

--- Mémorise les ordres du serveur (forceInstall, forceRemove, forceDisable) appliqués à onModManagerReady.
---Source : lua/ge/extensions/core/repository.lua:559
---@param cmddata table Listes d'identifiants de mods par clé.
function core_repository.setRepoCmd(cmddata) end

--- Mémorise le message du dépôt, inclus ensuite dans les listes envoyées à l'UI.
---Source : lua/ge/extensions/core/repository.lua:555
---@param data table Message.
function core_repository.setRepoMsg(data) end

--- Mémorise un message d'automatisation, inclus dans les listes envoyées à l'UI (automationMsg).
---Source : lua/ge/extensions/core/repository.lua:563
---@param data table Message.
function core_repository.setrepoAutomationMsg(data) end

--- Demande à l'UI d'afficher la fiche d'un mod (évènement 'ShowMod').
---Source : lua/ge/extensions/core/repository.lua:605
---@param modId string Identifiant du mod.
function core_repository.uiShowMod(modId) end

--- Affiche le menu des mods (état UI 'menu.mods.local') après MenuHide.
---Source : lua/ge/extensions/core/repository.lua:600
function core_repository.uiShowRepo() end

--- Envoie à l'UI 'UpdateQueueState' avec les listes updatingList, doneList, missingList et le drapeau updating.
---Source : lua/ge/extensions/core/repository.lua:53
function core_repository.uiUpdateQueue() end

--- Passe tous les éléments d'action 'missing' en mise à jour et relance la file.
---Source : lua/ge/extensions/core/repository.lua:542
function core_repository.updateAllMissing() end

--- Désactive le montage auto, marque tous les éléments d'action 'update' pour mise à jour et relance la file.
---Source : lua/ge/extensions/core/repository.lua:516
function core_repository.updateAllMods() end

--- Met à jour un seul mod de la file.
---Source : lua/ge/extensions/core/repository.lua:529
---@param id string Identifiant du mod.
function core_repository.updateOneMod(id) end

