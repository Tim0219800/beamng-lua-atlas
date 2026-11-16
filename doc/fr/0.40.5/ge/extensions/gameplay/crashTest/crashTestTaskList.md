# `gameplay_crashTest_crashTestTaskList`

*Fichier : `lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua` · VM : Game Engine (GE) · 165 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_crashTest_crashTestTaskList` : `extensions.load("gameplay_crashTest_crashTestTaskList")`, puis la globale `gameplay_crashTest_crashTestTaskList`

Alimente la liste de tâches de l'UI (évènements SetTasklistHeader et SetTasklistTask) pour le scénario de crash test. Chaque étape devient une tâche de type 'goal' identifiée par l'id du véhicule joueur (plVehId) ; libellé et sous-texte sont construits depuis l'objectif, la vitesse d'impact et les conditions de dégâts. Les hooks marquent la tâche active, échouée ou terminée.

## Remarques

- L'id de tâche est stepData.plVehId : si plusieurs étapes ont le même véhicule joueur, elles partagent la même id côté UI.
- Libellé : 'Simple crash' -> « Crash into the marked target(s) » ; 'Crash target vehicle into target area' -> « Redirect the target into the highlighted area » ; autre objectif -> nil.
- Sous-texte : vitesse d'impact convertie par translateVelocity (unité du joueur), suivie du texte sur les dégâts (« Minimize damage », « Maximize damage », « At least X damage », « Not more than X damage »). Aucun espace n'est inséré entre la vitesse et le texte de dégâts.
- resetTasklist est défini mais jamais appelé ni exporté.
- clearTasklist et reset plantent si setCrashTestDataAndInit n'a pas été appelé (crashTestData nil).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_crashTest_crashTestTaskList.finishedCurrentTask(stepData)` | Marque la tâche de l'étape comme terminée (done = true). | 134 |
| `gameplay_crashTest_crashTestTaskList.onCrashTestStepFailed(stepData)` | Hook appelé quand une étape échoue : marque la tâche comme échouée (fail = true). Sans effet si stepData est nil. *(interne)* *(hook)* | 118 |
| `gameplay_crashTest_crashTestTaskList.onExtensionUnloaded()` | Hook appelé au déchargement de l'extension : retire toutes les tâches de l'UI. *(interne)* *(hook)* | 148 |
| `gameplay_crashTest_crashTestTaskList.onNewCrashTestStep(stepData)` | Hook appelé au début d'une étape : envoie la tâche correspondante comme active (ni terminée ni échouée). *(interne)* *(hook)* | 104 |
| `gameplay_crashTest_crashTestTaskList.reset()` | Retire toutes les tâches de l'UI (clear = true pour chaque étape). | 152 |
| `gameplay_crashTest_crashTestTaskList.setCrashTestDataAndInit(crashTestData_)` | Mémorise la liste des étapes, affiche l'en-tête « Crash analysis steps » et crée la première tâche (inactive). | 97 |

### Détail des paramètres

#### `gameplay_crashTest_crashTestTaskList.finishedCurrentTask(stepData)`

Marque la tâche de l'étape comme terminée (done = true).

- `stepData` (*table*) : Données de l'étape.

#### `gameplay_crashTest_crashTestTaskList.onCrashTestStepFailed(stepData)`

Hook appelé quand une étape échoue : marque la tâche comme échouée (fail = true). Sans effet si stepData est nil.

- `stepData` (*table|nil*) : Données de l'étape.

#### `gameplay_crashTest_crashTestTaskList.onNewCrashTestStep(stepData)`

Hook appelé au début d'une étape : envoie la tâche correspondante comme active (ni terminée ni échouée).

- `stepData` (*table*) : Données de l'étape.

#### `gameplay_crashTest_crashTestTaskList.setCrashTestDataAndInit(crashTestData_)`

Mémorise la liste des étapes, affiche l'en-tête « Crash analysis steps » et crée la première tâche (inactive).

- `crashTestData_` (*table<integer, table>*) : Liste des données d'étapes du crash test.

**Évènements UI (guihooks.trigger) :** `SetTasklistHeader`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/crashTest/crashTestTaskList.lua`.*
