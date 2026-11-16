# `ui_router_guards_multiseat`

*Fichier : `lua/ge/extensions/ui/router/guards/multiseat.lua` · VM : Game Engine (GE) · 31 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_guards_multiseat` : `extensions.load("ui_router_guards_multiseat")`, puis la globale `ui_router_guards_multiseat`

Garde de sortie « confirmMultiseatSettingsExit » : lorsqu'on quitte l'écran des réglages multi-sièges, délègue la confirmation à ui_multiseat_multiseatSettings.confirmExit(route, params, context). Les déplacements entre pause.multiseatSettings et pause.multiseatSettings.vehicleSelector restent dans le flux et sont autorisés ; si ui_multiseat_multiseatSettings n'est pas chargé, la sortie est autorisée.

## Champs

| Champ | Type | Description |
|---|---|---|
| `guards` | table<string, function> | Table des gardes exposées : {confirmMultiseatSettingsExit = function(route, params, context)}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/guards/multiseat.lua`.*
