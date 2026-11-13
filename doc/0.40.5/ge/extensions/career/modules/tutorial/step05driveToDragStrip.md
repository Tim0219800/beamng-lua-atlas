# `career_modules_tutorial_step05driveToDragStrip`

*Fichier : `lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua` · VM : Game Engine (GE) · 256 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tutorial_step05driveToDragStrip` : `extensions.load("career_modules_tutorial_step05driveToDragStrip")`, puis la globale `career_modules_tutorial_step05driveToDragStrip`

Étape 5 du tutoriel de carrière (« driveToDragStrip ») : le joueur conduit jusqu'au drag strip, avec guidage au sol et marqueur, puis gare le véhicule sur la place beforeDragStrip (immobile 1 s). Phases : waitPopup, driveToStrip, parkInStaging (déclenchée à moins de 25 m de la place). Ensuite l'étape 06dragStripBasics est activée. Active les zones drivingToDragBounds et parkingBounds.

## Remarques

- Au départ, le véhicule est téléporté sur la place simpleTimeTrialFinish (fin de l'étape 4) et le trafic est restauré (career_modules_playerDriving.restoreTrafficAfterTutorialPhase).
- Le drapeau d'attention de l'objectif « conduire jusqu'au strip » est retiré après 5 m parcourus.
- Les préfabriqués sont changés 0,5 s après le début de l'étape.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tutorial_step05driveToDragStrip.cleanup()` | Retire le reset de zone, le guidage, la liste de tâches et les visuels de la place de parking. *(interne)* | 230 |
| `career_modules_tutorial_step05driveToDragStrip.onCareerTutorialLeftBounds()` | Hook de sortie de zone : lance le reset de sortie de zone de l'étape. *(interne)* *(hook)* | 192 |
| `career_modules_tutorial_step05driveToDragStrip.onDebugMenu(im)` | Affiche la phase et un bouton « Skip Step 5 » (téléporte le véhicule sur beforeDragStrip puis active l'étape 6). *(interne)* *(hook)* | 237 |
| `career_modules_tutorial_step05driveToDragStrip.onIntroPopupCareerClosed(id)` | Hook de fermeture de popup : à la fermeture de v2/driveToDragStrip, passe en phase driveToStrip et affiche l'objectif. *(interne)* *(hook)* | 180 |
| `career_modules_tutorial_step05driveToDragStrip.onUpdate(dtReal, dtSim, dtRaw)` | Appelé chaque frame : suit la distance parcourue et la distance à la place, passe en phase de parking et valide l'objectif de parking avant d'activer 06dragStripBasics (après 1 s). *(interne)* *(hook)* | 196 |
| `career_modules_tutorial_step05driveToDragStrip.setup(stepData)` | Appelé à l'activation : restaure le trafic, active les zones, installe le reset de sortie de zone (retour à simpleTimeTrialFinish), prépare le véhicule (allumage, dégel, joueur au volant), trace le guidage, crée le marqueur, affiche la popup v2/driveToDragStrip et bascule les préfabriqués. *(interne)* | 114 |

### Détail des paramètres

#### `career_modules_tutorial_step05driveToDragStrip.onDebugMenu(im)`

Affiche la phase et un bouton « Skip Step 5 » (téléporte le véhicule sur beforeDragStrip puis active l'étape 6).

- `im` (*table*) : Table ui_imgui.

#### `career_modules_tutorial_step05driveToDragStrip.onIntroPopupCareerClosed(id)`

Hook de fermeture de popup : à la fermeture de v2/driveToDragStrip, passe en phase driveToStrip et affiche l'objectif.

- `id` (*string*) : Id de la popup.

#### `career_modules_tutorial_step05driveToDragStrip.onUpdate(dtReal, dtSim, dtRaw)`

Appelé chaque frame : suit la distance parcourue et la distance à la place, passe en phase de parking et valide l'objectif de parking avant d'activer 06dragStripBasics (après 1 s).

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta simulation (s).
- `dtRaw` (*number*) : Delta brut (s).

#### `career_modules_tutorial_step05driveToDragStrip.setup(stepData)`

Appelé à l'activation : restaure le trafic, active les zones, installe le reset de sortie de zone (retour à simpleTimeTrialFinish), prépare le véhicule (allumage, dégel, joueur au volant), trace le guidage, crée le marqueur, affiche la popup v2/driveToDragStrip et bascule les préfabriqués.

- `stepData` (*any*) : Données de l'étape (non utilisées).

**Évènements UI (guihooks.trigger) :** `ClearTasklist`, `DiscardTasklistItem`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tutorial/step05driveToDragStrip.lua`.*
