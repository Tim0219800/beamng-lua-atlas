# `career_modules_tutorial_tasklistLocale`

*Fichier : `lua/ge/extensions/career/modules/tutorial/tasklistLocale.lua` · VM : Game Engine (GE) · 56 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tutorial_tasklistLocale` : `extensions.load("career_modules_tutorial_tasklistLocale")`, puis la globale `career_modules_tutorial_tasklistLocale`

Aide utilisée par les étapes du tutoriel de carrière pour envoyer la liste de tâches à l'UI : elle traduit les champs texte (label, subtext, labelController, subtextController) qui sont des clés commençant par « ui. » ou des tables {txt=...}, remplit les libellés des actionItems (fillActionLabels), puis déclenche les guihooks SetTasklistHeader / SetTasklistTask. Chargé par require, pas comme extension.

## Remarques

- Les entrées avec le champ clear sont renvoyées telles quelles, sans traduction.
- La traduction travaille sur une copie : la table d'origine n'est pas modifiée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tutorial_tasklistLocale.resolveHeader(header)` | Retourne une copie d'un en-tête de liste de tâches avec ses textes traduits. | 39 |
| `career_modules_tutorial_tasklistLocale.resolveTask(task)` | Retourne une copie d'une tâche (goal ou message) avec textes traduits et libellés d'actions résolus. | 43 |
| `career_modules_tutorial_tasklistLocale.setTasklistHeader(header)` | Envoie l'en-tête traduit à l'UI via guihooks.trigger("SetTasklistHeader"). | 47 |
| `career_modules_tutorial_tasklistLocale.setTasklistTask(task)` | Envoie ou met à jour une tâche traduite dans l'UI via guihooks.trigger("SetTasklistTask"). | 51 |

### Détail des paramètres

#### `career_modules_tutorial_tasklistLocale.resolveHeader(header)`

Retourne une copie d'un en-tête de liste de tâches avec ses textes traduits.

- `header` (*table*) : En-tête (ex. {label = "ui.…"}).
- **renvoie** : table Copie traduite.

#### `career_modules_tutorial_tasklistLocale.resolveTask(task)`

Retourne une copie d'une tâche (goal ou message) avec textes traduits et libellés d'actions résolus.

- `task` (*table*) : Tâche (id, type, label, subtext, actionItems, attention…).
- **renvoie** : table Copie traduite.

#### `career_modules_tutorial_tasklistLocale.setTasklistHeader(header)`

Envoie l'en-tête traduit à l'UI via guihooks.trigger("SetTasklistHeader").

- `header` (*table*) : En-tête à afficher.

#### `career_modules_tutorial_tasklistLocale.setTasklistTask(task)`

Envoie ou met à jour une tâche traduite dans l'UI via guihooks.trigger("SetTasklistTask").

- `task` (*table*) : Tâche à afficher ou mettre à jour.

**Évènements UI (guihooks.trigger) :** `SetTasklistHeader`, `SetTasklistTask`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tutorial/tasklistLocale.lua`.*
