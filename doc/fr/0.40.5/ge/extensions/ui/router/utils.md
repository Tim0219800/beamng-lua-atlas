# `ui_router_utils`

*Fichier : `lua/ge/extensions/ui/router/utils.lua` · VM : Game Engine (GE) · 166 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_utils` : `extensions.load("ui_router_utils")`, puis la globale `ui_router_utils`

Petits utilitaires du routeur UI : détection et résolution de noms de routes relatifs (styles Angular « ^. » et Vue « ./ », « ../ »), fusion profonde de tables et résolution d'une référence de fonction « module.func » en fonction Lua appelable. Utilisé par le routeur et ses services.

## Remarques

- Le code signale lui-même (TODO) que les fonctions de résolution relative devraient être nettoyées ou supprimées ; routeManager.resolveRouteName est la version plus récente.
- resolveFunctionReference charge l'extension à la volée : `extensions[moduleName]` déclenche le chargement automatique.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_utils.deepMerge(target, source)` | Fusionne récursivement `source` dans `target` (modifié sur place) : les tables communes sont fusionnées, les autres valeurs écrasées par celles de source. Si source n'est pas une table, renvoie source (ou target si source est nil). | 101 |
| `ui_router_utils.isRelativeRoute(route)` | Indique si le nom de route est relatif : commence par '^' (Angular) ou par '.' (Vue). | 5 |
| `ui_router_utils.resolveFunctionReference(reference, contextLabel)` | Résout une chaîne « module.func » (séparation au dernier point) en fonction de l'extension correspondante. | 123 |
| `ui_router_utils.resolveRelativeRoute(route, currentState)` | Convertit une route relative en nom absolu pointé par rapport à l'état courant. « ^^.x » ou « ../../x » remontent de n niveaux ; « ./x » reste au même niveau (ajoute un enfant) ; les '/' deviennent des '.'. Une route absolue est renvoyée telle quelle. | 23 |

### Détail des paramètres

#### `ui_router_utils.deepMerge(target, source)`

Fusionne récursivement `source` dans `target` (modifié sur place) : les tables communes sont fusionnées, les autres valeurs écrasées par celles de source. Si source n'est pas une table, renvoie source (ou target si source est nil).

- `target` (*table*) : Table modifiée.
- `source` (*table*) : Table à fusionner.
- **renvoie** : table La table target fusionnée.

#### `ui_router_utils.isRelativeRoute(route)`

Indique si le nom de route est relatif : commence par '^' (Angular) ou par '.' (Vue).

- `route` (*string|any*) : Nom de route.
- **renvoie** : boolean true si relatif ; false pour un non-string.

#### `ui_router_utils.resolveFunctionReference(reference, contextLabel)`

Résout une chaîne « module.func » (séparation au dernier point) en fonction de l'extension correspondante.

- `reference` (*string|nil*) : Référence « module.func » ; nil donne trois nil.
- `contextLabel` (*string|nil*) : Libellé utilisé dans les messages d'erreur (défaut « Function reference »).
- **renvoie** : function|nil La fonction trouvée.
- **renvoie** : string|nil Message d'erreur.
- **renvoie** : boolean|nil true en cas d'erreur.

#### `ui_router_utils.resolveRelativeRoute(route, currentState)`

Convertit une route relative en nom absolu pointé par rapport à l'état courant. « ^^.x » ou « ../../x » remontent de n niveaux ; « ./x » reste au même niveau (ajoute un enfant) ; les '/' deviennent des '.'. Une route absolue est renvoyée telle quelle.

- `route` (*string*) : Route relative ou absolue.
- `currentState` (*string*) : Nom pointé de la route courante.
- **renvoie** : string Nom pointé résolu.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/utils.lua`.*
