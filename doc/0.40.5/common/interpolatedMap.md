# `interpolatedMap`

*Fichier : `lua/common/interpolatedMap.lua` · VM : Commun (GE + véhicule) · 267 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("interpolatedMap")`

Table d'interpolation 1D (linéaire) ou 2D (bilinéaire) sur grille régulière ou irrégulière. new() crée l'objet, loadData(inputData, opts) charge les données (ce qui choisit la méthode get 1D ou 2D), puis get(x[, y]) renvoie la valeur interpolée. Sert pour des cartes moteur, courbes de couple, tables de coefficients. Garde en cache le dernier résultat et le dernier intervalle utilisé (recherche rapide si x varie peu).

## Exemple

```lua
local map = require('interpolatedMap').new()
-- 2D : coin vide puis axe X ; ensuite chaque ligne = valeur Y, valeurs Z
map:loadData({{nil, 0, 1000, 2000}, {0, 10, 20, 30}, {1, 15, 25, 40}})
local z = map:get(rpm, load)
-- 1D : paires {x, z}
map:loadData({{0, 0}, {1000, 100}, {2000, 150}})
local v = map:get(1500)
```

## Remarques

- Avant loadData, get et reset sont des fonctions vides (renvoient nil).
- Formats acceptés par loadData : (a) paires {x, z} (avec ou sans ligne d'en-tête dont la 1re cellule est une chaîne) ; (b) deux lignes {xValues}, {zValues} ; (c) tableau 2D dont la première ligne donne les valeurs X (avec ou sans coin vide) et dont chaque ligne suivante commence par la valeur Y suivie des valeurs Z. Un tableau de 2 lignes de nombres est toujours interprété comme {xValues, zValues}.
- opts : xScale, yScale, zScale (multiplicateurs appliqués aux axes et valeurs, défaut 1).
- Les axes X et Y doivent être croissants, avec au moins 2 points ; sinon division par zéro dans le calcul des intervalles.
- Hors de la plage de données, get renvoie nil sauf si le champ clampToDataRange est mis à true (la valeur est alors bornée à la plage).
- Champs publics utiles : is1D, is2D, xMin, xMax, yMin, yMax, clampToDataRange (défaut false), xIndices, yIndices, data.
- Cas 1D : self.lastInputY reste nil ; le cache du dernier résultat compare x et l'absence de y.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `interpolatedMap.new()` | Crée une table d'interpolation vide. | 245 |

### Détail des paramètres

#### `interpolatedMap.new()`

Crée une table d'interpolation vide.

- **renvoie** : table Objet interpolatedMap avec méthodes loadData, get, reset.

## Classe `interpolatedMap`

Objet renvoyé par new().

| Méthode | Description | Ligne |
|---|---|---|
| `interpolatedMap:get(x, y)` | Valeur interpolée : get(x) en 1D, get(x, y) en 2D. Remplacée par loadData selon la dimension. | dyn |
| `interpolatedMap:loadData(inputData, opts)` | Charge les données (voir formats dans notes), calcule les bornes et choisit la méthode get 1D ou 2D. | dyn |
| `interpolatedMap:reset()` | Ne fait rien (fonction vide). | dyn |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/interpolatedMap.lua`.*
