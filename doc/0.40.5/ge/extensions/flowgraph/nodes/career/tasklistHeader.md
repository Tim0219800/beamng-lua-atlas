# `flowgraph_nodes_career_tasklistHeader`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/tasklistHeader.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/tasklistHeader")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Tasklist Header » (catégorie once_instant, tags goal/goals, couleur/icône ui). Définit l'en-tête et le sous-texte de la liste de tâches (app Tasklist) du tutoriel de carrière, via le guihook SetTasklistHeader. Entrées : label et sub (any, texte ou objet de traduction). Recopie le flux d'entrée sur la sortie.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Envoie guihooks.trigger('SetTasklistHeader', {label, subtext}) puis copie flow vers la sortie. | 23 |

**Évènements UI (guihooks.trigger) :** `SetTasklistHeader`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/tasklistHeader.lua`.*
