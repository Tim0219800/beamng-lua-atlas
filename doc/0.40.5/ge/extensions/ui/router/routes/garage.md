# `ui_router_routes_garage`

*Fichier : `lua/ge/extensions/ui/router/routes/garage.lua` · VM : Game Engine (GE) · 308 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_garage` : `extensions.load("ui_router_routes_garage")`, puis la globale `ui_router_routes_garage`

Routes du garage (Vue) : vue d'ensemble, véhicule (sélecteur, réglage et miroirs, peinture, pièces, sauvegarde de configuration), liste de véhicules, « mycars », mode photo et édition d'overlay. Hook racine : gameplay_garageMode.onGarageEnter. Titres de véhicule dynamiques via gameplay_garageMode.vehicleByIdOrActive.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.
- Les routes vehicles/mycars utilisent le même screenId « garage.vehicles » ; leurs hooks sont ui_vehicleSelector_general.onRootRoute* et ui_garage_routeLifecycleCallbacks.onPhotomode* pour le mode photo.

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | vehicle (abstrait ; selector, tuning > mirrors, paint, parts, save), vehicles (> vehicle), mycars (> vehicle), photomode (exitGuards confirmPhotomodeExit ; > overlay > edit > adjust). |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {screenId = "garage", title = "Garage", scopeTree garage-layout > garage-sidemenu, ui = Vue, infoBar visible sans info système, topBar et uiApps masquées, onEnter = gameplay_garageMode.onGarageEnter} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/garage.lua`.*
