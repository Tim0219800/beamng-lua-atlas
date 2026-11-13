# `ui_router_routes_mods`

*Fichier : `lua/ge/extensions/ui/router/routes/mods.lua` · VM : Game Engine (GE) · 43 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_mods` : `extensions.load("ui_router_routes_mods")`, puis la globale `ui_router_routes_mods`

Routes du gestionnaire de mods (interface Angular héritée) : local, downloaded, scheduled, repository, automation, automationDetails, details, tous avec un screenId « menu.mods.* ». Module abstrait inclus par menu.lua et pause.lua (pause y ajoute les hooks de pause).

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.
- Le commentaire du code explique que forcer uiTypes = angular évite que le routeur attende un accusé de montage Vue qui ne vient jamais (sinon la transition expire et efface les données de retour).

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | local, downloaded, scheduled, repository, automation, automationDetails, details. |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {screenId = "menu.mods", abstract = true, ui = Angular uniquement} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/mods.lua`.*
