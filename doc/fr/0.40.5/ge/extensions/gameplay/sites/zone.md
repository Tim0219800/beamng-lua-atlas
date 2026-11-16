# `gameplay_sites_zone`

*Fichier : `lua/ge/extensions/gameplay/sites/zone.lua` · VM : Game Engine (GE) · 501 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/sites/zone")` (fichier sous extensions/ mais pas une extension classique)

Classe « Zone » d'un jeu de sites : un polygone 2D (liste de sommets en coordonnées monde) délimitant une région de la carte, avec en option deux plans (haut et bas) qui bornent la zone en hauteur. Sert à tester si un point ou un véhicule est dans la zone (limites de ville, zones de trafic, de mission) et à la dessiner en debug. Le module renvoie un constructeur.

## Exemple

```lua
local zone = sites.zones.objects[id]
if zone:containsPoint2D(veh:getPosition()) then print('dans', zone.name) end
print(zone:zoneArea())
```

## Remarques

- Le test d'appartenance est 2D (algorithme par parité sur x/y) : la hauteur n'intervient que via les plans top/bot actifs (pointBetweenPlanes) ; sans plan actif, la zone est infinie en z.
- processVertices fixe v.radius = 5 pour chaque sommet et chaîne les sommets en boucle (v.next / v.prev). Il faut l'appeler après toute modification manuelle de self.vertices ; addVertex, removeVertex et autoPlanes le font.
- Une zone sans sommet est marquée aabb.invalid = true et journalise une erreur.
- rayIntersectsZone suppose que tous les sommets ont un champ next (donc processVertices déjà appelé).
- makeHighResolutionFence remplace les sommets par des points intermédiaires (pas max 3 m par défaut), recalés sur le terrain si core_terrain existe.
- drawFence modifie le champ a du ColorI passé en argument.

## Classe `C`

Objet zone. Champs : sites, id, name, color, vertices (liste de {pos, radius, index, next, prev}), center, labelPos, aabb {xMin..zMax, invalid}, top / bot ({pos, normal, active}), fenceDown, fenceHeight, usePlanes, customFields, locations et parkingSpots (remplis par finalizeSites).

Le module renvoie un constructeur : `local obj = require("gameplay_sites_zone")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:aabbCheck(point)` | Test rapide x/y contre la boîte englobante (z ignoré). | 197 |
| `C:addVertex(pos, index)` | Insère un sommet (à la fin ou à l'index donné) et recalcule les données dérivées. | 72 |
| `C:autoPlanes(ignoreTop, ignoreBot)` | Crée automatiquement des plans horizontaux 5 m au-dessus du sommet le plus haut et 5 m en dessous du plus bas, centrés sur la zone. | 143 |
| `C:changedPlanes()` | À appeler après modification des plans top/bot ; relance processVertices. | 132 |
| `C:containsPoint2D(point)` | Teste si un point est dans le polygone (x/y) et entre les plans. | 252 |
| `C:containsVehicle(veh, basic)` | Teste si un véhicule est dans la zone, d'après sa boîte englobante de spawn : centre seul en mode basic, sinon les quatre coins du bas/haut utilisés (points 0, 3, 4 et 7) doivent tous être dans la zone. | 275 |
| `C:drawDebug(drawMode, clr, customHeight, customDown, nearCam, drawDistance)` | Dessine la zone en debug (clôture translucide, nom, plans selon le mode). Ne dessine que si la caméra est assez proche. | 291 |
| `C:drawFence(from, to, clrI, down, up, usePlanes, nearCam, drawDistance, shapeAlpha)` | Dessine un panneau de clôture (deux triangles, double face) entre deux points. | 393 |
| `C:drawMinimap(td)` | Dessine le contour de la zone sur la minimap de l'interface (lignes blanches). | 380 |
| `C:drawPlane(plane, clrF)` | Dessine un plan (haut ou bas) par des lignes reliant son point d'ancrage aux sommets projetés, et sa normale. | 369 |
| `C:init(sites, name, forceId)` | Constructeur. sites peut être nil (identifiant -1). Valeurs par défaut : fenceDown 0, fenceHeight 5, plans inactifs. | 7 |
| `C:makeHighResolutionFence(maxStep)` | Remplace les sommets par une version échantillonnée tous les maxStep mètres (au minimum 1), recalée sur la hauteur du terrain. | 446 |
| `C:onDeserialized(data)` | Restaure la zone depuis les données et appelle processVertices. | 51 |
| `C:onSerialize()` | Sérialise nom, sommets, couleur, champs personnalisés et plans top/bot. | 26 |
| `C:pointBetweenPlanes(point)` | Indique si un point se trouve entre les plans actifs (un plan inactif est ignoré). | 167 |
| `C:processVertices()` | Précalculs : boîte englobante (aabb), centre, position du libellé, chaînage des sommets, extension de l'aabb par les plans. Si un plan n'est pas actif, la borne z correspondante est infinie. | 83 |
| `C:rayIntersectsZone(rayPos, rayDir)` | Distance d'intersection d'un rayon avec la « clôture » (murs verticaux le long du contour, bornés par fenceDown/fenceHeight ou par les plans). | 214 |
| `C:removeVertex(index)` | Supprime le sommet d'index donné et recalcule. | 77 |
| `C:validPlanes()` | Teste que les deux plans sont actifs et que leurs normales pointent respectivement vers le haut (top) et vers le bas (bot). | 137 |
| `C:vertexPlaneIntersection(vertex, plane)` | Projette verticalement (axe z) un sommet sur un plan. Renvoie le sommet inchangé si le plan est inactif ou aligné avec l'axe z (erreur journalisée). | 181 |
| `C:zoneArea()` | Aire du polygone en m² (formule du lacet, x/y). 0 si moins de 3 sommets. | 476 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawCylinder`, `drawLine`, `drawTextAdvanced`, `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/sites/zone.lua`.*
