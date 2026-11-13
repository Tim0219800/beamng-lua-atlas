# `ui_router_routes_legal`

*Fichier : `lua/ge/extensions/ui/router/routes/legal.lua` · VM : Game Engine (GE) · 60 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes_legal` : `extensions.load("ui_router_routes_legal")`, puis la globale `ui_router_routes_legal`

Routes juridiques (Vue, abstrait) : assistant de consentement en ligne en trois étapes onlineFeatures -> telemetry -> confirmation, chaque étape ayant le garde de sortie `onlineConsentSet` et conservant la barre d'aide manette.

## Remarques

- Module de configuration de routes : il n'exporte aucune fonction. routeManager le lit (via l'extension ui_router_routes_<nom>) quand routes.lua l'inclut par `{ include = "<nom>" }`.
- Les clés de `Children` forment les segments du nom pointé : « <module>.<enfant> ». `children` (minuscule) dans un nœud désigne ses sous-routes ; `include` y monte un autre module.
- `ui` est hérité par les routes enfants (uiTypes, uiTypesFilter, infoBar, topBar, uiApps, uiNav, triggerPause) : un enfant ne le redéfinit que pour ce qui change.
- exitGuards = {"onlineConsentSet"} : garde de sortie empêchant de quitter l'assistant tant que le consentement n'est pas fixé (déduit du nom).

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table<string, table> | onlineFeatures (sans backTarget), telemetry (retour onlineFeatures), confirmation (retour telemetry) ; infoBar par défaut restaurée pour la manette. |
| `ModuleName` | string | Nom du module de routes (premier segment du nom pointé). |
| `Root` | table | {abstract = true, ui = Vue uniquement, infoBar et topBar masquées, uiApps par défaut} |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes/legal.lua`.*
