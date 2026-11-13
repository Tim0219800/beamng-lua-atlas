# `flowgraph_nodes_ui_genericMissionDataText`

*Fichier : `lua/ge/extensions/flowgraph/nodes/ui/genericMissionDataText.lua` · VM : Game Engine (GE) · 83 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/ui/genericMissionDataText")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Generic Mission Text » (catégorie repeat_instant, durée) : affiche une info dans l'app « Generic Mission Data ». Entrées : « title » (clé de traduction), « txt », « icon » (info), « order », « category » (flowgraph), « style » (text, time ou timemillis), « clear ». Un seul message par catégorie. Les styles time/timemillis convertissent des secondes en MM:SS ou MM:SS.mmm.

## Remarques

- Si title et txt sont nil ou si 'clear' est vrai, l'info est effacée (toute la liste si category est nil).
- Le pin 'icon' est déclaré mais jamais envoyé à l'UI.

## Classe `C`

Classe du nœud flowgraph (retournée par _flowgraph_createNode(C)).

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Crée la table uiData réutilisée. | 29 |
| `C:postInit()` | Modèles : styles et titres (temps, récupérations). | 33 |
| `C:work()` | Envoie ou efface les données via ui_apps_genericMissionData.setData et signale genericMissionDataChanged au module ui. | 46 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/ui/genericMissionDataText.lua`.*
