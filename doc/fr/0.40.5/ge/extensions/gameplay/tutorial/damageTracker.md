# `gameplay_tutorial_damageTracker`

*Fichier : `lua/ge/extensions/gameplay/tutorial/damageTracker.lua` · VM : Game Engine (GE) · 393 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_tutorial_damageTracker` : `extensions.load("gameplay_tutorial_damageTracker")`, puis la globale `gameplay_tutorial_damageTracker`

Suit les dégâts du véhicule pendant le tutoriel de carrière (et le time trial). Il s'appuie sur gameplay_util_crashDetection pour détecter la fin d'un crash, attend que le véhicule ralentisse (ou un délai maximum), puis affiche une fenêtre d'information (career_modules_tutorialPopups) et une tâche « réparer » ou « redémarrer » dans la liste de tâches. La tâche disparaît quand le véhicule est réparé ou réinitialisé.

## Exemple

```lua
gameplay_tutorial_damageTracker.setTrackedVehicleId(vehId)
gameplay_tutorial_damageTracker.setEnabled(true)
```

## Remarques

- Dépend de gameplay_util_crashDetection (M.dependencies).
- Attente avant la fenêtre : jusqu'à 5 s (1,5 s en time trial) ou dès que la vitesse <= 3 km/h.
- Après une sortie de limites (onCareerTutorialOutOfBoundsStarted), les dégâts sont ignorés pendant 8 s.
- Identifiants de fenêtre : 'v2/damagedVehicleTimeTrial', 'v2/damagedVehicle' (tutoriel actif), 'v2/damagedVehicleCareer' ; chacune ne s'affiche qu'une fois par session du module.
- BUG : onVehicleResetted est défini deux fois ; la seconde définition (plus simple, sans cas time trial) écrase la première, donc la gestion time trial de la première n'est jamais exécutée.
- Le module ne détecte les crashs que pour le véhicule suivi (trackedVehId) ; en time trial, il suit automatiquement le véhicule du joueur.

**Dépendances (chargées avant) :** `gameplay_util_crashDetection`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_tutorial_damageTracker.claimNextDamagePopup()` | Marque un crash comme déjà pris en charge par l'appelant : la prochaine fenêtre de dégâts sera sautée, mais la tâche de réparation restera due. | 162 |
| `gameplay_tutorial_damageTracker.cleanup()` | Désactive le suivi et remet à zéro tout l'état du module (véhicule configuré, tâche, handler, drapeaux de fenêtres déjà affichées). | 202 |
| `gameplay_tutorial_damageTracker.debugTriggerCrash()` | Simule un crash (debug) : marque hadCrash et déclenche l'attente de la fenêtre de dégâts. | 195 |
| `gameplay_tutorial_damageTracker.getHadCrash()` | Indique si un crash a été détecté depuis la dernière remise à zéro. | 388 |
| `gameplay_tutorial_damageTracker.onCareerTutorialOutOfBoundsEnded()` | Hook appelé au retour dans les limites : hors time trial, si le véhicule suivi a des dégâts, réaffiche la tâche de réparation. *(interne)* *(hook)* | 315 |
| `gameplay_tutorial_damageTracker.onCareerTutorialOutOfBoundsStarted()` | Hook appelé quand le joueur sort des limites : ignore les dégâts pendant 8 s, annule crash en attente et tâche de réparation. *(interne)* *(hook)* | 307 |
| `gameplay_tutorial_damageTracker.onClientStartMission(levelPath)` | Hook de début de mission : assure que le véhicule suivi est à jour si le suivi est actif. *(interne)* *(hook)* | 347 |
| `gameplay_tutorial_damageTracker.onRecoveryPromptButtonPressed(buttonId)` | Hook de la fenêtre de récupération : si le bouton 'restartMission' est pressé en time trial après un crash, marque comme réparé et retire les tâches. *(interne)* *(hook)* | 368 |
| `gameplay_tutorial_damageTracker.onRecoveryPromptRepairHereUsed(invVehId)` | Hook appelé quand le joueur choisit de réparer sur place : marque le véhicule comme réparé et retire les tâches. *(interne)* *(hook)* | 353 |
| `gameplay_tutorial_damageTracker.onUpdate(dtReal, dtSim, dtRaw)` | Hook de mise à jour : s'assure que le bon véhicule est suivi, puis, si une fenêtre de dégâts est en attente, l'affiche quand le véhicule est quasi arrêté ou après le délai maximum. *(interne)* *(hook)* | 278 |
| `gameplay_tutorial_damageTracker.onVehicleCrashEnded(crashData)` | Hook de crashDetection appelé à la fin d'un crash. Si le véhicule suivi est concerné (et que les dégâts ne sont pas supprimés), programme l'affichage de la fenêtre de dégâts. *(interne)* *(hook)* | 294 |
| `gameplay_tutorial_damageTracker.onVehicleRepaired(invVehId)` | Hook appelé après réparation d'un véhicule : si un crash avait eu lieu, retire les tâches de réparation. *(interne)* *(hook)* | 360 |
| `gameplay_tutorial_damageTracker.onVehicleResetted(vehicleId)` | Hook appelé quand un véhicule est réinitialisé : si c'est le véhicule suivi et que le suivi est actif, marque comme réparé et retire les tâches. (Définition effective : la seconde du fichier, qui écrase la première.) *(interne)* *(hook)* | 379 |
| `gameplay_tutorial_damageTracker.setDamagePopupHandler(handler)` | Remplace l'ouverture de la fenêtre de dégâts de carrière par un handler personnalisé, appelé avec l'id de la fenêtre. Une valeur non fonctionnelle retire le handler. | 86 |
| `gameplay_tutorial_damageTracker.setDefaultRepairGoal()` | Restaure la tâche de réparation par défaut (id 'tutorial_repairVehicleGoal', action toggleRadialMenuMulti). | 85 |
| `gameplay_tutorial_damageTracker.setEnabled(value)` | Active ou désactive le suivi des dégâts. À la désactivation : arrête le suivi du véhicule et retire toutes les tâches ; à l'activation : suit le véhicule et affiche la tâche si nécessaire. | 181 |
| `gameplay_tutorial_damageTracker.setRepairGoal(goal)` | Définit la tâche « réparer » affichée après un crash (table de tâche pour la liste de tâches). nil restaure la tâche par défaut. | 84 |
| `gameplay_tutorial_damageTracker.setTrackedVehicleId(vehicleId)` | Fixe l'id du véhicule à suivre (pris en compte au prochain ensureTrackedVehicle, par exemple dans onUpdate). | 158 |
| `gameplay_tutorial_damageTracker.showRepairTask()` | Affiche la tâche de réparation (ou de redémarrage en time trial) si le suivi est actif, qu'un crash a eu lieu et que le véhicule n'a pas encore été réparé. | 169 |

### Détail des paramètres

#### `gameplay_tutorial_damageTracker.getHadCrash()`

Indique si un crash a été détecté depuis la dernière remise à zéro.

- **renvoie** : boolean true si un crash a eu lieu.

#### `gameplay_tutorial_damageTracker.onClientStartMission(levelPath)`

Hook de début de mission : assure que le véhicule suivi est à jour si le suivi est actif.

- `levelPath` (*string*) : Chemin du niveau (non utilisé).

#### `gameplay_tutorial_damageTracker.onRecoveryPromptButtonPressed(buttonId)`

Hook de la fenêtre de récupération : si le bouton 'restartMission' est pressé en time trial après un crash, marque comme réparé et retire les tâches.

- `buttonId` (*string*) : Identifiant du bouton pressé.

#### `gameplay_tutorial_damageTracker.onRecoveryPromptRepairHereUsed(invVehId)`

Hook appelé quand le joueur choisit de réparer sur place : marque le véhicule comme réparé et retire les tâches.

- `invVehId` (*integer*) : Id du véhicule d'inventaire (non utilisé).

#### `gameplay_tutorial_damageTracker.onUpdate(dtReal, dtSim, dtRaw)`

Hook de mise à jour : s'assure que le bon véhicule est suivi, puis, si une fenêtre de dégâts est en attente, l'affiche quand le véhicule est quasi arrêté ou après le délai maximum.

- `dtReal` (*number*) : Delta temps réel.
- `dtSim` (*number*) : Delta temps de simulation.
- `dtRaw` (*number*) : Delta temps brut (utilisé pour le délai d'attente).

#### `gameplay_tutorial_damageTracker.onVehicleCrashEnded(crashData)`

Hook de crashDetection appelé à la fin d'un crash. Si le véhicule suivi est concerné (et que les dégâts ne sont pas supprimés), programme l'affichage de la fenêtre de dégâts.

- `crashData` (*table*) : Données du crash ; crashData.vehId = véhicule concerné.

#### `gameplay_tutorial_damageTracker.onVehicleRepaired(invVehId)`

Hook appelé après réparation d'un véhicule : si un crash avait eu lieu, retire les tâches de réparation.

- `invVehId` (*integer*) : Id du véhicule d'inventaire (non utilisé).

#### `gameplay_tutorial_damageTracker.onVehicleResetted(vehicleId)`

Hook appelé quand un véhicule est réinitialisé : si c'est le véhicule suivi et que le suivi est actif, marque comme réparé et retire les tâches. (Définition effective : la seconde du fichier, qui écrase la première.)

- `vehicleId` (*integer*) : Id du véhicule réinitialisé.

#### `gameplay_tutorial_damageTracker.setDamagePopupHandler(handler)`

Remplace l'ouverture de la fenêtre de dégâts de carrière par un handler personnalisé, appelé avec l'id de la fenêtre. Une valeur non fonctionnelle retire le handler.

- `handler` (*function|nil*) : function(popupId) appelée à la place de career_modules_tutorialPopups.introPopup.

#### `gameplay_tutorial_damageTracker.setEnabled(value)`

Active ou désactive le suivi des dégâts. À la désactivation : arrête le suivi du véhicule et retire toutes les tâches ; à l'activation : suit le véhicule et affiche la tâche si nécessaire.

- `value` (*boolean*) : true pour activer.

#### `gameplay_tutorial_damageTracker.setRepairGoal(goal)`

Définit la tâche « réparer » affichée après un crash (table de tâche pour la liste de tâches). nil restaure la tâche par défaut.

- `goal` (*table|nil*) : Table de tâche ({id, type, label, subtext, actionItems, done}).

#### `gameplay_tutorial_damageTracker.setTrackedVehicleId(vehicleId)`

Fixe l'id du véhicule à suivre (pris en compte au prochain ensureTrackedVehicle, par exemple dans onUpdate).

- `vehicleId` (*integer|nil*) : Id du véhicule, nil pour ne rien suivre.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant celle-ci : { 'gameplay_util_crashDetection' }. |

**Évènements UI (guihooks.trigger) :** `DiscardTasklistItem`, `SetTasklistTask`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/tutorial/damageTracker.lua`.*
