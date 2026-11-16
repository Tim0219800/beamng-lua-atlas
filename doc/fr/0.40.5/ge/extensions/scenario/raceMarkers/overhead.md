# `scenario_raceMarkers_overhead`

*Fichier : `lua/ge/extensions/scenario/raceMarkers/overhead.lua` · VM : Game Engine (GE) · 206 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/scenario/raceMarkers/overhead")` (fichier sous extensions/ mais pas une extension classique)

Marqueur de checkpoint « flèche en hauteur » : une flèche (s_mm_arrow_ribbon_down.dae) tournée vers la caméra, qui oscille verticalement au-dessus du point, colorée selon le mode et dont la transparence augmente de près (fondu entre fadeNear et fadeFar). Le module renvoie un constructeur : require('scenario/raceMarkers/overhead')(id) donne un objet de la classe C.

## Remarques

- Couleurs par mode : default orange (1, 0.333, 0), next noir, start et lap vert, final bleu, branch (1, 0.6, 0.07), hidden noir.
- setToCheckpoint(wp) lit wp.pos, wp.radius, wp.fadeNear et wp.fadeFar (défauts 5 et 25 m).
- Dans update, le facteur de mélange de couleur t est fixé à 1 : le changement de mode est immédiat, sans fondu.
- Le commentaire de setToCheckpoint cite des modes (finish, etc.) : les noms réels sont ceux de modeInfos (final, lap...).

## Classe `C`

Marqueur flèche au-dessus du checkpoint.

Le module renvoie un constructeur : `local obj = require("scenario_raceMarkers_overhead")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearMarkers()` | Supprime l'objet créé. | 189 |
| `C:createMarkers()` | Supprime les anciens objets puis crée la flèche. | 179 |
| `C:createObject(shapeName, objectName)` | Crée un TSStatic caché enregistré sous objectName et ajouté à ScenarioObjectsGroup. | 157 |
| `C:hide()` | Appelle setVisibility(false). | 153 |
| `C:init(id)` | Constructeur : initialise l'état. | 49 |
| `C:setMode(mode)` | 'hidden' masque, autre mode affiche ; mémorise l'ancien et le nouveau mode. | 129 |
| `C:setToCheckpoint(wp)` | Place le marqueur sur un checkpoint. | 116 |
| `C:setVisibility(v)` | Affiche ou cache la flèche. | 144 |
| `C:show()` | Appelle setVisibility(true). | 154 |
| `C:update(dt, dtSim)` | Appel par image : oriente la flèche vers la caméra, l'anime (0.4 + 0.4*sin) et ajuste couleur et alpha selon la distance. | 74 |

## Appels vers le moteur (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceMarkers/overhead.lua`.*
