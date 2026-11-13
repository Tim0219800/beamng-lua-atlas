# `ui_router_routes`

*Fichier : `lua/ge/extensions/ui/router/routes.lua` · VM : Game Engine (GE) · 43 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routes` : `extensions.load("ui_router_routes")`, puis la globale `ui_router_routes`

Registre racine des routes du routeur UI : l'unique point d'entrée explicite pour enregistrer les familles de routes de premier niveau. Chaque entrée `{ include = "nom" }` monte le module de routes/nom.lua (Root + Children). Il n'y a pas de découverte automatique par le système de fichiers : un module n'est enregistré que s'il est listé ici (ou ajouté à l'exécution via routeManager.addVueRoutes / registerModRoutes). Lu par routeManager.

## Remarques

- Global.include désigne le module des routes globales à un seul segment (play, /mainmenu…), ici « global ».
- La liste contient « livery » alors qu'aucun fichier routes/livery.lua n'est présent dans 0.40.5 ; seul « liveries » existe. Cette entrée est ignorée avec un avertissement.

## Champs

| Champ | Type | Description |
|---|---|---|
| `Children` | table[] | Liste d'entrées `{ include = "module" }` : bigmap, campaign, career, debug, default, firstDrive, freeroamLevels, freeroamWizard, garage, legal, livery, liveries, menu, mission, mods, multiseat, multiplayer, options, pause, radial, scenario, taxi, trackBuilder. |
| `Global` | table | `{ include = "global" }` : module des routes globales plates (play, /mainmenu, etc.). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routes.lua`.*
