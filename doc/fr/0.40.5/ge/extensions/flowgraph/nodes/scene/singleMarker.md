# `flowgraph_nodes_scene_singleMarker`

*Fichier : `lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua` · VM : Game Engine (GE) · 153 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/scene/singleMarker")` (fichier sous extensions/ mais pas une extension classique)

Noeud flowgraph « Single Marker » (auteur BeamNG). Affiche un marqueur de course (scenario/race_marker) à une position avec un rayon. Doit être réinitialisé manuellement (pin reset) ; la transparence selon la caméra n'est mise à jour qu'avec un flux continu. Types de marqueur : overhead, ringMarker, sideColumnMarker, sideMarker, cylinderMarker, attention, sideHologramMarker, singleHologramMarker. Entrées : flow, reset, position, radius, markerType, color, fadeNearDist, fadeFarDist ; sortie : flow.

## Remarques

- Bug : _afterTrigger teste self.shown qui n'est jamais mis à true : le marqueur n'est pas caché quand le flow retombe, seul reset le supprime.
- Ancien nom de pin : clear -> reset (legacyPins).

## Classe `C`

Classe du noeud flowgraph (retournee par _flowgraph_createNode(C)). Les methodes sont appelees par le gestionnaire flowgraph ou l'editeur.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_afterTrigger()` | Après déclenchement : si flow est faux et le marqueur affiché, tente de le cacher. | 61 |
| `C:_executionStarted()` | Réinitialise le cache de position/rayon. | 73 |
| `C:_executionStopped()` | Cache le marqueur à l'arrêt. | 67 |
| `C:blend()` | Vide (non utilisé). | 100 |
| `C:destroy()` | Appelé à la destruction du noeud : nettoie les objets créés. | 148 |
| `C:fillFields()` | Lit position (+ data.zOffset sur z), rayon (2 par défaut, 1er composant si table) et couleur ; renvoie true si position ou rayon ont changé. | 76 |
| `C:hideMarker()` | Efface le marqueur (clearMarkers) et l'oublie. | 54 |
| `C:init(mgr, ...)` | Initialise l'état ; data.zOffset = 0. | 36 |
| `C:onClientEndMission()` | Hook de fin de mission : nettoie les objets créés par le noeud. | 144 |
| `C:onDrawOnMinimap(td)` | Dessine un cercle avec pointeur de bord sur la minimap tant que le marqueur existe. | 138 |
| `C:postInit()` | Propose les types de marqueur comme modèles du pin markerType. | 45 |
| `C:work()` | Sur reset, cache le marqueur ; sur flow, crée le marqueur si besoin, le met à jour (setToCheckpoint, couleur, update) et active flow en sortie. | 106 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/scene/singleMarker.lua`.*
