# `ui_router_runtimeRouteRegistry`

*Fichier : `lua/ge/extensions/ui/router/runtimeRouteRegistry.lua` · VM : Game Engine (GE) · 434 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_router_runtimeRouteRegistry` : `extensions.load("ui_router_runtimeRouteRegistry")`, puis la globale `ui_router_runtimeRouteRegistry`

Registre pur des routes d'exécution et analyseur de routes Vue brutes, sans effet de bord côté jeu. Il transforme un tableau de routes Vue en surcharges de configuration du routeur et mémorise quelle source possède chaque nom de route. routeManager en consomme les « gagnants » pour les superposer à l'arbre Lua statique. Chaque instance (M.new()) garde des instantanés par sourceId, un ordre stable d'enregistrement et la dérivation par nom (la source la plus récente gagne, sans composition).

## Remarques

- L'analyse est transactionnelle : un tableau invalide est rejeté en entier et ne remplace jamais l'instantané précédent de la source.
- Champs meta reportés dans le bloc `ui` : uiTypes, uiTypesFilter, infoBar, topBar, uiApps, triggerPause, uiNav. Par défaut une route d'exécution a ui.uiTypes = {"vue"}, uiTypesFilter = only et runtime = true.
- meta.luaRoute peut surcharger seulement : screenId, title, abstract, scopeTree, backTarget, fallbackTarget, back, onEnter, onMount, onLeave, ui. Toute autre clé est ignorée avec un avertissement.
- onEnter/onMount/onLeave doivent être des chaînes « module.func ». backTarget et fallbackTarget ne peuvent pas coexister.
- `name` peut être une chaîne ou un tableau de chaînes (alias) ; un nœud sans nom sert seulement de regroupement mais ses `children` sont parcourus. Un nom en double dans une même source est une erreur.
- Un nouveau sourceId prend le dernier rang de priorité ; ré-enregistrer une source garde son rang.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_router_runtimeRouteRegistry.isValidHookRef(ref)` | Vérifie qu'une référence de hook est une chaîne « module.func » (séparation au dernier point, deux parties non vides). | 44 |
| `ui_router_runtimeRouteRegistry.new()` | Crée une instance de registre isolée (routeManager en détient une ; les tests en créent à volonté). Méthodes de l'instance : register(sourceId, rawRoutes) -> {success, isNew, names, added, removed, changed} ou {success=false, errors} ; unregister(sourceId) -> {success, existed, added, removed, changed} ; getEffectiveRoutes() ; getEffectiveNames() (triés) ; getRoute(name) ; getRouteSource(name) ; hasRoute(name) ; hasSource(sourceId) ; getSourceOrder() ; clear(). | 389 |
| `ui_router_runtimeRouteRegistry.parseRawRoutes(rawRoutes)` | Analyse un tableau de routes Vue brut en liste ordonnée de noms et table nom -> surcharge de configuration. Descend dans `children` des nœuds nommés ou non. Toute erreur rejette l'ensemble. | 155 |

### Détail des paramètres

#### `ui_router_runtimeRouteRegistry.isValidHookRef(ref)`

Vérifie qu'une référence de hook est une chaîne « module.func » (séparation au dernier point, deux parties non vides).

- `ref` (*string|any*) : Référence à tester.
- **renvoie** : boolean true si valide.

#### `ui_router_runtimeRouteRegistry.new()`

Crée une instance de registre isolée (routeManager en détient une ; les tests en créent à volonté). Méthodes de l'instance : register(sourceId, rawRoutes) -> {success, isNew, names, added, removed, changed} ou {success=false, errors} ; unregister(sourceId) -> {success, existed, added, removed, changed} ; getEffectiveRoutes() ; getEffectiveNames() (triés) ; getRoute(name) ; getRouteSource(name) ; hasRoute(name) ; hasSource(sourceId) ; getSourceOrder() ; clear().

- **renvoie** : table Instance de registre.

#### `ui_router_runtimeRouteRegistry.parseRawRoutes(rawRoutes)`

Analyse un tableau de routes Vue brut en liste ordonnée de noms et table nom -> surcharge de configuration. Descend dans `children` des nœuds nommés ou non. Toute erreur rejette l'ensemble.

- `rawRoutes` (*table*) : Tableau de routes Vue (name, meta, children).
- **renvoie** : table { ok = boolean, errors = string[], names = string[], definitions = table<string, table> }

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/router/runtimeRouteRegistry.lua`.*
