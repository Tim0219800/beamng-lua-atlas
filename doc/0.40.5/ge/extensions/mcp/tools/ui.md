# `mcp_tools_ui`

*Fichier : `lua/ge/extensions/mcp/tools/ui.lua` · VM : Game Engine (GE) · 205 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_tools_ui` : `extensions.load("mcp_tools_ui")`, puis la globale `mcp_tools_ui`

Outils MCP pour l'interface (CEF/Vue) : lire la route et l'état Pinia, naviguer, afficher/masquer l'UI, afficher un message, et piloter le DOM (JS arbitraire, clic, molette, saisie, clavier, survol) pour des tests d'interface. Les commandes JS sont envoyées avec be:executeJS ; les résultats reviennent à GE par window.beamng.sendEngineLua vers les callbacks `_cb.vueDump` / `_cb.uiEval`.

## Remarques

- Attention sécurité : ui_eval exécute du JavaScript arbitraire dans l'UI.
- ui_eval et dump_vue_state sont asynchrones : un appel renvoie le résultat de la demande précédente (s'il y en a un) ou un message « call again ». Dans ui_eval, si un résultat est déjà en attente il est renvoyé SANS relancer l'évaluation. Le corps JS peut être une expression (auto-retournée si le texte ne contient pas « return »).
- Le sérialiseur de ui_eval est borné (profondeur 5, 200 éléments de tableau, 100 clés d'objet) ; les nœuds DOM sont réduits à un descripteur <tag#id.classe>.
- ui_click, ui_scroll, ui_type, ui_key, ui_hover sont « fire-and-forget » (erreurs JS avalées, aucun retour sur le succès réel) : vérifier l'effet avec ui_eval. `nth` est 1-based.
- Le callback ui_eval est partagé : `ui_eval` utilise shared.asyncResults.ui, `dump_vue_state` shared.asyncResults.vue.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_tools_ui.dump_vue_state()` | Demande un instantané de la route courante et des stores Pinia (asynchrone). | 50 |
| `mcp_tools_ui.get_ui_state()` | État de l'UI : route/scope (ui_router.getState) et état de jeu (core_gamestate.getGameState). | 36 |
| `mcp_tools_ui.set_ui_state(args)` | Navigue vers une route de l'UI (ui_router.navigate). | 42 |
| `mcp_tools_ui.show_message(args)` | Affiche un message dans l'app de messages du jeu via ui_message ; réutiliser la même category remplace le message précédent. | 66 |
| `mcp_tools_ui.toggle_ui(args)` | Affiche/masque l'UI (comme Alt+U) via ui_visibility. | 58 |
| `mcp_tools_ui.ui_click(args)` | Simule un clic complet (pointerdown, mousedown, pointerup, mouseup, click, option dblclick) au centre d'un élément trouvé par sélecteur CSS ; clic droit déclenche aussi contextmenu. | 89 |
| `mcp_tools_ui.ui_eval(args)` | Évalue du JavaScript dans l'UI et renvoie sa valeur en JSON (asynchrone). | 76 |
| `mcp_tools_ui.ui_hover(args)` | Simule un survol (pointerover, mouseover, pointerenter, mouseenter, pointermove, mousemove) d'un élément. | 134 |
| `mcp_tools_ui.ui_key(args)` | Envoie un évènement clavier à un élément ou à l'élément actif. | 124 |
| `mcp_tools_ui.ui_scroll(args)` | Envoie un évènement wheel à un élément (deltaY>0 = vers le bas ; 120 par défaut si aucun delta). | 103 |
| `mcp_tools_ui.ui_type(args)` | Saisit du texte dans un input/textarea/contenteditable (fixe la valeur puis déclenche input et change, compatible v-model). | 113 |

### Détail des paramètres

#### `mcp_tools_ui.dump_vue_state()`

Demande un instantané de la route courante et des stores Pinia (asynchrone).

- **renvoie** : string JSON {route, stores} précédent, ou message.
- **renvoie** : boolean false.

#### `mcp_tools_ui.get_ui_state()`

État de l'UI : route/scope (ui_router.getState) et état de jeu (core_gamestate.getGameState).

- **renvoie** : string JSON {route, gameState}.
- **renvoie** : boolean false.

#### `mcp_tools_ui.set_ui_state(args)`

Navigue vers une route de l'UI (ui_router.navigate).

- `args` (*table*) : {route: string (ex. 'menu', 'menu.vehicles'), params?: table}
- **renvoie** : string Message.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_ui.show_message(args)`

Affiche un message dans l'app de messages du jeu via ui_message ; réutiliser la même category remplace le message précédent.

- `args` (*table*) : {text: string, ttl?: number s (défaut 5), category?: string (défaut 'mcp'), icon?: string (défaut 'info')}
- **renvoie** : string « shown: … ».
- **renvoie** : boolean true si text manquant.

#### `mcp_tools_ui.toggle_ui(args)`

Affiche/masque l'UI (comme Alt+U) via ui_visibility.

- `args` (*table|nil*) : {show?: boolean} true/false pour fixer, absent pour basculer.
- **renvoie** : string « ui visible: … ».
- **renvoie** : boolean true si ui_visibility absent.

#### `mcp_tools_ui.ui_click(args)`

Simule un clic complet (pointerdown, mousedown, pointerup, mouseup, click, option dblclick) au centre d'un élément trouvé par sélecteur CSS ; clic droit déclenche aussi contextmenu.

- `args` (*table*) : {selector: string, nth?: integer, button?: 'left'|'middle'|'right'|0|1|2, doubleClick?: boolean}
- **renvoie** : string Message.
- **renvoie** : boolean true si selector manquant.

#### `mcp_tools_ui.ui_eval(args)`

Évalue du JavaScript dans l'UI et renvoie sa valeur en JSON (asynchrone).

- `args` (*table*) : {js: string}
- **renvoie** : string Résultat JSON ou message « dispatched ».
- **renvoie** : boolean true si js manquant.

#### `mcp_tools_ui.ui_hover(args)`

Simule un survol (pointerover, mouseover, pointerenter, mouseenter, pointermove, mousemove) d'un élément.

- `args` (*table*) : {selector: string, nth?: integer}
- **renvoie** : string Message.
- **renvoie** : boolean true si selector manquant.

#### `mcp_tools_ui.ui_key(args)`

Envoie un évènement clavier à un élément ou à l'élément actif.

- `args` (*table*) : {key: string (ex. 'Enter'), selector?: string, event?: 'down'|'up'|'press' (défaut keydown+keyup), nth?: integer}
- **renvoie** : string Message.
- **renvoie** : boolean true si key manquant.

#### `mcp_tools_ui.ui_scroll(args)`

Envoie un évènement wheel à un élément (deltaY>0 = vers le bas ; 120 par défaut si aucun delta).

- `args` (*table*) : {selector: string, deltaX?: number, deltaY?: number, nth?: integer}
- **renvoie** : string Message.
- **renvoie** : boolean true si selector manquant.

#### `mcp_tools_ui.ui_type(args)`

Saisit du texte dans un input/textarea/contenteditable (fixe la valeur puis déclenche input et change, compatible v-model).

- `args` (*table*) : {selector: string, text: string, clear?: boolean (défaut true, false = ajoute), nth?: integer}
- **renvoie** : string Message.
- **renvoie** : boolean true si paramètre manquant.

## Champs

| Champ | Type | Description |
|---|---|---|
| `cb` | table<string, function> | Callbacks `vueDump(s)` et `uiEval(s)` : stockent la chaîne dans shared.asyncResults.vue / .ui. |
| `schemas` | table<string, table> | Schémas des outils d'interface. |

## Appels vers le moteur (C++)

- `be:` `executeJS`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/tools/ui.lua`.*
