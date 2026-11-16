# `gameplay_rally_starThresholds`

*Fichier : `lua/ge/extensions/gameplay/rally/starThresholds.lua` · VM : Game Engine (GE) · 51 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_rally_starThresholds` : `extensions.load("gameplay_rally_starThresholds")`, puis la globale `gameplay_rally_starThresholds`

Calcule les seuils de temps des étoiles (or, argent, bronze) d'une spéciale de rallye à partir d'un temps de référence créé à la main (baseline) et de la longueur de l'étape. Or = baseline x 1,03 (rythme serré, aucune marge pour les resets). Argent et bronze = baseline x multiplicateur d'allure + une marge additive qui pardonne un certain nombre de resets par km.

## Exemple

```lua
local t = gameplay_rally_starThresholds.compute(600, 12.5)
-- t.gold, t.silver, t.bronze en secondes (arrondis au dixième)
```

## Remarques

- Formules : gold = base*goldMult ; silver = base*silverPaceMult + silverResetsPerKm*lengthKm*perResetSeconds ; bronze = base*bronzePaceMult + bronzeResetsPerKm*lengthKm*perResetSeconds.
- Si la longueur est absente ou nulle, la marge de resets vaut 0 (seuils d'allure uniquement).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_rally_starThresholds.compute(baselineSeconds, lengthKm)` | Calcule les seuils or/argent/bronze en secondes, arrondis au dixième. | 39 |

### Détail des paramètres

#### `gameplay_rally_starThresholds.compute(baselineSeconds, lengthKm)`

Calcule les seuils or/argent/bronze en secondes, arrondis au dixième.

- `baselineSeconds` (*number|string*) : Temps de référence de l'étape en secondes (converti par tonumber, 0 si invalide)
- `lengthKm` (*number|string*) : Longueur de l'étape en km (0 si invalide)
- **renvoie** : table {gold=number, silver=number, bronze=number} en secondes

## Champs

| Champ | Type | Description |
|---|---|---|
| `bronzePaceMult` | number | Multiplicateur d'allure du bronze (1.23). |
| `bronzeResetsPerKm` | number | Resets par km pardonnés pour le bronze (2.233, soit ~5 resets sur les plus courtes spéciales). |
| `goldMult` | number | Multiplicateur d'allure de l'or (1.03), volontairement serré. |
| `perResetSeconds` | number | Secondes ajoutées par reset dans la marge : pénalité de chrono (~5 s) plus perte d'élan (~3,5 s), soit 8.5. |
| `silverPaceMult` | number | Multiplicateur d'allure de l'argent (1.13). |
| `silverResetsPerKm` | number | Resets par km pardonnés pour l'argent (0.9, soit ~2 resets sur les plus courtes spéciales d'environ 2,2 km). |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/rally/starThresholds.lua`.*
