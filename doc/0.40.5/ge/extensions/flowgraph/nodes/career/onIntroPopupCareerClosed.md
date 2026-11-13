# `flowgraph_nodes_career_onIntroPopupCareerClosed`

*Fichier : `lua/ge/extensions/flowgraph/nodes/career/onIntroPopupCareerClosed.lua` · VM : Game Engine (GE) · 53 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/career/onIntroPopupCareerClosed")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « On introPopupCareerClosed » (catégorie repeat_instant, couleur/icône ui). Détecte la fermeture de la fenêtre d'intro de la carrière. Sorties : closed (impulsion d'une frame) et id (any, id de la fenêtre fermée, nil sinon).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Efface les drapeaux après le déclenchement. | 44 |
| `C:init()` | Crée la table de drapeaux. | 22 |
| `C:onIntroPopupCareerClosed(id)` | Hook : lève closed et mémorise l'id de la fenêtre si fourni. | 36 |
| `C:work(args)` | Chaque frame : closed à faux et id à nil, puis applique et efface les drapeaux. | 27 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/career/onIntroPopupCareerClosed.lua`.*
