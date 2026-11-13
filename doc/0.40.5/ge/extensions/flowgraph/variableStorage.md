# `flowgraph_variableStorage`

*Fichier : `lua/ge/extensions/flowgraph/variableStorage.lua` · VM : Game Engine (GE) · 407 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/variableStorage")` (fichier sous extensions/ mais pas une extension classique)

Stockage des variables d'un projet flowgraph (variables globales du projet lues/écrites par les nœuds getVariable/setVariable). Le module renvoie un constructeur : `require('flowgraph_variableStorage')(mgr)`. Chaque variable a un nom, un type (string, number, bool, vec3, quat, color), une valeur de base, une valeur courante, une stratégie de fusion (voir `flowgraph_utils`) et des options (typage fixe, non supprimable, surveillée, conservée après arrêt). Les écritures de la frame passent par `change` puis sont fusionnées par `finalizeChanges`.

## Exemple

```lua
local vs = mgr.variables
vs:addVariable('score', 0, 'number', 'sum')
vs:change('score', 10)
vs:finalizeChanges()
local v, ok = vs:get('score')
```

## Remarques

- Trois façons d'écrire : `changeBase` (valeur de départ + courante, avec test de type), `changeInstant` (valeur courante seulement, sans fusion) et `change` (passe par la stratégie de fusion, effective après `finalizeChanges`).
- À l'arrêt (`_executionStopped`), chaque variable revient à sa `baseValue`, sauf celles marquées `keepAfterStop` dont la valeur courante devient la nouvelle base.
- Les stratégies par défaut si celle demandée est invalide : `last`, `max` pour un number, `or_` pour un bool.
- `updateType` remet la valeur à un défaut du type (false, 0, '', {0,0,0}…) et ne fonctionne pas si `fixedType`.
- Bug probable : `renameVariable` ne met pas à jour le champ `name` de la variable renommée et appelle `table.insert(customVariableOrder, nil, newName)` si l'ancien nom n'était pas dans l'ordre personnalisé.
- Bug probable : `_onDeserialized` fait `self.customVariableOrder = self.customVariableOrder or data.customVariableOrder` ; comme `customVariableOrder` existe toujours (table), l'ordre sauvegardé est ignoré (l'ordre est reconstruit par `addVariable`).
- `changeCustomVariableOrder` plante si le nom n'est pas dans `customVariableOrder` (`oldIdx` nil).

## Classe `C`

Instance de stockage de variables. Champs : mgr, id, variables (nom -> {name, baseValue, value, index, type, fixedType, undeletable, mergeStrat, mergeFuns, monitored, keepAfterStop}), variableChanges, sortedVariableNames, customVariableOrder, types.

Le module renvoie un constructeur : `local obj = require("flowgraph_variableStorage")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelé à l'arrêt : vide les changements en attente et remet chaque variable à sa valeur de base (ou conserve sa valeur si `keepAfterStop`). | 340 |
| `C:_onClear()` | Appelé quand le projet est vidé ; équivaut à `_executionStopped`. | 336 |
| `C:_onDeserialized(data)` | Recharge les variables depuis les données de sauvegarde (accepte l'ancien format sans `list`), triées par index puis nom. | 372 |
| `C:_onSerialize()` | Sérialise les variables : {list = [{name, value=baseValue, index, type, mergeStrat, fixedType, undeletable, monitored, keep}], customVariableOrder}. | 351 |
| `C:addVariable(name, value, type, mergeStrat, fixedType, undeletable)` | Ajoute une variable. Renvoie false (et log une erreur) si elle existe déjà. | 119 |
| `C:change(name, value)` | Soumet une valeur à la stratégie de fusion de la variable ; effective après `finalizeChanges`. Refuse nil. | 314 |
| `C:changeBase(name, value)` | Change la valeur de base et la valeur courante, après test de compatibilité de type. | 291 |
| `C:changeCustomVariableOrder(name, newIdx)` | Déplace une variable dans `customVariableOrder` pour qu'elle soit placée avant/après l'index `newIdx` (relatif à l'ordre d'origine). | 101 |
| `C:changeInstant(name, value)` | Change immédiatement la valeur courante, sans fusion ni test de type. | 305 |
| `C:clear()` | Supprime toutes les variables et les changements en attente. | 82 |
| `C:finalizeChanges()` | Finalise les fusions de toutes les variables modifiées (`finalize`, puis `init`) et vide la liste des changements. Appelé par le manager en fin de frame (déduit du code). | 328 |
| `C:get(name)` | Lit la valeur courante d'une variable. Log une erreur si elle n'existe pas. | 57 |
| `C:getFull(name)` | Renvoie la table complète de la variable (valeur, type, stratégie…). | 70 |
| `C:getMaxSortIndex()` | Plus grand `index` de tri parmi les variables (0 si aucune). | 111 |
| `C:getMergeStrats(type)` | Renvoie les stratégies de fusion triées proposées pour un type (voir `sortedMergeFuns`). | 48 |
| `C:getName()` | Renvoie « (nom du manager / id du manager) » pour les logs. | 40 |
| `C:getTypes()` | Liste des types de variables supportés (string, number, bool, vec3, quat, color) avec couleur et icône. | 44 |
| `C:init(mgr)` | Constructeur : prend un id unique du manager, crée les tables et complète la liste des types avec couleur et icône de l'éditeur. | 25 |
| `C:refreshSortedVariableNames()` | Reconstruit `sortedVariableNames`, noms triés par `index`. | 88 |
| `C:removeVariable(name)` | Supprime une variable (sauf `undeletable`) et la retire de l'ordre personnalisé. | 236 |
| `C:renameVariable(name, newName)` | Renomme une variable et prévient les nœuds getVariable/setVariable de tous les graphes et macros. | 255 |
| `C:setFixedType(name, fixedType)` | Active/désactive le typage fixe. | 208 |
| `C:setKeepAfterStop(name, keep)` | Si true, la valeur courante devient la valeur de base à l'arrêt du projet (conservée). | 226 |
| `C:setMergeStrat(name, strat)` | Fixe la stratégie de fusion et l'initialise. Une stratégie invalide est remplacée par une valeur par défaut selon le type. | 140 |
| `C:setMonitor(name, monitor)` | Marque la variable comme surveillée (affichage dans l'éditeur). | 217 |
| `C:updateType(name, type)` | Change le type d'une variable (valeurs remises à un défaut du type), repasse en stratégie `last` et prévient les nœuds getVariable/setVariable. | 163 |
| `C:variableExists(name)` | Dit si une variable existe. | 52 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/variableStorage.lua`.*
