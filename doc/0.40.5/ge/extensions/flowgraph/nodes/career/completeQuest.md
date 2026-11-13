# `flowgraph_nodes_career_completeQuest`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/completeQuest.lua` · VM : Game Engine (GE) · 27 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/completeQuest")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Complete Quest » (catégorie once_instant, couleur/icône career). Termine la quête associée au flowgraph via career_modules_questManager.completeQuest(mgr.quest.id), seulement si la carrière est active et que le graphe a une quête (self.mgr.quest). Pin d'entrée : completeOnStop (bool, défaut true, hardCoded).

## Remarques

- Le pin completeOnStop est déclaré (« complète seulement à l'arrêt du manager, avec un décalage d'une frame ») mais n'est pas lu dans ce fichier : la quête est complétée immédiatement.
- Le pin utilise la clé « hardCoded » (C majuscule) alors que les autres nœuds écrivent « hardcoded ».

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Appelle completeQuest pour la quête du graphe si carrière active. | 20 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/completeQuest.lua`.*
