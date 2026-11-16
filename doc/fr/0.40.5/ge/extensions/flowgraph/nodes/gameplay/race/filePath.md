# `flowgraph_nodes_gameplay_race_filePath`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua` · VM : Game Engine (GE) · 110 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/race/filePath")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « File Path » (catégorie once_p_duration, tag scenario). Charge un chemin de course (fichier .race.json) en objet gameplay/race/path, le désérialise, l'inverse si demandé, appelle autoConfig() et le publie. Entrées : file (string, chemin avec ou sans .race.json, résolu par mgr:getRelativeAbsolutePath), reverse (bool). Sorties : pathData (table 'pathData' pour les autres nœuds de course), name, desc, branching, closed, laps (tours par défaut), checkpointCount (nombre de pathnodes triés) et recoveryCount (pathnodes ayant un point de recovery, selon le sens). Le chargement se fait une seule fois (tant que self.path est nil).

## Remarques

- Si le fichier est introuvable, une erreur de nœud est posée sur la pin 'file'.
- Dans l'éditeur, le panneau de propriétés propose d'ouvrir le Race Editor et de coder en dur le fichier ouvert dans la pin file.
- La description de checkpointCount précise que le décompte ne marche pas pour les chemins branchants.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Oublie le chemin chargé à l'arrêt du graphe. | 64 |
| `C:drawCustomProperties()` | Panneau de propriétés de l'éditeur : bouton d'ouverture du Race Editor, nom du fichier ouvert et bouton « Hardcode to File Pin ». | 42 |
| `C:init(mgr, ...)` | Initialise self.path à nil et désactive clearOutPinsOnStart. | 31 |
| `C:onNodeReset()` | Oublie le chemin chargé (self.path = nil) pour forcer un rechargement. | 60 |
| `C:postInit()` | Restreint le sélecteur de fichier de la pin 'file' aux fichiers « Race Files » (.race.json). | 36 |
| `C:work(args)` | Charge le fichier de course s'il ne l'est pas encore, applique reverse/autoConfig et remplit toutes les pins de sortie. | 68 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/race/filePath.lua`.*
