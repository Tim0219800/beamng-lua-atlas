# `ui_router_routeHandlers_careerExitHandlers`

*Fichier : `lua/ge/extensions/ui/router/routeHandlers/careerExitHandlers.lua` · VM : Game Engine (GE) · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_routeHandlers_careerExitHandlers` : `extensions.load("ui_router_routeHandlers_careerExitHandlers")`, puis la globale `ui_router_routeHandlers_careerExitHandlers`

Gestionnaires de retour/sortie des écrans de carrière, référencés par routeHandlers.lua : sortie de la sélection de profil, retour dans les pages de branche et sortie d'une négociation.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_routeHandlers_careerExitHandlers.careerBranchPageBackHandler()` | Retour d'une page de branche de carrière. Si la branche (params.pathId) a un parent, navigue vers career.branchPage avec {pathId = parentId, focusPathId = pathId, returnRoute?}. Sinon, si returnRoute == "career.computer", navigue vers career.computer, sinon vers career.domainSelection avec {focusPathId = pathId}. | 15 |
| `ui_router_routeHandlers_careerExitHandlers.careerProfilesExitHandler()` | Quitte l'écran des profils de carrière : navigue vers « pause » si la carrière est active (career_career.isActive), sinon vers « menu ». | 7 |
| `ui_router_routeHandlers_careerExitHandlers.negotiationExitHandler()` | Quitte une négociation : appelle career_modules_marketplace.finalizeNegotiationExit() puis retourne à l'entrée précédente (mêmes paramètres, restoreLastScope = true). | 41 |

### Détail des paramètres

#### `ui_router_routeHandlers_careerExitHandlers.careerBranchPageBackHandler()`

Retour d'une page de branche de carrière. Si la branche (params.pathId) a un parent, navigue vers career.branchPage avec {pathId = parentId, focusPathId = pathId, returnRoute?}. Sinon, si returnRoute == "career.computer", navigue vers career.computer, sinon vers career.domainSelection avec {focusPathId = pathId}.

- **renvoie** : table Résultat de ui_router.navigate.

#### `ui_router_routeHandlers_careerExitHandlers.negotiationExitHandler()`

Quitte une négociation : appelle career_modules_marketplace.finalizeNegotiationExit() puis retourne à l'entrée précédente (mêmes paramètres, restoreLastScope = true).

- **renvoie** : table Résultat de navigate, ou {success=false, reason="no_previous_entry"} sans entrée précédente.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/routeHandlers/careerExitHandlers.lua`.*
