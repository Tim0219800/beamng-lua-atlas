# `libs_copas_copas_ftp`

*Fichier : `lua/common/libs/copas/copas/ftp.lua` · VM : Commun (GE + véhicule) · 96 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/copas/copas/ftp")`

Sous-module FTP de la bibliothèque tierce Copas : identique à socket.ftp de LuaSocket, mais utilise des sockets Copas asynchrones (copas.wrap). Définit copas.ftp avec get, put et command. Les constantes PORT, TIMEOUT, PASSWORD et USER sont redirigées vers le module socket.ftp d'origine quand on les affecte.

## Remarques

- Bug : parseRequest construit la table t mais ne la renvoie pas (pas de `return t`) ; get/put appelés avec une URL en chaîne reçoivent donc nil. La forme table (get{...}/put{...}) fonctionne.
- get et put sont enveloppés par socket.protect.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_copas_copas_ftp.command(cmdt)` | Envoie une commande FTP brute (comme socket.ftp.command) avec un socket Copas. | 90 |
| `libs_copas_copas_ftp.parseRequest(u, body)` | Convertit la forme courte en forme avancée : avec body c'est un PUT (source = body), sinon un GET avec champ target recevant le résultat. | 57 |

### Détail des paramètres

#### `libs_copas_copas_ftp.command(cmdt)`

Envoie une commande FTP brute (comme socket.ftp.command) avec un socket Copas.

- `cmdt` (*table*) : Table de commande LuaSocket

#### `libs_copas_copas_ftp.parseRequest(u, body)`

Convertit la forme courte en forme avancée : avec body c'est un PUT (source = body), sinon un GET avec champ target recevant le résultat.

- `u` (*string*) : URL ftp://…
- `body` (*string|nil*) : Contenu à envoyer (PUT)

## Champs

| Champ | Type | Description |
|---|---|---|
| `get` | function | Télécharge un fichier : get(url_ou_table). En forme chaîne, renvoie le contenu concaténé. |
| `put` | function | Envoie un fichier : put(url_ou_table, body). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/copas/copas/ftp.lua`.*
