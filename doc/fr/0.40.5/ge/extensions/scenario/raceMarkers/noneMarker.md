# `scenario_raceMarkers_noneMarker`

*Fichier : `lua/ge/extensions/scenario/raceMarkers/noneMarker.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/scenario/raceMarkers/noneMarker")` (fichier sous extensions/ mais pas une extension classique)

Marqueur de checkpoint « vide » : il implémente l'interface commune des marqueurs de course (init, update, setToCheckpoint, setMode, setVisibility, hide, show, createMarkers, clearMarkers) sans rien afficher. Sert à désactiver les marqueurs visuels. Le module renvoie un constructeur : require('scenario/raceMarkers/noneMarker')(id) donne un objet de la classe C.

## Remarques

- C:init n'enregistre pas l'identifiant : self.id reste nil. Utilisé via scenario_race_marker.createRaceMarker (qui range le marqueur dans idToMarker[marker.id]), cela produit une clé nil et une erreur Lua : probable bug.
- Toutes les méthodes sont vides, sauf hide et show qui appellent setVisibility (vide).

## Classe `C`

Marqueur sans effet visuel, interface identique aux autres marqueurs de course.

Le module renvoie un constructeur : `local obj = require("scenario_raceMarkers_noneMarker")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearMarkers()` | Ne supprime rien. | 35 |
| `C:createMarkers()` | Ne crée aucun objet. | 31 |
| `C:hide()` | Appelle setVisibility(false). | 27 |
| `C:init(id)` | Constructeur appelé par le module : ne fait rien (l'id n'est pas mémorisé). | 8 |
| `C:setMode(mode)` | Ne fait rien. | 20 |
| `C:setToCheckpoint(wp, mode)` | Ne fait rien. | 17 |
| `C:setVisibility(v)` | Ne fait rien. | 24 |
| `C:show()` | Appelle setVisibility(true). | 28 |
| `C:update()` | Appel par image : ne fait rien. | 12 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceMarkers/noneMarker.lua`.*
