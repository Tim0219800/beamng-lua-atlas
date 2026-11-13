# `flowgraph_nodes_gameplay_sites_fileSites`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua` · VM : Game Engine (GE) · 75 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/sites/fileSites")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « File Sites » (catégorie once_p_duration, tags scenario). Charge un fichier .sites.json via gameplay_sites_sitesManager.loadSites et le finalise. Pin d'entrée : file ; pin de sortie : sitesData (table de type sitesData) à brancher sur les nœuds Sites (location, zone, parking spot…). L'éditeur propose d'ouvrir le Sites Editor et de coder en dur le fichier actuellement ouvert. En cas d'échec, erreur de nœud « Failed to find sites file ».

**Dépendances (chargées avant) :** `gameplay_sites_sitesManager`

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelé à l'arrêt de l'exécution du projet flowgraph ; libère l'état interne. | 55 |
| `C:drawCustomProperties()` | Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui). | 33 |
| `C:init(mgr, ...)` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 22 |
| `C:onNodeReset()` | Oublie les sites chargés pour forcer un nouveau chargement. | 51 |
| `C:postInit()` | Appelé après la création des pins du nœud ; sert à ajuster les pins (modèles de valeurs, filtres de fichiers, clés dynamiques). | 27 |
| `C:work(args)` | Au premier appel, résout le chemin (avec ou sans extension .sites.json), charge et finalise les sites, puis publie la table sur sitesData. Les appels suivants ne font rien tant que self.sites est défini. | 59 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/sites/fileSites.lua`.*
