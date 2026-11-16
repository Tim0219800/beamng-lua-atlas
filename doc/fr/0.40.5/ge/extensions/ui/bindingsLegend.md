# `ui_bindingsLegend`

*Fichier : `lua/ge/extensions/ui/bindingsLegend.lua` · VM : Game Engine (GE) · 1107 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_bindingsLegend` : `extensions.load("ui_bindingsLegend")`, puis la globale `ui_bindingsLegend`

Alimente l'app « légende des commandes » (bindings legend) de l'interface. Elle regroupe des jeux d'actions (nommés par un label et classés par priorité) et les envoie à l'UI via `setActionsForLegend` : actions liées aux modificateurs maintenus (Shift, Ctrl, Alt, modifier1 à 6), actions propres au véhicule, commandes de conduite de base et actions constantes. Un moddeur ou un autre module s'en sert pour afficher ses propres actions à l'écran avec addActions. Dépend de `core_input_actions` et `core_input_bindings`.

## Exemple

```lua
ui_bindingsLegend.addActions('monMod', {
  {action = 'toggle_slow_motion'}
}, {priority = 5, ttl = 8})
```

## Remarques

- Chaque jeu d'actions est identifié par son label ; addActions remplace le jeu existant de même label. Priorités vues dans le code : modificateurs 9, vehicleSpecific 10 (affiché à la demande) ou 8 (éphémère après changement de véhicule), actions constantes 10. Si un jeu a une priorité, seuls les jeux de priorité maximale sont envoyés à l'UI.
- `additionalData.ttl` (secondes réelles) retire le jeu automatiquement dans onUpdate ; `removeIfOverwrittenWithHigherPriority` annule l'ajout si un jeu de priorité supérieure existe déjà ; `resetFade` vaut true par défaut.
- Chaque action reçoit par défaut `inputActionOnClick = true` et, sans `label`, le titre de l'action active (`core_input_actions.getActiveActions()[action].title`) : une action inconnue provoquerait une erreur sur nil.
- Au maximum `actionLimit = 50` est défini en constante ; la combinaison Shift seule est filtrée (actions marquées `hidden`).
- shouldFade() renvoie toujours false : le masquage automatique après 7 s (fadeDelaySeconds) est désactivé dans cette version, le code d'origine étant en commentaire.
- onInputBindingsChanged et onPlayerVehicleDataChanged sont locales ; seul onPlayerVehicleDataChanged est exportée (sous les noms onVehicleSpawned et onVehicleResetted). onInputBindingsChanged n'est pas exportée, donc jamais appelée comme hook : le fichier ne réagit pas à ce changement de bindings (déduit du code).
- Réglage utilisé : `bindingsLegendShowApp` (booléen, true par défaut).
- Les actions toujours affichées (actionsToAlwaysShow) sont notamment toggleWalkingMode, activateStarterMotor, toggleShowVehicleSpecificActions, toggle_slow_motion, toggleShowBindingsLegendApp, nodegrabberPadMode et switch_next_vehicle ; le fichier `ui/bindingAppActions.json` est lu au chargement.

**Dépendances (chargées avant) :** `core_input_actions`, `core_input_bindings`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_bindingsLegend.addActions(label, actions, additionalData)` | Ajoute (ou remplace) un jeu d'actions affiché dans la légende, puis envoie les données à l'UI. Un jeu vide supprime simplement l'ancien jeu de même label. | 754 |
| `ui_bindingsLegend.enableShowVehicleSpecificActions(enable)` | Active ou désactive l'affichage des actions propres au véhicule (priorité 10). Sans effet si l'app est masquée dans les réglages, si l'état demandé est déjà actif, ou si le véhicule n'a pas de telles actions. | 925 |
| `ui_bindingsLegend.onActionFilterUpdated()` | Hook appelé quand le filtre d'actions change. Invalide les caches et renvoie les données à l'UI. *(interne)* *(hook)* | 979 |
| `ui_bindingsLegend.onClientEndMission()` | Hook appelé à la fin d'une mission/niveau. Vide les jeux d'actions et les caches, et désenregistre les modes de boîte de vitesses. *(interne)* *(hook)* | 951 |
| `ui_bindingsLegend.onClientStartMission()` | Hook appelé au début d'une mission/niveau. Ne fait rien. *(interne)* *(hook)* | 948 |
| `ui_bindingsLegend.onDeserialized(data)` | Hook appelé après un rechargement Lua. Lance un job qui invalide le cache des actions de modificateurs. *(interne)* *(hook)* | 1069 |
| `ui_bindingsLegend.onDeviceChanged()` | Hook appelé quand le périphérique d'entrée change. Invalide les caches et renvoie les données à l'UI. *(interne)* *(hook)* | 1063 |
| `ui_bindingsLegend.onExtensionLoaded()` | Hook appelé au chargement de l'extension. Lit `ui/bindingAppActions.json` et calcule les actions disponibles du véhicule. *(interne)* *(hook)* | 1050 |
| `ui_bindingsLegend.onModifierChanged(newModifiers)` | Hook appelé quand les touches modificatrices maintenues changent. Cherche, parmi les bindings des périphériques récents, les actions dont les modificateurs correspondent exactement et les affiche comme jeu `modified` (priorité 9). *(interne)* *(hook)* | 791 |
| `ui_bindingsLegend.onSettingsChanged()` | Hook appelé quand les réglages changent. Réinitialise la signature des commandes de base et renvoie les données à l'UI. *(interne)* *(hook)* | 996 |
| `ui_bindingsLegend.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque frame. Avance le minuteur de fade, rafraîchit les commandes de conduite de base (changement de mode de boîte), décompte le `ttl` des jeux d'actions et affiche la fenêtre de debug. Sort tôt s'il n'y a pas de véhicule joueur. *(interne)* *(hook)* | 869 |
| `ui_bindingsLegend.onVehicleResetted(vehId)` | Hook appelé quand un véhicule est réinitialisé. Même fonction que onVehicleSpawned : si c'est le véhicule du joueur 0 (ou sans id), invalide les caches et renvoie les données à l'UI. *(interne)* *(hook)* | 969 |
| `ui_bindingsLegend.onVehicleSpawned(vehId)` | Hook appelé quand un véhicule est créé. Voir onVehicleResetted. *(interne)* *(hook)* | 969 |
| `ui_bindingsLegend.onVehicleSwitched(oldId, newId, player)` | Hook appelé quand le véhicule contrôlé change. Recalcule les actions du véhicule et, s'il en a, les affiche brièvement (jeu `vehicleSpecific`, ttl 10 s) avec un message d'aide. *(interne)* *(hook)* | 1027 |
| `ui_bindingsLegend.resetFade()` | Remet à zéro le minuteur de masquage de la légende. | 107 |
| `ui_bindingsLegend.sendDataToUI(forceResetFade)` | Fusionne les jeux d'actions (en gardant ceux de plus haute priorité), ajoute infos de modificateurs et état `showApp`, puis envoie le tout à l'UI par le hook `setActionsForLegend`. | 630 |
| `ui_bindingsLegend.setDebug(enabled)` | Active ou désactive la fenêtre ImGui « BindingsLegend Debug » (délai de masquage, état de fade). | 82 |
| `ui_bindingsLegend.setShowBasicDrivingControls(enable)` | Active ou désactive l'affichage des commandes de conduite de base (jeu `basicDriving`), mis à jour selon le mode de boîte de vitesses. | 901 |
| `ui_bindingsLegend.showToggleVehicleSpecificActionsMessage()` | Affiche deux messages UI (`Message`, 10 s) indiquant comment afficher les actions du véhicule, un pour manette et un pour clavier. Ignoré pendant l'expérience de première conduite ou si l'app est masquée. | 1007 |
| `ui_bindingsLegend.toggleShowApp()` | Bascule le réglage `bindingsLegendShowApp`, masque les actions du véhicule, remet le minuteur à zéro et renvoie les données à l'UI. | 1075 |
| `ui_bindingsLegend.toggleShowVehicleSpecificActions()` | Affiche ou masque les actions propres au véhicule du joueur. | 944 |
| `ui_bindingsLegend.triggerInputAction(action, value)` | Exécute une action d'entrée comme si elle était déclenchée, sur le véhicule du joueur 0 (appelée depuis l'UI quand on clique une action). | 1058 |

### Détail des paramètres

#### `ui_bindingsLegend.addActions(label, actions, additionalData)`

Ajoute (ou remplace) un jeu d'actions affiché dans la légende, puis envoie les données à l'UI. Un jeu vide supprime simplement l'ancien jeu de même label.

- `label` (*string*) : Nom du jeu d'actions (clé de remplacement).
- `actions` (*table<integer, table>*) : Actions ; chaque entrée a au moins `action` (nom de l'action d'entrée) et éventuellement `label`, `inputActionOnClick`.
- `additionalData` (*table|nil*) : Options : priority, ttl, removeIfOverwrittenWithHigherPriority, resetFade, modifiersActive…

#### `ui_bindingsLegend.enableShowVehicleSpecificActions(enable)`

Active ou désactive l'affichage des actions propres au véhicule (priorité 10). Sans effet si l'app est masquée dans les réglages, si l'état demandé est déjà actif, ou si le véhicule n'a pas de telles actions.

- `enable` (*boolean*) : true pour afficher.

#### `ui_bindingsLegend.onDeserialized(data)`

Hook appelé après un rechargement Lua. Lance un job qui invalide le cache des actions de modificateurs.

- `data` (*any*) : Données désérialisées (non utilisées).

#### `ui_bindingsLegend.onModifierChanged(newModifiers)`

Hook appelé quand les touches modificatrices maintenues changent. Cherche, parmi les bindings des périphériques récents, les actions dont les modificateurs correspondent exactement et les affiche comme jeu `modified` (priorité 9).

- `newModifiers` (*integer*) : Masque de bits : 1 Shift G, 2 Shift D, 4 Ctrl G, 8 Ctrl D, 16 Alt G, 32 Alt D, 64 à 2048 modifier1 à modifier6.

#### `ui_bindingsLegend.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque frame. Avance le minuteur de fade, rafraîchit les commandes de conduite de base (changement de mode de boîte), décompte le `ttl` des jeux d'actions et affiche la fenêtre de debug. Sort tôt s'il n'y a pas de véhicule joueur.

- `dtReal` (*number*) : Delta de temps réel en secondes.
- `dtSim` (*number*) : Delta de temps de simulation en secondes (non utilisé).
- `dtRaw` (*number*) : Delta brut en secondes (non utilisé).

#### `ui_bindingsLegend.onVehicleResetted(vehId)`

Hook appelé quand un véhicule est réinitialisé. Même fonction que onVehicleSpawned : si c'est le véhicule du joueur 0 (ou sans id), invalide les caches et renvoie les données à l'UI.

- `vehId` (*integer*) : Id du véhicule.

#### `ui_bindingsLegend.onVehicleSpawned(vehId)`

Hook appelé quand un véhicule est créé. Voir onVehicleResetted.

- `vehId` (*integer*) : Id du véhicule.

#### `ui_bindingsLegend.onVehicleSwitched(oldId, newId, player)`

Hook appelé quand le véhicule contrôlé change. Recalcule les actions du véhicule et, s'il en a, les affiche brièvement (jeu `vehicleSpecific`, ttl 10 s) avec un message d'aide.

- `oldId` (*integer*) : Ancien véhicule.
- `newId` (*integer*) : Nouveau véhicule.
- `player` (*integer*) : Joueur concerné (non utilisé).

#### `ui_bindingsLegend.sendDataToUI(forceResetFade)`

Fusionne les jeux d'actions (en gardant ceux de plus haute priorité), ajoute infos de modificateurs et état `showApp`, puis envoie le tout à l'UI par le hook `setActionsForLegend`.

- `forceResetFade` (*boolean|nil*) : Force la remise à zéro du délai de masquage.

#### `ui_bindingsLegend.setDebug(enabled)`

Active ou désactive la fenêtre ImGui « BindingsLegend Debug » (délai de masquage, état de fade).

- `enabled` (*boolean*) : true pour afficher la fenêtre.

#### `ui_bindingsLegend.setShowBasicDrivingControls(enable)`

Active ou désactive l'affichage des commandes de conduite de base (jeu `basicDriving`), mis à jour selon le mode de boîte de vitesses.

- `enable` (*boolean*) : true pour activer.

#### `ui_bindingsLegend.triggerInputAction(action, value)`

Exécute une action d'entrée comme si elle était déclenchée, sur le véhicule du joueur 0 (appelée depuis l'UI quand on clique une action).

- `action` (*string*) : Nom de l'action d'entrée.
- `value` (*number|nil*) : Valeur transmise à `core_input_actions.executeCommand`.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : core_input_actions et core_input_bindings. |

**Évènements UI (guihooks.trigger) :** `Message`, `setActionsForLegend`, `setBindingsLegendFade`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicle`, `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/bindingsLegend.lua`.*
