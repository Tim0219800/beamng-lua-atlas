# `gameplay_race_pathnode`

*Fichier : `lua/ge/extensions/gameplay/race/pathnode.lua` · VM : Game Engine (GE) · 319 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/gameplay/race/pathnode")` (fichier sous extensions/ mais pas une extension classique)

Classe d'un point de passage (pathnode) d'un chemin de course : sphère avec rayon et normale optionnelle, positionnée manuellement ou sur un nœud du navgraph. Gère les zones de récupération (recovery/reverseRecovery), le remplissage latéral (sidePadding), des champs personnalisés, les points de route associés et la génération de transformations de décor sur les côtés. Le module renvoie une fabrique : require('/lua/ge/extensions/gameplay/race/pathnode')(path, name, forceId).

## Remarques

- Champs : id, name, mode ('manual' ou 'navgraph'), pos, normal (nil sans direction), hasNormal, radius, navRadiusScale (1), visible (true), useAsSplit (true, compte comme temps intermédiaire), recovery et reverseRecovery (id de startPosition, -1 si aucun), sidePadding (vec3 : x = gauche, y = droite), customFields, sortOrder.
- getSideTransforms désactive temporairement la collision de la forêt pendant ses lancers de rayon (core_forest).
- getPaddedCenter utilise self.normal : erreur si le pathnode n'a pas de normale (hasNormal false).
- setNavRadiusScale lit map.getMap().nodes[navgraphName] sans vérifier que le nœud existe.
- onSerialize n'enregistre pas la liste des points de route (ils sont recalculés).

## Classe `C`

Point de passage de course. Les angles passés à getSideTransforms sont en radians.

Le module renvoie un constructeur : `local obj = require("gameplay_race_pathnode")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:convertRayHitToTransform(hit, pRot, zOff, scl, side, alignMode)` | Convertit le résultat d'un lancer de rayon en transformation d'objet de décor : position décalée de zOff le long de la normale du sol, échelle, rotation selon alignMode. | 248 |
| `C:drawDebug(drawMode, clr, extraText)` | Dessine sphère, libellé (préfixe '*' si useAsSplit, entre parenthèses si invisible), champs personnalisés numériques (si la préférence de l'éditeur raceEditor.general.showCustomFields est active) et flèches de normale. | 174 |
| `C:getPaddedCenter()` | Centre et largeur de la zone utile du pathnode une fois retirés les remplissages latéraux sidePadding. | 168 |
| `C:getRecovery()` | Position de départ de récupération associée (path.startPositions.objects[recovery]). | 87 |
| `C:getReverseRecovery()` | Position de départ de récupération en marche arrière (reverseRecovery). | 90 |
| `C:getRoutePoint()` | Point de route associé. | 301 |
| `C:getSideTransforms(posOffset, rotOffset, sclOffset, alignMode)` | Calcule deux transformations de décor, à gauche et à droite du pathnode, en lançant des rayons vers le sol de chaque côté (rayon de 10 m). Renvoie une table vide si le pathnode n'a pas de normale. | 269 |
| `C:getStaticRoutePoint()` | Point de route statique. | 309 |
| `C:init(path, name, forceId)` | Constructeur : id, nom par défaut « Pathnode <id> », mode manuel, valeurs par défaut des champs. | 7 |
| `C:inside(pos)` | Indique si un point est dans la sphère (et devant le plan de la normale si hasNormal). | 78 |
| `C:intersectCorners(fromCorners, toCorners)` | Teste si un segment reliant les coins d'un véhicule traverse le pathnode : le plan de la normale dans la sphère si hasNormal, sinon la sphère elle-même. | 94 |
| `C:onDeserialized(data, oldIdMap)` | Restaure le pathnode à partir de données sérialisées ; convertit les ids de récupération avec oldIdMap. | 148 |
| `C:onSerialize()` | Sérialise le pathnode (nom, mode, échelle, position, rayon, normale, navgraphName, recovery, visible, useAsSplit, sidePadding, customFields). | 128 |
| `C:setManual(pos, radius, normal)` | Passe en mode manuel avec position, rayon et normale données. | 47 |
| `C:setNavRadiusScale(scl)` | Change l'échelle du rayon navgraph et recalcule le rayon en mode navgraph. | 71 |
| `C:setNavgraph(navgraphName, fallback)` | Passe en mode navgraph : position et rayon (× navRadiusScale) du nœud de la carte routière, ou de fallback si le nœud n'existe pas. Efface la normale. | 55 |
| `C:setNormal(normal)` | Définit la normale (longueur > 0,9 requise, puis normalisée, hasNormal true) ; sinon l'efface. | 33 |
| `C:setRoutePoint(rp)` | Mémorise le point de route associé (suivi du véhicule). | 294 |
| `C:setStaticRoutePoint(rp)` | Mémorise le point de route statique (non modifié par le suivi du véhicule). | 305 |

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/race/pathnode.lua`.*
