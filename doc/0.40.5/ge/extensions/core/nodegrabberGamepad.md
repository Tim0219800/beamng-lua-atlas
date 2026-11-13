# `core_nodegrabberGamepad`

*Fichier : `lua/ge/extensions/core/nodegrabberGamepad.lua` · VM : Game Engine (GE) · 262 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_nodegrabberGamepad` : `extensions.load("core_nodegrabberGamepad")`, puis la globale `core_nodegrabberGamepad`

Extension GE `core_nodegrabberGamepad` : pilote le 'nodegrabber' (attraper et tirer un nœud du véhicule avec la souris ou la manette) pour les entrées manette et souris. Elle active l'action map 'Nodegrabber', bascule temporairement la caméra du joueur vers la caméra 'relative' placée comme la caméra actuelle, règle la force de traction (0 à 100) et affiche la légende des touches. Les appels sont normalement déclenchés par les actions d'entrée (nodegrabberPadMode, nodegrabberGrab, nodegrabberStrength...), pas par du code de mod.

## Exemple

```lua
-- exemple de liaison d'action (côté input) : core_nodegrabberGamepad.toggleActive() active/désactive le mode manette
core_nodegrabberGamepad.addStrength(5)
```

## Remarques

- M.state est exporté et mutable : { active (mode manette), actionMapActive, mouseActive, grabbing, previousCameraName, previousRelativeData, vehId, strength = 30 }.
- Le mode manette (active) place la caméra en 'relative' avec la même position/rotation/FOV que la caméra courante (relative à un repère du véhicule construit sur les nœuds ref/left/back de la caméra relative, ou 0/1/2 par défaut), et restaure la caméra précédente à la désactivation. Il ne démarre pas si une caméra globale est active.
- La force (state.strength) est bornée à [0, 100] et se règle par boutons (pas de 5) ou axe analogique (50 unités par seconde, via onUpdate). Un message UI 'ui.nodegrabber.strength' avec le pourcentage entier est affiché quand la valeur arrondie change.
- grab(value, deviceName) : pour un périphérique dont le nom commence par 'mouse', le bouton souris du nodegrabber est simulé ; sinon setGrab applique la force proportionnelle à value (0..1) × strength.
- Toute interaction est annulée (resetInteraction) quand : l'extension est déchargée, le niveau finit, l'interface CEF devient visible, un menu s'ouvre, le véhicule suivi est reset/remplacé/rechargé, les actions nodegrabberRender/nodegrabberGrab deviennent bloquées, ou la caméra change (sauf vers 'relative'). onSerialize réinitialise aussi l'interaction, mais il n'y a pas d'onDeserialized : l'état renvoyé n'est pas restauré.
- Dépendance : ui_bindingsLegend (légende des touches : priorité 8.2 pour la manette, 10.2 pour la souris).

**Dépendances (chargées avant) :** `ui_bindingsLegend`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_nodegrabberGamepad.addStrength(value)` | Ajoute `value` à la force de traction (bornée à 0..100), l'applique au nodegrabber et affiche le message UI si la valeur arrondie a changé. | 203 |
| `core_nodegrabberGamepad.changeStrength(value, filterType)` | Action d'entrée de réglage de la force : bouton binaire (filterType 0) = addStrength(value × 5) ; axe analogique = mémorise la valeur et onUpdate l'applique en continu. | 209 |
| `core_nodegrabberGamepad.fixCurrentNode()` | Restaure la force normale et fixe (épingle) le nœud actuellement ciblé via be.nodeGrabber:fixCurrentNode. | 198 |
| `core_nodegrabberGamepad.grab(value, deviceName)` | Action d'entrée 'grab' : attrape ou relâche selon le périphérique (souris = clic simulé ; autre = setGrab). | 180 |
| `core_nodegrabberGamepad.onActionFilterUpdated()` | Quand les filtres d'actions changent : annule l'interaction si nodegrabberRender ou nodegrabberGrab est bloquée. *(interne)* *(hook)* | 253 |
| `core_nodegrabberGamepad.onBeforeVehicleReplaced(vehicleId)` | Avant le remplacement d'un véhicule : annule l'interaction si concerné. *(interne)* *(hook)* | 251 |
| `core_nodegrabberGamepad.onCameraModeChanged(cameraName)` | Quand le mode de caméra change : désactive le mode manette (hors grab et souris) si la nouvelle caméra n'est pas 'relative'. *(interne)* *(hook)* | 258 |
| `core_nodegrabberGamepad.onCefVisibilityChanged(cefVisible)` | Quand l'interface CEF change de visibilité : annule l'interaction si elle devient invisible. *(interne)* *(hook)* | 245 |
| `core_nodegrabberGamepad.onClientEndMission()` | À la fin du niveau : annule toute interaction. *(interne)* *(hook)* | 244 |
| `core_nodegrabberGamepad.onDespawnObject(vehicleId, isReloading)` | Quand un objet est supprimé : annule l'interaction seulement s'il s'agit d'un rechargement (isReloading). *(interne)* *(hook)* | 252 |
| `core_nodegrabberGamepad.onExtensionUnloaded()` | Au déchargement : annule toute interaction. *(interne)* *(hook)* | 243 |
| `core_nodegrabberGamepad.onGlobalCameraSet(cameraName)` | Quand une caméra globale est activée : désactive le mode manette (hors grab et souris). *(interne)* *(hook)* | 259 |
| `core_nodegrabberGamepad.onMenuActionMapEnabled(enabled)` | Quand l'action map de menu s'active : annule l'interaction. *(interne)* *(hook)* | 246 |
| `core_nodegrabberGamepad.onNodegrab(grabbed)` | Appelé par le nodegrabber natif quand un nœud est attrapé ou relâché : met à jour state.grabbing, la légende souris et l'affichage des nœuds. *(interne)* *(hook)* | 169 |
| `core_nodegrabberGamepad.onSerialize()` | Avant un rechargement Lua : annule toute interaction et renvoie M.state. *(interne)* *(hook)* | 237 |
| `core_nodegrabberGamepad.onUpdate(dtReal)` | Hook par frame : en mode manette actif et si l'axe de force est non nul, ajoute strengthAxis × 50 × dtReal à la force. *(interne)* *(hook)* | 217 |
| `core_nodegrabberGamepad.onVehicleResetted(vehicleId)` | Quand un véhicule est remis à zéro : annule l'interaction si c'est le véhicule suivi ou le véhicule joueur. *(interne)* *(hook)* | 250 |
| `core_nodegrabberGamepad.setGrab(value)` | Attrape (value > 0, avec la force value × strength) ou relâche (restaure la force normale) le nœud ciblé. | 188 |
| `core_nodegrabberGamepad.setMouseActive(enabled)` | Active ou désactive le mode souris. Activer le mode souris désactive d'abord le mode manette. | 159 |
| `core_nodegrabberGamepad.toggleActive()` | Active ou désactive le mode manette du nodegrabber (caméra relative, mode contrôleur, action map et légende). | 176 |

### Détail des paramètres

#### `core_nodegrabberGamepad.addStrength(value)`

Ajoute `value` à la force de traction (bornée à 0..100), l'applique au nodegrabber et affiche le message UI si la valeur arrondie a changé.

- `value` (*number*) : Variation de force.

#### `core_nodegrabberGamepad.changeStrength(value, filterType)`

Action d'entrée de réglage de la force : bouton binaire (filterType 0) = addStrength(value × 5) ; axe analogique = mémorise la valeur et onUpdate l'applique en continu.

- `value` (*number*) : Valeur de l'entrée.
- `filterType` (*integer*) : 0 pour un bouton, autre pour un axe.

#### `core_nodegrabberGamepad.grab(value, deviceName)`

Action d'entrée 'grab' : attrape ou relâche selon le périphérique (souris = clic simulé ; autre = setGrab).

- `value` (*number*) : Valeur de l'axe ou du bouton (0 = relâché).
- `deviceName` (*string*) : Nom du périphérique d'entrée (commençant par 'mouse' pour une souris).

#### `core_nodegrabberGamepad.onBeforeVehicleReplaced(vehicleId)`

Avant le remplacement d'un véhicule : annule l'interaction si concerné.

- `vehicleId` (*integer*) : Id du véhicule.

#### `core_nodegrabberGamepad.onCameraModeChanged(cameraName)`

Quand le mode de caméra change : désactive le mode manette (hors grab et souris) si la nouvelle caméra n'est pas 'relative'.

- `cameraName` (*string*) : Nom du nouveau mode de caméra.

#### `core_nodegrabberGamepad.onCefVisibilityChanged(cefVisible)`

Quand l'interface CEF change de visibilité : annule l'interaction si elle devient invisible.

- `cefVisible` (*boolean*) : Interface visible.

#### `core_nodegrabberGamepad.onDespawnObject(vehicleId, isReloading)`

Quand un objet est supprimé : annule l'interaction seulement s'il s'agit d'un rechargement (isReloading).

- `vehicleId` (*integer*) : Id de l'objet.
- `isReloading` (*boolean*) : true si c'est un rechargement du véhicule.

#### `core_nodegrabberGamepad.onGlobalCameraSet(cameraName)`

Quand une caméra globale est activée : désactive le mode manette (hors grab et souris).

- `cameraName` (*string|nil*) : Nom de la caméra globale.

#### `core_nodegrabberGamepad.onMenuActionMapEnabled(enabled)`

Quand l'action map de menu s'active : annule l'interaction.

- `enabled` (*boolean*) : Action map de menu active.

#### `core_nodegrabberGamepad.onNodegrab(grabbed)`

Appelé par le nodegrabber natif quand un nœud est attrapé ou relâché : met à jour state.grabbing, la légende souris et l'affichage des nœuds.

- `grabbed` (*boolean*) : true si un nœud est actuellement attrapé.

#### `core_nodegrabberGamepad.onSerialize()`

Avant un rechargement Lua : annule toute interaction et renvoie M.state.

- **renvoie** : table M.state.

#### `core_nodegrabberGamepad.onUpdate(dtReal)`

Hook par frame : en mode manette actif et si l'axe de force est non nul, ajoute strengthAxis × 50 × dtReal à la force.

- `dtReal` (*number*) : Temps réel écoulé (s).

#### `core_nodegrabberGamepad.onVehicleResetted(vehicleId)`

Quand un véhicule est remis à zéro : annule l'interaction si c'est le véhicule suivi ou le véhicule joueur.

- `vehicleId` (*integer*) : Id du véhicule.

#### `core_nodegrabberGamepad.setGrab(value)`

Attrape (value > 0, avec la force value × strength) ou relâche (restaure la force normale) le nœud ciblé.

- `value` (*number*) : Intensité 0..1 (> 0 = attraper).

#### `core_nodegrabberGamepad.setMouseActive(enabled)`

Active ou désactive le mode souris. Activer le mode souris désactive d'abord le mode manette.

- `enabled` (*boolean*) : true pour activer.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | { 'ui_bindingsLegend' }. |
| `state` | table | État du nodegrabber (voir notes). |

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/nodegrabberGamepad.lua`.*
