# `flowgraph_nodes_mission_getSetupData`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/getSetupData.lua` · VM : Game Engine (GE) · 43 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/getSetupData")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'Get Mission Setup Data' (categorie provider). Expose sur ses sorties les valeurs des modules de preparation de mission (self.mgr.activity.setupModules) : utilisation du vehicule d'origine du joueur, modele/config choisis, et reglages du trafic (actif, trafic precedent, quantite, quantite active, taux de reapparition).

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work()` | Si une activite avec setupModules existe, recopie data.vehicles.* et data.traffic.* vers les pins (booleens forces, valeurs par defaut '' ou 0). | 25 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/getSetupData.lua`.*
