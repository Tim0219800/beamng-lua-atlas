# `scenario_raceMarkers_parkingAttention`

*Fichier : `lua/ge/extensions/scenario/raceMarkers/parkingAttention.lua` · VM : Game Engine (GE) · 137 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/scenario/raceMarkers/parkingAttention")` (fichier sous extensions/ mais pas une extension classique)

Marqueur d'attention pour une place de parking : dessine en debug (debugDrawer:drawTriSolid) les quatre parois bleues translucides (alpha 25 %) d'un parallélépipède autour de la place, hauteur 1.33 m, double face. Aucun objet de scène n'est créé. Le module renvoie un constructeur : require('scenario/raceMarkers/parkingAttention')(id) donne un objet de la classe C.

## Remarques

- setToCheckpoint(wp) accepte soit wp = {pos, rot, scl} (centre, quaternion, taille complète de la place), soit wp.parkingSpot avec ces trois champs ; sinon seul wp.pos et wp.radius sont mémorisés et rien n'est dessiné.
- La couleur est fixe (0, 0.4, 1) quel que soit le mode.
- La page extraite affiche update(dtSim) ; la signature réelle est update(dt, dtSim).

## Classe `C`

Parois de debug autour d'une place de parking.

Le module renvoie un constructeur : `local obj = require("scenario_raceMarkers_parkingAttention")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:clearMarkers()` | Efface la table d'identifiants. | 126 |
| `C:createMarkers()` | Conservé pour la compatibilité d'API avec les autres marqueurs : ne crée aucun objet. | 122 |
| `C:hide()` | Appelle setVisibility(false). | 118 |
| `C:init(id)` | Constructeur : initialise l'état. | 34 |
| `C:setMode(mode)` | 'hidden' masque, autre mode affiche. | 101 |
| `C:setToCheckpoint(wp)` | Mémorise la place de parking à entourer. | 79 |
| `C:setVisibility(v)` | Active ou désactive le dessin. | 114 |
| `C:show()` | Appelle setVisibility(true). | 119 |
| `C:update(dt, dtSim)` | Appel par image : avance le minuteur de mode, masque après le fondu en 'hidden' et dessine les quatre parois si une place est définie. | 49 |

## Appels vers le moteur (C++)

- `debugDrawer:` `drawTriSolid`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/scenario/raceMarkers/parkingAttention.lua`.*
