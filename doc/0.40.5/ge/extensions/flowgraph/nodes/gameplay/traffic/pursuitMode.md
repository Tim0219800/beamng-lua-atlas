# `flowgraph_nodes_gameplay_traffic_pursuitMode`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitMode.lua` · VM : Game Engine (GE) · 41 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/traffic/pursuitMode")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Set Pursuit Mode » (once_instant). Règle le mode de poursuite pour un véhicule du trafic : mode (0 off, 1 à 3 actif, -1 arrêté), targetId (défaut : véhicule joueur), policeId (défaut : toutes les polices). Ne fait rien si le trafic n'est pas 'on' ; insère la cible dans le trafic si absente.

## Classe `C`

Classe du nœud flowgraph (créée via `_flowgraph_createNode(C)`).

| Méthode | Description | Ligne |
|---|---|---|
| `C:drawMiddle(builder, style)` | Affiche « Traffic not active! » si le trafic n'est pas actif. | 34 |
| `C:workOnce()` | Si le trafic est 'on', insère la cible dans le trafic au besoin puis appelle gameplay_police.setPursuitMode(mode, vehId, policeId). | 23 |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/traffic/pursuitMode.lua`.*
