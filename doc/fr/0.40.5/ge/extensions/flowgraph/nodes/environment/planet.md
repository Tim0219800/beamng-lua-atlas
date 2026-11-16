# `flowgraph_nodes_environment_planet`

*Fichier : `lua/ge/extensions/flowgraph/nodes/environment/planet.lua` · VM : Game Engine (GE) · 485 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/nodes/environment/planet")` (fichier sous extensions/ mais pas une extension classique)

Nœud flowgraph « Planet » (catégorie once_p_duration, couleur/icône vehicle). Donne à un véhicule une gravité planétaire (obj:setPlanets avec position, rayon et masse) et génère en plus une vraie planète solide : six faces de maillage procédural (ProceduralMesh) déformées en sphère à partir d'une carte de hauteur PNG en croix de cube (défaut « cubemap_small.png »), placées à la position donnée, avec un matériau « procheightmapMat » créé à la volée. Entrées : vehId (sinon joueur), position (vec3), heightmap (chemin PNG), surfaceHeight (échelle du relief, 1 par défaut), radius (≥ 1), mass. À l'arrêt ou au reset, retire les planètes du véhicule et supprime les objets créés. Le jeu note qu'il manque de documentation sur les paramètres.

## Remarques

- C.todo du jeu : « Needs further documentation on what each parameter does and how it should be used. »
- workOnce ne fait rien si position, radius ou mass est nil ou si |radius| < 1 ; ne teste pas que le véhicule existe (veh nil plante).
- La fonction locale `test` (fin du fichier) référence M qui n'existe pas dans ce fichier et n'est jamais appelée.
- warpSphere (non utilisée par workOnce) est une ancienne version ; workOnce utilise warpSphereCubic.
- Ancien pin renommé : vehID -> vehId. Constante C.gConst = 6.6742e-11.
- En éditeur, data.showDebug (true) dessine la sphère, la masse, la force et la distance dans drawMiddle.

## Classe `C`

Classe du nœud, avec les fonctions de génération de planète.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_executionStopped()` | Appelle onNodeReset. | 37 |
| `C:createheightmapMesh(heightmap, uvScale, material)` | Construit les données de maillage (sommets, UV, normales lissées, faces, matériau) à partir d'une grille de points avec bordure. | 163 |
| `C:drawMiddle(builder, style)` | Éditeur : dessin de debug et gravité de surface (G*masse/rayon²). | 123 |
| `C:getSquare(grid, size, identifier, dimensions)` | Extrait de la carte en croix la face de cube demandée (f, r, b, l, u, d), avec une bordure d'un point recopiée depuis les faces voisines (table blLookup), et met les coordonnées x/y à l'échelle des dimensions. | 378 |
| `C:heightmapFromPNG(path, scale, invertColors)` | Charge un PNG (GBitmap) et renvoie une grille vec3(x, y, z) où z = luminosité moyenne 0-1 (signe inversé par défaut). | 323 |
| `C:init()` | Active showDebug. | 32 |
| `C:normalFromPoints(p1, p3, p2)` | Normale (z positif) du triangle p1, p3, p2. | 289 |
| `C:onNodeReset()` | Supprime les planètes du véhicule (obj:setPlanets({})) et supprime les objets ProceduralMesh créés. | 41 |
| `C:placeObject(name, mesh, pos, rot)` | Crée un ProceduralMesh non sauvegardé dans MissionGroup avec le maillage, position et rotation donnés. | 301 |
| `C:warpSphere(sphereRadius, heightmap, surfaceHeight)` | Déforme une grille plane en calotte sphérique (méthode angulaire, non utilisée par workOnce). | 247 |
| `C:warpSphereCubic(sphereRadius, heightmap, cLength, surfaceHeight)` | Projette une face de cube sur une sphère de rayon donné, avec relief = z * surfaceHeight. | 264 |
| `C:workOnce()` | Applique la gravité planétaire au véhicule, crée le matériau, charge la carte de hauteur, génère les six faces de la planète et recharge les collisions (be:reloadCollision). | 57 |

## Appels vers le moteur (C++)

- `be:` `reloadCollision`
- `debugDrawer:` `drawLine`, `drawSphere`, `drawText`
- `obj:` `delete`, `getId`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/nodes/environment/planet.lua`.*
