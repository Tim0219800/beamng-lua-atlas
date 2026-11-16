# `ui_firstDrive_moveOff`

*Fichier : `lua/ge/extensions/ui/firstDrive/moveOff.lua` · VM : Game Engine (GE) · 665 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_firstDrive_moveOff` : `extensions.load("ui_firstDrive_moveOff")`, puis la globale `ui_firstDrive_moveOff`

Didacticiel « démarrer et rouler » de l'expérience First Drive. Une fois activé, il suit le véhicule du joueur 0 (accélérateur, frein, embrayage, rapport, moteur, régime, vitesse des roues, lus via core_vehicleBridge) et affiche dans l'application « moveOff » du conteneur « topCenter » les touches à utiliser pour chaque étape : allumer le moteur, démarrer, s'arrêter, faire marche arrière, couper le moteur. Les instructions dépendent du mode de boîte : arcade, manuelle réaliste avec embrayage automatique, ou manuelle réaliste.

## Exemple

```lua
ui_firstDrive_moveOff.setEnabled(true)
-- l'interface reçoit l'évènement FirstDriveMoveOffState à chaque changement d'instruction
local state = ui_firstDrive_moveOff.getState()
```

## Remarques

- Évènement UI : FirstDriveMoveOffState, avec { label, steps, sectionIndex, sectionCount, active }. Chaque step contient action, actionLabel, inputType (« press », « hold » ou « release »), status (« complete », « current » ou « upcoming ») et éventuellement separator (« or »). À la désactivation, { active = false } est envoyé.
- Le nombre de sections est 5 en arcade et en embrayage automatique, 6 en manuel réaliste (étape supplémentaire pour passer au point mort avant de démarrer).
- Le hook onFirstDriveMoveOffSectionCompleted est émis (une fois, avec le nom de la section : engineOn, moveOff, stopping, reverse ou engineOff) après la mise à jour de l'état qui a terminé la section.
- Seuils utilisés : vitesse de roues 0,5 m/s pour « en mouvement », 1,5 m/s pour valider la marche arrière, 1500 tr/min avant de relâcher l'embrayage, frein 0,2, embrayage tenu à partir de 0,8 et relâché sous 0,15. Une pause de 2 s sépare chaque section et 0,3 s est attendue après chaque changement de véhicule pour laisser les valeurs se rafraîchir.
- Le mode (arcade, realisticAutoClutch, realisticManual) est déterminé par la valeur gearboxMode du mainController du véhicule (repli : réglage defaultGearboxBehavior, « arcade »), puis par le réglage autoClutch.
- L'extension se désactive seule à onExtensionUnloaded et onClientEndMission ; un changement de réglages relance le suivi du véhicule après 0,1 s.
- Seul le joueur 0 est suivi : onVehicleSwitched ignore les autres joueurs.

**Dépendances (chargées avant) :** `ui_appContainers`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_firstDrive_moveOff.getEnabled()` | Indique si le didacticiel est actif. | 654 |
| `ui_firstDrive_moveOff.getState()` | Renvoie la dernière instruction publiée (label, steps, sectionIndex, sectionCount, active), ou nil si rien n'est affiché. | 588 |
| `ui_firstDrive_moveOff.onClientEndMission()` | Hook appelé à la fin du niveau : désactive le didacticiel. *(interne)* *(hook)* | 649 |
| `ui_firstDrive_moveOff.onExtensionUnloaded()` | Hook appelé au déchargement de l'extension : désactive le didacticiel. *(interne)* *(hook)* | 645 |
| `ui_firstDrive_moveOff.onSettingsChanged()` | Hook appelé quand les réglages changent. Si actif, relance le suivi du véhicule après 0,1 s, ce qui relit le mode de boîte. *(interne)* *(hook)* | 636 |
| `ui_firstDrive_moveOff.onUpdate(dtReal)` | Hook appelé à chaque image avec dtReal (secondes réelles). Reconfigure le suivi si le véhicule du joueur change, attend la fin des délais, calcule l'instruction courante, la publie à l'interface si elle a changé et émet onFirstDriveMoveOffSectionCompleted quand une section vient d'être validée. *(interne)* *(hook)* | 592 |
| `ui_firstDrive_moveOff.onVehicleDestroyed(vehicleId)` | Hook appelé quand un véhicule est détruit : arrête le suivi si c'est le véhicule suivi. *(interne)* *(hook)* | 632 |
| `ui_firstDrive_moveOff.onVehicleReplaced(vehicleId)` | Hook appelé quand un véhicule est remplacé ; même traitement que onVehicleDestroyed. *(interne)* *(hook)* | 632 |
| `ui_firstDrive_moveOff.onVehicleSwitched(_, newVehicleId, player)` | Hook appelé quand le véhicule du joueur change. Relance le suivi sur le nouveau véhicule (ignoré si inactif ou si player n'est pas 0). *(interne)* *(hook)* | 627 |
| `ui_firstDrive_moveOff.setEnabled(value)` | Active ou désactive le didacticiel. À l'activation, commence à suivre le véhicule du joueur 0 (abonnements aux valeurs throttle_input, brake_input, clutch_input, gearIndex, engineRunning, rpm, wheelspeed) ; à la désactivation, désabonne, cache l'application et envoie { active = false }. Sans effet si l'état ne change pas. | 576 |

### Détail des paramètres

#### `ui_firstDrive_moveOff.getEnabled()`

Indique si le didacticiel est actif.

- **renvoie** : boolean true si actif.

#### `ui_firstDrive_moveOff.getState()`

Renvoie la dernière instruction publiée (label, steps, sectionIndex, sectionCount, active), ou nil si rien n'est affiché.

- **renvoie** : table|nil Dernier état envoyé à l'interface.

#### `ui_firstDrive_moveOff.onUpdate(dtReal)`

Hook appelé à chaque image avec dtReal (secondes réelles). Reconfigure le suivi si le véhicule du joueur change, attend la fin des délais, calcule l'instruction courante, la publie à l'interface si elle a changé et émet onFirstDriveMoveOffSectionCompleted quand une section vient d'être validée.

- `dtReal` (*number*) : Durée réelle de l'image en secondes.

#### `ui_firstDrive_moveOff.onVehicleDestroyed(vehicleId)`

Hook appelé quand un véhicule est détruit : arrête le suivi si c'est le véhicule suivi.

- `vehicleId` (*integer*) : Identifiant du véhicule détruit.

#### `ui_firstDrive_moveOff.onVehicleReplaced(vehicleId)`

Hook appelé quand un véhicule est remplacé ; même traitement que onVehicleDestroyed.

- `vehicleId` (*integer*) : Identifiant du véhicule remplacé.

#### `ui_firstDrive_moveOff.onVehicleSwitched(_, newVehicleId, player)`

Hook appelé quand le véhicule du joueur change. Relance le suivi sur le nouveau véhicule (ignoré si inactif ou si player n'est pas 0).

- `_` (*any*) : Identifiant de l'ancien véhicule (non utilisé).
- `newVehicleId` (*integer|nil*) : Identifiant du nouveau véhicule.
- `player` (*integer|nil*) : Indice du joueur concerné.

#### `ui_firstDrive_moveOff.setEnabled(value)`

Active ou désactive le didacticiel. À l'activation, commence à suivre le véhicule du joueur 0 (abonnements aux valeurs throttle_input, brake_input, clutch_input, gearIndex, engineRunning, rpm, wheelspeed) ; à la désactivation, désabonne, cache l'application et envoie { active = false }. Sans effet si l'état ne change pas.

- `value` (*boolean*) : Seul true active ; toute autre valeur désactive.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant celle-ci : ui_appContainers. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onFirstDriveMoveOffSectionCompleted`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/firstDrive/moveOff.lua`.*
