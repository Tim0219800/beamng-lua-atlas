# `ui_router_routes_multiplayer`

*Fichier : `lua/ge/extensions/ui/router/routes/multiplayer.lua` · VM : Game Engine (GE) · 54 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_multiplayer` : `extensions.load("ui_router_routes_multiplayer")`, puis la globale `ui_router_routes_multiplayer`

Routes multijoueur : host-options, settings et playerList (écrans de pause avec hooks ui_pause_routeLifecycleCallbacks) et spectator (Vue, hooks multiplayer_gamemodes_utils_spectator.onSpectatorViewEnter/Leave). Inclus par menu.lua et pause.lua.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | host-options (screenId multiplayer.host-options), settings (screenId pause.multiplayer.settings), playerList (pause.multiplayer.playerList), spectator (uiApps visibles, barres masquées). |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {} (racine vide) |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/multiplayer.lua`.*
