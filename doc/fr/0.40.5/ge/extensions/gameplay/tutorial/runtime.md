# `gameplay_tutorial_runtime`

*Fichier : `lua/ge/extensions/gameplay/tutorial/runtime.lua` · VM : Game Engine (GE) · 306 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_tutorial_runtime` : `extensions.load("gameplay_tutorial_runtime")`, puis la globale `gameplay_tutorial_runtime`

Moteur générique de didacticiel : il enchaîne des « étapes » qui sont chacune une extension Lua distincte (préfixe + identifiant d'étape). Il charge/décharge l'extension de l'étape courante, mémorise la progression (étapes terminées, étape courante) et relaie onUpdate/onPreRender vers l'étape active, vers le suivi de dégâts, les marqueurs et le système de limites de zone. Un moddeur s'en sert en appelant configure() puis start().

## Exemple

```lua
gameplay_tutorial_runtime.configure({stepOrder = {"1", "2"}, stepExtensionPrefix = "career_modules_tutorial_step"})
gameplay_tutorial_runtime.start()
-- depuis une étape terminée :
gameplay_tutorial_runtime.advanceToNextStep()
```

## Remarques

- L'extension d'une étape est chargée sous le nom stepExtensionPrefix .. stepId ; elle peut exposer setup(), cleanup(), onUpdate() et onPreRender().
- stop() décharge l'étape sans marquer le didacticiel terminé et ne nettoie ni marqueurs, ni limites, ni setup ; endTutorial() fait ce nettoyage complet et passe isCompleted à true.
- Un identifiant d'étape est converti en chaîne par activateStep (tostring) ; completeStep, lui, utilise l'identifiant tel quel comme clé de completedSteps.
- onUpdate met à jour le suivi de dégâts (damageTracker) même quand le didacticiel n'est pas actif.

**Dépendances (chargées avant) :** `gameplay_tutorial_setup`, `gameplay_tutorial_markers`, `gameplay_tutorial_damageTracker`, `gameplay_tutorial_bounds`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_tutorial_runtime.activateStep(stepId)` | Nettoie et décharge l'étape précédente, charge l'extension de la nouvelle étape, met à jour la progression et appelle son setup({}). | 150 |
| `gameplay_tutorial_runtime.advanceToNextStep()` | Termine l'étape courante puis active la suivante ; s'il n'y en a plus, appelle endTutorial(). | 200 |
| `gameplay_tutorial_runtime.completeStep(stepId)` | Marque une étape comme terminée dans completedSteps. | 192 |
| `gameplay_tutorial_runtime.configure(opts)` | Fixe la configuration : ordre des étapes, préfixe des extensions d'étape, préfabs initiaux, chargement des sites et des actions bloquées au démarrage, callbacks onStarted/onEnded. Branche aussi les getters du module bounds et des marqueurs (véhicule du didacticiel). | 57 |
| `gameplay_tutorial_runtime.endTutorial()` | Fin normale : cleanup de l'étape, des marqueurs, du suivi de dégâts, des limites et du setup ; passe isCompleted à true, efface la liste de tâches de l'interface (ClearTasklist) et appelle onEnded. | 227 |
| `gameplay_tutorial_runtime.getCurrentStep()` | Identifiant de l'étape courante. | 103 |
| `gameplay_tutorial_runtime.getProgressData()` | Renvoie la table de progression interne (pas une copie). | 95 |
| `gameplay_tutorial_runtime.getStepIdByIndex(index)` | Identifiant d'étape à une position donnée de l'ordre configuré. | 111 |
| `gameplay_tutorial_runtime.getStepOrder()` | Renvoie la liste ordonnée des identifiants d'étapes configurée. | 107 |
| `gameplay_tutorial_runtime.isActive()` | Indique si le didacticiel est en cours. | 99 |
| `gameplay_tutorial_runtime.onPreRender(dtReal, dtSim, dtRaw)` | Hook appelé avant le rendu : relaie à l'étape active (dtReal, dtSim seulement) et au module bounds. *(interne)* *(hook)* | 293 |
| `gameplay_tutorial_runtime.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque image par le moteur d'extensions : transmet l'id du véhicule du didacticiel au damageTracker, relaie à l'étape active, met à jour dégâts, marqueurs et limites. *(interne)* *(hook)* | 277 |
| `gameplay_tutorial_runtime.setProgressData(data)` | Remplace la progression (étape courante, étapes terminées, drapeau terminé), typiquement après chargement d'une sauvegarde. | 88 |
| `gameplay_tutorial_runtime.start()` | Démarre le didacticiel : active les préfabs initiaux, charge les sites, installe les actions bloquées, puis active l'étape mémorisée (ou la première si elle est invalide). Appelle onStarted en cas de succès. | 115 |
| `gameplay_tutorial_runtime.stop()` | Décharge l'étape active sans marquer le didacticiel comme terminé et sans nettoyer les autres modules. | 262 |

### Détail des paramètres

#### `gameplay_tutorial_runtime.activateStep(stepId)`

Nettoie et décharge l'étape précédente, charge l'extension de la nouvelle étape, met à jour la progression et appelle son setup({}).

- `stepId` (*string|integer*) : Identifiant d'étape présent dans stepOrder.
- **renvoie** : boolean false si inactif, id invalide ou extension introuvable.

#### `gameplay_tutorial_runtime.advanceToNextStep()`

Termine l'étape courante puis active la suivante ; s'il n'y en a plus, appelle endTutorial().

- **renvoie** : boolean false si inactif ou si l'étape courante n'est pas dans stepOrder.

#### `gameplay_tutorial_runtime.completeStep(stepId)`

Marque une étape comme terminée dans completedSteps.

- `stepId` (*string*) : Identifiant de l'étape.
- **renvoie** : boolean false si le didacticiel n'est pas actif.

#### `gameplay_tutorial_runtime.configure(opts)`

Fixe la configuration : ordre des étapes, préfixe des extensions d'étape, préfabs initiaux, chargement des sites et des actions bloquées au démarrage, callbacks onStarted/onEnded. Branche aussi les getters du module bounds et des marqueurs (véhicule du didacticiel).

- `opts` (*table*) : Champs facultatifs : stepOrder (liste d'ids), stepExtensionPrefix, initialPrefabs, loadSitesOnStart, setupBlockedActionsOnStart, onStarted, onEnded.

#### `gameplay_tutorial_runtime.endTutorial()`

Fin normale : cleanup de l'étape, des marqueurs, du suivi de dégâts, des limites et du setup ; passe isCompleted à true, efface la liste de tâches de l'interface (ClearTasklist) et appelle onEnded.

- **renvoie** : boolean false si le didacticiel n'était pas actif.

#### `gameplay_tutorial_runtime.getCurrentStep()`

Identifiant de l'étape courante.

- **renvoie** : string|nil nil si aucune étape n'est active.

#### `gameplay_tutorial_runtime.getProgressData()`

Renvoie la table de progression interne (pas une copie).

- **renvoie** : table {currentStepId, completedSteps, isCompleted}

#### `gameplay_tutorial_runtime.getStepIdByIndex(index)`

Identifiant d'étape à une position donnée de l'ordre configuré.

- `index` (*integer*) : Position à partir de 1.
- **renvoie** : string|nil nil hors limites.

#### `gameplay_tutorial_runtime.getStepOrder()`

Renvoie la liste ordonnée des identifiants d'étapes configurée.

- **renvoie** : string[] Liste des ids.

#### `gameplay_tutorial_runtime.isActive()`

Indique si le didacticiel est en cours.

- **renvoie** : boolean true entre start() et endTutorial()/stop().

#### `gameplay_tutorial_runtime.onPreRender(dtReal, dtSim, dtRaw)`

Hook appelé avant le rendu : relaie à l'étape active (dtReal, dtSim seulement) et au module bounds.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `gameplay_tutorial_runtime.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque image par le moteur d'extensions : transmet l'id du véhicule du didacticiel au damageTracker, relaie à l'étape active, met à jour dégâts, marqueurs et limites.

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).
- `dtRaw` (*number*) : Delta temps brut (s).

#### `gameplay_tutorial_runtime.setProgressData(data)`

Remplace la progression (étape courante, étapes terminées, drapeau terminé), typiquement après chargement d'une sauvegarde.

- `data` (*table*) : Table avec currentStepId, completedSteps (table id -> true) et isCompleted.

#### `gameplay_tutorial_runtime.start()`

Démarre le didacticiel : active les préfabs initiaux, charge les sites, installe les actions bloquées, puis active l'étape mémorisée (ou la première si elle est invalide). Appelle onStarted en cas de succès.

- **renvoie** : boolean false si déjà actif, si stepOrder est vide ou si l'étape n'a pas pu être activée.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant celle-ci : gameplay_tutorial_setup, _markers, _damageTracker et _bounds. |
| `sharedTutorialData` | table | Table vide partagée que les étapes peuvent utiliser pour s'échanger des données. |

**Évènements UI (guihooks.trigger) :** `ClearTasklist`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/tutorial/runtime.lua`.*
