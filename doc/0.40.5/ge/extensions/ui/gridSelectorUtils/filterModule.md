# `ui_gridSelectorUtils_filterModule`

*Fichier : `lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua` · VM : Game Engine (GE) · 777 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_gridSelectorUtils_filterModule` : `extensions.load("ui_gridSelectorUtils_filterModule")`, puis la globale `ui_gridSelectorUtils_filterModule`

Utilitaire des sélecteurs en grille : gère l'état des filtres (filtres à ensemble de valeurs « set » et filtres de plage « range »), le texte de recherche, le verrouillage de filtres et le calcul de la liste des filtres actifs affichée en pastilles. Les backends (véhicules, gameplay, etc.) créent une instance via `create` en lui fournissant la fonction qui construit les filtres à partir de leur liste d'éléments.

## Remarques

- Un filtre est décrit dans filterList par { propName, propKey, type = 'set'|'range', options, min, max }. filterByProp[propName] vaut { [option] = bool } pour un set et { min, max } pour une range.
- toggleFilter : si toutes les options sont activées, ne garde que l'option cliquée ; sinon inverse l'option ; si tout devient false, tout est réactivé. Les options verrouillées ne sont pas modifiées.
- Bug : unlockFilter teste `if not lockedFiltersByProp[propName] then lockedFiltersByProp[propName] = nil` (condition inversée) : elle ne déverrouille jamais rien. Seule clearLockedFilters libère les verrous.
- Bug probable : updateFilters teste `type(lockedOptions) == 'table'` alors que lockedFiltersByProp[propName] est toujours une table ; la branche « range » n'est jamais atteinte.
- Les caches sont invalidés par un drapeau interne (filtersDirty) ; passesFilters et getValidFilters recalculent validFilters si nécessaire. passesFilters renvoie toujours true sans customPassesFiltersFunction.
- L'option d'un filtre peut être une table : sa valeur est option.value, sinon option.id, sinon option.name.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_gridSelectorUtils_filterModule.create(createFiltersFunction, commonFilters, rangeFilters, dictFilters, backendName, customPassesFiltersFunction)` | Crée une instance de gestion de filtres. | 4 |

### Détail des paramètres

#### `ui_gridSelectorUtils_filterModule.create(createFiltersFunction, commonFilters, rangeFilters, dictFilters, backendName, customPassesFiltersFunction)`

Crée une instance de gestion de filtres.

- `createFiltersFunction` (*function|nil*) : (configList) -> filterList, filterByProp, commonFilters ; appelée par initializeFilters.
- `commonFilters` (*table[]|nil*) : Liste de paires { propName, option } considérées comme filtres « communs ».
- `rangeFilters` (*table|nil*) : Accepté mais non utilisé dans le code.
- `dictFilters` (*table|nil*) : Accepté mais non utilisé dans le code.
- `backendName` (*string|nil*) : Nom du backend, défaut "gridSelector" (non utilisé ensuite).
- `customPassesFiltersFunction` (*function|nil*) : (itemData, validFilters, searchText) -> boolean ; utilisée par passesFilters.
- **renvoie** : table Instance (voir classes.instance).

## Classe `instance`

Objet renvoyé par create().

| Méthode | Description | Ligne |
|---|---|---|
| `instance:calculateActiveFilters()` | Calcule les filtres différents des valeurs par défaut. | dyn |
| `instance:clearAllFilters()` | Réinitialise tous les filtres range et set puis vide le texte de recherche. | dyn |
| `instance:clearLockedFilters()` | Supprime tous les verrous. | dyn |
| `instance:getActiveFilters()` | Renvoie la liste des filtres actifs (displayText, propName, propValue, isActive, iconType, type). | dyn |
| `instance:getFilters()` | Renvoie l'état complet pour l'UI. | dyn |
| `instance:getSearchText()` | Renvoie le texte de recherche. | dyn |
| `instance:getValidFilters()` | Renvoie la liste des filtres restrictifs (recalculée si nécessaire). | dyn |
| `instance:initializeFilters(configList)` | Appelle createFiltersFunction(configList) et remplace filterList, filterByProp et éventuellement commonFilters. | dyn |
| `instance:isFilterLocked(propName, option)` | Indique si une option (ou n'importe quelle option si option est nil) d'une propriété est verrouillée. | dyn |
| `instance:lockFilter(propName, options)` | Verrouille l'état courant d'un filtre (range : min/max ; set : options données ou toutes). | dyn |
| `instance:lockFilterMode(propName, options)` | Verrouille un filtre dans un mode : range -> fixe min/max donnés ; set -> toutes les options à false puis celles de `options` (table option -> bool) à la valeur donnée, toutes verrouillées. | dyn |
| `instance:lockFilterModeExclusive(propName, allowedOptions)` | Filtres set uniquement : toutes les options à false et verrouillées, sauf celles de allowedOptions mises à true et non verrouillées. | dyn |
| `instance:passesFilters(itemData)` | Teste un élément avec customPassesFiltersFunction(itemData, validFilters, searchText) ; true si aucune fonction fournie. | dyn |
| `instance:resetRangeFilter(propName)` | Remet un filtre de plage à ses bornes par défaut. | dyn |
| `instance:resetSetFilter(propName)` | Réactive toutes les options d'un filtre set. | dyn |
| `instance:setSearchText(val)` | Définit le texte de recherche (nil devient "") et invalide le cache. | dyn |
| `instance:setupValidFilters()` | Reconstruit la liste interne des filtres effectivement restrictifs (utilisée par passesFilters). | dyn |
| `instance:toggleFilter(propName, option)` | Bascule une option d'un filtre set (voir notes). Ignorée si l'option est verrouillée. | dyn |
| `instance:unlockFilter(propName, options)` | Destinée à déverrouiller un filtre ; sans effet à cause d'un bug (voir notes). | dyn |
| `instance:updateFilters(newFilters)` | Remplace filterByProp par newFilters en conservant les valeurs verrouillées. | dyn |
| `instance:updateRangeFilter(propName, min, max)` | Fixe min et max d'un filtre de plage (ignoré si verrouillé). | dyn |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/gridSelectorUtils/filterModule.lua`.*
