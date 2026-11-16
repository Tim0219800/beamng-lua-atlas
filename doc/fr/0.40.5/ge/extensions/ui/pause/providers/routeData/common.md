# `ui_pause_providers_routeData_common`

*Fichier : `lua/ge/extensions/ui/pause/providers/routeData/common.lua` · VM : Game Engine (GE) · 90 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_providers_routeData_common` : `extensions.load("ui_pause_providers_routeData_common")`, puis la globale `ui_pause_providers_routeData_common`

Outils partagés par les fournisseurs routeData du menu pause : navigation par séquence d'états, enregistrement de boutons via ui_pause_actions, confirmation de sortie (niveau ou jeu) adaptée à la carrière, exécution d'une sortie avec sauvegarde préalable, et construction de groupes de rail. Les ids de texte de confirmation sont exposés dans ExitLevelTexts et ExitGameTexts.

## Remarques

- asRailGroup renvoie nil (et non un groupe vide) quand la liste d'actions est vide : cela évite que le JSON encode les actions en objet au lieu de tableau.
- withExitConfirm en carrière : si une sauvegarde existe, confirmText = {txt = texts.career} et confirmSince = date de sauvegarde (l'UI remplit {{time}}) ; sinon texte notSaved, et si career_career.isAutosaveEnabled() le bouton propose « Enregistrer et quitter » (confirmDestructive = false) avec une option « Quitter sans enregistrer » (altLabel).
- registerPauseButton nécessite que ui_pause_actions soit chargé (variable globale non protégée).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_providers_routeData_common.asRailGroup(id, actions)` | Crée un groupe de rail {id, actions}, ou nil si la liste est vide. | 81 |
| `ui_pause_providers_routeData_common.bool(value)` | Convertit n'importe quelle valeur en booléen (truthy -> true, sinon false). | 7 |
| `ui_pause_providers_routeData_common.registerPauseButton(button)` | Enregistre un bouton de pause : extrait button.callback, copie le reste des métadonnées et appelle ui_pause_actions.registerButton. Sans callback, utilise une fonction qui renvoie false. | 21 |
| `ui_pause_providers_routeData_common.runExit(exitFn, payload)` | Exécute la fonction de sortie ; si payload.saveFirst est vrai, sauvegarde d'abord la carrière via ui_pause_actions.saveCareerThen. | 72 |
| `ui_pause_providers_routeData_common.tryPushStateSequence(states)` | Essaie de naviguer vers chaque état via ui_router.navigate (dans un pcall) jusqu'à ce qu'un réussisse (result.result ~= false). | 11 |
| `ui_pause_providers_routeData_common.withExitConfirm(button, context, texts)` | Complète un bouton de sortie avec les champs de confirmation (cancelLabel, confirmText, confirmSince, confirmLabel, altLabel…) selon le mode (carrière ou non) et l'état de sauvegarde. | 49 |

### Détail des paramètres

#### `ui_pause_providers_routeData_common.asRailGroup(id, actions)`

Crée un groupe de rail {id, actions}, ou nil si la liste est vide.

- `id` (*string*) : Id du groupe.
- `actions` (*table[]|nil*) : Boutons du groupe.
- **renvoie** : table|nil Groupe ou nil.

#### `ui_pause_providers_routeData_common.bool(value)`

Convertit n'importe quelle valeur en booléen (truthy -> true, sinon false).

- `value` (*any*) : Valeur à convertir.
- **renvoie** : boolean Booléen.

#### `ui_pause_providers_routeData_common.registerPauseButton(button)`

Enregistre un bouton de pause : extrait button.callback, copie le reste des métadonnées et appelle ui_pause_actions.registerButton. Sans callback, utilise une fonction qui renvoie false.

- `button` (*table|nil*) : Métadonnées du bouton plus callback.
- **renvoie** : table|nil Métadonnées enregistrées (avec buttonId) ou nil si button est nil.

#### `ui_pause_providers_routeData_common.runExit(exitFn, payload)`

Exécute la fonction de sortie ; si payload.saveFirst est vrai, sauvegarde d'abord la carrière via ui_pause_actions.saveCareerThen.

- `exitFn` (*function*) : Fonction de sortie (returnToMainMenu, quit…).
- `payload` (*table|nil*) : Charge utile du bouton (champ lu : saveFirst).

#### `ui_pause_providers_routeData_common.tryPushStateSequence(states)`

Essaie de naviguer vers chaque état via ui_router.navigate (dans un pcall) jusqu'à ce qu'un réussisse (result.result ~= false).

- `states` (*string|string[]|nil*) : Nom d'état ou liste d'états à essayer dans l'ordre.
- **renvoie** : boolean true si une navigation a réussi.

#### `ui_pause_providers_routeData_common.withExitConfirm(button, context, texts)`

Complète un bouton de sortie avec les champs de confirmation (cancelLabel, confirmText, confirmSince, confirmLabel, altLabel…) selon le mode (carrière ou non) et l'état de sauvegarde.

- `button` (*table*) : Métadonnées du bouton, modifiées en place.
- `context` (*table*) : Contexte pause (champ lu : mode).
- `texts` (*table*) : ExitLevelTexts ou ExitGameTexts.
- **renvoie** : table Le même bouton.

## Champs

| Champ | Type | Description |
|---|---|---|
| `ExitGameTexts` | table<string, string> | Ids de traduction pour quitter le jeu : default, career, notSaved. |
| `ExitLevelTexts` | table<string, string> | Ids de traduction pour quitter le niveau : default, career, notSaved. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/providers/routeData/common.lua`.*
