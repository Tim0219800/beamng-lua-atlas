# `flowgraph_nodes_vehicle_ai_scriptAI_pathFromFile`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua` · VM : Game Engine (GE) · 81 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile")` (fichier sous extensions/ mais pas une extension classique)

Nœud « AI Path from File » (catégorie provider, couleur ai). Fournit un chemin ScriptAI chargé depuis un fichier de piste /replays/scriptai/tracks/*.track.json choisi dans l'inspecteur (bouton « Refresh Files » pour relister). Sortie : path (type aiPath), c'est le champ « recording » du fichier. À brancher sur « AI Follow Path from Data ».

## Remarques

- Si aucun fichier n'est choisi ou si la lecture échoue, loadedFile reste nil et work lève une erreur (loadedFile.recording).
- jsonReadFile reçoit le premier retour de mgr:getRelativeAbsolutePath (le chemin résolu).

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Ne fait rien. | 30 |
| `C:_onDeserialized(nodeData)` | Restaure le nom de fichier et recalcule le nom court. | 72 |
| `C:_onSerialize(res)` | Sauvegarde le nom de fichier. | 68 |
| `C:drawCustomProperties()` | Dessine le bouton « Refresh Files » et la liste déroulante des fichiers de piste. | 33 |
| `C:drawMiddle(builder, style)` | Affiche le nom court du fichier et son état de chargement. | 62 |
| `C:init()` | Liste les fichiers de piste (FS:findFiles) et initialise nom et fichier chargé. | 23 |
| `C:work()` | Charge le fichier avec jsonReadFile s'il ne l'est pas encore et publie loadedFile.recording sur path. | 54 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/scriptAI/pathFromFile.lua`.*
