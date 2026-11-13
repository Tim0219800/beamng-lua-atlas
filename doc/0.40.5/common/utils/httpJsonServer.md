# `utils_httpJsonServer`

*Fichier : `lua/common/utils/httpJsonServer.lua` · VM : Commun (GE + véhicule) · 163 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("utils/httpJsonServer")`

Mini serveur HTTP non bloquant qui répond en JSON, pour monter rapidement une API REST locale (outils externes, éditeurs). Se charge avec require('utils/httpJsonServer') ; init() ouvre le port, puis update() doit être appelé régulièrement (à chaque frame). Seules les requêtes GET sont traitées.

## Exemple

```lua
local srv = require('utils/httpJsonServer')
local function handle(request)
  if request.uri and request.uri.path == 'v1/ping' then return {ok = true} end
  -- renvoyer nil donne une réponse {ok=false, error=500}
end
srv.init('localhost', 23512, handle)
-- puis, à chaque frame : srv.update()
```

## Remarques

- Le callback reçoit {uri = (table url.parse), headers = {nomEnMinuscules = valeur}}. uri.path ne commence pas par '/' (le motif capture ce qui suit 'GET /').
- Le callback doit renvoyer une table sérialisable en JSON ; nil produit {ok=false, error=500} (le code HTTP réel reste celui de la réponse du serveur, le 500 est dans le corps JSON).
- Si bind échoue, une erreur est loguée mais le code continue (settimeout/listen sont quand même appelés).
- Les connexions fermées ne sont pas retirées des listes clients (TODO FIXME dans le code) : fuite possible.
- Utilise socket.select non bloquant, un timeout de 0.1 s par client lisible, et ltn12 pour l'envoi par blocs de 4096 octets.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `utils_httpJsonServer.init(_bindhost, _bindport, _callback)` | Crée la socket TCP, la lie à l'hôte/port, la met en écoute non bloquante et mémorise le callback de traitement des requêtes. | 52 |
| `utils_httpJsonServer.update()` | À appeler régulièrement : accepte les nouveaux clients, lit les requêtes GET prêtes, appelle le callback et envoie les réponses JSON (puis ferme la connexion). Ne fait rien avant init(). | 105 |

### Détail des paramètres

#### `utils_httpJsonServer.init(_bindhost, _bindport, _callback)`

Crée la socket TCP, la lie à l'hôte/port, la met en écoute non bloquante et mémorise le callback de traitement des requêtes.

- `_bindhost` (*string*) : Adresse d'écoute, ex. 'localhost'
- `_bindport` (*integer*) : Port TCP, ex. 23512
- `_callback` (*function*) : function(request) -> table|nil : construit la réponse JSON

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/utils/httpJsonServer.lua`.*
