# `ui_router_services_navigationContext`

*Fichier : `lua/ge/extensions/ui/router/services/navigationContext.lua` · VM : Game Engine (GE) · 87 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_services_navigationContext` : `extensions.load("ui_router_services_navigationContext")`, puis la globale `ui_router_services_navigationContext`

Construit le contexte de navigation du routeur UI : un instantané de l'état du jeu (carrière, garage, mission, scénario, multijoueur, multiseat, premier trajet, tutoriel freeroam, grande carte autorisée ou non) et le mode courant. Chaque lecture est protégée par pcall, donc un module de jeu absent donne simplement false/nil. Sert aux décisions de routes (écrans, décorateurs de contexte).

## Remarques

- Priorité du champ `mode` : multiplayer, mission, scenario, garage, career, freeroamTutorial, multiseatGamemode, sinon freeroam.
- isMultiseatActive est vrai si le multiseat, le freeroam multiseat ou plusieurs joueurs sont actifs.
- L'action testée pour la grande carte est « toggleBigMap » (core_input_actionFilter).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_services_navigationContext.buildNavigationContext(toRoute, fromRoute, kind, extras)` | Complète getContext() avec le type de navigation, des extras et des résumés {name, params, meta} des routes d'arrivée et de départ. | 77 |
| `ui_router_services_navigationContext.getContext()` | Renvoie la table de contexte : isCareerActive, isGarageActive, isMissionActive, isScenarioActive, isMultiplayerActive, foregroundMissionId, isBigMapBlocked, isBigMapAllowed, isFreeroamTutorialActive, isFirstDriveActive, isFirstDriveGuided, isMultiseatGamemodeActive, isMultiseatActive, mode. | 31 |

### Détail des paramètres

#### `ui_router_services_navigationContext.buildNavigationContext(toRoute, fromRoute, kind, extras)`

Complète getContext() avec le type de navigation, des extras et des résumés {name, params, meta} des routes d'arrivée et de départ.

- `toRoute` (*table|nil*) : Route de destination.
- `fromRoute` (*table|nil*) : Route d'origine.
- `kind` (*string*) : Nature de la navigation (déduit du code : transmis tel quel dans context.kind).
- `extras` (*table|nil*) : Données supplémentaires (défaut {}).
- **renvoie** : table Contexte avec kind, extras, toRoute, fromRoute.

#### `ui_router_services_navigationContext.getContext()`

Renvoie la table de contexte : isCareerActive, isGarageActive, isMissionActive, isScenarioActive, isMultiplayerActive, foregroundMissionId, isBigMapBlocked, isBigMapAllowed, isFreeroamTutorialActive, isFirstDriveActive, isFirstDriveGuided, isMultiseatGamemodeActive, isMultiseatActive, mode.

- **renvoie** : table Contexte courant.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/services/navigationContext.lua`.*
