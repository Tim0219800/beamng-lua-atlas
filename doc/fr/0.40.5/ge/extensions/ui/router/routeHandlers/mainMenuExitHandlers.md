# `ui_router_routeHandlers_mainMenuExitHandlers`

*Fichier : `lua/ge/extensions/ui/router/routeHandlers/mainMenuExitHandlers.lua` · VM : Game Engine (GE) · 20 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routeHandlers_mainMenuExitHandlers` : `extensions.load("ui_router_routeHandlers_mainMenuExitHandlers")`, puis la globale `ui_router_routeHandlers_mainMenuExitHandlers`

Gestionnaire de sortie du menu principal.

## Remarques

- Le gestionnaire appelle dump(...) à chaque exécution : trace de debug laissée dans le jeu (écrit le contexte de jeu dans le journal).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_routeHandlers_mainMenuExitHandlers.mainmenuExitHandler()` | Quitte le menu principal : navigue vers « garage » si le mode garage est actif (gameplay_garageMode.isActive), sinon vers « play » si l'état de jeu est « freeroam » ; ne fait rien dans les autres cas. | 6 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routeHandlers/mainMenuExitHandlers.lua`.*
