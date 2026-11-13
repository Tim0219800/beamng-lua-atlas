# `scenario_raceMarkers_sideColumnMarker`

*Fichier : `lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua` · VM : Game Engine (GE) · 314 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/scenario/raceMarkers/sideColumnMarker")` (fichier sous extensions/ mais pas une extension classique)

Marqueur de checkpoint par défaut de scenario_race_marker : deux colonnes (modèle single_faded_column.dae) de part et d'autre du passage, plus une base au sol (checkpoint_curve_base.dae). Les colonnes grandissent avec la distance pour rester visibles de loin. Prend en charge l'écran partagé : chaque marqueur peut n'être visible que pour un joueur (setRenderViewPlayer). Le module renvoie un constructeur : require('scenario/raceMarkers/sideColumnMarker')(id) donne un objet de la classe C.

## Remarques

- Couleurs par mode : default rouge (1, 0.07, 0), next noir, start et lap vert (0.4, 1, 0.2), recovery jaune (1, 0.85, 0), final bleu (0.1, 0.3, 1), branch orange (1, 0.6, 0), hidden noir. Fondu de couleur de 0.3 s.
- setToCheckpoint(wp) lit wp.pos, wp.radius (demi-écart entre les colonnes), wp.normal (direction de passage, facultative), wp.fadeNear (1 par défaut), wp.fadeFar (50), wp.minAlpha (0.25).
- Les colonnes sont placées à pos +/- side*radius avec un décalage vertical de -10 m, et leur hauteur croît avec la distance (jusqu'à environ 20 unités entre 60 et 180 m, puis encore à grande distance).
- La caméra de référence pour la distance est celle du contexte du joueur renderViewPlayer (core_camera.getContextIdForPlayer), sinon la caméra principale.
- Les objets sont mémorisés par identifiants (baseId, leftId, rightId) et recherchés à chaque image avec scenetree.findObjectById.
- La page extraite affiche update(dtSim) ; la signature réelle est update(dt, dtSim).

## Classe `C`

Marqueur à deux colonnes latérales.

Le module renvoie un constructeur : `local obj = require("scenario_raceMarkers_sideColumnMarker")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:applyRenderViewMask()` | Efface les masques de rendu des objets puis les cache dans les vues d'écran partagé des autres joueurs que renderViewPlayer (render_splitScreen.getPlayers). | 233 |
| `C:clearMarker(id)` | Supprime un objet à partir de son identifiant (masque de rendu effacé avant la suppression). | 288 |
| `C:clearMarkers()` | Supprime base et colonnes. | 299 |
| `C:createMarkers()` | Supprime les anciens objets puis crée la base et les deux colonnes, et applique le masque de vues. | 280 |
| `C:createObject(shapeName, objectName)` | Crée un TSStatic caché enregistré sous objectName et ajouté à ScenarioObjectsGroup. | 257 |
| `C:hide()` | Appelle setVisibility(false). | 229 |
| `C:init(id)` | Constructeur : initialise l'état et appelle clearMarkers. | 67 |
| `C:setMode(mode)` | Change de mode : affiche (sauf 'hidden') et lance le fondu de couleur. | 201 |
| `C:setRenderViewPlayer(player)` | Réserve ce marqueur à la vue d'un joueur (nil pour tous) et applique le masque. | 252 |
| `C:setToCheckpoint(wp)` | Place base et colonnes sur un checkpoint. | 175 |
| `C:setVisibility(v)` | Affiche ou cache base et colonnes. | 213 |
| `C:show()` | Appelle setVisibility(true). | 230 |
| `C:update(dt, dtSim)` | Appel par image : calcule couleur, alpha, taille de la base et des colonnes d'après la distance à la caméra. | 99 |

## Appels vers le moteur (C++)

- `obj:` `delete`, `renderViewMaskClear`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceMarkers/sideColumnMarker.lua`.*
