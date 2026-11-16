# `ui_router_guards_vehicleConfiguration`

*Fichier : `lua/ge/extensions/ui/router/guards/vehicleConfiguration.lua` · VM : Game Engine (GE) · 19 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_guards_vehicleConfiguration` : `extensions.load("ui_router_guards_vehicleConfiguration")`, puis la globale `ui_router_guards_vehicleConfiguration`

Garde de sortie « confirmVehicleConfigurationCombinedExit » : délègue à ui_pause_vehicleConfigurationGuard.confirmExit(route, params, context) la confirmation de sortie de l'écran de configuration de véhicule ; autorise si ce module n'est pas chargé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `guards` | table<string, function> | Table des gardes exposées : {confirmVehicleConfigurationCombinedExit = function(route, params, context)}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/guards/vehicleConfiguration.lua`.*
