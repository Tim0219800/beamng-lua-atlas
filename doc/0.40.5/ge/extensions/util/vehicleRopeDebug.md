# `util_vehicleRopeDebug`

*Fichier : `lua/ge/extensions/util/vehicleRopeDebug.lua` · VM : Game Engine (GE) · 1200 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_vehicleRopeDebug` : `extensions.load("util_vehicleRopeDebug")`, puis la globale `util_vehicleRopeDebug`

Outil de débogage ImGui « Rope Visual Sandbox » pour les cordes visuelles (rope visuals) du véhicule joueur. Il liste les cordes de `be:getPlayerVehicle(0).ropeIds` (via `getRopeVisual`), dessine leurs nœuds et directions avec `debugDrawer`, permet de survoler et de faire glisser les nœuds à la souris, d'éditer les positions des ancrages A et B, et affiche des statistiques de performance (temps de simulation et de rendu par corde, pics). Se charge à la main depuis la console.

## Exemple

```lua
extensions.load('util_vehicleRopeDebug')
```

## Remarques

- Aucune fonction n'est appelée par le jeu à part le hook onUpdate : tout le travail (statistiques, interaction souris, dessin, fenêtre ImGui) se fait dans M.onUpdate chaque image.
- La fenêtre est ouverte par défaut (windowOpen = true) ; la corde est sélectionnée automatiquement : la première du véhicule joueur.
- Le glissement d'un nœud se fait dans le plan horizontal à la hauteur Z du nœud saisi (rope:setDraggedNode, -1 pour relâcher).
- Les statistiques de performance supposent une image de 16,67 ms (60 FPS) et gardent 60 images d'historique ; un pic = plus de 2 fois la moyenne.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_vehicleRopeDebug.onUpdate(dt)` | Mise à jour par image : met à jour les statistiques de performance, gère le survol et le glissement des nœuds de corde à la souris (si debugNodes est actif), dessine les nœuds des cordes du véhicule joueur, puis construit la fenêtre ImGui « Rope Visual Sandbox ». *(interne)* *(hook)* | 572 |

### Détail des paramètres

#### `util_vehicleRopeDebug.onUpdate(dt)`

Mise à jour par image : met à jour les statistiques de performance, gère le survol et le glissement des nœuds de corde à la souris (si debugNodes est actif), dessine les nœuds des cordes du véhicule joueur, puis construit la fenêtre ImGui « Rope Visual Sandbox ».

- `dt` (*number*) : pas de temps de l'image, en secondes (hook onUpdate)

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`
- `debugDrawer:` `drawArrow`, `drawLineInstance`, `drawSphere`, `drawText`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/vehicleRopeDebug.lua`.*
