# `scenario_raceMarkers_ringMarker`

*Fichier : `lua/ge/extensions/scenario/raceMarkers/ringMarker.lua` · VM : Game Engine (GE) · 222 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/scenario/raceMarkers/ringMarker")` (fichier sous extensions/ mais pas une extension classique)

Marqueur de checkpoint « anneau » : un anneau 3D (checkpoint_ring.dae, ou checkpoint_ring_finish.dae pour les modes lap et final) orienté selon la normale du checkpoint et coloré selon le mode, avec un fondu de 0.3 s entre deux modes. Le module renvoie un constructeur : require('scenario/raceMarkers/ringMarker')(id) donne un objet de la classe C.

## Remarques

- Couleurs par mode : default rouge (1, 0.07, 0), next noir, start et lap vert (0.4, 1, 0.2), final bleu (0.1, 0.3, 1), branch orange (1, 0.6, 0), hidden noir (fondu sortant puis masqué).
- setToCheckpoint(wp) lit wp.pos, wp.radius, wp.normal (direction de l'anneau), wp.up (vec3, défaut 0,0,1) et wp.mode (choisit le modèle).
- Dans setToCheckpoint l'échelle est radius+1.5, mais update la ramène à radius : l'écart ne dure qu'à la première image.
- La page extraite affiche update(dtSim) ; la signature réelle est update(dt, dtSim).

## Classe `C`

Marqueur anneau de checkpoint.

Le module renvoie un constructeur : `local obj = require("scenario_raceMarkers_ringMarker")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearMarkers()` | Supprime l'objet créé. | 205 |
| `C:createMarkers()` | Supprime les anciens objets puis crée l'anneau. | 195 |
| `C:createObject(shapeName, objectName)` | Crée un TSStatic caché enregistré sous objectName et ajouté à ScenarioObjectsGroup. | 173 |
| `C:hide()` | Appelle setVisibility(false). | 169 |
| `C:init(id)` | Constructeur : initialise l'état et copie la table des modes. | 56 |
| `C:setMode(mode)` | Passe à un mode : affiche (sauf 'hidden'), démarre le fondu de couleur depuis l'ancien mode et change le modèle. | 146 |
| `C:setToCheckpoint(wp)` | Place l'anneau (position, modèle selon wp.mode, rotation) sur un checkpoint. | 127 |
| `C:setVisibility(v)` | Affiche ou cache l'anneau. | 162 |
| `C:show()` | Appelle setVisibility(true). | 170 |
| `C:update(dt, dtSim)` | Appel par image : avance le fondu de couleur, masque l'anneau une fois en mode 'hidden', met à jour échelle et couleur. | 81 |

## Appels vers le moteur (C++)

- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceMarkers/ringMarker.lua`.*
