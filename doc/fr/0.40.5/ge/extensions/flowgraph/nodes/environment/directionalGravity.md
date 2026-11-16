# `flowgraph_nodes_environment_directionalGravity`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua` · VM : Game Engine (GE) · 115 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/directionalGravity")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Directional Gravity » (catégorie dynamic_p_duration, couleur/icône vehicle). Donne à un véhicule une gravité directionnelle en simulant une planète énorme et très lointaine : place une « planète » de rayon 1 000 000 m à 1 000 000 m du véhicule dans la direction donnée, avec la masse qui produit l'accélération voulue (masse = magnitude * rayon² / G), via obj:setPlanets côté véhicule. Entrées : vehId (number, sinon véhicule du joueur), direction (vec3, normalisé par le nœud, défaut {0,0,-1}), magnitude (m/s², défaut 1). À l'arrêt du graphe les planètes du véhicule sont supprimées (obj:setPlanets({})). En mode 'repeat', recalculée à chaque frame (utile car l'origine suit le véhicule).

## Remarques

- Bug (éditeur) : drawMiddle lit self.pinIn.mass et self.pinIn.radius qui n'existent pas sur ce nœud (copié de Planet) : provoque une erreur d'indexation d'un nil lors du dessin.
- data.showDebug (true par défaut) dessine une ligne et la force de gravité (texte) dans le monde depuis drawMiddle.
- Ancien pin renommé : vehID -> vehId.
- Constante C.gConst = 6.6742e-11 (m³ s⁻² kg⁻¹).

## Classe `C`

Classe du nœud.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Supprime les planètes du véhicule (obj:setPlanets({})). | 37 |
| `C:drawMiddle(builder, style)` | Éditeur : affichage de debug (ligne, force) et gravité de surface. | 82 |
| `C:init()` | Active showDebug et crée la table planet. | 31 |
| `C:setDirectionalGravity()` | Calcule origine, rayon et masse de la planète et envoie obj:setPlanets au véhicule. Ne fait rien si direction ou magnitude est nil. | 55 |
| `C:work()` | Si dynamicMode vaut 'repeat', réapplique la gravité à chaque frame. | 49 |
| `C:workOnce()` | Applique la gravité directionnelle une fois. | 45 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawLine`, `drawText`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/directionalGravity.lua`.*
