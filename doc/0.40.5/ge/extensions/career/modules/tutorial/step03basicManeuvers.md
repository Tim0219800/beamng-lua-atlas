# `career_modules_tutorial_step03basicManeuvers`

*Fichier : `lua/ge/extensions/career/modules/tutorial/step03basicManeuvers.lua` · VM : Game Engine (GE) · 186 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tutorial_step03basicManeuvers` : `extensions.load("career_modules_tutorial_step03basicManeuvers")`, puis la globale `career_modules_tutorial_step03basicManeuvers`

Étape 3 du tutoriel de carrière (« basicManeuvers ») : le joueur conduit librement (message sur le changement de caméra) puis doit garer le véhicule sur la place de parking nommée simpleCourseStart (marqueur + décalque au sol). Le objectif est validé quand le véhicule reste immobile dans la place pendant 1 s (gameplay_tutorial_markers.checkParkGoalWithStationaryTime) ; l'étape suivante est alors activée après 1,5 s.

## Remarques

- Si la place simpleCourseStart est introuvable dans les sites du tutoriel, un avertissement est loggé et l'objectif de parking ne peut pas se valider.
- Les hooks sont appelés par le runtime du tutoriel.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tutorial_step03basicManeuvers.cleanup()` | Appelé à la fin de l'étape : retire le reset de sortie de zone, vide la liste de tâches, supprime marqueur et décalque. *(interne)* | 125 |
| `career_modules_tutorial_step03basicManeuvers.onCareerTutorialLeftBounds()` | Hook de sortie de zone : lance le reset de sortie de zone de l'étape. *(interne)* *(hook)* | 107 |
| `career_modules_tutorial_step03basicManeuvers.onDebugMenu(im)` | Affiche l'état des objectifs et un bouton « Skip Step 3 » (téléporte le véhicule sur la place et avance). *(interne)* *(hook)* | 164 |
| `career_modules_tutorial_step03basicManeuvers.onUpdate(dtReal, dtSim, dtRaw)` | Appelé chaque frame : teste l'objectif de parking ; une fois validé, passe à l'étape suivante après 1,5 s. *(interne)* *(hook)* | 112 |
| `career_modules_tutorial_step03basicManeuvers.setup(stepData)` | Appelé à l'activation : réinitialise l'objectif, active la zone evalZone, installe le reset de sortie de zone, puis démarre directement la phase de parking (débloque les vitesses, dégèle le véhicule, crée le marqueur). *(interne)* | 89 |

### Détail des paramètres

#### `career_modules_tutorial_step03basicManeuvers.onDebugMenu(im)`

Affiche l'état des objectifs et un bouton « Skip Step 3 » (téléporte le véhicule sur la place et avance).

- `im` (*table*) : Table ui_imgui.

#### `career_modules_tutorial_step03basicManeuvers.onUpdate(dtReal, dtSim, dtRaw)`

Appelé chaque frame : teste l'objectif de parking ; une fois validé, passe à l'étape suivante après 1,5 s.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta simulation (s).
- `dtRaw` (*number*) : Delta brut (s).

#### `career_modules_tutorial_step03basicManeuvers.setup(stepData)`

Appelé à l'activation : réinitialise l'objectif, active la zone evalZone, installe le reset de sortie de zone, puis démarre directement la phase de parking (débloque les vitesses, dégèle le véhicule, crée le marqueur).

- `stepData` (*any*) : Données de l'étape (non utilisées).

**Évènements UI (guihooks.trigger) :** `ClearTasklist`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tutorial/step03basicManeuvers.lua`.*
