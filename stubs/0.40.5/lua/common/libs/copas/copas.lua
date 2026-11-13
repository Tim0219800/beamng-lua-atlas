---@meta
-- tim19Atlas stub generated from lua/common/libs/copas/copas.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Copas 2.0.2 : bibliothèque tierce (Kepler Project) — « Coroutine Oriented Portable Asynchronous Services », un répartiteur à base de coroutines pour serveurs et clients TCP/UDP, qui s'appuie sur LuaSocket. Les sockets sont enveloppés (copas.wrap) pour que send/receive/connect cèdent la main au lieu de bloquer ; copas.loop ou copas.step font tourner le tout. Copas sert de base aux sous-modules copas.http, copas.ftp, copas.smtp, copas.timer, copas.lock, copas.semaphore et copas.limit.
--- Accès : `require("libs/copas/copas")`
---@class libs_copas_copas
---@field _COPYRIGHT string Copyright Kepler Project 2005-2017.
---@field _DESCRIPTION string Coroutine Oriented Portable Asynchronous Services.
---@field _VERSION string "Copas 2.0.2".
---@field autoclose boolean Si vrai (défaut), ferme le socket de la connexion une fois le handler terminé.
---@field running boolean Indique que la boucle copas.loop tourne (faux au départ).
local libs_copas_copas = {}

--- Enregistre un socket serveur TCP et un handler appelé dans une nouvelle coroutine pour chaque connexion acceptée (fonction définie dans le code, non listée par l'extracteur automatique). (assignée dynamiquement)
---Source : lua/common/libs/copas/copas.lua:dyn
---@param server table Socket serveur LuaSocket
---@param handler function Fonction handler(skt) (voir copas.handler)
---@param timeout number|nil Timeout des opérations (déduit du code)
function libs_copas_copas.addserver(server, handler, timeout) end

--- Ajoute une nouvelle coroutine au répartiteur ; elle démarre au prochain pas de boucle.
---Source : lua/common/libs/copas/copas.lua:903
---@param handler function Fonction exécutée dans la coroutine
---@param ... any Arguments passés au handler
---@return thread  La coroutine créée
function libs_copas_copas.addthread(handler, ...) end

--- Connecte le socket et attend (en cédant la main) la fin de la connexion.
---Source : lua/common/libs/copas/copas.lua:565
---@param skt table Socket
---@param host string Hôte
---@param port integer Port
function libs_copas_copas.connect(skt, host, port) end

--- Poignée de main SSL asynchrone sur un socket client connecté. Renvoie un nouveau socket SSL qui remplace l'ancien ; lève une erreur en cas d'échec.
---Source : lua/common/libs/copas/copas.lua:611
---@param skt table Socket client LuaSocket
---@param sslt table Paramètres SSL
---@return table  Socket SSL
function libs_copas_copas.dohandshake(skt, sslt) end

--- Indique s'il n'y a plus rien à faire (aucun socket en lecture/écriture ni tâche planifiée).
---Source : lua/common/libs/copas/copas.lua:1166
---@return boolean  true s'il n'y a plus rien à traiter
function libs_copas_copas.finished() end

--- Vide le tampon d'écriture d'un client (obsolète).
---Source : lua/common/libs/copas/copas.lua:651
function libs_copas_copas.flush() end

--- Enveloppe un handler de façon à envelopper le socket et faire la poignée de main SSL facultative.
---Source : lua/common/libs/copas/copas.lua:769
---@param handler function Handler(skt)
---@param sslparams table|nil Paramètres SSL
---@return function  Handler enveloppé
function libs_copas_copas.handler(handler, sslparams) end

--- Boucle sans fin du répartiteur : écoute et traite les requêtes jusqu'à l'arrêt. Met copas.running à true.
---Source : lua/common/libs/copas/copas.lua:1175
---@param initializer function|nil Fonction exécutée dans une coroutine au démarrage
---@param timeout number|nil Timeout de chaque pas
function libs_copas_copas.loop(initializer, timeout) end

--- Lit selon un motif sur un client et cède la main aux timeouts. Pour UDP, le motif est obligatoire et doit être un nombre.
---Source : lua/common/libs/copas/copas.lua:398
---@param client table Socket
---@param pattern string|integer|nil Motif de lecture LuaSocket ("*l", "*a", nombre d'octets)
---@param part string|nil Données déjà reçues (reprise)
function libs_copas_copas.receive(client, pattern, part) end

--- Comme receive, mais se débloque dès que des données arrivent (lecture par morceaux).
---Source : lua/common/libs/copas/copas.lua:468
---@param client table Socket
---@param pattern string|integer|nil Motif de lecture
---@param part string|nil Données déjà reçues
function libs_copas_copas.receivePartial(client, pattern, part) end

--- Reçoit des données d'un client UDP (non disponible pour TCP).
---Source : lua/common/libs/copas/copas.lua:438
---@param client table Socket UDP
---@param size integer Taille maximale
function libs_copas_copas.receivefrom(client, size) end

--- Retire un serveur du répartiteur ; le ferme sauf si keep_open est vrai.
---Source : lua/common/libs/copas/copas.lua:882
---@param server table Socket serveur
---@param keep_open boolean|nil Ne pas fermer le socket
function libs_copas_copas.removeserver(server, keep_open) end

--- Retire une coroutine du répartiteur (elle est supprimée à sa prochaine reprise).
---Source : lua/common/libs/copas/copas.lua:912
---@param thread thread Coroutine à retirer
function libs_copas_copas.removethread(thread) end

--- Envoie des données à un client, avec tampon, en cédant la main sur timeout. from et to sont ignorés pour UDP.
---Source : lua/common/libs/copas/copas.lua:509
---@param client table Socket
---@param data string Données
---@param from integer|nil Premier octet à envoyer
---@param to integer|nil Dernier octet à envoyer
function libs_copas_copas.send(client, data, from, to) end

--- Envoie un datagramme UDP.
---Source : lua/common/libs/copas/copas.lua:559
---@param client table Socket UDP
---@param data string Données
---@param ip string Adresse
---@param port integer Port
function libs_copas_copas.sendto(client, data, ip, port) end

--- Définit la fonction appelée quand un handler lève une erreur ; avec default vrai, remplace aussi le gestionnaire par défaut (déduit du code).
---Source : lua/common/libs/copas/copas.lua:798
---@param err function Gestionnaire d'erreurs
---@param default boolean|nil Changer le gestionnaire par défaut
function libs_copas_copas.setErrorHandler(err, default) end

--- Définit le timeout d'un socket Copas.
---Source : lua/common/libs/copas/copas.lua:380
---@param skt table Socket
---@param timeout number Timeout en secondes
function libs_copas_copas.settimeout(skt, timeout) end

--- Suspend la coroutine courante et la réveille après sleeptime secondes. Une valeur négative la suspend jusqu'à un appel explicite à wakeup.
---Source : lua/common/libs/copas/copas.lua:926
---@param sleeptime number Durée en secondes (négative : jusqu'à wakeup)
function libs_copas_copas.sleep(sleeptime) end

--- Un pas de la boucle du répartiteur : traite les sockets prêts et les tâches planifiées.
---Source : lua/common/libs/copas/copas.lua:1136
---@param timeout number|nil Durée max d'attente des sockets, en secondes
---@return boolean|nil  false si aucune donnée traitée, true sinon (ou nil + message d'erreur)
function libs_copas_copas.step(timeout) end

--- Choisit de renvoyer les erreurs de timeout d'origine de LuaSocket (vrai) ou toujours « timeout » (faux).
---Source : lua/common/libs/copas/copas.lua:809
---@param bool boolean Activer les erreurs d'origine
function libs_copas_copas.useSocketTimeoutErrors(bool) end

--- Réveille une coroutine endormie par sleep.
---Source : lua/common/libs/copas/copas.lua:931
---@param co thread Coroutine à réveiller
function libs_copas_copas.wakeup(co) end

--- Enveloppe un socket LuaSocket en socket asynchrone Copas ; avec sslt, active SSL.
---Source : lua/common/libs/copas/copas.lua:755
---@param skt table Socket LuaSocket
---@param sslt table|nil Paramètres SSL (table vide pour les valeurs par défaut)
---@return table  Socket enveloppé
function libs_copas_copas.wrap(skt, sslt) end

--- File interne des coroutines endormies (objet interne).
---@class libs_copas_copas__sleeping
local libs_copas_copas__sleeping = {}

--- Insère une coroutine endormie (interne au répartiteur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/copas/copas.lua:58
function libs_copas_copas__sleeping.insert() end

--- Retire une coroutine endormie (interne au répartiteur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/copas/copas.lua:58
function libs_copas_copas__sleeping.remove() end

--- Fonctions LuaSocket redéfinies par Copas en versions sûres vis-à-vis des coroutines (permet d'utiliser socket.http dans Copas).
---@class libs_copas_copas_socket
local libs_copas_copas_socket = {}

--- Version de socket.newtry compatible coroutines.
---Source : lua/common/libs/copas/copas.lua:83
---@param finalizer function Fonction de nettoyage
function libs_copas_copas_socket.newtry(finalizer) end

--- Version de socket.protect compatible coroutines.
---Source : lua/common/libs/copas/copas.lua:77
---@param func function Fonction à protéger
function libs_copas_copas_socket.protect(func) end

return libs_copas_copas
