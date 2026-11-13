# `libs_copas_copas_http`

*Fichier : `lua/common/libs/copas/copas/http.lua` · VM : Commun (GE + véhicule) · 414 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("libs/copas/copas/http")`

Sous-module HTTP de la bibliothèque tierce Copas : copie complète du client HTTP/1.1 de LuaSocket (Diego Nehab) modifiée pour gérer https, les redirections http/https et les sockets Copas asynchrones. Définit copas.http ; copas.http.request(url[, body]) renvoie corps, code, en-têtes, statut. À appeler depuis une coroutine Copas.

## Exemple

```lua
copas.addthread(function()
  local body, code = copas.http.request("http://example.org/")
end)
```

## Remarques

- Avec une URL en chaîne : GET (ou POST si body est donné, content-type application/x-www-form-urlencoded) ; renvoie body, code, headers, status, ou nil + erreur.
- Avec une table, la requête avancée accepte url, method, headers, source, sink, create, etc. (comme LuaSocket).
- Le premier parseRequest définit target (table recevant les morceaux du corps) et sink.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `libs_copas_copas_http.open(reqt)` | API bas niveau : crée le socket (reqt:create()), fixe le timeout, se connecte à reqt.host:reqt.port et renvoie un objet de connexion HTTP. | 121 |
| `libs_copas_copas_http.parseRequest(u, b)` | Convertit la forme abrégée en table de requête avancée avec champ target (résultats) ; si un corps est donné : méthode POST, en-têtes content-length et content-type. | 380 |

### Détail des paramètres

#### `libs_copas_copas_http.open(reqt)`

API bas niveau : crée le socket (reqt:create()), fixe le timeout, se connecte à reqt.host:reqt.port et renvoie un objet de connexion HTTP.

- `reqt` (*table*) : Requête avec host, port, create
- **renvoie** : table Objet de connexion

#### `libs_copas_copas_http.parseRequest(u, b)`

Convertit la forme abrégée en table de requête avancée avec champ target (résultats) ; si un corps est donné : méthode POST, en-têtes content-length et content-type.

- `u` (*string*) : URL
- `b` (*string|nil*) : Corps POST
- **renvoie** : table Table de requête

## Champs

| Champ | Type | Description |
|---|---|---|
| `PORT` | integer | Port par défaut HTTP, 80. |
| `SSLOPTIONS` | string | Options SSL par défaut, "all". |
| `SSLPORT` | integer | Port par défaut HTTPS, 443. |
| `SSLPROTOCOL` | string | Protocole SSL par défaut, "tlsv1_2". |
| `SSLVERIFY` | string | Vérification des certificats, "none" par défaut (non vérifiés). |
| `TIMEOUT` | number | Timeout de connexion, 60 s. |
| `USERAGENT` | string | Champ User-Agent envoyé, valeur de socket._VERSION. |
| `request` | function | request(url_ou_table, body) : envoie une requête HTTP/HTTPS (protégée par socket.protect). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/libs/copas/copas/http.lua`.*
