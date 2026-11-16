# `htmlTexture`

*Fichier : `lua/vehicle/htmlTexture.lua` · VM : Véhicule · 66 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("htmlTexture")`

Aide pour afficher une page web (HTML/JS) sur une texture du véhicule (écran de tableau de bord, afficheur). `create` ou `new` crée une vue web (obj:createWebView) liée à un tag de matériau/texture ; `call` ou la méthode callJS exécutent ensuite une fonction JavaScript dans cette page avec des données encodées en JSON. À utiliser depuis un contrôleur ou une extension du véhicule.

## Exemple

```lua
local htmlTexture = require('htmlTexture')
local screen = htmlTexture.new('@dashScreen', 'local://local/vehicles/mycar/dash.html', 512, 256, 30)
screen:callJS('setSpeed', {kmh = 90})
-- ou sans objet :
htmlTexture.create('@dashScreen', uri, 512, 256, nil, 'automatic')
htmlTexture.call('@dashScreen', 'setSpeed', {kmh = 90})
```

## Remarques

- usagemode : nil ou 'automatic' (id 1, rafraîchissement continu, fps = fps ou 25 par défaut), 'once' (id 0, rendu une seule fois, fps forcé à 0), 'manual' (id 2, rendu à la demande, fps forcé à 0). Une autre valeur laisse l'id à 0 mais conserve fps tel quel.
- Le code JS exécuté est la chaîne `jsMethod(<JSON de data>)` : jsMethod doit être un nom de fonction JavaScript global (ou chemin) existant dans la page ; data est encodé avec jsonEncode.
- Les objets créés par new ont les champs webViewTag, uri, width, height, fps, usageModeID et les méthodes callJS(jsMethod, data) et streamJS(streamName, jsMethod, data) (file d'attente de flux JS via obj:queueWebViewStreamJS).
- Le commentaire du code indique que create n'est utilisable que pour son propre véhicule.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `htmlTexture.call(webViewTag, jsMethod, data)` | Met en file l'exécution de `jsMethod(<JSON>)` dans la vue web identifiée par son tag (obj:queueWebViewJS). | 38 |
| `htmlTexture.create(webViewTag, uri, width, height, fps, usagemode)` | Crée une vue web sans renvoyer d'objet (même logique de usagemode que new). Prévu pour le véhicule propriétaire. | 45 |
| `htmlTexture.new(webViewTag, uri, width, height, fps, usagemode)` | Crée une vue web et renvoie un objet pratique avec les méthodes callJS et streamJS. | 17 |

### Détail des paramètres

#### `htmlTexture.call(webViewTag, jsMethod, data)`

Met en file l'exécution de `jsMethod(<JSON>)` dans la vue web identifiée par son tag (obj:queueWebViewJS).

- `webViewTag` (*string*) : Tag de la vue web.
- `jsMethod` (*string*) : Nom de la fonction JavaScript à appeler.
- `data` (*any*) : Argument encodé en JSON (jsonEncode).

#### `htmlTexture.create(webViewTag, uri, width, height, fps, usagemode)`

Crée une vue web sans renvoyer d'objet (même logique de usagemode que new). Prévu pour le véhicule propriétaire.

- `webViewTag` (*string*) : Tag de la texture web.
- `uri` (*string*) : Adresse de la page HTML.
- `width` (*integer*) : Largeur en pixels.
- `height` (*integer*) : Hauteur en pixels.
- `fps` (*number|nil*) : Images par seconde (25 par défaut en mode automatic).
- `usagemode` (*string|nil*) : 'automatic' (défaut), 'once' ou 'manual'.

#### `htmlTexture.new(webViewTag, uri, width, height, fps, usagemode)`

Crée une vue web et renvoie un objet pratique avec les méthodes callJS et streamJS.

- `webViewTag` (*string*) : Identifiant/tag de la texture web du matériau.
- `uri` (*string*) : Adresse de la page HTML à afficher.
- `width` (*integer*) : Largeur de la texture en pixels.
- `height` (*integer*) : Hauteur de la texture en pixels.
- `fps` (*number|nil*) : Images par seconde (mode automatic uniquement, 25 par défaut).
- `usagemode` (*string|nil*) : 'automatic' (défaut), 'once' ou 'manual'.
- **renvoie** : table Objet {webViewTag, uri, width, height, fps, usageModeID} avec callJS(jsMethod, data) et streamJS(streamName, jsMethod, data).

## Appels vers le moteur (C++)

- `obj:` `createWebView`, `queueWebViewJS`, `queueWebViewStreamJS`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/htmlTexture.lua`.*
