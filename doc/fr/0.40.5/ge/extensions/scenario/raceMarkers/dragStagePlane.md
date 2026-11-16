# `scenario_raceMarkers_dragStagePlane`

*Fichier : `lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua` · VM : Game Engine (GE) · 189 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/scenario/raceMarkers/dragStagePlane")` (fichier sous extensions/ mais pas une extension classique)

Marqueur de zone de placement (staging) pour les courses de dragster : dessine avec debugDrawer des plans translucides au sol (ligne de départ et ligne du joueur reliées par des parois latérales et des repères réguliers). Blanc quand la position n'est pas valide, bleu quand le véhicule est bien placé, rouge quand il a dépassé la ligne. Aucun objet de scène n'est créé. Le module renvoie un constructeur : require('scenario/raceMarkers/dragStagePlane')(id) donne un objet de la classe C.

## Remarques

- Couleurs (alpha 102/255) : blanc par défaut, bleu (26, 89, 255) si isValidStage, rouge si distanceToCar > 0 sans placement valide.
- Les signatures réelles sont setPlane(center, across, up, halfWidth, height) et updateFromStaging(stageTransform, distanceToStage, isValidStage) ; la page extraite omet le premier paramètre de chacune.
- updateFromStaging attend stageTransform = {position, x, y, scale?} ; la demi-largeur vaut max(2.75, scale.x * 0.65) (scale.x défaut 4).
- Les repères intermédiaires sont espacés de 1 m le long de la distance au véhicule.
- Le dessin se fait à chaque update, qui doit être appelé à chaque image (scenario_race_marker.render le fait).

## Classe `C`

Plan de staging dessiné en debug.

Le module renvoie un constructeur : `local obj = require("scenario_raceMarkers_dragStagePlane")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearMarkers()` | Efface la table d'identifiants. | 30 |
| `C:createMarkers()` | Prépare une table d'identifiants vide (aucun objet créé). | 26 |
| `C:getShowDistance()` | Distance à partir de laquelle le plan doit être affiché (25 m). | 59 |
| `C:hide()` | Appelle setVisibility(false). | 87 |
| `C:init(id)` | Constructeur : initialise centre, axes, demi-largeur 2 m, hauteur 0.5 m, distance d'affichage 25 m. | 10 |
| `C:setMode(mode)` | 'hidden' (défaut) masque, tout autre mode affiche. | 74 |
| `C:setPlane(center, across, up, halfWidth, height)` | Règle la géométrie du plan ; chaque argument nil garde la valeur actuelle. across et up sont normalisés (ignorés s'ils sont quasi nuls), halfWidth et height sont bornés à 0.05 minimum. | 41 |
| `C:setToCheckpoint(wp)` | Place le centre du plan sur wp.pos. | 34 |
| `C:setVisibility(v)` | Active ou désactive le dessin. | 83 |
| `C:show()` | Appelle setVisibility(true). | 91 |
| `C:update(dt, dtSim)` | Appel par image : dessine les faces translucides avec debugDrawer:drawTriSolid. | 126 |
| `C:updateFromStaging(stageTransform, distanceToStage, isValidStage)` | Met à jour le plan d'après la transformation de staging et la distance du véhicule à la ligne. | 63 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceMarkers/dragStagePlane.lua`.*
