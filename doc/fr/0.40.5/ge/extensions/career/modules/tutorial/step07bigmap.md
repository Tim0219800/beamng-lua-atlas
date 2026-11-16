# `career_modules_tutorial_step07bigmap`

*Fichier : `lua/ge/extensions/career/modules/tutorial/step07bigmap.lua` · VM : Game Engine (GE) · 249 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tutorial_step07bigmap` : `extensions.load("career_modules_tutorial_step07bigmap")`, puis la globale `career_modules_tutorial_step07bigmap`

Étape 7 du tutoriel de carrière (« bigmap ») : apprendre la grande carte. Le joueur l'ouvre, lit une popup (v2/bigmapTutorial), sélectionne le point d'intérêt du garage (tutorial_apm_parking), définit un itinéraire vers lui (à 10 m de la place garageExteriorPark), puis ferme la carte ; l'étape suivante s'active 1 s après. Un message d'aide sur le bulletin de temps (timeslip) s'affiche dans la zone timeslipHint quand la carte est fermée.

## Remarques

- L'action toggleBigMap est débloquée pour l'étape (blockedActionsTemplates.bigMap = false).
- En sortie de zone, le véhicule est téléporté sur la place beforeDragStrip.
- Les hooks onActivateBigMapCallback / onDeactivateBigMapCallback / onPoiSelectedFromBigmap / onSetBigmapNavFocus sont émis par la grande carte ; ils sont ignorés si l'étape courante n'est pas 07bigmap.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tutorial_step07bigmap.cleanup()` | Retire le reset de zone, le message timeslip et la liste de tâches. *(interne)* | 226 |
| `career_modules_tutorial_step07bigmap.onActivateBigMapCallback()` | Hook émis à l'ouverture de la grande carte : masque l'aide timeslip et, à la première ouverture, ouvre la popup v2/bigmapTutorial après 0,5 s. *(interne)* *(hook)* | 151 |
| `career_modules_tutorial_step07bigmap.onCareerTutorialLeftBounds()` | Hook de sortie de zone : lance le reset de sortie de zone de l'étape. *(interne)* *(hook)* | 146 |
| `career_modules_tutorial_step07bigmap.onDeactivateBigMapCallback()` | Hook émis à la fermeture de la grande carte : si l'itinéraire est posé, valide l'objectif de fermeture et avance d'étape après 1 s. *(interne)* *(hook)* | 200 |
| `career_modules_tutorial_step07bigmap.onDebugMenu(im)` | Affiche l'état de l'étape et un bouton « Skip Step 7 ». *(interne)* *(hook)* | 234 |
| `career_modules_tutorial_step07bigmap.onIntroPopupCareerClosed(id)` | Hook de fermeture de popup : à la fermeture de v2/bigmapTutorial, affiche l'objectif de sélection d'un POI. *(interne)* *(hook)* | 167 |
| `career_modules_tutorial_step07bigmap.onPoiSelectedFromBigmap(poiId)` | Hook émis quand un POI est sélectionné : valide l'objectif si c'est le POI du garage. *(interne)* *(hook)* | 175 |
| `career_modules_tutorial_step07bigmap.onSetBigmapNavFocus(pos)` | Hook émis quand un itinéraire est défini sur la carte : valide l'objectif si la destination est à moins de 10 m du garage. *(interne)* *(hook)* | 187 |
| `career_modules_tutorial_step07bigmap.onUpdate(dtReal, dtSim, dtRaw)` | Appelé chaque frame : affiche ou masque le message d'aide timeslip selon que le joueur est dans la zone timeslipHint, dans les limites et que la carte est fermée. *(interne)* *(hook)* | 213 |
| `career_modules_tutorial_step07bigmap.setup(stepData)` | Appelé à l'activation : remet les objectifs à zéro, débloque la grande carte, active les zones drivingToDragBounds et dragStripBounds, affiche le message « ouvrir la grande carte » et vide les POI bruts. *(interne)* | 118 |

### Détail des paramètres

#### `career_modules_tutorial_step07bigmap.onDebugMenu(im)`

Affiche l'état de l'étape et un bouton « Skip Step 7 ».

- `im` (*table*) : Table ui_imgui.

#### `career_modules_tutorial_step07bigmap.onIntroPopupCareerClosed(id)`

Hook de fermeture de popup : à la fermeture de v2/bigmapTutorial, affiche l'objectif de sélection d'un POI.

- `id` (*string*) : Id de la popup.

#### `career_modules_tutorial_step07bigmap.onPoiSelectedFromBigmap(poiId)`

Hook émis quand un POI est sélectionné : valide l'objectif si c'est le POI du garage.

- `poiId` (*string*) : Id du POI sélectionné.

#### `career_modules_tutorial_step07bigmap.onSetBigmapNavFocus(pos)`

Hook émis quand un itinéraire est défini sur la carte : valide l'objectif si la destination est à moins de 10 m du garage.

- `pos` (*table*) : Position de destination (champs x, y, z).

#### `career_modules_tutorial_step07bigmap.onUpdate(dtReal, dtSim, dtRaw)`

Appelé chaque frame : affiche ou masque le message d'aide timeslip selon que le joueur est dans la zone timeslipHint, dans les limites et que la carte est fermée.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta simulation (s).
- `dtRaw` (*number*) : Delta brut (s).

#### `career_modules_tutorial_step07bigmap.setup(stepData)`

Appelé à l'activation : remet les objectifs à zéro, débloque la grande carte, active les zones drivingToDragBounds et dragStripBounds, affiche le message « ouvrir la grande carte » et vide les POI bruts.

- `stepData` (*any*) : Données de l'étape (non utilisées).

**Évènements UI (guihooks.trigger) :** `ClearTasklist`, `DiscardTasklistItem`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tutorial/step07bigmap.lua`.*
