# `ui_router_routes_freeroamWizard`

*Fichier : `lua/ge/extensions/ui/router/routes/freeroamWizard.lua` · VM : Game Engine (GE) · 111 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_freeroamWizard` : `extensions.load("ui_router_routes_freeroamWizard")`, puis la globale `ui_router_routes_freeroamWizard`

Variante « Wizard » de l'assistant freeroam : même parcours que freeroamLevels (levels > level, vehicles > vehicle, options, multiplayer) mais sous la racine freeroamWizard (titre ui.menu.freeroamSelector.title). Les hooks appellent freeroam_freeroamConfigurator.onWizard*.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.
- Aucun module « freeroamWizard » n'est listé dans routes.lua : il n'est inclus que si un autre module l'inclut (les entrées freeroam d'origine sont dans menu.lua et pause.lua).

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | levels (> level), vehicles (> vehicle), options, multiplayer ; titres dynamiques via resolveSelectedLevelTitle / resolveSelectedVehicleTitle. |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {title = "ui.menu.freeroamSelector.title", ui = Vue uniquement, infoBar par défaut, topBar et uiApps masquées} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/freeroamWizard.lua`.*
