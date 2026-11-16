# `scenario_raceMarkers_singleHologramMarker`

*Fichier : `lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua` · VM : Game Engine (GE) · 228 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/scenario/raceMarkers/singleHologramMarker")` (fichier sous extensions/ mais pas une extension classique)

Marqueur de checkpoint « colonne hologramme » : une seule colonne centrale (s_single_faded_column_rect.dae) posée sur le sol par lancer de rayon, colorée selon le mode, qui s'allonge avec la distance et oscille légèrement. Le module renvoie un constructeur : require('scenario/raceMarkers/singleHologramMarker')(id) donne un objet de la classe C.

## Remarques

- setToCheckpoint(wp) lit wp.pos, wp.radius, wp.normal (défaut (1,1,0) normalisé), wp.fadeNear, wp.fadeFar, wp.minAlpha.
- Couleurs par mode : default bleu (0, 0.4, 1), next noir (colonne amincie à 0.75), start et lap vert (0.4, 1, 0.2), recovery jaune (1, 0.85, 0), final bleu (0.1, 0.3, 1), branch orange (1, 0.6, 0), hidden amincit à 0. Fondu de 0.8 s entre deux modes.
- Le sol est trouvé avec Engine.castRay (6 m au-dessus, 25 m en dessous) en coupant temporairement la collision de la forêt ; si le sol est plus de 1 m sous la position d'origine, la position d'origine est gardée.
- L'alpha de la colonne vaut clamp((distance - 60) / 60, 0.15, 1) : plus visible de loin.
- update plante si appelé avant setToCheckpoint (centerPos nil) ; scenario_race_marker appelle toujours setToCheckpoint d'abord.
- La page extraite affiche update(dtSim) ; la signature réelle est update(dt, dtSim).

## Classe `C`

Marqueur colonne unique.

Le module renvoie un constructeur : `local obj = require("scenario_raceMarkers_singleHologramMarker")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearMarker(id)` | Supprime un objet à partir de son identifiant. | 210 |
| `C:clearMarkers()` | Supprime la colonne. | 217 |
| `C:createMarkers()` | Supprime l'ancien objet puis crée la colonne. | 205 |
| `C:createObject(shapeName, objectName)` | Crée un TSStatic caché enregistré sous objectName et ajouté à ScenarioObjectsGroup. | 184 |
| `C:hide()` | Appelle setVisibility(false). | 181 |
| `C:init(id)` | Constructeur : initialise l'état. | 74 |
| `C:setMode(mode)` | Change de mode : affiche (sauf 'hidden') et lance le fondu. | 163 |
| `C:setToCheckpoint(wp)` | Pose la colonne sur le sol sous le checkpoint. | 131 |
| `C:setVisibility(v)` | Affiche ou cache la colonne. | 173 |
| `C:show()` | Appelle setVisibility(true). | 182 |
| `C:update(dt, dtSim)` | Appel par image : fondu, couleur, alpha et hauteur de colonne selon la distance, oscillation. | 94 |

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `obj:` `delete`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceMarkers/singleHologramMarker.lua`.*
