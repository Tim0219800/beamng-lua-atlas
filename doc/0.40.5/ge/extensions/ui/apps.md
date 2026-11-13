# `ui_apps`

*Fichier : `lua/ge/extensions/ui/apps.lua` · VM : Game Engine (GE) · 252 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_apps` : `extensions.load("ui_apps")`, puis la globale `ui_apps`

Catalogue des apps d'interface (Vue/JS) installées. getUIAppsData parcourt /ui/modules/apps/ à la recherche de app.json, de app.vue et des variantes app.<directive>.vue, et construit une table indexée par nom d'app (types traduits, aperçus, fichiers vue/js, indicateurs interactive/essential/photomode…). Le module surveille aussi /settings/ui_apps/ et prévient l'interface quand un layout change.

## Remarques

- Un app.json sans domElement ou sans directive est ignoré avec une erreur dans le log.
- Les apps sans app.json mais avec un app.vue (ou app.<variante>.vue) sont ajoutées comme apps « sourceOnly » (catégorie Embedded, auxiliaires, cachées du navigateur d'apps).
- Les clés de position css autorisées dans app.json sont left, right, top, bottom, width, height et margin ; les autres sont supprimées.
- Une app dont le champ simplemenu ne correspond pas à Engine.UI.isSimpleMenu() est exclue.
- Un avertissement est journalisé si getUIAppsData dépasse 100 ms.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_apps.getUIAppsData()` | Construit et renvoie le catalogue des apps disponibles, indexé par appName. | 214 |
| `ui_apps.notifyLayoutsChanged()` | Envoie l'événement UI 'UiAppLayoutsChanged' pour que l'interface relise les layouts. | 222 |
| `ui_apps.onFilesChanged(files)` | Hook appelé quand des fichiers changent : si un fichier est sous /settings/ui_apps/, programme un rafraîchissement des layouts 0,2 s plus tard. *(interne)* *(hook)* | 228 |
| `ui_apps.onUpdate()` | Hook de frame : déclenche notifyLayoutsChanged quand le délai programmé par onFilesChanged est écoulé. *(interne)* *(hook)* | 238 |

### Détail des paramètres

#### `ui_apps.getUIAppsData()`

Construit et renvoie le catalogue des apps disponibles, indexé par appName.

- **renvoie** : table<string, table> Données de chaque app (appName, directive, types, typesTranslated, folder, vueFile, hasAppVue, hasAppJs, interactive, essential, isAuxiliary, photomode, official, previews…).

#### `ui_apps.onFilesChanged(files)`

Hook appelé quand des fichiers changent : si un fichier est sous /settings/ui_apps/, programme un rafraîchissement des layouts 0,2 s plus tard.

- `files` (*table<integer, table>*) : Liste d'entrées avec un champ filename.

**Évènements UI (guihooks.trigger) :** `UiAppLayoutsChanged`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/apps.lua`.*
