# `jbeam_scaling`

*Fichier : `lua/common/jbeam/scaling.lua` · VM : Commun (GE + véhicule) · 52 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/scaling")`

Étape de post-traitement jbeam qui applique les clés « scaleXxx » : pour toute clé numérique nommée scale suivie d'un nom (ex. scaleNodeWeight), multiplie la valeur de la clé voisine Xxx (ex. NodeWeight) par ce facteur, puis supprime la clé scale. Parcourt récursivement toutes les sections de type dictionnaire, sauf celles ignorées par jbeam/utils (ignoreSections).

## Remarques

- Le test de la clé est strict : elle doit commencer par 'scale' (minuscules) et avoir au moins un caractère après ; 'scale' seul n'est pas traité.
- Si la clé cible n'existe pas ou n'est pas un nombre, la clé scale est quand même supprimée sans effet.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_scaling.process(vehicle)` | Applique les clés scaleXxx sur tout le véhicule (en place). *(interne)* | 12 |

### Détail des paramètres

#### `jbeam_scaling.process(vehicle)`

Applique les clés scaleXxx sur tout le véhicule (en place).

- `vehicle` (*table*) : Données jbeam du véhicule.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/scaling.lua`.*
