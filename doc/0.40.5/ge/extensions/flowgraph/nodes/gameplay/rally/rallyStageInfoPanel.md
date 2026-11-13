# `flowgraph_nodes_gameplay_rally_rallyStageInfoPanel`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua` · VM : Game Engine (GE) · 226 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Rally Info Panel » (catégorie repeat_instant, tag rally/ui/start/screen, icône ui). Construit le panneau consolidé de l'écran de départ rally et l'ajoute via mgr.modules.ui:addUIElement({type = 'rallyStageInfo', ...}) : statistiques (distance en km et répartition des surfaces, lues dans le fichier driveline de la mission), blurb de description de la mission, règles (récupération avec ou sans réparation, retournement, contrôle d'arrêt, ou règles de boucle : liaison, parc d'assistance, vitesse de liaison, faux départs, pénalités de contrôle horaire). Entrées : flow, isLoop (bool : règles de boucle si vrai, de spéciale seule sinon). Sortie : flow. Définit l'icône de page 'roadInfo'.

## Remarques

- La réparation sur recovery vient de activity.lastUserSettings.rallyRepairVehicleOnRecovery, sinon du réglage rallyRepairVehicleOnRecovery, sinon true.
- En mode boucle, affiche aussi distances SS/liaison/total (via le gestionnaire de boucle) et la liste des spéciales (stage1..4_rallyStage).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:buildLoopStages()` | Liste des spéciales de la boucle (nom, distance, surfaces) d'après les champs stage1..4_rallyStage de la mission. | 96 |
| `C:buildLoopStats()` | Distances de spéciales, de liaison et totale de la boucle rally (formatées en km). | 78 |
| `C:buildRules(repairEnabled)` | Construit la liste des règles (clés de traduction ou {txt, context}) selon isLoop et la réparation. | 132 |
| `C:buildStats()` | Stats formatées de la spéciale courante. | 74 |
| `C:formatStats(stats)` | Formate les stats : distance (« %.2f km ») et surfaces arrondies > 0 % triées par valeur décroissante. | 49 |
| `C:getServiceParkSpeedLimit()` | Limite de vitesse du parc d'assistance affichable (30 km/h par défaut). | 123 |
| `C:readStats()` | Lit les stats du driveline du rally manager, ou du fichier spline de la mission. | 27 |
| `C:readStatsForFolder(folder)` | Lit les stats du fichier driveline d'un dossier de mission. | 41 |
| `C:work()` | Chaque frame : recopie flow et ajoute l'élément UI rallyStageInfo. | 168 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/rally/rallyStageInfoPanel.lua`.*
