# `flowgraph_nodes_career_vehicleGroupByClass`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/vehicleGroupByClass.lua` · VM : Game Engine (GE) · 46 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/vehicleGroupByClass")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Vehicle Group by Performance Class » (catégorie once_instant, auteur BeamNG, tags career/race/class/vehicle). Génère un groupe de véhicules pour une classe de performance. Entrée : class (string nom de classe, ou number indice à partir de 1, borné dans la liste de gameplay_vehiclePerformance.getClassNames()). Sorties : vehGroup (table vehicleGroupData) et aggressionCoef (multiplicateur d'agressivité de l'IA). Si la mission active définit generateVehicleGroup, elle est utilisée (filtres de sélection de véhicules de l'éditeur) ; sinon career_modules_vehicleClassGrouping.generateGroup. Dépend de career_modules_vehicleClassGrouping et gameplay_vehiclePerformance.

**Dépendances (chargées avant) :** `career_modules_vehicleClassGrouping`, `gameplay_vehiclePerformance`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Convertit la classe numérique en nom, génère le groupe de véhicules (mission ou module de groupement) et sort aussi le coefficient d'agressivité. | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/vehicleGroupByClass.lua`.*
