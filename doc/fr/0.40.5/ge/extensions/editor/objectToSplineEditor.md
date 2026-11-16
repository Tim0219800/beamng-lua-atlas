# `editor_objectToSplineEditor`

*Fichier : `lua/ge/extensions/editor/objectToSplineEditor.lua` · VM : Game Engine (GE) · 498 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_objectToSplineEditor` : `extensions.load("editor_objectToSplineEditor")`, puis la globale `editor_objectToSplineEditor`

Outil « Object To Spline Editor » du World Editor : copie un objet (TSStatic ou BeamNGVehicle) le long d'une spline guide (DecalRoad ou MeshRoad). On choisit l'objet et la spline depuis la sélection, puis on règle l'écart (gap), les décalages de début et de fin, l'axe de l'objet, le nombre maximal de copies (500 par défaut), l'orientation selon la normale du terrain, un mode alternatif, le placement dans un SimGroup et des variations aléatoires (écart, position, rotation, gaussienne). La spline est dessinée en vert et les positions prévues en jaune avec debugDrawer.

## Remarques

- L'outil crée de vrais objets dans la scène (copies de l'objet source via Sim.getUniqueName) et peut recharger la collision (be:reloadCollision).
- Les identifiants objId et guideId sont remis à nil si l'objet n'existe plus dans le scenetree.
- Le guide DecalRoad utilise getMiddleEdgePosition, le MeshRoad getTopMiddleEdgePosition (surélevés de 1 cm pour le dessin).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_objectToSplineEditor.onEditorGui()` | Hook d'éditeur appelé à chaque frame : dessine la fenêtre « Object To Spline Editor » (sélection de l'objet et de la spline, paramètres, création) et la spline guide. *(interne)* *(hook)* | 254 |
| `editor_objectToSplineEditor.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : enregistre la fenêtre (420x500) et l'entrée de menu « Object To Spline Editor ». *(interne)* *(hook)* | 490 |

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `be:` `getSurfaceHeightBelow`, `reloadCollision`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawSquarePrism`
- `obj:` `getField`, `getId`, `getObjectBox`, `getPosition`, `getScale`, `getWorldBox`, `setTransform`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/objectToSplineEditor.lua`.*
