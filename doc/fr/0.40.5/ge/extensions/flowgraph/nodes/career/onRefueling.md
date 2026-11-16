# `flowgraph_nodes_career_onRefueling`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua` · VM : Game Engine (GE) · 74 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/onRefueling")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « On Refueling » (catégorie repeat_instant, couleur/icône ui). Détecte les évènements de ravitaillement en carrière. Sorties : openedMenu, tankFilled, paidPrice, closedMenu (impulsions d'une frame), currentlyFueling (flow tant que le plein est en cours, via career_modules_fuel.isCurrentlyFueling) et tankPercent (number, énergie actuelle / énergie max sommées sur tous les réservoirs).

## Remarques

- tankPercent n'est pas mis à jour si getFuelData() renvoie nil (garde sa dernière valeur) ; division par max sans protection si max vaut 0.
- Utilise career_modules_fuel : nécessite la carrière.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Crée la table de drapeaux. | 26 |
| `C:onPaidRefuelling(data)` | Hook : lève paidPrice. | 66 |
| `C:onRefuelingEndTransaction()` | Hook : lève closedMenu. | 70 |
| `C:onRefuelingStartTransaction(data)` | Hook : lève openedMenu. | 54 |
| `C:onRefuelingStopFueling(data)` | Hook : lève tankFilled. | 58 |
| `C:work(args)` | Chaque frame : remet à faux les pins flow, applique les drapeaux, met à jour currentlyFueling et tankPercent, efface les drapeaux. | 30 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/onRefueling.lua`.*
