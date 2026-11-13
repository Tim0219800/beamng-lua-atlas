# `ui_router_routes_decals`

*Fichier : `lua/ge/extensions/ui/router/routes/decals.lua` · VM : Game Engine (GE) · 145 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_decals` : `extensions.load("ui_router_routes_decals")`, puis la globale `ui_router_routes_decals`

Sous-arbre de routes de l'éditeur de décalcomanies de livrées (inclus par liveries.edit.decals). Flux d'ajout : decals -> camera (choix de la vue) -> selector (grille de décalcomanies) -> transform -> settings ; branches séparées pour material, mirror et transform d'une décalcomanie déjà sélectionnée. Les hooks pointent vers ui_liveries_routeLifecycleCallbacks.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.
- Le screenId commence par « liveries.edit.decals » pour que la préparation et le nettoyage de ui_liveries_decal restent valides sur toute la branche (commentaire du code).

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | camera (> selector > transform > settings), material, mirror, transform (> settings), chacun avec backTarget vers le niveau précédent. |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {screenId = "liveries.edit.decals", title = "ui.liveries.edit.decals", backTarget = "liveries.edit", targetScope = "layers-manager", scopeTree (liveries-decals-hidden, layers-manager), onEnter onDecalsEnter, onMount onDecalsMount, onLeave onDecalsLeave} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/decals.lua`.*
