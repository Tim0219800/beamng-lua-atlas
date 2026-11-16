# `scenario_raceMarkers_crawlMarker`

*Fichier : `lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua` · VM : Game Engine (GE) · 541 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/scenario/raceMarkers/crawlMarker")` (fichier sous extensions/ mais pas une extension classique)

Marqueur de checkpoint pour les parcours de franchissement (crawl) : une flèche flottante qui regarde la caméra, deux drapeaux orange plantés de part et d'autre du passage (posés sur le terrain), et une grande colonne visible de loin. Il a ses propres modes (inactive, current, recovery, bonus, skipped, final, finished). La flèche monte jusqu'à une hauteur d'où elle reste visible de la caméra (lancers de rayon statiques). Compatible avec l'écran partagé (setRenderViewPlayer). Le module renvoie un constructeur : require('scenario/raceMarkers/crawlMarker')(id) donne un objet de la classe C.

## Remarques

- Couleurs par mode : default blanc, inactive gris (0.5), current orange (1, 0.5, 0), recovery jaune (1, 0.85, 0), bonus violet (0.8, 0.2, 1), skipped rouge (1, 0.07, 0), final bleu (0.1, 0.3, 1), finished vert (0.4, 1, 0.2), hidden noir. Le mode 'finished' masque la base.
- Les modes actifs (current, recovery, bonus, final) ont une colonne visible dès 40 m au lieu de 200 m et la flèche cherche un point dégagé jusqu'à 100 m de hauteur.
- setToCheckpoint(wp) lit wp.pos (le point est replaqué au sol : core_terrain.getTerrainHeight ou be:getSurfaceHeightBelow), wp.radius, wp.fadeNear (5 par défaut), wp.fadeFar (25), wp.delay (secondes avant que la flèche monte), wp.dir (direction du passage) ou wp.nextPos (le sens se déduit alors du checkpoint suivant).
- Les drapeaux sont décalés de 2.5 m de chaque côté de la direction de passage et alignés sur la normale du terrain.
- drawOnMinimap(td) dessine un cercle coloré avec ui_apps_minimap_utils.simpleCircle (si le mode n'est pas 'hidden') ; il est appelé par scenario_race_marker.drawOnMinimap.
- Le premier paramètre de update est dt (durée réelle), le second dtSim (durée simulée, utilisée pour le délai et les ressorts de hauteur et d'échelle).
- La page extraite affiche update(dtSim) ; la signature réelle est update(dt, dtSim).

## Classe `C`

Marqueur crawl avec flèche, drapeaux et colonne.

Le module renvoie un constructeur : `local obj = require("scenario_raceMarkers_crawlMarker")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:applyRenderViewMask()` | Cache les objets du marqueur dans les vues d'écran partagé des autres joueurs que renderViewPlayer. | 454 |
| `C:clearMarkers()` | Supprime les objets créés (en effaçant leur masque de vue). | 518 |
| `C:createMarkers()` | Supprime les anciens objets puis crée flèche, deux drapeaux et colonne. | 488 |
| `C:createObject(shapeName, objectName)` | Crée un TSStatic caché enregistré sous objectName. | 466 |
| `C:drawOnMinimap(td)` | Dessine un cercle sur la minicarte à la position du marqueur, avec la couleur du mode. | 394 |
| `C:hide()` | Appelle setVisibility(false). | 436 |
| `C:init(id)` | Constructeur : initialise l'état, les lisseurs et les couleurs. | 91 |
| `C:placeFlags()` | Place les deux drapeaux de part et d'autre de la position selon pathDirection, au sol. | 163 |
| `C:setMode(mode)` | Change de mode : affiche (sauf 'hidden'), mémorise l'ancien mode et relance le fondu ; ne fait rien de plus si le mode est inchangé. | 401 |
| `C:setRenderViewPlayer(player)` | Réserve ce marqueur à la vue d'un joueur (nil pour tous) et applique le masque. | 461 |
| `C:setToCheckpoint(wp)` | Place le marqueur sur un checkpoint et réinitialise les caches de hauteur. | 346 |
| `C:setVisibility(v)` | Affiche ou cache flèche, drapeaux et colonne. | 419 |
| `C:show()` | Appelle setVisibility(true). | 437 |
| `C:update(dt, dtSim)` | Appel par image : couleur, alpha selon la distance, orientation et hauteur de la flèche, échelle, colonne. | 185 |

## Appels vers le moteur (C++)

- `be:` `getSurfaceHeightBelow`
- `obj:` `delete`, `renderViewMaskClear`, `setField`, `setPosition`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceMarkers/crawlMarker.lua`.*
