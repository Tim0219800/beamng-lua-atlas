# `scenario_raceMarkers_parkingraceSpotMarker`

*Fichier : `lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua` · VM : Game Engine (GE) · 169 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/scenario/raceMarkers/parkingraceSpotMarker")` (fichier sous extensions/ mais pas une extension classique)

Marqueur d'une place de parking pour les courses de parking : trois contours empilés (park_outline_marker.dae, hauteur 1.2 m) et un décalque rayé au sol (parkDecalStripes.png, via Engine.Render.DynamicDecalMgr), dont la couleur est lissée dans le temps. Ce n'est pas un marqueur de checkpoint classique : il n'a pas de setToCheckpoint ni de setMode, on le règle avec setSpot et setColor. Le module renvoie un constructeur : require('scenario/raceMarkers/parkingraceSpotMarker')(id) donne un objet de la classe C.

## Exemple

```lua
local m = require('scenario/raceMarkers/parkingraceSpotMarker')('spot1')
m:createMarkers()
m:setSpot(vec3(100, 50, 10), quat(0, 0, 0, 1), vec3(2.5, 5, 0.5))
m:setColor({0, 1, 0, 1})
m:show()
-- à chaque image :
m:update(dt)
```

## Remarques

- setSpot(pos, rot, scl) : pos est le centre, scl la taille COMPLÈTE de la place sur chaque axe. L'échelle XY des contours suit la convention parkingMarker.lua (scl.y / 2.05).
- setColor accepte {r, g, b, a} (indices 1 à 4) ou une table avec champs r/g/b/a ; les composantes sont lissées avec un taux de 8. Les contours sont toujours opaques (alpha 1), le décalque a un alpha multiplié par 0.9 et un fondu entre 3.5 et 6 m.
- Les décalques doivent être renvoyés à chaque image : update appelle Engine.Render.DynamicDecalMgr.addDecals à chaque appel (alors que visible est vrai).
- Ce marqueur ne possède pas de méthode setMode ni setToCheckpoint : l'utiliser via scenario_race_marker.setModes ou setToCheckpoints échouerait.
- update ne prend que dt (le lisseur de couleur en dépend). Les contours ne sont pas ajoutés à ScenarioObjectsGroup.
- La page extraite affiche setSpot(rot, scl) ; la signature réelle est setSpot(pos, rot, scl).

## Classe `C`

Marqueur de place de parking avec contours et décalque.

Le module renvoie un constructeur : `local obj = require("scenario_raceMarkers_parkingraceSpotMarker")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearMarkers()` | Supprime les contours (après vérification qu'ils existent encore) et les données de décalque. | 70 |
| `C:createMarkers()` | Supprime les anciens objets puis crée trois contours TSStatic (collision et décalque désactivés) et prépare les données du décalque au sol. | 39 |
| `C:hide()` | Appelle setVisibility(false). | 131 |
| `C:init(id)` | Constructeur : initialise position, rotation, taille (2.5 x 5 x 0.5), couleurs et lisseurs. | 18 |
| `C:setColor(color)` | Fixe la couleur cible (lissée ensuite). | 114 |
| `C:setSpot(pos, rot, scl)` | Configure la place : position, rotation et taille, appliquées aux contours et au décalque. | 86 |
| `C:setVisibility(v)` | Affiche ou cache les contours. | 122 |
| `C:show()` | Appelle setVisibility(true). | 130 |
| `C:update(dt)` | Appel par image quand visible : avance les lisseurs de couleur, colore les contours et renvoie le décalque au gestionnaire de décalques dynamiques. | 133 |

## Appels vers le moteur (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceMarkers/parkingraceSpotMarker.lua`.*
