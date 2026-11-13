# `flowgraph_nodes_mission_stageLightsDragRace`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/stageLightsDragRace.lua` · VM : Game Engine (GE) · 76 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/stageLightsDragRace")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Set Stage Lights' (categorie repeat_instant). Allume la lumiere Pre Stage ou Stage de l'arbre de Noel du drag race (objets scene Prestagelight_l/r et Stagelight_l/r) du cote 'side' ('l' ou 'r', defaut 'l'). 'light' vaut 'preStage' (defaut) ou 'stage'. L'impulsion 'reset' cache toutes ces lumieres.

## Remarques

- La sortie flow n'est jamais ecrite, et le pin d'entree flow n'est pas teste.
- Sans reset prealable, self.lights est vide et work plante a l'acces des lumieres.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide la table lights. | 43 |
| `C:init()` | Vide la table lights. | 47 |
| `C:initLights()` | Recherche les quatre objets lumineux dans la scene. | 32 |
| `C:postInit()` | Definit les valeurs proposees des pins side (left/right) et light (Pre Stage/Stage). | 21 |
| `C:work()` | Sur reset : retrouve les lumieres et les cache. Sinon rend visible la lumiere choisie. | 51 |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/stageLightsDragRace.lua`.*
