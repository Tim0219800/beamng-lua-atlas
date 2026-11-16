# `flowgraph_nodes_career_onGarageEvent`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/onGarageEvent.lua` · VM : Game Engine (GE) · 48 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/onGarageEvent")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « On Garage Event » (catégorie repeat_instant, couleur/icône ui). Impulsions d'une frame sur les évènements de garage de la carrière : beforeGarageInventoryOpened (menu de sélection avant garage ouvert), beforeGarageVehicleSelected (véhicule choisi), endMode (mode garage terminé).

## Remarques

- work() remet à faux seulement les deux premières sorties ; endMode n'est jamais remis à faux explicitement (il reste à la dernière valeur écrite, true après un évènement), probable oubli.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Crée la table de drapeaux. | 22 |
| `C:onBeforeGarageVehicleSelected(data)` | Hook : lève beforeGarageVehicleSelected. | 39 |
| `C:onBeforeGarageVehicleSelectionMenuOpened(data)` | Hook : lève beforeGarageInventoryOpened. | 35 |
| `C:onEndGarageMode(data)` | Hook : lève endMode. | 43 |
| `C:work(args)` | Chaque frame : remet à faux deux sorties, applique puis efface les drapeaux. | 26 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/onGarageEvent.lua`.*
