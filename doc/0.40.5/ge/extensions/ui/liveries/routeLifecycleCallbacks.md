# `ui_liveries_routeLifecycleCallbacks`

*Fichier : `lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua` · VM : Game Engine (GE) · 273 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_liveries_routeLifecycleCallbacks` : `extensions.load("ui_liveries_routeLifecycleCallbacks")`, puis la globale `ui_liveries_routeLifecycleCallbacks`

**Dépendances (chargées avant) :** `ui_liveries_saves`, `ui_liveries`, `ui_liveries_fill`, `ui_liveries_decal`, `ui_liveries_textures`, `ui_liveries_camera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_liveries_routeLifecycleCallbacks.onDecalCameraEnter(context, toRoute, fromRoute, data)` | *(hook)* | 137 |
| `ui_liveries_routeLifecycleCallbacks.onDecalMaterialEnter(context, toRoute, fromRoute, data)` | *(hook)* | 144 |
| `ui_liveries_routeLifecycleCallbacks.onDecalMirrorEnter(context, toRoute, fromRoute, data)` | *(hook)* | 155 |
| `ui_liveries_routeLifecycleCallbacks.onDecalSelectorMount(context, toRoute, fromRoute, data)` | *(hook)* | 170 |
| `ui_liveries_routeLifecycleCallbacks.onDecalTransformLeave(context, toRoute, fromRoute, data)` | *(hook)* | 196 |
| `ui_liveries_routeLifecycleCallbacks.onDecalTransformMount(context, toRoute, fromRoute, data)` | *(hook)* | 174 |
| `ui_liveries_routeLifecycleCallbacks.onDecalTransformSettingsEnter(context, toRoute, fromRoute, data)` | *(hook)* | 203 |
| `ui_liveries_routeLifecycleCallbacks.onDecalTransformSettingsLeave(context, toRoute, fromRoute, data)` | *(hook)* | 212 |
| `ui_liveries_routeLifecycleCallbacks.onDecalsEnter(context, toRoute, fromRoute, data)` | *(hook)* | 124 |
| `ui_liveries_routeLifecycleCallbacks.onDecalsLeave(context, toRoute, fromRoute, data)` | *(hook)* | 187 |
| `ui_liveries_routeLifecycleCallbacks.onDecalsMount(context, toRoute, fromRoute, data)` | *(hook)* | 133 |
| `ui_liveries_routeLifecycleCallbacks.onExistingDecalTransformEnter(context, toRoute, fromRoute, data)` | *(hook)* | 220 |
| `ui_liveries_routeLifecycleCallbacks.onExistingDecalTransformLeave(context, toRoute, fromRoute, data)` | *(hook)* | 245 |
| `ui_liveries_routeLifecycleCallbacks.onExistingDecalTransformMount(context, toRoute, fromRoute, data)` | *(hook)* | 233 |
| `ui_liveries_routeLifecycleCallbacks.onLiveriesEditEnter(context, toRoute, fromRoute, data)` | *(hook)* | 81 |
| `ui_liveries_routeLifecycleCallbacks.onLiveriesEnter(context, toRoute, fromRoute, data)` | *(hook)* | 70 |
| `ui_liveries_routeLifecycleCallbacks.onLiveriesLeave(context, toRoute, fromRoute, data)` | *(hook)* | 110 |
| `ui_liveries_routeLifecycleCallbacks.onLiveriesMount(context, toRoute, fromRoute, data)` | *(hook)* | 78 |
| `ui_liveries_routeLifecycleCallbacks.onLiveriesPaintEnter(context, toRoute, fromRoute, data)` | *(hook)* | 100 |
| `ui_liveries_routeLifecycleCallbacks.onLiveriesRootLeave(context, toRoute, fromRoute, data)` | the home screen has no other leave hook, so the root pop happens here *(hook)* | 106 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/liveries/routeLifecycleCallbacks.lua`.*
