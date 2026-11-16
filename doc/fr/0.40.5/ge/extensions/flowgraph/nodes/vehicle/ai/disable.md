# `flowgraph_nodes_vehicle_ai_disable`

*Fichier : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/disable.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/vehicle/ai/disable")` (fichier sous extensions/ mais pas une extension classique)

Nœud « AI Disable » (couleur ai, repeat_p_duration). Désactive le mode IA d'un véhicule. Entrée : aiVehId (sans valeur = véhicule du joueur). Données : useScriptStop (false : utilise ai:scriptStop au lieu de ai.setState disabled), handBrakeWhenFinished, straightenWheelsWhenFinished.

## Classe `C`

Classe du nœud flowgraph ; chaque instance représente un nœud dans un graphe.

| Méthode | Description | Ligne |
|---|---|---|
| `C:init()` | Initialise les trois données du nœud à false. | 20 |
| `C:work()` | Envoie au véhicule ai:scriptStop(handBrake, straightenWheels) si useScriptStop, sinon ai.setState({mode = "disabled"}). | 26 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/vehicle/ai/disable.lua`.*
