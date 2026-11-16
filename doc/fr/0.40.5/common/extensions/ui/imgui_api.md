# `ui_imgui_api`

*Fichier : `lua/common/extensions/ui/imgui_api.lua` · VM : Commun (GE + véhicule) · 17 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_imgui_api` : `extensions.load("ui_imgui_api")`, puis la globale `ui_imgui_api`

Module interne qui assemble l'API ImGui : crée la table M avec le champ ctx (contexte ImGui global) puis y injecte les fonctions générées de imgui_luaintf.lua et les ajouts personnalisés de imgui_custom_luaintf.lua. Le fichier précise de ne pas l'utiliser directement (utiliser ui_imgui) et qu'il doit rester synchronisé avec imgui_api.h côté C++.

## Remarques

- Les deux require utilisent le chemin '/common/extensions/ui/...' et chaque module renvoie une fonction qui reçoit M.
- ctx vaut nil jusqu'à ce que ui_imgui l'affecte (onImGuiReady / onExtensionLoaded).

## Champs

| Champ | Type | Description |
|---|---|---|
| `ctx` | userdata|nil | Contexte ImGui global Lua ; nil à la création, renseigné par ui_imgui. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/extensions/ui/imgui_api.lua`.*
