# `scenario_raceMarkers_directionMarker`

*Fichier : `lua/ge/extensions/scenario/raceMarkers/directionMarker.lua` · VM : Game Engine (GE) · 165 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/scenario/raceMarkers/directionMarker")` (fichier sous extensions/ mais pas une extension classique)

Marqueur de checkpoint « flèche de direction » : une flèche flottante (s_mm_arrow_floating.dae) orientée selon la rotation du checkpoint, avec un léger va-et-vient le long de son axe avant. Sa couleur suit core_groundMarkers.floatingArrowColor (bleu 0, 0.4, 1 par défaut). Le module renvoie un constructeur : require('scenario/raceMarkers/directionMarker')(id) donne un objet de la classe C.

## Remarques

- setToCheckpoint(wp) exige wp.pos ; wp.rot (quaternion sous forme de table ou userdata x,y,z,w) donne l'orientation, wp.radius l'échelle (3 par défaut). Sans wp.pos, l'appel est ignoré.
- Amplitude du va-et-vient : 0.08 m, fréquence liée à os.clock()*3.
- Le mode n'a aucun effet visuel : seul 'hidden' masque, les autres modes affichent.

## Classe `C`

Marqueur flèche de direction.

Le module renvoie un constructeur : `local obj = require("scenario_raceMarkers_directionMarker")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearMarkers()` | Supprime l'objet créé. | 146 |
| `C:createMarkers()` | Supprime les anciens objets puis crée la flèche. | 135 |
| `C:createObject(shapeName, objectName)` | Crée un TSStatic caché (avec instanceColor et instanceColor1) enregistré sous objectName et ajouté à ScenarioObjectsGroup. | 112 |
| `C:hide()` | Appelle setVisibility(false). | 109 |
| `C:init(id)` | Constructeur : initialise l'état. | 43 |
| `C:setMode(mode)` | 'hidden' masque, autre mode affiche ; mémorise le mode. | 88 |
| `C:setToCheckpoint(wp)` | Place la flèche sur un checkpoint et applique la couleur. | 73 |
| `C:setVisibility(v)` | Affiche ou cache la flèche. | 100 |
| `C:show()` | Appelle setVisibility(true). | 110 |
| `C:update(dt, dtSim)` | Appel par image : applique position (avec va-et-vient), rotation et échelle à la flèche. | 56 |

## Appels vers le moteur (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceMarkers/directionMarker.lua`.*
