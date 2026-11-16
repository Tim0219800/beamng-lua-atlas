# `flowgraph_nodes_vehicle_trailerRespawn`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/trailerRespawn.lua` · VM : Game Engine (GE) · 34 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/trailerRespawn")` (fichier sous extensions/ mais pas une extension classique)

Nœud « Trailer Respawn Control » (catégorie `once_instant`, dépend de `core_trailerRespawn`). Active ou désactive le respawn automatique des remorques avec leurs véhicules (`core_trailerRespawn.setEnabled(enabled)`). Pins : `enabled` (bool, défaut false, codé en dur), `flow` en entrée et sortie.

**Dépendances (chargées avant) :** `core_trailerRespawn`

## Classe `C`

Classe du nœud flowgraph (renvoyée par `_flowgraph_createNode(C)`). Champs de définition : name, description, category, pinSchema, tags.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Constructeur ; `self.enabled = true` (champ non utilisé ensuite). | 22 |
| `C:work()` | Si le flux d'entrée est actif, appelle `setEnabled` et propage le flux. | 26 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/trailerRespawn.lua`.*
