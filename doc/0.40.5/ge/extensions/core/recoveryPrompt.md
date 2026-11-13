# `core_recoveryPrompt`

*Fichier : `lua/ge/extensions/core/recoveryPrompt.lua` · VM : Game Engine (GE) · 1009 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_recoveryPrompt` : `extensions.load("core_recoveryPrompt")`, puis la globale `core_recoveryPrompt`

Menu de « recovery » du joueur (remorquer sur la route, remettre sur les roues, réparer, retourner au garage, voyage rapide, réinitialiser le véhicule, recommencer ou valider une mission, rendre un véhicule de livraison ou de prêt). Il tient une table de boutons (buttonOptions) avec type de cible (vehicle, walk, none), conditions d'inclusion et d'activation, prix et fonction exécutée pendant un fondu d'écran. Les boutons sont exposés dans le menu radial (core_quickAccess) et dans les rails du menu pause. Un moddeur ajoute ses propres boutons avec addButton et pilote lesquels sont actifs.

## Exemple

```lua
core_recoveryPrompt.addButton('myTeleport', 'Ma téléportation', function(target) --[[ ... ]] end, 30, nil, true, true, true, 'car')
core_recoveryPrompt.setButtonActiveById('myTeleport', false)
```

## Remarques

- Boutons intégrés : towToRoad, flipUpright, getFavoriteVehicle, flipMission, recoverMission, submitMission, restartMission, repairHere, resetVehicle, stopTestdrive, giveBackDeliveryVehicle, returnLoanedVehicle ; plus, en carrière, towTo<garage> et quickTravelTo<garage> et quickTravelToVehicle (ajoutés par setDefaultsForCareer).
- Seuls les boutons ajoutés avec addButton (customButton) peuvent être retirés par removeButtonById ou écrasés par un nouvel addButton.
- Déroulement : buttonPressed mémorise le bouton et sa cible ; si fadeActive, joue le son, lance ui_fadeScreen.start(0.3) ; onScreenFadeState appelle ensuite handleCurrRecoveryOption, qui émet le hook onRecoveryPromptButtonPressed(id), exécute atFadeFunction(target), incrémente le compteur, affiche le message, arrête le fondu. En carrière hors marche et hors mission, un snapshot d'état des pièces 'beforeTeleport' est créé avant.
- Seuils : vehicleSlow = vitesse < 10 m/s ; vehicleStopped = vitesse < 0.5 m/s.
- Prix en carrière : 50 pour flipUpright, 75 pour towToRoad, gratuits si l'assistance routière est gratuite pour le véhicule.
- BUG probable : dans getButtonsForTarget, la boucle sur includeConditions écrase 'add' à chaque condition, donc seule la dernière condition compte.
- BUG probable : addButton, en cas de collision d'ordre, lit o.id qui n'existe pas sur les entrées (le message de log contient nil) ; et son premier log('E', ...) passe le message à la place du tag.
- BUG probable : setButtonLimits plante si une clé de limits n'est pas un identifiant de bouton existant (buttonOptions[id] est nil). createPopupData utilise la variable 'title' non définie (vaut nil, donc le titre est toujours la traduction par défaut).
- Ce module appelle sans protection career_career, gameplay_walk, gameplay_missions_missionManager, etc. ; il suppose ces extensions chargées.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_recoveryPrompt.addButton(id, label, atFadeFunction, order, message, active, enabled, fadeActive, icon)` | Ajoute un bouton personnalisé (type 'none' implicite car pas de champ type : il n'apparaît que dans la liste des cibles 'none'). Refuse d'écraser un bouton intégré. | 535 |
| `core_recoveryPrompt.buttonPressed(buttonId, target)` | Exécute le processus de recovery pour un bouton : snapshot de pièces éventuel, puis fondu d'écran (son de début puis ui_fadeScreen.start) avant l'action, ou action immédiate si fadeActive est faux. | 642 |
| `core_recoveryPrompt.deactivateAllButtons()` | Désactive tous les boutons (le menu reste dans son état). | 507 |
| `core_recoveryPrompt.deserializeState(data)` | Restaure l'état produit par serializeState. | 629 |
| `core_recoveryPrompt.getButtonActiveById(id)` | Indique si un bouton est actif. | 514 |
| `core_recoveryPrompt.getButtonLimitsAndCounts()` | Renvoie la limite et le compteur de chaque bouton. | 606 |
| `core_recoveryPrompt.getCustomRecoveryOptionsActiveState()` | Renvoie une liste nettoyée des options de recovery (actives ou non) : active, enabled, label (traduit si texte), icon, isRecoveryOption. | 978 |
| `core_recoveryPrompt.getPauseCareerRightRailButtons()` | Boutons du rail droit du menu pause en carrière : flipUpright et towToRoad pour le véhicule du joueur. | 863 |
| `core_recoveryPrompt.getPauseMissionRightRailButtons()` | Boutons à afficher dans le rail droit du menu pause en mission : restartMission, flipMission, recoverMission, towToRoad (cibles véhicule joueur et none). Chaque entrée : id, title, icon, holdToClick, enabled, disableReason, order, startSlot, targetType, targetVehId. | 841 |
| `core_recoveryPrompt.handleCurrRecoveryOption()` | Exécute l'option de recovery en cours (appelée à la fin du fondu) : hook onRecoveryPromptButtonPressed, atFadeFunction, compteur, message, fin du fondu et rechargement du routeur UI. *(interne)* | 669 |
| `core_recoveryPrompt.isActive()` | Indique si le menu de recovery est actif globalement. | 472 |
| `core_recoveryPrompt.onBeforeRadialOpened()` | Hook appelé avant l'ouverture du menu radial : à la première fois, enregistre les entrées de recovery dans core_quickAccess (racine, quickTravel/, towing/). *(interne)* *(hook)* | 960 |
| `core_recoveryPrompt.onExtensionLoaded()` | Hook de chargement : construit la table des boutons (setupButtonOptions). *(interne)* *(hook)* | 955 |
| `core_recoveryPrompt.onHideRadialMenu()` | Hook : le menu radial est fermé, les données du popup sont effacées. *(interne)* *(hook)* | 969 |
| `core_recoveryPrompt.onPopupClosed()` | Hook de fermeture du popup : oublie l'option courante et les données du popup. *(interne)* *(hook)* | 663 |
| `core_recoveryPrompt.onQuickAccessLoaded()` | Hook : core_quickAccess a été rechargé, les entrées devront être ré-enregistrées à la prochaine ouverture. *(interne)* *(hook)* | 973 |
| `core_recoveryPrompt.onResetGameplay(playerID)` | Hook appelé à la réinitialisation du gameplay : si le menu est actif et qu'aucune recovery n'est en cours, ouvre le menu rapide (core_quickAccess) sur la racine carrière, mission ou quick selon le contexte. *(interne)* *(hook)* | 879 |
| `core_recoveryPrompt.onScreenFadeState(state)` | Hook de ui_fadeScreen : à chaque changement d'état, appelle handleCurrRecoveryOption (qui ne fait rien s'il n'y a pas de demande en cours). *(interne)* *(hook)* | 699 |
| `core_recoveryPrompt.removeButtonById(id)` | Supprime un bouton personnalisé. Refusé pour les boutons intégrés. | 565 |
| `core_recoveryPrompt.resetButtonLimitCounters(onlyFor)` | Remet à 0 le compteur d'utilisations des boutons. | 598 |
| `core_recoveryPrompt.serializeState()` | Sérialise l'état (actif global et état actif de chaque bouton) pour la sauvegarde. | 619 |
| `core_recoveryPrompt.setActive(a)` | Active ou désactive le menu de recovery globalement. | 473 |
| `core_recoveryPrompt.setButtonActiveById(id, a)` | Active ou désactive un bouton. Journalise un avertissement si l'id est inconnu. | 509 |
| `core_recoveryPrompt.setButtonEnabledById(id, e)` | Change l'état enabled d'un bouton ; si e est vrai, le bouton devient aussi actif. | 519 |
| `core_recoveryPrompt.setButtonLimits(limits)` | Définit le nombre d'utilisations maximum par bouton (réinitialise toutes les limites d'abord ; -1 = illimité). Quand une limite existe, le libellé affiche les utilisations restantes. | 587 |
| `core_recoveryPrompt.setDefaultsForCareer()` | Réglage carrière : active le menu, ne garde actifs que towToRoad, flipUpright, getFavoriteVehicle, stopTestdrive, giveBackDeliveryVehicle, returnLoanedVehicle, et ajoute les boutons de remorquage et de voyage rapide vers les garages du niveau. | 479 |
| `core_recoveryPrompt.setDefaultsForFreeroam()` | Réglage freeroam : désactive le menu et tous les boutons. | 474 |
| `core_recoveryPrompt.setDefaultsForTutorial()` | Réglage tutoriel : active le menu avec seulement towToRoad, repairHere et flipUpright. | 493 |
| `core_recoveryPrompt.setEverythingActive()` | Active le menu et tous les boutons. | 502 |

### Détail des paramètres

#### `core_recoveryPrompt.addButton(id, label, atFadeFunction, order, message, active, enabled, fadeActive, icon)`

Ajoute un bouton personnalisé (type 'none' implicite car pas de champ type : il n'apparaît que dans la liste des cibles 'none'). Refuse d'écraser un bouton intégré.

- `id` (*string*) : Identifiant unique.
- `label` (*string|nil*) : Clé de traduction ; défaut 'ui.career.recovery.noLabel'.
- `atFadeFunction` (*function|nil*) : Fonction exécutée pendant le fondu ; reçoit la cible {type, vehId}.
- `order` (*number|nil*) : Ordre d'affichage ; défaut = plus grand ordre existant + 1.
- `message` (*string|nil*) : Clé de traduction du message affiché après l'action.
- `active` (*boolean|nil*) : Actif, true par défaut.
- `enabled` (*boolean|function|nil*) : Cliquable.
- `fadeActive` (*boolean|nil*) : Jouer un fondu d'écran, true par défaut.
- `icon` (*string|nil*) : Nom d'icône.

#### `core_recoveryPrompt.buttonPressed(buttonId, target)`

Exécute le processus de recovery pour un bouton : snapshot de pièces éventuel, puis fondu d'écran (son de début puis ui_fadeScreen.start) avant l'action, ou action immédiate si fadeActive est faux.

- `buttonId` (*string*) : Identifiant du bouton.
- `target` (*{type: string, vehId: integer|nil}*) : Cible : type 'vehicle', 'walk' ou 'none', et vehId pour un véhicule.

#### `core_recoveryPrompt.deserializeState(data)`

Restaure l'état produit par serializeState.

- `data` (*table*) : {active, buttons}.

#### `core_recoveryPrompt.getButtonActiveById(id)`

Indique si un bouton est actif.

- `id` (*string*) : Identifiant du bouton.
- **renvoie** : boolean|nil nil si l'id est inconnu.

#### `core_recoveryPrompt.getButtonLimitsAndCounts()`

Renvoie la limite et le compteur de chaque bouton.

- **renvoie** : table<string, {limit: integer|nil, count: integer|nil}> Par id de bouton.

#### `core_recoveryPrompt.getCustomRecoveryOptionsActiveState()`

Renvoie une liste nettoyée des options de recovery (actives ou non) : active, enabled, label (traduit si texte), icon, isRecoveryOption.

- **renvoie** : table<string, table> Par id de bouton.

#### `core_recoveryPrompt.getPauseCareerRightRailButtons()`

Boutons du rail droit du menu pause en carrière : flipUpright et towToRoad pour le véhicule du joueur.

- **renvoie** : table[] Boutons triés par ordre.

#### `core_recoveryPrompt.getPauseMissionRightRailButtons()`

Boutons à afficher dans le rail droit du menu pause en mission : restartMission, flipMission, recoverMission, towToRoad (cibles véhicule joueur et none). Chaque entrée : id, title, icon, holdToClick, enabled, disableReason, order, startSlot, targetType, targetVehId.

- **renvoie** : table[] Boutons triés par ordre.

#### `core_recoveryPrompt.isActive()`

Indique si le menu de recovery est actif globalement.

- **renvoie** : boolean État actif.

#### `core_recoveryPrompt.onResetGameplay(playerID)`

Hook appelé à la réinitialisation du gameplay : si le menu est actif et qu'aucune recovery n'est en cours, ouvre le menu rapide (core_quickAccess) sur la racine carrière, mission ou quick selon le contexte.

- `playerID` (*integer*) : Joueur concerné (non utilisé).

#### `core_recoveryPrompt.onScreenFadeState(state)`

Hook de ui_fadeScreen : à chaque changement d'état, appelle handleCurrRecoveryOption (qui ne fait rien s'il n'y a pas de demande en cours).

- `state` (*any*) : État du fondu (non utilisé).

#### `core_recoveryPrompt.removeButtonById(id)`

Supprime un bouton personnalisé. Refusé pour les boutons intégrés.

- `id` (*string*) : Identifiant du bouton.

#### `core_recoveryPrompt.resetButtonLimitCounters(onlyFor)`

Remet à 0 le compteur d'utilisations des boutons.

- `onlyFor` (*table<string, boolean>|nil*) : Ensemble d'ids concernés ; nil = tous.

#### `core_recoveryPrompt.serializeState()`

Sérialise l'état (actif global et état actif de chaque bouton) pour la sauvegarde.

- **renvoie** : {active: boolean, buttons: table<string, boolean>} État.

#### `core_recoveryPrompt.setActive(a)`

Active ou désactive le menu de recovery globalement.

- `a` (*boolean*) : Nouvel état.

#### `core_recoveryPrompt.setButtonActiveById(id, a)`

Active ou désactive un bouton. Journalise un avertissement si l'id est inconnu.

- `id` (*string*) : Identifiant du bouton.
- `a` (*boolean*) : Actif ou non.

#### `core_recoveryPrompt.setButtonEnabledById(id, e)`

Change l'état enabled d'un bouton ; si e est vrai, le bouton devient aussi actif.

- `id` (*string*) : Identifiant du bouton.
- `e` (*boolean*) : Enabled.

#### `core_recoveryPrompt.setButtonLimits(limits)`

Définit le nombre d'utilisations maximum par bouton (réinitialise toutes les limites d'abord ; -1 = illimité). Quand une limite existe, le libellé affiche les utilisations restantes.

- `limits` (*table<string, integer>|nil*) : Id de bouton -> limite.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onRecoveryPromptButtonPressed` — écouté par 2 module(s)
- `onRecoveryPromptRepairHereUsed` — écouté par 1 module(s)

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`, `resetVehicle`
- `scenetree.` `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/recoveryPrompt.lua`.*
