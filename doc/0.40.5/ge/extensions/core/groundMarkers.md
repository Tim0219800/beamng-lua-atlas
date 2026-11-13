# `core_groundMarkers`

*Fichier : `lua/ge/extensions/core/groundMarkers.lua` · VM : Game Engine (GE) · 447 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_groundMarkers` : `extensions.load("core_groundMarkers")`, puis la globale `core_groundMarkers`

Extension GE `core_groundMarkers` : navigation au sol. Calcule un itinéraire (route planner) du véhicule joueur vers un ou plusieurs points, dessine des décalques de flèches bleues sur la route devant le véhicule (rendu par DynamicDecalMgr), met à jour les flèches flottantes aux intersections (core_groundMarkerArrows) et envoie le tracé à l'UI (appli de navigation). Un moddeur l'utilise pour guider le joueur vers une destination : setPath(points).

## Exemple

```lua
-- guider vers une position monde puis vider le tracé à l'arrivée
core_groundMarkers.setPath(vec3(100, 200, 30), {clearPathOnReachingTarget = true})
-- plusieurs étapes, calcul asynchrone
core_groundMarkers.setPath({vec3(0,0,0), vec3(500,0,0)}, {async = true, onComplete = function() print('prêt') end})
core_groundMarkers.setPath(nil)   -- efface
```

## Remarques

- setPath(wp, options) : wp peut être un vec3, un nom de nœud de la carte routière (string), une table {x,y,z} (3 éléments), ou une liste de ces éléments. wp nil ou liste vide efface le tracé et les flèches. Les noms de nœuds inconnus sont ignorés avec un avertissement.
- options reconnues : step (espacement des décalques en m, défaut 3), color ({r,g,b} 0..1 ; défaut le jeu de couleurs M.colorSet = 'blue' (0,0.4,1) ou 'green'), cutOffDrivability, penaltyAboveCutoff, penaltyBelowCutoff, dirMult, wD, wZ (paramètres du routeur : setRouteParams), renderDecals (false = pas de décalques), lockFixedNodes, clearPathOnReachingTarget, async (true = calcul par job, le tracé n'est disponible qu'au callback), onComplete (appelé quand le chemin est prêt).
- Rendu : décalques dessinés dans la zone de M.decalDrawingDistance = 120 m devant le véhicule ; opacité croissante de 0 (à 1 m, decalBlendOffset) à 1 (à 10 m, decalBlendStart), pleine jusqu'à 100 m (decalBlendEnd), puis décroissante jusqu'à 120 m. Régénérés quand le véhicule a bougé de plus de 1 m, ou en continu si la grande carte est ouverte. Rien n'est dessiné en mode photo.
- Réglages utilisateur lus : showNavigationGroundmarkers (décalques) et showNavigationArrows (flèches flottantes).
- L'UI reçoit 'NavigationGroundMarkersUpdate' {markers = [x1,y1,x2,y2,…], color = '#RRGGBBFF'} lors d'un nouveau tracé et toutes les 0,25 s pendant le rendu.
- Le tracé est effacé en fin de niveau (onClientEndMission), au déchargement de l'extension et au début/arrêt de toute mission (onAnyMissionChanged 'started' ou 'stopped').
- Incohérences : deprecationWarning utilise une variable `logTag` qui n'est pas définie dans ce fichier (nil) ; onSerialize ne renvoie rien (efface seulement les flèches), donc le tracé n'est pas conservé après un rechargement d'extensions ; M.stepDistance, M.endWP, M.color, M.activeDecalCount ne sont initialisés que par setPath ; setFocus est déprécié (setPath).

**Dépendances (chargées avant) :** `core_groundMarkerArrows`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_groundMarkers.currentlyHasTarget()` | Indique si un tracé est actif. | 396 |
| `core_groundMarkers.generateRouteDecals(startPos)` | Remplit le pool de décalques le long du chemin à partir de la position donnée (jusqu'à decalDrawingDistance) avec l'opacité calculée, puis met à jour les flèches flottantes si le réglage est actif. Appelée à chaque rendu par onPreRender. | 142 |
| `core_groundMarkers.getPathLength()` | Longueur restante du chemin jusqu'à la destination, d'après distToTarget du premier point. | 45 |
| `core_groundMarkers.getTargetPos()` | Première destination restante telle que fournie à setPath. | 399 |
| `core_groundMarkers.onAnyMissionChanged(state)` | Hook de changement d'état d'une mission : efface le tracé quand l'état est 'started' ou 'stopped'. *(interne)* *(hook)* | 426 |
| `core_groundMarkers.onClientEndMission()` | Hook de fin de niveau : appelle resetAll. *(interne)* *(hook)* | 384 |
| `core_groundMarkers.onExtensionUnloaded()` | Hook de déchargement de l'extension : appelle resetAll. *(interne)* *(hook)* | 388 |
| `core_groundMarkers.onPreRender(dt)` | Hook de rendu : suit le véhicule sur le chemin, régénère les décalques si besoin, dessine le debug, ajoute les décalques à Engine.Render.DynamicDecalMgr et envoie le tracé à l'UI toutes les 0,25 s. Ne fait rien sans destination ou en mode photo. *(interne)* *(hook)* | 185 |
| `core_groundMarkers.onSerialize()` | Hook avant rechargement des extensions : supprime les flèches ; ne renvoie rien. *(interne)* *(hook)* | 392 |
| `core_groundMarkers.onSettingsChanged()` | Hook de changement de réglages : crée ou supprime les flèches flottantes selon showNavigationArrows et force la régénération des décalques selon showNavigationGroundmarkers. *(interne)* *(hook)* | 405 |
| `core_groundMarkers.resetAll()` | Efface le tracé (setPath(nil)), réinitialise les paramètres du routeur et supprime les flèches. | 367 |
| `core_groundMarkers.sendToApp()` | Envoie à l'UI le tracé courant : guihooks 'NavigationGroundMarkersUpdate' {markers = x,y à plat, color = '#RRGGBBFF'}. | 234 |
| `core_groundMarkers.setFocus(wp, step, _fadeStart, _fadeEnd, _endPos, _disableVeh, _color, _cutOffDrivability, _penaltyAboveCutoff, _penaltyBelowCutoff, _renderDecals)` | Déprécié : ancienne API convertie en options pour setPath (warning loggué une fois). Les paramètres _fadeStart, _fadeEnd, _endPos, _disableVeh sont ignorés. | 354 |
| `core_groundMarkers.setPath(wp, options)` | Définit (ou efface) l'itinéraire de navigation vers un ou plusieurs points. Réinitialise le pool de décalques, calcule le chemin depuis la position du véhicule joueur (ou de la caméra), crée les flèches et prévient l'UI. | 249 |
| `core_groundMarkers.unflagFirstFixedNode()` | Retire la première destination de la liste (étape atteinte) et le marquage de nœud fixe correspondant dans le routeur ; s'il n'y en a plus, efface tout. | 333 |

### Détail des paramètres

#### `core_groundMarkers.currentlyHasTarget()`

Indique si un tracé est actif.

- **renvoie** : boolean true si une destination est définie.

#### `core_groundMarkers.generateRouteDecals(startPos)`

Remplit le pool de décalques le long du chemin à partir de la position donnée (jusqu'à decalDrawingDistance) avec l'opacité calculée, puis met à jour les flèches flottantes si le réglage est actif. Appelée à chaque rendu par onPreRender.

- `startPos` (*vec3*) : Position de départ (véhicule joueur ou caméra).

#### `core_groundMarkers.getPathLength()`

Longueur restante du chemin jusqu'à la destination, d'après distToTarget du premier point.

- **renvoie** : number Mètres ; math.huge si un calcul asynchrone est en cours ; 0 s'il n'y a pas de chemin.

#### `core_groundMarkers.getTargetPos()`

Première destination restante telle que fournie à setPath.

- **renvoie** : vec3|string|table|nil Destination (peut être un nom de nœud) ou nil.

#### `core_groundMarkers.onAnyMissionChanged(state)`

Hook de changement d'état d'une mission : efface le tracé quand l'état est 'started' ou 'stopped'.

- `state` (*string*) : État de la mission.

#### `core_groundMarkers.onPreRender(dt)`

Hook de rendu : suit le véhicule sur le chemin, régénère les décalques si besoin, dessine le debug, ajoute les décalques à Engine.Render.DynamicDecalMgr et envoie le tracé à l'UI toutes les 0,25 s. Ne fait rien sans destination ou en mode photo.

- `dt` (*number*) : Delta temps du rendu en secondes.

#### `core_groundMarkers.setFocus(wp, step, _fadeStart, _fadeEnd, _endPos, _disableVeh, _color, _cutOffDrivability, _penaltyAboveCutoff, _penaltyBelowCutoff, _renderDecals)`

Déprécié : ancienne API convertie en options pour setPath (warning loggué une fois). Les paramètres _fadeStart, _fadeEnd, _endPos, _disableVeh sont ignorés.

- `wp` (*any*) : Destination(s), comme setPath.
- `step` (*number|nil*) : Espacement des décalques.
- `_fadeStart` (*any*) : Ignoré.
- `_fadeEnd` (*any*) : Ignoré.
- `_endPos` (*any*) : Ignoré.
- `_disableVeh` (*any*) : Ignoré.
- `_color` (*number[]|nil*) : Couleur RGB.
- `_cutOffDrivability` (*number|nil*) : Voir setPath.
- `_penaltyAboveCutoff` (*number|nil*) : Voir setPath.
- `_penaltyBelowCutoff` (*number|nil*) : Voir setPath.
- `_renderDecals` (*boolean|nil*) : Voir setPath.

#### `core_groundMarkers.setPath(wp, options)`

Définit (ou efface) l'itinéraire de navigation vers un ou plusieurs points. Réinitialise le pool de décalques, calcule le chemin depuis la position du véhicule joueur (ou de la caméra), crée les flèches et prévient l'UI.

- `wp` (*vec3|string|table|table[]|nil*) : Destination(s) : vec3, nom de nœud de la carte, {x,y,z}, ou liste de ceux-ci. nil efface.
- `options` (*table|nil*) : Voir notes : step, color, cutOffDrivability, penaltyAboveCutoff, penaltyBelowCutoff, dirMult, wD, wZ, renderDecals, lockFixedNodes, clearPathOnReachingTarget, async, onComplete.

#### `core_groundMarkers.unflagFirstFixedNode()`

Retire la première destination de la liste (étape atteinte) et le marquage de nœud fixe correspondant dans le routeur ; s'il n'y en a plus, efface tout.

- **renvoie** : boolean false s'il n'y avait aucun tracé actif, sinon true.

## Champs

| Champ | Type | Description |
|---|---|---|
| `colorSet` | string | Jeu de couleurs actif : 'blue' (défaut) ou 'green' (clés de colorSets). |
| `colorSets` | table<string, {decals: number[], arrows: number[]}> | Couleurs RGB 0..1 des décalques et des flèches : blue {0,0.4,1}/{0,0.48,0.77}, green {0,1,0}/{0,1,0}. |
| `debugPath` | boolean | true = dessine les points du chemin (sphères, prismes, numéros) à chaque rendu. Faux par défaut. |
| `decalBlendEnd` | number | 100 m : distance à partir de laquelle l'opacité décroît vers 0 à decalDrawingDistance. |
| `decalBlendOffset` | number | 1 m : distance sous laquelle les décalques sont invisibles. |
| `decalBlendStart` | number | 10 m : distance à partir de laquelle l'opacité est complète. |
| `decalDrawingDistance` | number | 120 : distance maximale des décalques devant le véhicule, en mètres. |
| `decalPool` | table[] | Pool de données de décalques réutilisées à chaque image (champs texture, position, forwardVec, color, scale, fadeStart, fadeEnd). |
| `decalPoolCount` | integer | Nombre d'entrées dans decalPool. |
| `dependencies` | string[] | {'core_groundMarkerArrows'}. |
| `routePlanner` | table | Instance de gameplay/route/route (calcul du chemin, trackVehicle, path[] avec pos, distToTarget, wp, linkCount). |

**Évènements UI (guihooks.trigger) :** `NavigationGroundMarkersUpdate`

## Appels vers le moteur (C++)

- `debugDrawer:` `drawSphere`, `drawSquarePrism`, `drawTextAdvanced`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/groundMarkers.lua`.*
