# `flowgraph_nodes_gameplay_getWalkingBlacklist`

*Fichier : `lua/ge/extensions/flowgraph/nodes/gameplay/getWalkingBlacklist.lua` · VM : Game Engine (GE) · 37 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/gameplay/getWalkingBlacklist")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Is Walking Blacklisted » (catégorie repeat_instant, dépend de gameplay_walk). Indique si un véhicule (pin vehId) est autorisé ou interdit à l'entrée depuis le mode marche. Sorties : allowed, denied (flux) et value (bool caché).

## Remarques

- Bug : work écrit self.pinOut.bool.value, mais aucun pin « bool » n'existe (le pin s'appelle value) : l'accès plante dès que vehId est renseigné.

**Dépendances (chargées avant) :** `gameplay_walk`

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:work(args)` | Appelle gameplay_walk.isVehicleBlacklisted(vehId) pour remplir allowed/denied ; met les sorties à nil si vehId est absent. | 23 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/gameplay/getWalkingBlacklist.lua`.*
