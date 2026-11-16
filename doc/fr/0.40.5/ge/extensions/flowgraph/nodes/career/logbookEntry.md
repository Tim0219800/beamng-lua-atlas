# `flowgraph_nodes_career_logbookEntry`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/logbookEntry.lua` · VM : Game Engine (GE) · 32 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/logbookEntry")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Logbook Entry » (catégorie once_instant, couleur/icône career). Ajoute une entrée au journal de bord de la carrière (career_modules_logbook.genericInfoUnlocked) avec un titre et un texte. Entrées : title, text (string). Ne fait rien hors carrière. Recopie le flux d'entrée sur la sortie.

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:workOnce()` | Si carrière active et module logbook présent, ajoute l'entrée ; copie flow vers la sortie. | 24 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/logbookEntry.lua`.*
