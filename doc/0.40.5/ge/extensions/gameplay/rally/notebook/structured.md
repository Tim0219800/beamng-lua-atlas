# `gameplay_rally_notebook_structured`

*Fichier : `lua/ge/extensions/gameplay/rally/notebook/structured.lua` · VM : Game Engine (GE) · 378 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/rally/notebook/structured")` (fichier sous extensions/ mais pas une extension classique)

Stockage « structuré » d'une pacenote de rallye en six emplacements fixes (clés de chaîne "1" à "6", qui sont aussi l'ordre de lecture) : 1 = prudence (caution), 2 et 3 = modificateurs avant le virage, 4 = virage (corner), 5 et 6 = modificateurs après. Un emplacement vide vaut {}. Chaque élément est une table typée { type = ..., ... } ; le style actif fournit les libellés. Le module migre aussi les anciens schémas v1 (liste) et v2 (4 emplacements) à la désérialisation. Le module renvoie un constructeur d'objet (classe C) et expose des helpers M.* qui acceptent un objet ou une table brute.

## Exemple

```lua
local Structured = require('extensions/gameplay/rally/notebook/structured')
local s = Structured()
s:setOrderedItems({ {type='caution', level=2}, {type='corner', descriptor='hairpin'} })
print(s:slotItem(4).descriptor) -- 'hairpin'
```

## Remarques

- Schéma courant : 3 (six emplacements). Éléments au-delà des six emplacements : ignorés avec un log 'W' (tag rallyStructured).
- Corner canonique : descriptor, shape, measurementType (omis si 'single' ; seuls single/split2/split3 sont valides), riskIntensity (-1, 1 ou nil), lengthMode ('shorter'|'longer'|'skip'|nil). Les anciens champs lengthFeel, radiusChange, intensityVariation sont migrés (intensityVariation -1 -> shape 'opens', 1 -> 'tightens').
- setOrderedItems répartit : caution -> slot 1, corner -> slot 4, modificateurs -> 2/3 avant le corner, 5/6 après.
- Les types d'élément autres que caution/corner sont des modificateurs atomiques copiés tels quels (deepcopy).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_notebook_structured.orderedItems(structured)` | Version utilitaire : renvoie la liste ordonnée des éléments non vides d'un objet structuré ou d'une table brute (gère aussi les anciens schémas v2). (assignée dynamiquement) | dyn |
| `gameplay_rally_notebook_structured.setOrderedItems(structured, items)` | Version utilitaire : remplace le contenu par une liste ordonnée d'éléments, répartis dans les emplacements. Appelle la méthode d'instance si elle existe, sinon écrit items et schemaVersion dans la table. (assignée dynamiquement) | dyn |
| `gameplay_rally_notebook_structured.slotItem(structured, index)` | Version utilitaire : renvoie l'élément d'un emplacement, ou nil s'il est vide. (assignée dynamiquement) | dyn |
| `gameplay_rally_notebook_structured.slotItems(structured)` | Version utilitaire : renvoie la table des six emplacements (clés "1".."6") normalisée, en migrant les schémas v1/v2 si besoin. (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `gameplay_rally_notebook_structured.orderedItems(structured)`

Version utilitaire : renvoie la liste ordonnée des éléments non vides d'un objet structuré ou d'une table brute (gère aussi les anciens schémas v2). (assignée dynamiquement)

- `structured` (*table*) : Objet structuré ou table brute (avec ou sans champ items).
- **renvoie** : table[] Éléments dans l'ordre des emplacements ; {} si l'argument n'est pas une table.

#### `gameplay_rally_notebook_structured.setOrderedItems(structured, items)`

Version utilitaire : remplace le contenu par une liste ordonnée d'éléments, répartis dans les emplacements. Appelle la méthode d'instance si elle existe, sinon écrit items et schemaVersion dans la table. (assignée dynamiquement)

- `structured` (*table*) : Objet structuré ou table brute (modifié en place).
- `items` (*table[]*) : Éléments typés.

#### `gameplay_rally_notebook_structured.slotItem(structured, index)`

Version utilitaire : renvoie l'élément d'un emplacement, ou nil s'il est vide. (assignée dynamiquement)

- `structured` (*table*) : Objet structuré ou table brute.
- `index` (*integer*) : Numéro d'emplacement de 1 à 6.
- **renvoie** : table|nil Élément { type = ... } ou nil.

#### `gameplay_rally_notebook_structured.slotItems(structured)`

Version utilitaire : renvoie la table des six emplacements (clés "1".."6") normalisée, en migrant les schémas v1/v2 si besoin. (assignée dynamiquement)

- `structured` (*table*) : Objet structuré ou table brute.
- **renvoie** : table<string, table> Carte d'emplacements ; emplacements vides = {}.

## Classe `C`

Objet renvoyé par Structured() : champs schemaVersion et items (carte des six emplacements).

| Méthode | Description | Ligne |
|---|---|---|
| `C:hasItems()` | true si au moins un emplacement est rempli. | 311 |
| `C:init()` | Constructeur : schéma courant, six emplacements vides. | 248 |
| `C:itemCount()` | Nombre d'éléments non vides. | 307 |
| `C:onDeserialized(data)` | Recharge depuis des données sauvegardées (data.items, data.schemaVersion) en migrant les schémas v1 (liste ordonnée) et v2 (quatre emplacements) vers le schéma v3. | 253 |
| `C:onSerialize()` | Renvoie { schemaVersion, items } où items est la carte normalisée des six emplacements. | 274 |
| `C:orderedItems()` | Liste des éléments non vides dans l'ordre des emplacements 1 à 6. | 281 |
| `C:setOrderedItems(items)` | Remplace le contenu à partir d'une liste ordonnée (caution -> 1, corner -> 4, modificateurs -> 2/3 avant ou 5/6 après le corner). Les surplus sont ignorés avec un avertissement. | 297 |
| `C:setSlotItems(items)` | Remplace le contenu à partir d'une carte d'emplacements (clés "1".."6" ou entiers). | 302 |
| `C:slotItem(index)` | Élément d'un emplacement, ou nil s'il est vide. | 289 |
| `C:slotItems()` | Copie normalisée de la carte des six emplacements. | 285 |

## Classe `M`

Table du module : helpers orderedItems, slotItems, slotItem, setOrderedItems (voir functions). Appeler le module comme une fonction crée une instance de C.

| Méthode | Description | Ligne |
|---|---|---|
| `M.orderedItems(structured)` |  | 315 |
| `M.setOrderedItems(structured, items)` |  | 359 |
| `M.slotItem(structured, index)` |  | 342 |
| `M.slotItems(structured)` |  | 327 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/notebook/structured.lua`.*
