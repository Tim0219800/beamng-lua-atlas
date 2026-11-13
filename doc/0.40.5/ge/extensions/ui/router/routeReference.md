# `ui_router_routeReference`

*Fichier : `lua/ge/extensions/ui/router/routeReference.lua` · VM : Game Engine (GE) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routeReference` : `extensions.load("ui_router_routeReference")`, puis la globale `ui_router_routeReference`

Fonctions pures pour décomposer une référence de navigation décorée de la forme `route[?clé=valeur&...][:portée]`. La partie route peut rester relative (« ./options ») : ce module ne la résout pas, il sépare seulement la requête inline et la portée (scope) et décode les paramètres inline.

## Exemple

```lua
local r = extensions.ui_router_routeReference.parse("menu.options?tab=audio&x=1:scope1")
-- r.route == "menu.options", r.scope == "scope1", r.params == {tab="audio", x="1"}
```

## Remarques

- Les valeurs inline restent des chaînes. Les paramètres explicites passés par programme l'emportent sur les inline en cas de collision (mergeParams, avec avertissement).
- Sans '?', le séparateur de portée est le premier ':' de la référence ; avec '?', c'est le premier ':' situé après le '?'.
- Une référence dont la route est vide, ou dont la portée est vide, est traitée comme une route non décorée (portée nil).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_routeReference.mergeParams(inlineParams, explicitParams)` | Superpose les paramètres explicites sur les paramètres inline (copie). Les explicites gagnent et un avertissement est journalisé si la valeur diffère. | 118 |
| `ui_router_routeReference.parse(reference)` | Sépare « route[?requête][:portée] » en ses parties. Une référence non-chaîne est renvoyée sans changement avec des params vides. | 70 |
| `ui_router_routeReference.parseQuery(query)` | Analyse un segment « a=1&b=2 » en table. Les valeurs restent des chaînes ; une clé répétée garde la dernière valeur (avertissement) ; une clé nue (« flag ») vaut une chaîne vide ; les clés vides sont ignorées. | 38 |
| `ui_router_routeReference.urlDecode(value)` | Décode un composant de requête : '+' devient une espace, puis les séquences %XX sont décodées. | 24 |

### Détail des paramètres

#### `ui_router_routeReference.mergeParams(inlineParams, explicitParams)`

Superpose les paramètres explicites sur les paramètres inline (copie). Les explicites gagnent et un avertissement est journalisé si la valeur diffère.

- `inlineParams` (*table|nil*) : Paramètres issus de la référence.
- `explicitParams` (*table|nil*) : Paramètres passés explicitement.
- **renvoie** : table Table fusionnée.

#### `ui_router_routeReference.parse(reference)`

Sépare « route[?requête][:portée] » en ses parties. Une référence non-chaîne est renvoyée sans changement avec des params vides.

- `reference` (*string|any*) : Référence de navigation brute.
- **renvoie** : table { route = string, scope = string|nil, params = table<string, string> }

#### `ui_router_routeReference.parseQuery(query)`

Analyse un segment « a=1&b=2 » en table. Les valeurs restent des chaînes ; une clé répétée garde la dernière valeur (avertissement) ; une clé nue (« flag ») vaut une chaîne vide ; les clés vides sont ignorées.

- `query` (*string|nil*) : Segment de requête sans le '?'.
- **renvoie** : table<string, string> Paramètres décodés.

#### `ui_router_routeReference.urlDecode(value)`

Décode un composant de requête : '+' devient une espace, puis les séquences %XX sont décodées.

- `value` (*string*) : Texte encodé ; une valeur non-chaîne est renvoyée telle quelle.
- **renvoie** : string Texte décodé.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routeReference.lua`.*
