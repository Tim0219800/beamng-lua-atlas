# `ui_router_routeHandlers_radialExitHandlers`

*Fichier : `lua/ge/extensions/ui/router/routeHandlers/radialExitHandlers.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routeHandlers_radialExitHandlers` : `extensions.load("ui_router_routeHandlers_radialExitHandlers")`, puis la globale `ui_router_routeHandlers_radialExitHandlers`

Gestionnaire de retour du menu radial (accès rapide).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_routeHandlers_radialExitHandlers.radialBackHandler()` | Retour dans le menu radial : appelle core_quickAccess.back() ; si cela ne renvoie rien de vrai, ferme le menu avec core_quickAccess.setEnabled(false, "", false). Échoue avec reason="quick_access_unavailable" si core_quickAccess est indisponible. | 7 |

### Détail des paramètres

#### `ui_router_routeHandlers_radialExitHandlers.radialBackHandler()`

Retour dans le menu radial : appelle core_quickAccess.back() ; si cela ne renvoie rien de vrai, ferme le menu avec core_quickAccess.setEnabled(false, "", false). Échoue avec reason="quick_access_unavailable" si core_quickAccess est indisponible.

- **renvoie** : table {result=true, success=true, data=nil} ou {result=false, success=false, reason="quick_access_unavailable"}.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routeHandlers/radialExitHandlers.lua`.*
