# `career_modules_tutorial`

*Fichier : `lua/ge/extensions/career/modules/tutorial.lua` · VM : Game Engine (GE) · 240 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tutorial` : `extensions.load("career_modules_tutorial")`, puis la globale `career_modules_tutorial`

Tutoriel de la carrière, en 9 étapes (01enterVehicle à 09spmSignup). Ce module est une fine couche au-dessus de gameplay_tutorial_runtime : il lui fournit l'ordre des étapes, le préfixe des extensions d'étapes (career_modules_tutorial_step<id>), les préfabriqués initiaux et l'action de fin, et il sauvegarde la progression dans <profil>/career/tutorialState.json.

## Remarques

- Au démarrage de la carrière (onCareerActive), le tutoriel ne se lance que si career_career.tutorialEnabled est vrai.
- À la fin du tutoriel : autosave réactivé, sauvegarde, récupération par défaut de la carrière, reset de l'état du joueur, vidage des POI bruts et retour à l'état de jeu « career ».
- Une étape sauvegardée invalide est ignorée (retour à la première étape).
- Les fonctions de contrôle retournent le booléen du runtime et resynchronisent la progression en cas de succès.
- sharedTutorialData est capturé à la fin du chargement du module (copie de la référence du runtime).

**Dépendances (chargées avant) :** `gameplay_tutorial_runtime`, `gameplay_tutorial_setup`, `gameplay_tutorial_markers`, `gameplay_tutorial_damageTracker`, `gameplay_tutorial_bounds`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tutorial.activateStep(stepId)` | Active directement une étape. | 164 |
| `career_modules_tutorial.advanceToNextStep()` | Passe à l'étape suivante. | 180 |
| `career_modules_tutorial.completeStep(stepId)` | Marque une étape comme terminée. | 172 |
| `career_modules_tutorial.endTutorial()` | Termine le tutoriel (déclenche l'action de fin configurée). | 188 |
| `career_modules_tutorial.getCompletedSteps()` | Retourne les étapes terminées. | 204 |
| `career_modules_tutorial.getCurrentStep()` | Retourne l'id de l'étape courante. | 144 |
| `career_modules_tutorial.getStepIdByIndex(index)` | Retourne l'id d'étape à un indice donné (à partir de 1). | 152 |
| `career_modules_tutorial.getStepOrder()` | Retourne la liste ordonnée des ids d'étapes. | 148 |
| `career_modules_tutorial.isActive()` | Indique si le tutoriel est en cours. | 140 |
| `career_modules_tutorial.onCareerActive()` | Hook appelé quand la carrière devient active ; démarre le tutoriel si activé. *(interne)* *(hook)* | 132 |
| `career_modules_tutorial.onExtensionLoaded()` | Hook de chargement : configure le runtime, lit tutorialState.json du profil courant et envoie la progression au runtime. *(interne)* *(hook)* | 94 |
| `career_modules_tutorial.onExtensionUnloaded()` | Hook de déchargement : arrête le runtime. *(interne)* *(hook)* | 120 |
| `career_modules_tutorial.onGetRawPoiListForTutorial(elements)` | Pendant le tutoriel, ajoute à la liste de POI le point « garage » (tutorial_apm_parking) sur la place de parking garageExteriorPark, avec icône, nom et miniature de la grande carte. *(interne)* *(hook)* | 209 |
| `career_modules_tutorial.onPreRender(dtReal, dtSim, dtRaw)` | Hook de pré-rendu : relaie au runtime. *(interne)* *(hook)* | 200 |
| `career_modules_tutorial.onSaveCurrentProfile(currentSavePath)` | Hook de sauvegarde du profil : écrit la progression dans tutorialState.json. *(interne)* *(hook)* | 126 |
| `career_modules_tutorial.onUpdate(dtReal, dtSim, dtRaw)` | Hook de mise à jour : relaie au runtime. *(interne)* *(hook)* | 196 |
| `career_modules_tutorial.start()` | Démarre le tutoriel via le runtime. | 156 |

### Détail des paramètres

#### `career_modules_tutorial.activateStep(stepId)`

Active directement une étape.

- `stepId` (*string*) : Id de l'étape.
- **renvoie** : boolean Succès.

#### `career_modules_tutorial.advanceToNextStep()`

Passe à l'étape suivante.

- **renvoie** : boolean Succès.

#### `career_modules_tutorial.completeStep(stepId)`

Marque une étape comme terminée.

- `stepId` (*string*) : Id de l'étape.
- **renvoie** : boolean Succès.

#### `career_modules_tutorial.endTutorial()`

Termine le tutoriel (déclenche l'action de fin configurée).

- **renvoie** : boolean Succès.

#### `career_modules_tutorial.getCompletedSteps()`

Retourne les étapes terminées.

- **renvoie** : table completedSteps du runtime (vide si aucune).

#### `career_modules_tutorial.getCurrentStep()`

Retourne l'id de l'étape courante.

- **renvoie** : string|nil Ex. "03basicManeuvers".

#### `career_modules_tutorial.getStepIdByIndex(index)`

Retourne l'id d'étape à un indice donné (à partir de 1).

- `index` (*integer*) : Indice dans l'ordre des étapes.
- **renvoie** : string|nil Id de l'étape.

#### `career_modules_tutorial.getStepOrder()`

Retourne la liste ordonnée des ids d'étapes.

- **renvoie** : string[] Les 9 étapes.

#### `career_modules_tutorial.isActive()`

Indique si le tutoriel est en cours.

- **renvoie** : boolean Résultat du runtime.

#### `career_modules_tutorial.onCareerActive()`

Hook appelé quand la carrière devient active ; démarre le tutoriel si activé.

- **renvoie** : boolean|nil false si le tutoriel est désactivé.

#### `career_modules_tutorial.onGetRawPoiListForTutorial(elements)`

Pendant le tutoriel, ajoute à la liste de POI le point « garage » (tutorial_apm_parking) sur la place de parking garageExteriorPark, avec icône, nom et miniature de la grande carte.

- `elements` (*table*) : Liste de POI à compléter (table.insert).

#### `career_modules_tutorial.onPreRender(dtReal, dtSim, dtRaw)`

Hook de pré-rendu : relaie au runtime.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta brut (s).

#### `career_modules_tutorial.onSaveCurrentProfile(currentSavePath)`

Hook de sauvegarde du profil : écrit la progression dans tutorialState.json.

- `currentSavePath` (*string*) : Dossier de sauvegarde du profil.

#### `career_modules_tutorial.onUpdate(dtReal, dtSim, dtRaw)`

Hook de mise à jour : relaie au runtime.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulation (s).
- `dtRaw` (*number*) : Delta brut (s).

#### `career_modules_tutorial.start()`

Démarre le tutoriel via le runtime.

- **renvoie** : boolean Succès.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | gameplay_tutorial_runtime, _setup, _markers, _damageTracker, _bounds. |
| `sharedTutorialData` | table | Données partagées entre étapes, issues de gameplay_tutorial_runtime. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tutorial.lua`.*
