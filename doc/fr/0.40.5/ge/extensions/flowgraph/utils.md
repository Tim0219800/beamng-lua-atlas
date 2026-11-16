# `flowgraph_utils`

*Fichier : `lua/ge/extensions/flowgraph/utils.lua` · VM : Game Engine (GE) · 286 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `flowgraph_utils` : `extensions.load("flowgraph_utils")`, puis la globale `flowgraph_utils`

Utilitaires du flowgraph : détection de type d'une valeur, test de compatibilité avec un type de pin, valeur par défaut par type, étiquette ImGui, et fonctions de fusion (merge) utilisées par les variables du `variableStorage` quand plusieurs nœuds écrivent la même variable dans la même frame. Il est chargé comme extension `flowgraph_utils` mais aussi par `require` depuis pin et variableStorage.

## Remarques

- `getVariableType` ne reconnaît une table que par sa taille : 3 éléments = vec3, 4 = quat ; une couleur (4 composantes) est donc vue comme `quat`.
- `isVariableCompatible` accepte un vecteur de 3 pour 'vec3' ou 'table', et 4 éléments pour 'quat', 'color' ou 'table'. Un `nil` ou autre type est incompatible.
- Stratégies de fusion : `all` (first, last, readOnly), `number` (min, max, average, sum), `bool` (or_, and_), `vec3` (average, sum), `string` (concat, concatComma, concatSpace, concatNewline), `any` (toutes, préfixées num_, bool_, vec_, any_).
- Chaque stratégie a `init(variable)`, `merge(variable, newValue)` et `finalize(variable)`, appelées par `variableStorage`.
- Pour les stratégies `vec3`, `merge` garde la table de la première valeur et l'additionne en place : cela modifie la table passée par le premier appelant.
- `any_concat*` sont rangées sous la clé `any_` mais s'appliquent aux chaînes.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_utils.getDefaultValueForType(typeName)` | Valeur par défaut d'un type : 0 (number/any), '' (string), true (bool), {0,0,0} (vec3), {0,0,0,0} (quat), {1,1,1,1} (color), {} (table). Si `typeName` est une liste, utilise le premier élément. Autre type : nil. | 31 |
| `flowgraph_utils.getVariableType(value)` | Donne le type flowgraph d'une valeur Lua : bool, string, number, vec3 (table de 3), quat (table de 4), sinon nil. | 10 |
| `flowgraph_utils.isVariableCompatible(value, compType)` | Dit si une valeur peut être stockée dans un pin/variable du type `compType`. | 21 |
| `flowgraph_utils.showLabel(label, color)` | Dessine en ImGui une petite étiquette (fond rouge translucide par défaut) juste au-dessus de la ligne courante. | 53 |

### Détail des paramètres

#### `flowgraph_utils.getDefaultValueForType(typeName)`

Valeur par défaut d'un type : 0 (number/any), '' (string), true (bool), {0,0,0} (vec3), {0,0,0,0} (quat), {1,1,1,1} (color), {} (table). Si `typeName` est une liste, utilise le premier élément. Autre type : nil.

- `typeName` (*string|table*) : Type ou liste de types.
- **renvoie** : any Valeur par défaut ou nil.

#### `flowgraph_utils.getVariableType(value)`

Donne le type flowgraph d'une valeur Lua : bool, string, number, vec3 (table de 3), quat (table de 4), sinon nil.

- `value` (*any*) : Valeur à tester.
- **renvoie** : string|nil Nom du type ou nil.

#### `flowgraph_utils.isVariableCompatible(value, compType)`

Dit si une valeur peut être stockée dans un pin/variable du type `compType`.

- `value` (*any*) : Valeur.
- `compType` (*string*) : Type visé (bool, string, number, vec3, quat, color, table).
- **renvoie** : boolean true si compatible.

#### `flowgraph_utils.showLabel(label, color)`

Dessine en ImGui une petite étiquette (fond rouge translucide par défaut) juste au-dessus de la ligne courante.

- `label` (*string*) : Texte.
- `color` (*any*) : ImVec4 de fond (défaut rouge 0,4 alpha).

## Champs

| Champ | Type | Description |
|---|---|---|
| `mergeFuns` | table<string, table> | Fonctions de fusion par catégorie : all, number, bool, vec3, string, any. Chaque entrée : {num, description, init, merge, finalize}. |
| `sortedMergeFuns` | table<string, table[]> | Listes triées {name, desc, num} par catégorie (any, all, number, string, bool, vec3), pour l'affichage dans l'éditeur. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/utils.lua`.*
