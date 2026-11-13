# `career_modules_tutorial_step02moveOff`

*Fichier : `lua/ge/extensions/career/modules/tutorial/step02moveOff.lua` · VM : Game Engine (GE) · 262 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tutorial_step02moveOff` : `extensions.load("career_modules_tutorial_step02moveOff")`, puis la globale `career_modules_tutorial_step02moveOff`

Étape 2 du tutoriel de carrière (« moveOff ») : apprendre à démarrer le véhicule selon le mode de boîte réglé à l'étape 1. Trois modes (déduits du réglage gearboxMode et de autoClutch) : arcade, realistic_clutch (passer la 1re puis accélérer) et realistic_no_clutch (embrayage manuel, avec récupération en cas de calage moteur). L'étape se termine quand le véhicule s'est déplacé d'au moins 3 m, puis active 03basicManeuvers après 1 s.

## Remarques

- Seuils : déplacement 3 m, entrée d'accélérateur 0,2, 1re vitesse = gearIndex 1.
- Le calage est détecté par un passage de ignitionLevel de 2 à 0 ou 1 (mode sans embrayage uniquement).
- Les hooks sont appelés par le runtime du tutoriel.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tutorial_step02moveOff.cleanup()` | Retire le gestionnaire de sortie de zone, désenregistre les notifications du véhicule et vide la liste de tâches. *(interne)* | 229 |
| `career_modules_tutorial_step02moveOff.onCareerTutorialLeftBounds()` | Hook de sortie de zone : lance le reset de sortie de zone de l'étape. *(interne)* *(hook)* | 149 |
| `career_modules_tutorial_step02moveOff.onDebugMenu(im)` | Affiche le mode courant et un bouton pour sauter l'étape (active 03basicManeuvers). *(interne)* *(hook)* | 252 |
| `career_modules_tutorial_step02moveOff.onUpdate(dtReal, dtSim, dtRaw)` | Appelé chaque frame : lit les entrées du véhicule en cache, gère le calage, valide les objectifs et avance à l'étape 03 quand la distance de 3 m est atteinte. *(interne)* *(hook)* | 153 |
| `career_modules_tutorial_step02moveOff.setup(stepData)` | Appelé à l'activation : réinitialise l'état, active la zone evalZone, enregistre les notifications throttle_input, clutch, gearIndex, ignitionLevel, lit le comportement de boîte (mainController/gearboxMode), choisit le mode, débloque les actions de changement de vitesse, dégèle le véhicule et construit la liste de tâches. *(interne)* | 93 |

### Détail des paramètres

#### `career_modules_tutorial_step02moveOff.onDebugMenu(im)`

Affiche le mode courant et un bouton pour sauter l'étape (active 03basicManeuvers).

- `im` (*table*) : Table ui_imgui.

#### `career_modules_tutorial_step02moveOff.onUpdate(dtReal, dtSim, dtRaw)`

Appelé chaque frame : lit les entrées du véhicule en cache, gère le calage, valide les objectifs et avance à l'étape 03 quand la distance de 3 m est atteinte.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta simulation (s).
- `dtRaw` (*number*) : Delta brut (s).

#### `career_modules_tutorial_step02moveOff.setup(stepData)`

Appelé à l'activation : réinitialise l'état, active la zone evalZone, enregistre les notifications throttle_input, clutch, gearIndex, ignitionLevel, lit le comportement de boîte (mainController/gearboxMode), choisit le mode, débloque les actions de changement de vitesse, dégèle le véhicule et construit la liste de tâches.

- `stepData` (*any*) : Données de l'étape (non utilisées).

**Évènements UI (guihooks.trigger) :** `ClearTasklist`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tutorial/step02moveOff.lua`.*
