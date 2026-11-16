# `ui_router_managers_breadcrumbManager`

*Fichier : `lua/ge/extensions/ui/router/managers/breadcrumbManager.lua` · VM : Game Engine (GE) · 105 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_managers_breadcrumbManager` : `extensions.load("ui_router_managers_breadcrumbManager")`, puis la globale `ui_router_managers_breadcrumbManager`

Construit le fil d'Ariane (breadcrumbs) d'une route pour le routeur. Pour une route non globale, il ajoute éventuellement un décorateur de module en tête, puis une miette par nœud de la chaîne de routes (label, abstract, isMinorRoute, routeName, params). Les titres peuvent être statiques (chaîne ou table non dynamique) ou dynamiques (fonction source appelée avec les paramètres, avec valeur de repli).

## Remarques

- Un titre dynamique : {mode="dynamic", source=<référence de fonction>, paramKey?, fallback?}. Si paramKey est défini, seule params[paramKey] est passée à la source, sinon la table params entière. Une valeur nil ou vide donne fallback.
- Le décorateur : celui fourni, sinon (si visible) la configuration du module via ui_router_routeManager.getModuleDecorator, en mode dynamique (source appelée avec params, repli config.fallback) ou statique ({label}). Il est ajouté comme première miette avec decorator=true et routeName=nil.
- Une route avec global = true n'a aucune miette.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_managers_breadcrumbManager.buildBreadcrumbs(routename, route, params, decorator)` | Construit la liste des miettes pour une route : décorateur éventuel puis une miette par nœud renvoyé par ui_router_routeManager.getRouteNodes(routename). | 72 |
| `ui_router_managers_breadcrumbManager.isDecoratorVisible()` | Indique si le décorateur est visible (NavigationState.isDecoratorVisible). | 100 |
| `ui_router_managers_breadcrumbManager.setDecoratorVisible(visible)` | Affiche ou masque le décorateur dans le fil d'Ariane (délègue à NavigationState.setDecoratorVisible). | 96 |

### Détail des paramètres

#### `ui_router_managers_breadcrumbManager.buildBreadcrumbs(routename, route, params, decorator)`

Construit la liste des miettes pour une route : décorateur éventuel puis une miette par nœud renvoyé par ui_router_routeManager.getRouteNodes(routename).

- `routename` (*string*) : Nom de route de base.
- `route` (*table*) : Configuration de la route (route.global désactive le fil d'Ariane).
- `params` (*table|nil*) : Paramètres de route (utilisés pour les titres dynamiques).
- `decorator` (*any|nil*) : Décorateur déjà résolu (sinon calculé si le décorateur est visible).
- **renvoie** : table[] Miettes {label, abstract, isMinorRoute, routeName, params} ; le décorateur est {label, routeName=nil, decorator=true}.

#### `ui_router_managers_breadcrumbManager.isDecoratorVisible()`

Indique si le décorateur est visible (NavigationState.isDecoratorVisible).

- **renvoie** : boolean true si visible.

#### `ui_router_managers_breadcrumbManager.setDecoratorVisible(visible)`

Affiche ou masque le décorateur dans le fil d'Ariane (délègue à NavigationState.setDecoratorVisible).

- `visible` (*boolean*) : true pour afficher.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/managers/breadcrumbManager.lua`.*
