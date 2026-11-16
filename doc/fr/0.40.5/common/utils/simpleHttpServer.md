# `ws`

*Fichier : `lua/common/utils/simpleHttpServer.lua` · VM : Commun (GE + véhicule) · 309 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `ws`

Mini serveur HTTP non bloquant, qui sert des fichiers statiques d'un dossier (avec détection de type MIME par extension et gabarits libs/resty/template pour .htmlt/.jst) et des handlers Lua par motif d'URL. Se charge avec require('utils/simpleHttpServer'). Prévu uniquement pour des environnements sûrs (le fichier le dit) : lent, petits fichiers, non sécurisé.

## Exemple

```lua
local ws = require('utils/simpleHttpServer')
ws.start('127.0.0.1', 8080, '/ui/mon/dossier', {
  {'/hello/(%d+)', function(req, res) return 'hello ' .. res[1] end},
  {'/api/info', function() return {v = beamng_version} end},
}, function(req, path) return {titre = 'x'} end)
-- puis à chaque frame : ws.update()
-- ws.stop()
```

## Remarques

- Handlers : liste de {motif Lua, fonction(req, captures)}. Le premier motif qui capture au moins une valeur gagne ; si la fonction renvoie une table, elle est servie en JSON, sinon le texte renvoyé est envoyé tel quel (réponse HTTP brute complète).
- Un motif sans capture (ex. '/api/getInfo/') fonctionne aussi : string.match renvoie alors la correspondance entière, donc le test #res > 0 passe.
- Seules les requêtes GET sont acceptées ; '/' est redirigé vers /index.html.
- Bug : la protection anti '..' utilise le motif "\\.\\." qui, en motif Lua, cherche un antislash suivi d'un caractère quelconque : les '..' ne sont PAS retirés, la traversée de dossiers reste possible. Ne pas exposer sur un réseau.
- Bug : dans serve_file, `ext == 'htmlt' or ext == 'jst' and argsCallback` a un problème de priorité d'opérateurs : un fichier .htmlt est rendu avec argsCallback même si celui-ci est nil (erreur).
- Incohérence : stop() ferme la socket mais ne remet pas tcp_socket à nil : update() continue d'essayer d'utiliser la socket fermée.
- Incohérence : les réponses d'erreur utilisent des fins de ligne et un format non standard (pas de Content-Length, concaténation `.. message or 'File not found'` à priorité douteuse).
- Les connexions fermées ne sont pas retirées de la liste clients (TODO FIXME dans le code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ws.start(_bindhost, _bindport, _fileroot, _handlers, _argsCallback)` | Crée la socket TCP, la lie à l'hôte/port et la met en écoute non bloquante. En cas d'échec de bind, loggue une erreur, ferme la socket et abandonne. | 68 |
| `ws.stop()` | Ferme la socket d'écoute et loggue la fermeture. | 90 |
| `ws.update()` | À appeler à chaque frame : accepte les nouveaux clients, lit les requêtes GET prêtes, construit la réponse (handler ou fichier) et la pompe vers le client (fermeture à la fin). Ne fait rien si le serveur n'est pas démarré. | 235 |

### Détail des paramètres

#### `ws.start(_bindhost, _bindport, _fileroot, _handlers, _argsCallback)`

Crée la socket TCP, la lie à l'hôte/port et la met en écoute non bloquante. En cas d'échec de bind, loggue une erreur, ferme la socket et abandonne.

- `_bindhost` (*string*) : Adresse d'écoute, ex. '127.0.0.1'
- `_bindport` (*integer*) : Port TCP
- `_fileroot` (*string*) : Dossier racine des fichiers servis (concaténé au chemin d'URL)
- `_handlers` (*table|nil*) : Liste de {motif, fonction} (voir notes), vide par défaut
- `_argsCallback` (*function|nil*) : function(req, path) -> table : variables passées aux gabarits .htmlt/.jst

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `stat`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/utils/simpleHttpServer.lua`.*
