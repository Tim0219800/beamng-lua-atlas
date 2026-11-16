# `flowgraph_nodes_mission_clearLightsDragRace`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/clearLightsDragRace.lua` · VM : Game Engine (GE) · 91 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/clearLightsDragRace")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Clear Lights Dragrace' (categorie repeat_instant). Cache les lumieres de prestage/stage et du compte a rebours (objets scene Prestagelight_l/r, Stagelight_l/r, Amberlight1-3_L/R, Greenlight_L/R, Redlight_L/R) ainsi que les 20 afficheurs de chiffres (display_time_i / display_speed_i), a la fin ou l'abandon d'une mission de drag race.

## Remarques

- Le pin d'entree 'flow' n'est pas teste : le noeud agit a chaque appel de work.
- Plante si les objets de la scene (lumieres, afficheurs) n'existent pas.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide la table lights et met flow a false. | 71 |
| `C:clearDigits()` | Cache les afficheurs display_time_i_l/r et display_speed_i_l/r (i de 1 a 5). | 55 |
| `C:init()` | Meme initialisation. | 76 |
| `C:initLights()` | Recherche les objets lumineux dans la scene et les cache tous (setHidden(true)). | 18 |
| `C:work()` | Appelle initLights et clearDigits a chaque frame de flux (pas de verification du flux d'entree) et met flow a true. | 81 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/clearLightsDragRace.lua`.*
