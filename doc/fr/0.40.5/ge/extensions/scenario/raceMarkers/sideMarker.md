# `scenario_raceMarkers_sideMarker`

*Fichier : `lua/ge/extensions/scenario/raceMarkers/sideMarker.lua` · VM : Game Engine (GE) · 320 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/scenario/raceMarkers/sideMarker")` (fichier sous extensions/ mais pas une extension classique)

Marqueur de checkpoint « courbes latérales » : une base au sol (checkpoint_curve_base.dae), des courbes latérales actives (checkpoint_curve_active.dae, ou _finish pour lap et final) et une version « distante » (checkpoint_curve_distant.dae) qui apparaît en fondu quand on est loin (bascule entre 50 m et 75 m par défaut). Orientation selon la normale du checkpoint ou la caméra. Le module renvoie un constructeur : require('scenario/raceMarkers/sideMarker')(id) donne un objet de la classe C.

## Remarques

- Couleurs par mode : default rouge (1, 0.07, 0), next noir, start et lap vert (0.4, 1, 0.2), final bleu (0.1, 0.3, 1), branch orange (1, 0.6, 0), hidden noir. Changement de mode avec fondu de couleur de 0.3 s.
- setToCheckpoint(wp) lit wp.pos, wp.radius, wp.normal (facultatif), wp.fadeNear, wp.fadeFar, wp.mode (choix du modèle).
- La bascule proche/lointain dure 0.8 s (blendDuration) avec hystérésis entre fadeNear et fadeFar.
- Le champ self.sides et la fonction C:hide/C:show utilisent des couleurs (oldColor/newColor) mémorisées mais jamais lues par update : code résiduel.
- La page extraite affiche update(dtSim) ; la signature réelle est update(dt, dtSim).

## Classe `C`

Marqueur à courbes latérales.

Le module renvoie un constructeur : `local obj = require("scenario_raceMarkers_sideMarker")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearMarkers()` | Supprime les objets créés. | 301 |
| `C:createMarkers()` | Supprime les anciens objets puis crée base, côtés et version distante. | 283 |
| `C:createObject(shapeName, objectName)` | Crée un TSStatic caché enregistré sous objectName et ajouté à ScenarioObjectsGroup. | 261 |
| `C:hide()` | Masque et mémorise la couleur 'hidden'. | 248 |
| `C:init(id)` | Constructeur : initialise l'état et copie la table des modes. | 69 |
| `C:setMode(mode)` | Change de mode : affiche (sauf 'hidden'), lance le fondu de couleur et change le modèle des côtés. | 212 |
| `C:setToCheckpoint(wp)` | Place base, côtés et marqueur distant sur un checkpoint. | 187 |
| `C:setVisibility(v)` | Affiche ou cache les trois objets. | 235 |
| `C:show()` | Affiche en restaurant la couleur mémorisée. | 254 |
| `C:update(dt, dtSim)` | Appel par image : gère le fondu proche/lointain, la rotation vers la normale ou la caméra, les couleurs et l'alpha de la base, des côtés et de la version distante. | 104 |

## Appels vers le moteur (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceMarkers/sideMarker.lua`.*
