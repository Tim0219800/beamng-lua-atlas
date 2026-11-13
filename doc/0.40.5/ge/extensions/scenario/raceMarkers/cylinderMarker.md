# `scenario_raceMarkers_cylinderMarker`

*Fichier : `lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua` · VM : Game Engine (GE) · 170 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/scenario/raceMarkers/cylinderMarker")` (fichier sous extensions/ mais pas une extension classique)

Marqueur de checkpoint « cylindre » : une base plate au sol (checkpoint_marker_base.dae) et un cylindre haut de 50 unités (checkpoint_marker.dae) colorés selon le mode, avec une transparence qui augmente avec la distance de la caméra. Le module renvoie un constructeur : require('scenario/raceMarkers/cylinderMarker')(id) donne un objet de la classe C.

## Remarques

- Couleurs par mode : default rouge (1, 0.07, 0), next gris (0.3), start et lap vert (0.4, 1, 0.2), recovery jaune (1, 0.85, 0), final bleu (0.1, 0.3, 1), branch orange (1, 0.6, 0). 'hidden' masque le marqueur.
- setToCheckpoint(wp) lit wp.pos, wp.radius, et facultativement wp.fadeNear et wp.fadeFar (distances d'apparition, 0 et 70 par défaut). La base est mise à l'échelle 2*radius, le cylindre à radius x radius x 50.
- L'alpha vaut clamp((distance - radius/2 - fadeNear) / (fadeFar - fadeNear), 0, 1) : le marqueur est transparent de près et opaque de loin. Base alpha *0.75, cylindre *0.95.
- Mode initial 'current' (non défini dans modeInfos) ; setMode doit être appelé avec un mode connu avant tout affichage coloré, sinon la couleur est {0,0,0,0}.
- update(dt, dtSim) est appelé par scenario_race_marker.render ; ses paramètres ne sont pas utilisés.

## Classe `C`

Marqueur cylindre de checkpoint.

Le module renvoie un constructeur : `local obj = require("scenario_raceMarkers_cylinderMarker")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearMarkers()` | Supprime les objets créés. | 152 |
| `C:createMarkers()` | Supprime les anciens objets puis crée la base et le cylindre. | 138 |
| `C:createObject(shapeName, objectName)` | Crée un TSStatic caché enregistré sous objectName et ajouté à ScenarioObjectsGroup. | 116 |
| `C:hide()` | Appelle setVisibility(false). | 112 |
| `C:init(id)` | Constructeur : initialise l'état (invisible, tables de couleurs par mode copiées). | 25 |
| `C:setMode(mode)` | Choisit la couleur selon le mode ('hidden' masque, sinon affiche). | 89 |
| `C:setToCheckpoint(wp)` | Place base et cylindre sur un checkpoint. | 71 |
| `C:setVisibility(v)` | Affiche ou cache la base et le cylindre. | 102 |
| `C:show()` | Appelle setVisibility(true). | 113 |
| `C:update()` | Appel par image : recalcule la transparence d'après la distance à la caméra (core_camera.getPosition) et met à jour les couleurs d'instance. | 46 |

## Appels vers le moteur (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceMarkers/cylinderMarker.lua`.*
