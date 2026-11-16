# `ui_simplePowertrainControl`

*Fichier : `lua/vehicle/extensions/ui/simplePowertrainControl.lua` · VM : Véhicule · 59 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_simplePowertrainControl` : `extensions.load (VM véhicule)("ui_simplePowertrainControl")`, puis la globale `ui_simplePowertrainControl`

Pont entre le véhicule et les boutons de contrôle simplifié du groupe motopropulseur affichés dans l'UI. setButton envoie l'événement UI `ChangePowerTrainButtons` (créer, mettre à jour ou retirer un bouton) ; updateButtons demande à powertrain et aux contrôleurs de republier leurs boutons. Les modules powertrain/controller s'en servent, un moddeur peut y ajouter ses propres boutons.

## Exemple

```lua
ui_simplePowertrainControl.setButton('myBtn', 'Mon bouton', 'iconId', '#ff8800', 0.5, 'controller.getController("x").toggle()', false, true)
```

## Remarques

- Le champ `players` envoyé à l'UI est la liste triée des index de joueurs assis (playerInfo.seatedPlayers).
- La couleur est normalisée : si c'est une chaîne non vide sans '#' initial, un '#' est ajouté ; sinon (nil ou autre type) elle devient nil.
- onClickCallback est transmis tel quel à l'UI (champ onClick) ; il s'agit d'une valeur que l'UI renverra, vraisemblablement une chaîne de code Lua (déduit du code, non vérifié ici).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_simplePowertrainControl.onInit()` | Hook d'initialisation du véhicule ; corps vide. *(interne)* *(hook)* | 49 |
| `ui_simplePowertrainControl.onReset()` | Hook de reset du véhicule ; corps vide. *(interne)* *(hook)* | 46 |
| `ui_simplePowertrainControl.setButton(id, uiName, icon, color, ringValue, onClickCallback, remove, active)` | Publie un bouton de contrôle simplifié vers l'UI via guihooks.trigger('ChangePowerTrainButtons', {...}). | 17 |
| `ui_simplePowertrainControl.updateButtons()` | Appelle powertrain.updateSimpleControlButtons() puis controller.updateSimpleControlButtons() pour que chaque module republie ses boutons. | 41 |

### Détail des paramètres

#### `ui_simplePowertrainControl.setButton(id, uiName, icon, color, ringValue, onClickCallback, remove, active)`

Publie un bouton de contrôle simplifié vers l'UI via guihooks.trigger('ChangePowerTrainButtons', {...}).

- `id` (*string*) : Identifiant du bouton.
- `uiName` (*string*) : Texte d'infobulle (champ tooltip).
- `icon` (*string*) : Identifiant d'icône.
- `color` (*string|nil*) : Couleur hexadécimale ; '#' ajouté si absent.
- `ringValue` (*number|any*) : Valeur de l'anneau de progression du bouton (transmise telle quelle).
- `onClickCallback` (*string|any*) : Callback transmis à l'UI (champ onClick).
- `remove` (*boolean|nil*) : true pour retirer le bouton.
- `active` (*boolean|nil*) : État actif du bouton.

**Évènements UI (guihooks.trigger) :** `ChangePowerTrainButtons`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/ui/simplePowertrainControl.lua`.*
