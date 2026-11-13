# `flowgraph_nodes_mission_knockAwayCheck`

*Fichier : `lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua` · VM : Game Engine (GE) · 180 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/mission/knockAwayCheck")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph 'KnockAway Check' (categorie repeat_instant). Detecte si les vehicules d'un prefab (pin prefabId) ont ete renverses (angle d'inclinaison) ou deplaces (distance) par rapport a leur position d'origine. Compte les vehicules touches (count), le total, les points (par vehicule, champ dynamique knockAwayPoints ou defaultPoints, 1 par defaut) et emet 'done' quand tous sont touches. Peut afficher des marqueurs au-dessus des cibles et des pointeurs sur la minimap. Les vehicules dont le nom interne contient 'ignore' sont exclus.

## Remarques

- Le test d'inclinaison compare up:dot(val.up) (un cosinus) a (pi * angle / 180) (un angle en radians) : les deux grandeurs ne sont pas comparables, donc tippingMinAngle ne correspond pas reellement a un angle en degres.
- Les pins de sortie 'points' et 'maxPoints' ont des descriptions copiees des pins 'count' et 'total'.
- work appelle self:_executionStopped() lors d'un reset pour liberer les marqueurs.
- Le noeud ecrit 'no mapdata!' dans la console tant que le vehicule n'est pas suivi par mapmgr.

## Classe `C`

Classe du noeud flowgraph (creee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStarted()` | Vide. | 35 |
| `C:_executionStopped()` | Termine et libere les marqueurs (scenario/race_marker). | 44 |
| `C:getOriginalVehicleTransforms(data)` | Pour chaque BeamNGVehicle du prefab, enregistre position, rotation et vecteur haut, et ajoute le vehicule au module vehicle du gestionnaire. | 51 |
| `C:init()` | data.zOffset=0, positions vide. | 39 |
| `C:onDrawOnMinimap(td)` | Dessine sur la minimap un pointeur (bord) ou un cercle pour chaque vehicule non encore renverse. | 168 |
| `C:onPreRender(dt, dtSim)` | Appele chaque frame de rendu ; dessine les marqueurs. | 161 |
| `C:work()` | Sur reset, reinitialise. A la premiere frame de flux, initialise les compteurs, les points et les marqueurs ; ensuite teste chaque vehicule (inclinaison via dirVecUp, deplacement via pos) et met a jour les compteurs et les marqueurs ; ecrit count, total, points, done, flow. | 68 |

## Appels vers le moteur (C++)

- `Sim.` `upcast`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/mission/knockAwayCheck.lua`.*
