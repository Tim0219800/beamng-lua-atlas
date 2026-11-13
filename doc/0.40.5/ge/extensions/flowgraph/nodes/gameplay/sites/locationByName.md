# `flowgraph_nodes_gameplay_sites_locationByName`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationByName.lua` · VM : Game Engine (GE) · 72 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/sites/locationByName")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Location by Name ». Cherche une location par nom dans sitesData.locations.byName. Entrées : flow, sitesData, locationName ; sorties : flow (vrai si trouvée), exists (caché), location (locationData). L'éditeur permet de coder en dur le nom de la location sélectionnée dans le Sites Editor.

## Remarques

- Si le nom n'existe pas, self._location vaut nil et `self._location.missing` provoque une erreur Lua (pas de test de nil).

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Appelé au démarrage de l'exécution du projet flowgraph ; réinitialise l'état interne du nœud. | 45 |
| `C:drawCustomProperties()` | Dessine les propriétés personnalisées du nœud dans le panneau de l'éditeur flowgraph (ImGui). | 27 |
| `C:drawMiddle(builder, style)` | Dessine le contenu central du nœud dans l'éditeur flowgraph (ImGui). | 66 |
| `C:init(mgr, ...)` | Initialise l'état interne du nœud à sa création (appelé par le moteur flowgraph). | 23 |
| `C:work(args)` | Quand le flux est actif et que le nom change, retrouve la location et active la sortie flow si elle existe (non missing). | 49 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/sites/locationByName.lua`.*
