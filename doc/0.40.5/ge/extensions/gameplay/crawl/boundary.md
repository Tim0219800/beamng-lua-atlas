# `gameplay_crawl_boundary`

*Fichier : `lua/ge/extensions/gameplay/crawl/boundary.lua` · VM : Game Engine (GE) · 512 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crawl_boundary` : `extensions.load("gameplay_crawl_boundary")`, puis la globale `gameplay_crawl_boundary`

Gestion de la limite de zone du mode « crawl » (franchissement lent). Il fait apparaître des drapeaux (TSStatic flagMarker.dae) le long du contour d'une zone, les anime (apparition avec mise à l'échelle et fondu, disparition en fondu) quand un crawler actif ou la caméra est à moins de visibilityRadius mètres, via un quadtree 2D, et vérifie si un crawler est sorti de la zone. Une sortie est enregistrée ; si le crawler s'éloigne d'au moins 10 m du point de sortie (tous les coins dehors), la pénalité 'dnf' est appliquée une seule fois via gameplay_crawl_utils.applyPenalty ; sinon onBoundaryViolation est appelé.

## Remarques

- Distances en mètres, durées d'animation en secondes. Valeurs par défaut : visibilityRadius 100, animationDuration 0.5, fadeIn 0.3, fadeOut 0.2, scaleUp 0.4, échelle de 0.1 à 1.0.
- Bug probable : setVisibilityRadius(nil) remet 200 alors que la valeur initiale est 100.
- Bug probable : getQuadtreeStats et le log de buildBoundaryQuadtree utilisent #boundaryObjects ; boundaryObjects est indexé par id d'objet (pas une séquence), donc # peut valoir 0 ou une valeur erronée.
- checkBoundary appelle gameplay_crawl_utils.onBoundaryViolation sans tester que gameplay_crawl_utils existe dans certaines branches (erreur si le module n'est pas chargé).
- Dans checkBoundary, sans coins disponibles (currentCorners vide), la position bbCenter est testée avec site:containsPoint2D ; retourne true tant que le crawler n'est pas disqualifié.
- Un marqueur n'est placé que si la normale du terrain a un produit scalaire >= 0.5 avec l'axe Z.
- Les objets de marqueurs sont dans un SimGroup 'BoundaryMarkers' ajouté à MissionGroup, avec canSave = false.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crawl_boundary.checkBoundary(site, crawler, crawlStates)` | Teste si un crawler est dans la zone (coins du véhicule ou centre de sa boîte). Enregistre le point de sortie, applique la pénalité 'dnf' (une fois) si tous les coins sont dehors à 10 m ou plus du point de sortie, ou signale une violation de limite. | 318 |
| `gameplay_crawl_boundary.cleanupBoundaryMarkers()` | Supprime le groupe de marqueurs et vide le suivi. | 306 |
| `gameplay_crawl_boundary.clearAllExitPoints()` | Efface tous les points de sortie et drapeaux DNF. | 431 |
| `gameplay_crawl_boundary.clearCrawlerExitPoint(crawlerId)` | Efface le point de sortie et le drapeau DNF d'un crawler. | 422 |
| `gameplay_crawl_boundary.getCrawlerExitPoint(crawlerId)` | Retourne le point où le crawler est sorti de la zone. | 417 |
| `gameplay_crawl_boundary.getQuadtreeStats()` | Retourne l'état du quadtree pour le debug. | 460 |
| `gameplay_crawl_boundary.rebuildQuadtree()` | Reconstruit le quadtree à partir des drapeaux suivis (utile si ces objets changent). | 455 |
| `gameplay_crawl_boundary.resetBoundaryObjects()` | Cache tous les drapeaux suivis (hidden, échelle minimale, couleur transparente) puis vide la table de suivi. | 189 |
| `gameplay_crawl_boundary.setAnimationTiming(duration, fadeIn, fadeOut, scaleUp)` | Règle les durées d'animation des drapeaux (valeurs par défaut si nil). | 444 |
| `gameplay_crawl_boundary.setVisibilityRadius(radius)` | Définit le rayon (m) dans lequel les drapeaux sont visibles. | 438 |
| `gameplay_crawl_boundary.spawnBoundaryMarkers(boundary, spacing)` | Supprime les marqueurs précédents, puis crée des drapeaux le long du contour (un tous les spacing mètres, posés sur le terrain et orientés selon le segment) et construit le quadtree de visibilité. Les drapeaux démarrent cachés. | 204 |
| `gameplay_crawl_boundary.triggerAppearingAnimation()` | Relance l'animation d'apparition pour les drapeaux actuellement non cachés. | 473 |
| `gameplay_crawl_boundary.updateBoundaryAnimations(dtSim, crawlStates)` | Met à jour la visibilité et l'animation des drapeaux de limite : ceux proches d'un crawler actif (ou de la caméra si aucun n'est actif) apparaissent, les autres disparaissent. À appeler à chaque image. | 63 |

### Détail des paramètres

#### `gameplay_crawl_boundary.checkBoundary(site, crawler, crawlStates)`

Teste si un crawler est dans la zone (coins du véhicule ou centre de sa boîte). Enregistre le point de sortie, applique la pénalité 'dnf' (une fois) si tous les coins sont dehors à 10 m ou plus du point de sortie, ou signale une violation de limite.

- `site` (*table*) : Zone avec la méthode containsPoint2D(pos).
- `crawler` (*table*) : Crawler : id, dynamicData (currentCorners, bbCenter).
- `crawlStates` (*table<any, table>*) : États des crawlers indexés par id (champ active).
- **renvoie** : boolean false si le crawler est inactif, disqualifié (DNF) ou si aucun site n'est donné ; true sinon.

#### `gameplay_crawl_boundary.clearCrawlerExitPoint(crawlerId)`

Efface le point de sortie et le drapeau DNF d'un crawler.

- `crawlerId` (*any*) : Id du crawler.

#### `gameplay_crawl_boundary.getCrawlerExitPoint(crawlerId)`

Retourne le point où le crawler est sorti de la zone.

- `crawlerId` (*any*) : Id du crawler.
- **renvoie** : vec3|nil Point de sortie, ou nil si le crawler est dans la zone.

#### `gameplay_crawl_boundary.getQuadtreeStats()`

Retourne l'état du quadtree pour le debug.

- **renvoie** : table {built, objectCount, bounds?} (voir notes sur objectCount).

#### `gameplay_crawl_boundary.setAnimationTiming(duration, fadeIn, fadeOut, scaleUp)`

Règle les durées d'animation des drapeaux (valeurs par défaut si nil).

- `duration` (*number|nil*) : Durée totale d'apparition (s), 0.5 par défaut.
- `fadeIn` (*number|nil*) : Durée du fondu d'entrée (s), 0.3 par défaut.
- `fadeOut` (*number|nil*) : Durée du fondu de sortie (s), 0.2 par défaut.
- `scaleUp` (*number|nil*) : Durée de la montée en échelle (s), 0.4 par défaut.

#### `gameplay_crawl_boundary.setVisibilityRadius(radius)`

Définit le rayon (m) dans lequel les drapeaux sont visibles.

- `radius` (*number|nil*) : Rayon en mètres ; 200 si nil.

#### `gameplay_crawl_boundary.spawnBoundaryMarkers(boundary, spacing)`

Supprime les marqueurs précédents, puis crée des drapeaux le long du contour (un tous les spacing mètres, posés sur le terrain et orientés selon le segment) et construit le quadtree de visibilité. Les drapeaux démarrent cachés.

- `boundary` (*table*) : Contour avec vertices (au moins 3), chacun avec pos (vec3) et éventuellement next.
- `spacing` (*number|nil*) : Distance entre drapeaux en mètres (2.0 par défaut).
- **renvoie** : integer|nil Id du SimGroup de marqueurs ; nil si le contour est invalide.

#### `gameplay_crawl_boundary.updateBoundaryAnimations(dtSim, crawlStates)`

Met à jour la visibilité et l'animation des drapeaux de limite : ceux proches d'un crawler actif (ou de la caméra si aucun n'est actif) apparaissent, les autres disparaissent. À appeler à chaque image.

- `dtSim` (*number*) : Delta temps simulation (s).
- `crawlStates` (*table<any, table>|nil*) : États des crawlers (active, crawlerData.dynamicData.vehPos).

## Appels vers le moteur (C++)

- `Sim.` `getUniqueName`
- `be:` `getSurfaceHeightBelow`
- `obj:` `setField`, `setScale`, `updateInstanceRenderData`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crawl/boundary.lua`.*
