# `flowgraph_nodes_logic_rateLimit`

*Fichier : `lua/ge/extensions/flowgraph/nodes/logic/rateLimit.lua` · VM : Game Engine (GE) · 80 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/logic/rateLimit")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Flow Interval' (categorie logic, fichier rateLimit). Laisse passer une impulsion de flux a intervalle regulier tant que le flux d'entree est actif. 'input' est une frequence (Hz) ou, si asDuration est vrai, une duree (s) ; 'reverseHit' decide si l'impulsion tombe en fin ou debut de cycle. dt optionnel, sinon mgr.dtSim.

## Remarques

- legacyPins renomme fps et interval vers 'frequency', un pin qui n'existe pas dans le schema (le pin s'appelle 'input').
- fps = |input| : une valeur 0 donnerait une division par zero (1/fps) en mode frequence.
- work plante si input est nil (math.abs(nil)).

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Remet time et prevFps a leur valeur initiale. | 39 |
| `C:drawMiddle(builder, style)` | Barre de progression du cycle. | 44 |
| `C:init()` | time=0, prevFps=-1. | 34 |
| `C:work()` | Reinitialise le minuteur au reset ou quand input change ; avec du flux, decremente time de dt ; quand time <= 0, ajoute 1/fps (ou input en mode duree) et emet flow=true cette frame, sinon false. | 51 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/logic/rateLimit.lua`.*
