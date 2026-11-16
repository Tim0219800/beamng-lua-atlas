# `guihooks`

*Fichier : `lua/common/guihooks.lua` · VM : Commun (GE + véhicule) · 215 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `guihooks`

Passerelle Lua vers l'interface HTML/JS (CEF). Permet de déclencher des hooks JS côté UI (guihooks.trigger) et d'envoyer des flux de données (streams) à haute fréquence pour les applications d'UI. Présent dans la VM GE (via `be`) et dans la VM véhicule (via `obj`) ; les deux envoient par queueHookJS/queueStreamDataJS. Un moddeur s'en sert pour afficher un message, mettre à jour une app UI ou tracer des valeurs dans l'app 'Generic Graph'.

## Exemple

```lua
guihooks.trigger('MyUiHook', {speed = 12.5, gear = 'D'})  -- côté JS : $scope.$on('MyUiHook', function(ev, data) ... end)
guihooks.message('Hello', 5, 'myCategory')
guihooks.graph({'vitesse', speed, 100, 'm/s'}, {'rpm', rpm, 8000})
```

## Remarques

- Les arguments nil sont supprimés de la liste envoyée à JS par trigger et triggerClient (les arguments sont compactés, pas de trou). trigger n'envoie '[]' s'il n'y a aucun argument non nil.
- trigger utilise l'identifiant de contexte d'exécution execCtxWebId (global) comme cible, 0 par défaut ; triggerClient permet de viser un identifiant de client précis (targetDsmId).
- Dans la VM véhicule, queueStream n'écrit dans le cache que si M.updateStreams est vrai ; reset() le remet à false. Côté GE, queueStream met toujours M.updateStreams à true. Le cache est envoyé par sendStreams.
- sendStreams() doit être appelé depuis le onGraphicsStep du véhicule (indiqué dans le code) : dans la VM véhicule il appelle aussi streams.update() et déclenche VehicleChange/VehicleReset si v.data a changé.
- M.queueStream et M.send sont des champs définis (alias) : l'extraction automatique les signale à tort comme nil, la variable locale queueStream est une fonction (nop si ni obj ni be n'existent).
- Le commentaire du code prévoit que ce module sera revu : 'todo replace ui_message'. guihooks.message ne fait rien si le joueur n'est pas assis (playerInfo.firstPlayerSeated faux).
- graph() renvoie la table values normalisée (clé, valeur, échelle, unité, renderNegatives, couleur RGBA issue de jetColor). graphWithCSV garde un fichier CSV ouvert au niveau du module : le premier appel fixe les colonnes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `guihooks.graph(a, ...)` | Alimente l'app UI 'Generic Graph' (stream 'genericGraphSimple'). Chaque argument est une table {clé, valeur, échelle, unité, renderNegatives, couleur}; valeurs par défaut : clé '#i', valeur 0, échelle 1, unité '', renderNegatives false, couleur RGBA dégradé jet. Renvoie la liste normalisée. Exemple : graph({'foo',foo}, {'bar',bar,100}, {'baz',baz,nil,'m/s',false,nil}). | 151 |
| `guihooks.graphWithCSV(filename, ...)` | Comme graph, et enregistre aussi chaque appel comme une ligne d'un CSV en mémoire (csvlib). Le premier appel crée le fichier et fixe les colonnes (clé + unité). Écrire sur disque avec graphWithCSVWrite(). | 167 |
| `guihooks.graphWithCSVWrite()` | Écrit le CSV accumulé par graphWithCSV dans le fichier ; journalise une erreur si aucun CSV n'existe. | 185 |
| `guihooks.message(msg, ttl, category, icon, availableOptionsCount, currentOptionIndex)` | Affiche un message dans l'UI via le hook 'Message' (données {msg, ttl, category, icon, availableOptionsCount, currentOptionIndex}). Ne fait rien si playerInfo.firstPlayerSeated est faux. | 126 |
| `guihooks.messageForSeatedPlayers(msg, ttl, category, icon, availableOptionsCount, currentOptionIndex)` | Envoie le hook 'Message' une fois pour chaque joueur assis (playerInfo.seatedPlayers), avec le champ data.player. Accepte soit les mêmes arguments que message, soit une seule table {msg=..., ...} passée en premier argument (ttl nil). | 132 |
| `guihooks.reset()` | Remet updateStreams à false, vide le cache de streams et envoie le hook 'VehicleReset' si le premier joueur est assis. Appelé lors d'un reset du véhicule/de la VM. *(interne)* | 97 |
| `guihooks.sendStreams()` | Envoie à l'UI tous les streams mis en cache par queueStream puis vide le cache. Appelé par le moteur (VM véhicule : depuis onGraphicsStep ; ne doit pas être appelé depuis GE d'après le commentaire du code). *(interne)* | 88 |
| `guihooks.trigger(hookName, ...)` | Déclenche le hook JS `hookName` côté UI avec les arguments donnés (encodés en JSON dans un tableau). Les valeurs nil sont ignorées. Sensible au ramasse-miettes (réutilise une table temporaire) : ne pas la modifier à la légère. | 26 |
| `guihooks.triggerClient(targetDsmId, hookName, ...)` | Comme trigger mais pour un client UI précis identifié par targetDsmId. | 41 |
| `guihooks.triggerRawJS(hookName, rawJs)` | Déclenche un hook JS en passant du JS brut (inséré tel quel entre crochets, pas d'échappement ni d'encodage JSON). À n'utiliser qu'avec du texte de confiance. | 54 |
| `guihooks.triggerStream(streamName, streamData)` | Envoie immédiatement une donnée de flux (stream) à l'UI sous le nom streamName (encodée en JSON). | 58 |

### Détail des paramètres

#### `guihooks.graph(a, ...)`

Alimente l'app UI 'Generic Graph' (stream 'genericGraphSimple'). Chaque argument est une table {clé, valeur, échelle, unité, renderNegatives, couleur}; valeurs par défaut : clé '#i', valeur 0, échelle 1, unité '', renderNegatives false, couleur RGBA dégradé jet. Renvoie la liste normalisée. Exemple : graph({'foo',foo}, {'bar',bar,100}, {'baz',baz,nil,'m/s',false,nil}).

- `a` (*table|nil*) : premier graphe {clé, valeur, échelle, unité, renderNegatives, couleur} (ignoré si nil/false)
- `...` (*table*) : autres graphes, même format
- **renvoie** : table[] liste des graphes avec valeurs par défaut remplies

#### `guihooks.graphWithCSV(filename, ...)`

Comme graph, et enregistre aussi chaque appel comme une ligne d'un CSV en mémoire (csvlib). Le premier appel crée le fichier et fixe les colonnes (clé + unité). Écrire sur disque avec graphWithCSVWrite().

- `filename` (*string|nil*) : nom du fichier CSV (pris au premier appel ; défaut graphcsv.<date>.csv)
- `...` (*table*) : graphes, mêmes arguments que graph

#### `guihooks.message(msg, ttl, category, icon, availableOptionsCount, currentOptionIndex)`

Affiche un message dans l'UI via le hook 'Message' (données {msg, ttl, category, icon, availableOptionsCount, currentOptionIndex}). Ne fait rien si playerInfo.firstPlayerSeated est faux.

- `msg` (*string*) : texte (clé de traduction possible, déduit du code UI)
- `ttl` (*number|nil*) : durée d'affichage en secondes, défaut 5
- `category` (*string|nil*) : catégorie du message, défaut ''
- `icon` (*string|nil*) : icône
- `availableOptionsCount` (*integer|nil*) : nombre d'options (menus de choix)
- `currentOptionIndex` (*integer|nil*) : option courante

#### `guihooks.messageForSeatedPlayers(msg, ttl, category, icon, availableOptionsCount, currentOptionIndex)`

Envoie le hook 'Message' une fois pour chaque joueur assis (playerInfo.seatedPlayers), avec le champ data.player. Accepte soit les mêmes arguments que message, soit une seule table {msg=..., ...} passée en premier argument (ttl nil).

- `msg` (*string|table*) : texte ou table de données avec champ msg
- `ttl` (*number|nil*) : durée, défaut 5
- `category` (*string|nil*) : catégorie, défaut ''
- `icon` (*string|nil*) : icône
- `availableOptionsCount` (*integer|nil*) : nombre d'options
- `currentOptionIndex` (*integer|nil*) : option courante

#### `guihooks.trigger(hookName, ...)`

Déclenche le hook JS `hookName` côté UI avec les arguments donnés (encodés en JSON dans un tableau). Les valeurs nil sont ignorées. Sensible au ramasse-miettes (réutilise une table temporaire) : ne pas la modifier à la légère.

- `hookName` (*string*) : nom du hook JS
- `...` (*any*) : arguments sérialisables en JSON (nil ignorés)

#### `guihooks.triggerClient(targetDsmId, hookName, ...)`

Comme trigger mais pour un client UI précis identifié par targetDsmId.

- `targetDsmId` (*integer*) : identifiant du client/UI cible
- `hookName` (*string*) : nom du hook JS
- `...` (*any*) : arguments (nil ignorés)

#### `guihooks.triggerRawJS(hookName, rawJs)`

Déclenche un hook JS en passant du JS brut (inséré tel quel entre crochets, pas d'échappement ni d'encodage JSON). À n'utiliser qu'avec du texte de confiance.

- `hookName` (*string*) : nom du hook JS
- `rawJs` (*any*) : code JS brut converti avec tostring

#### `guihooks.triggerStream(streamName, streamData)`

Envoie immédiatement une donnée de flux (stream) à l'UI sous le nom streamName (encodée en JSON).

- `streamName` (*string*) : nom du stream
- `streamData` (*any*) : donnée sérialisable en JSON

## Champs

| Champ | Type | Description |
|---|---|---|
| `queueStream` | function | queueStream(key, value) : met en cache la donnée de flux `key` pour envoi ultérieur par sendStreams (VM véhicule : seulement si updateStreams est vrai). nop si ni `obj` ni `be`. |
| `send` | function | Alias de queueStream. |

## Appels vers le moteur (C++)

- `be:` `queueHookJS`, `queueStreamDataJS`
- `obj:` `queueHookJS`, `queueStreamDataJS`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/guihooks.lua`.*
