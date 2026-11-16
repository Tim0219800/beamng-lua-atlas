# `util_screenshotCreator_modelSelection`

*Fichier : `lua/ge/extensions/util/screenshotCreator/modelSelection.lua` · VM : Game Engine (GE) · 220 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_modelSelection` : `extensions.load("util_screenshotCreator_modelSelection")`, puis la globale `util_screenshotCreator_modelSelection`

Onglet « Models selection » de l'outil de création de vignettes (ImGui) : liste tous les modèles de véhicules (core_vehicles.getModelList), regroupés par type, avec des cases à cocher pour choisir lesquels seront photographiés. Il propose des filtres par type (Cars, Trucks, Heavy Machinery, Trailers, Props, Other), des boutons Player Vehicle Model, Select All, Unselect All, Invert Selection, et deux colonnes « Unselected / Selected Models ». Le module job.lua l'interroge via getSelectedModels pour construire la liste de travail.

## Remarques

- La liste est construite au premier usage (ensurePopulated) puis conservée ; appeler repopulate() pour la reconstruire.
- Si le réglage shippedConfigsOnly est actif, seuls les modèles livrés avec le jeu (shippedConfigs.isModelShipped) sont visibles et sélectionnables.
- Les filtres de type sont combinés par OU ; les modèles qui ne correspondent pas restent affichés mais grisés.
- getSelectedModels renvoie le JBeam du véhicule du joueur si rien n'est coché : cela provoque une erreur Lua s'il n'y a aucun véhicule joueur (getPlayerVehicle(0) vaut nil).
- getSelectedCount, lui, compte uniquement les cases cochées (0 si rien) et ne tient pas compte de ce repli.

**Dépendances (chargées avant) :** `ui_imgui`, `ui_vehicleSelector_tileGrouping`, `core_vehicles`, `util_screenshotCreator_settings`, `util_screenshotCreator_shippedConfigs`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_modelSelection.drawTab()` | Dessine l'onglet ImGui « Models selection » (filtres, boutons, listes). À appeler à chaque frame dans la fenêtre de l'outil, entre BeginTabBar et EndTabBar ; ne dessine rien si l'onglet n'est pas actif. *(interne)* | 128 |
| `util_screenshotCreator_modelSelection.getSelectedCount()` | Compte les modèles cochés et visibles. | 204 |
| `util_screenshotCreator_modelSelection.getSelectedModels()` | Renvoie les clés des modèles cochés et visibles. Si aucun n'est coché, renvoie le modèle du véhicule joueur. | 188 |
| `util_screenshotCreator_modelSelection.repopulate()` | Reconstruit la liste des modèles depuis core_vehicles.getModelList() ; toutes les sélections sont perdues. | 215 |
| `util_screenshotCreator_modelSelection.selectPlayerVehicle()` | Coche uniquement le modèle du véhicule du joueur (comparaison avec JBeam) et décoche tous les autres. Journalise une erreur (tag selectCurVeh) s'il n'y a pas de véhicule joueur. | 116 |

### Détail des paramètres

#### `util_screenshotCreator_modelSelection.getSelectedCount()`

Compte les modèles cochés et visibles.

- **renvoie** : integer Nombre de modèles sélectionnés.

#### `util_screenshotCreator_modelSelection.getSelectedModels()`

Renvoie les clés des modèles cochés et visibles. Si aucun n'est coché, renvoie le modèle du véhicule joueur.

- **renvoie** : string[] Clés de modèles (dossier de véhicule, ex. « pickup »).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : ui_imgui, ui_vehicleSelector_tileGrouping, core_vehicles, util_screenshotCreator_settings, util_screenshotCreator_shippedConfigs. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/modelSelection.lua`.*
