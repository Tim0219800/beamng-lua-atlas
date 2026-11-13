# `libs_copas_copas`

*Fichier : `lua/common/libs/copas/copas.lua` · VM : Commun (GE + véhicule) · 1188 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/copas/copas")`

Copas 2.0.2 : bibliothèque tierce (Kepler Project) — « Coroutine Oriented Portable Asynchronous Services », un répartiteur à base de coroutines pour serveurs et clients TCP/UDP, qui s'appuie sur LuaSocket. Les sockets sont enveloppés (copas.wrap) pour que send/receive/connect cèdent la main au lieu de bloquer ; copas.loop ou copas.step font tourner le tout. Copas sert de base aux sous-modules copas.http, copas.ftp, copas.smtp, copas.timer, copas.lock, copas.semaphore et copas.limit.

## Exemple

```lua
local copas = require("libs/copas/copas")
copas.addthread(function()
  copas.sleep(1)
  print("1 s plus tard")
end)
copas.loop() -- ou copas.step(0) à chaque frame
```

## Remarques

- Dans BeamNG, préférer copas.step(timeout) appelé périodiquement plutôt que copas.loop (boucle sans fin qui bloquerait le jeu) (déduit de la nature des fonctions).
- copas.sleep(sleeptime) avec une valeur négative endort la coroutine jusqu'à copas.wakeup(co).
- dohandshake lève une erreur (au lieu de renvoyer nil+erreur) pour éviter de continuer en clair par mégarde ; il faut remplacer toutes les références à l'ancien socket par le socket SSL renvoyé.
- useSocketTimeoutErrors(true) renvoie les erreurs d'origine de LuaSocket (timeout, wantread, wantwrite, Operation already in progress) ; sinon toujours « timeout ».

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_copas_copas.addserver(server, handler, timeout)` | Enregistre un socket serveur TCP et un handler appelé dans une nouvelle coroutine pour chaque connexion acceptée (fonction définie dans le code, non listée par l'extracteur automatique). (assignée dynamiquement) | dyn |
| `libs_copas_copas.addthread(handler, ...)` | Ajoute une nouvelle coroutine au répartiteur ; elle démarre au prochain pas de boucle. | 903 |
| `libs_copas_copas.connect(skt, host, port)` | Connecte le socket et attend (en cédant la main) la fin de la connexion. | 565 |
| `libs_copas_copas.dohandshake(skt, sslt)` | Poignée de main SSL asynchrone sur un socket client connecté. Renvoie un nouveau socket SSL qui remplace l'ancien ; lève une erreur en cas d'échec. | 611 |
| `libs_copas_copas.finished()` | Indique s'il n'y a plus rien à faire (aucun socket en lecture/écriture ni tâche planifiée). | 1166 |
| `libs_copas_copas.flush()` | Vide le tampon d'écriture d'un client (obsolète). | 651 |
| `libs_copas_copas.handler(handler, sslparams)` | Enveloppe un handler de façon à envelopper le socket et faire la poignée de main SSL facultative. | 769 |
| `libs_copas_copas.loop(initializer, timeout)` | Boucle sans fin du répartiteur : écoute et traite les requêtes jusqu'à l'arrêt. Met copas.running à true. | 1175 |
| `libs_copas_copas.receive(client, pattern, part)` | Lit selon un motif sur un client et cède la main aux timeouts. Pour UDP, le motif est obligatoire et doit être un nombre. | 398 |
| `libs_copas_copas.receivePartial(client, pattern, part)` | Comme receive, mais se débloque dès que des données arrivent (lecture par morceaux). | 468 |
| `libs_copas_copas.receivefrom(client, size)` | Reçoit des données d'un client UDP (non disponible pour TCP). | 438 |
| `libs_copas_copas.removeserver(server, keep_open)` | Retire un serveur du répartiteur ; le ferme sauf si keep_open est vrai. | 882 |
| `libs_copas_copas.removethread(thread)` | Retire une coroutine du répartiteur (elle est supprimée à sa prochaine reprise). | 912 |
| `libs_copas_copas.send(client, data, from, to)` | Envoie des données à un client, avec tampon, en cédant la main sur timeout. from et to sont ignorés pour UDP. | 509 |
| `libs_copas_copas.sendto(client, data, ip, port)` | Envoie un datagramme UDP. | 559 |
| `libs_copas_copas.setErrorHandler(err, default)` | Définit la fonction appelée quand un handler lève une erreur ; avec default vrai, remplace aussi le gestionnaire par défaut (déduit du code). | 798 |
| `libs_copas_copas.settimeout(skt, timeout)` | Définit le timeout d'un socket Copas. | 380 |
| `libs_copas_copas.sleep(sleeptime)` | Suspend la coroutine courante et la réveille après sleeptime secondes. Une valeur négative la suspend jusqu'à un appel explicite à wakeup. | 926 |
| `libs_copas_copas.step(timeout)` | Un pas de la boucle du répartiteur : traite les sockets prêts et les tâches planifiées. | 1136 |
| `libs_copas_copas.useSocketTimeoutErrors(bool)` | Choisit de renvoyer les erreurs de timeout d'origine de LuaSocket (vrai) ou toujours « timeout » (faux). | 809 |
| `libs_copas_copas.wakeup(co)` | Réveille une coroutine endormie par sleep. | 931 |
| `libs_copas_copas.wrap(skt, sslt)` | Enveloppe un socket LuaSocket en socket asynchrone Copas ; avec sslt, active SSL. | 755 |

### Détail des paramètres

#### `libs_copas_copas.addserver(server, handler, timeout)`

Enregistre un socket serveur TCP et un handler appelé dans une nouvelle coroutine pour chaque connexion acceptée (fonction définie dans le code, non listée par l'extracteur automatique). (assignée dynamiquement)

- `server` (*table*) : Socket serveur LuaSocket
- `handler` (*function*) : Fonction handler(skt) (voir copas.handler)
- `timeout` (*number|nil*) : Timeout des opérations (déduit du code)

#### `libs_copas_copas.addthread(handler, ...)`

Ajoute une nouvelle coroutine au répartiteur ; elle démarre au prochain pas de boucle.

- `handler` (*function*) : Fonction exécutée dans la coroutine
- `...` (*any*) : Arguments passés au handler
- **renvoie** : thread La coroutine créée

#### `libs_copas_copas.connect(skt, host, port)`

Connecte le socket et attend (en cédant la main) la fin de la connexion.

- `skt` (*table*) : Socket
- `host` (*string*) : Hôte
- `port` (*integer*) : Port

#### `libs_copas_copas.dohandshake(skt, sslt)`

Poignée de main SSL asynchrone sur un socket client connecté. Renvoie un nouveau socket SSL qui remplace l'ancien ; lève une erreur en cas d'échec.

- `skt` (*table*) : Socket client LuaSocket
- `sslt` (*table*) : Paramètres SSL
- **renvoie** : table Socket SSL

#### `libs_copas_copas.finished()`

Indique s'il n'y a plus rien à faire (aucun socket en lecture/écriture ni tâche planifiée).

- **renvoie** : boolean true s'il n'y a plus rien à traiter

#### `libs_copas_copas.handler(handler, sslparams)`

Enveloppe un handler de façon à envelopper le socket et faire la poignée de main SSL facultative.

- `handler` (*function*) : Handler(skt)
- `sslparams` (*table|nil*) : Paramètres SSL
- **renvoie** : function Handler enveloppé

#### `libs_copas_copas.loop(initializer, timeout)`

Boucle sans fin du répartiteur : écoute et traite les requêtes jusqu'à l'arrêt. Met copas.running à true.

- `initializer` (*function|nil*) : Fonction exécutée dans une coroutine au démarrage
- `timeout` (*number|nil*) : Timeout de chaque pas

#### `libs_copas_copas.receive(client, pattern, part)`

Lit selon un motif sur un client et cède la main aux timeouts. Pour UDP, le motif est obligatoire et doit être un nombre.

- `client` (*table*) : Socket
- `pattern` (*string|integer|nil*) : Motif de lecture LuaSocket ("*l", "*a", nombre d'octets)
- `part` (*string|nil*) : Données déjà reçues (reprise)

#### `libs_copas_copas.receivePartial(client, pattern, part)`

Comme receive, mais se débloque dès que des données arrivent (lecture par morceaux).

- `client` (*table*) : Socket
- `pattern` (*string|integer|nil*) : Motif de lecture
- `part` (*string|nil*) : Données déjà reçues

#### `libs_copas_copas.receivefrom(client, size)`

Reçoit des données d'un client UDP (non disponible pour TCP).

- `client` (*table*) : Socket UDP
- `size` (*integer*) : Taille maximale

#### `libs_copas_copas.removeserver(server, keep_open)`

Retire un serveur du répartiteur ; le ferme sauf si keep_open est vrai.

- `server` (*table*) : Socket serveur
- `keep_open` (*boolean|nil*) : Ne pas fermer le socket

#### `libs_copas_copas.removethread(thread)`

Retire une coroutine du répartiteur (elle est supprimée à sa prochaine reprise).

- `thread` (*thread*) : Coroutine à retirer

#### `libs_copas_copas.send(client, data, from, to)`

Envoie des données à un client, avec tampon, en cédant la main sur timeout. from et to sont ignorés pour UDP.

- `client` (*table*) : Socket
- `data` (*string*) : Données
- `from` (*integer|nil*) : Premier octet à envoyer
- `to` (*integer|nil*) : Dernier octet à envoyer

#### `libs_copas_copas.sendto(client, data, ip, port)`

Envoie un datagramme UDP.

- `client` (*table*) : Socket UDP
- `data` (*string*) : Données
- `ip` (*string*) : Adresse
- `port` (*integer*) : Port

#### `libs_copas_copas.setErrorHandler(err, default)`

Définit la fonction appelée quand un handler lève une erreur ; avec default vrai, remplace aussi le gestionnaire par défaut (déduit du code).

- `err` (*function*) : Gestionnaire d'erreurs
- `default` (*boolean|nil*) : Changer le gestionnaire par défaut

#### `libs_copas_copas.settimeout(skt, timeout)`

Définit le timeout d'un socket Copas.

- `skt` (*table*) : Socket
- `timeout` (*number*) : Timeout en secondes

#### `libs_copas_copas.sleep(sleeptime)`

Suspend la coroutine courante et la réveille après sleeptime secondes. Une valeur négative la suspend jusqu'à un appel explicite à wakeup.

- `sleeptime` (*number*) : Durée en secondes (négative : jusqu'à wakeup)

#### `libs_copas_copas.step(timeout)`

Un pas de la boucle du répartiteur : traite les sockets prêts et les tâches planifiées.

- `timeout` (*number|nil*) : Durée max d'attente des sockets, en secondes
- **renvoie** : boolean|nil false si aucune donnée traitée, true sinon (ou nil + message d'erreur)

#### `libs_copas_copas.useSocketTimeoutErrors(bool)`

Choisit de renvoyer les erreurs de timeout d'origine de LuaSocket (vrai) ou toujours « timeout » (faux).

- `bool` (*boolean*) : Activer les erreurs d'origine

#### `libs_copas_copas.wakeup(co)`

Réveille une coroutine endormie par sleep.

- `co` (*thread*) : Coroutine à réveiller

#### `libs_copas_copas.wrap(skt, sslt)`

Enveloppe un socket LuaSocket en socket asynchrone Copas ; avec sslt, active SSL.

- `skt` (*table*) : Socket LuaSocket
- `sslt` (*table|nil*) : Paramètres SSL (table vide pour les valeurs par défaut)
- **renvoie** : table Socket enveloppé

## Champs

| Champ | Type | Description |
|---|---|---|
| `_COPYRIGHT` | string | Copyright Kepler Project 2005-2017. |
| `_DESCRIPTION` | string | Coroutine Oriented Portable Asynchronous Services. |
| `_VERSION` | string | "Copas 2.0.2". |
| `autoclose` | boolean | Si vrai (défaut), ferme le socket de la connexion une fois le handler terminé. |
| `running` | boolean | Indique que la boucle copas.loop tourne (faux au départ). |

## Classe `_sleeping`

File interne des coroutines endormies (objet interne).

Objet `_sleeping` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `_sleeping.insert()` | Insère une coroutine endormie (interne au répartiteur). | 58 |
| `_sleeping.remove()` | Retire une coroutine endormie (interne au répartiteur). | 58 |

## Classe `socket`

Fonctions LuaSocket redéfinies par Copas en versions sûres vis-à-vis des coroutines (permet d'utiliser socket.http dans Copas).

| Méthode | Description | Ligne |
|---|---|---|
| `socket.newtry(finalizer)` | Version de socket.newtry compatible coroutines. | 83 |
| `socket.protect(func)` | Version de socket.protect compatible coroutines. | 77 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/copas/copas.lua`.*
