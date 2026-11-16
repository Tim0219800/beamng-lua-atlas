# `ui_pause_features_homeRail`

*Fichier : `lua/ge/extensions/ui/pause/features/homeRail.lua` · VM : Game Engine (GE) · 717 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_pause_features_homeRail` : `extensions.load("ui_pause_features_homeRail")`, puis la globale `ui_pause_features_homeRail`

Construit le rail de boutons de droite de l'accueil du menu pause. Selon le contexte (mode freeroam, career, mission, multiplayer, garage, freeroamTutorial, scénario, première conduite, multiseat) il assemble des groupes de boutons : recovery (reprendre, réparer, récupération carrière/mission), firstDriveLearning, tutorialLesson, career, auxiliary (sélecteur de véhicule, carte, mode photo, replay), mainMenu (changer de niveau, quitter l'activité, quitter le niveau) et multiseat. Utilisé par ui_pause_providers_routeData_home.

## Exemple

```lua
-- ajouter ses boutons multiseat au rail
function M.onPauseHomeRailBuildMultiseatActions(actions, context, registerButton)
  actions[#actions + 1] = registerButton({id = 'home.monBouton', label = 'Mon bouton', icon = 'play', visible = true, enabled = true}, function() return true end)
end
```

## Remarques

- registerButton(definition, callback) est fourni par l'appelant (ui_pause_actions.registerButton) ; la définition contient id, label, icon, rail, routeTarget, visible, enabled, disabledReason, confirmText, flavor (« danger », « system »), showIndicator, hideInSimpleMenu, cancelLabel. Le callback renvoie true en cas de succès.
- Ordre des groupes : recovery, firstDriveLearning, tutorialLesson, career, puis le groupe multiseat avant auxiliary si le multiseat est actif (sinon après), enfin mainMenu.
- En première conduite guidée, seuls deux groupes existent : recovery (continuer) et mainMenu (quitter).
- En mode mission, les boutons de récupération viennent de core_recoveryPrompt.getPauseMissionRightRailButtons() ; à défaut, des boutons fixes (redémarrer, remettre sur les roues, dernier chemin, remorquage) sont créés. En carrière, ils viennent de getPauseCareerRightRailButtons().
- Le bouton « quitter l'activité » est masqué pour les scénarios assistants (quickrace, lightRunner, busRoute) car « quitter » n'y fait que vider l'état du scénario.
- Le bouton « Réparer ici » (home.repairHere) téléporte le véhicule en place avec spawn.safeTeleport (réparation) et émet onPauseMenuRightRailButtonPressed("repairHere") ; il n'existe pas en multiseat.
- Hooks émis : onPauseHomeRailBuildMultiseatActions(actions, context, registerButton), onGameplayActivityAborted, onPauseMenuRightRailButtonPressed(nom).
- Le libellé de la carte désactivée (« Disabled in current context ») est en dur, non traduit.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_pause_features_homeRail.build(context, registerButton)` | Construit la liste des groupes du rail pour le contexte du pause. Chaque groupe vient de Common.asRailGroup(nom, actions) et les groupes vides sont omis. Journalise le nombre de groupes et d'actions multiseat. | 681 |

### Détail des paramètres

#### `ui_pause_features_homeRail.build(context, registerButton)`

Construit la liste des groupes du rail pour le contexte du pause. Chaque groupe vient de Common.asRailGroup(nom, actions) et les groupes vides sont omis. Journalise le nombre de groupes et d'actions multiseat.

- `context` (*table*) : Contexte du pause : mode, isFirstDriveGuided, isFirstDriveActive, isMultiseatActive, isScenarioActive, isMissionActive, isBigMapAllowed…
- `registerButton` (*function*) : Fonction (definition, callback) qui enregistre un bouton et renvoie sa description.
- **renvoie** : table[] Groupes de boutons du rail.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onGameplayActivityAborted`
- `onPauseHomeRailBuildMultiseatActions` — écouté par 2 module(s)
- `onPauseMenuRightRailButtonPressed`

**Charge les extensions :** `ui_multiseat_freeroam`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/pause/features/homeRail.lua`.*
