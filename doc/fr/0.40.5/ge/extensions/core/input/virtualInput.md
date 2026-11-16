# `core_input_virtualInput`

*Fichier : `lua/ge/extensions/core/input/virtualInput.lua` · VM : Game Engine (GE) · 60 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_input_virtualInput` : `extensions.load("core_input_virtualInput")`, puis la globale `core_input_virtualInput`

Extension GE `core_input_virtualInput` : création de périphériques d'entrée virtuels (axes, boutons, POV) via le VirtualInputManager C++ et émission d'évènements sur ceux-ci. Un moddeur s'en sert pour injecter des commandes (volant, pédales, boutons) comme si un vrai contrôleur était branché ; les évènements passent par le système de bindings normal sous le nom de périphérique 'vinput<instance>'.

## Exemple

```lua
local inst = core_input_virtualInput.createDevice('MyPad', 'abcd1234', 2, 4, 0)
-- objType/action : valeurs attendues par le moteur (non définies dans ce fichier)
core_input_virtualInput.emit(inst, objType, 0, action, 0.5)
core_input_virtualInput.deleteDevice(inst)
```

## Remarques

- Les valeurs valides de objType et action pour emit sont définies côté C++ (non visibles dans ce fichier) ; val est un nombre.
- Les évènements sont horodatés avec os.clockhp().
- Le message d'erreur de deleteDevice dit 'Unable to create virtual device' : copier-coller dans le code du jeu, il s'agit bien d'une suppression.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_input_virtualInput.createDevice(productName, vidpid, axes, buttons, povs)` | Enregistre un périphérique virtuel auprès du VirtualInputManager et le mémorise dans M.devices. | 9 |
| `core_input_virtualInput.deleteDevice(deviceInstance)` | Désenregistre le périphérique 'vinput<deviceInstance>' et le retire de M.devices. | 26 |
| `core_input_virtualInput.emit(deviceInstance, objType, objectInstance, action, val)` | Envoie un évènement de périphérique virtuel au moteur (mgr:emitEvent('vinput', ...)). Ne fait rien si le manager est absent. | 48 |
| `core_input_virtualInput.getDeviceInfo(vidpid)` | Cherche un périphérique virtuel déjà créé par son vidpid. | 38 |

### Détail des paramètres

#### `core_input_virtualInput.createDevice(productName, vidpid, axes, buttons, povs)`

Enregistre un périphérique virtuel auprès du VirtualInputManager et le mémorise dans M.devices.

- `productName` (*string*) : Nom du produit affiché.
- `vidpid` (*string*) : Identifiant vendor/product ; sert à retrouver le périphérique avec getDeviceInfo.
- `axes` (*integer*) : Nombre d'axes (déduit du code).
- `buttons` (*integer*) : Nombre de boutons (déduit du code).
- `povs` (*integer*) : Nombre de POV/chapeaux (déduit du code).
- **renvoie** : integer|nil Numéro d'instance (>= 0) ; nil si le manager est absent ou l'instance < 0 (erreur loguée).
- **renvoie** : table|nil {productName, vidpid, axes, buttons, povs}.

#### `core_input_virtualInput.deleteDevice(deviceInstance)`

Désenregistre le périphérique 'vinput<deviceInstance>' et le retire de M.devices.

- `deviceInstance` (*integer*) : Instance renvoyée par createDevice.

#### `core_input_virtualInput.emit(deviceInstance, objType, objectInstance, action, val)`

Envoie un évènement de périphérique virtuel au moteur (mgr:emitEvent('vinput', ...)). Ne fait rien si le manager est absent.

- `deviceInstance` (*integer*) : Instance du périphérique.
- `objType` (*any*) : Type d'objet d'entrée (axe, bouton, POV) : valeur du moteur.
- `objectInstance` (*integer*) : Indice de l'axe/bouton/POV.
- `action` (*any*) : Type d'action (valeur du moteur).
- `val` (*number*) : Valeur de l'évènement.

#### `core_input_virtualInput.getDeviceInfo(vidpid)`

Cherche un périphérique virtuel déjà créé par son vidpid.

- `vidpid` (*string*) : Identifiant recherché.
- **renvoie** : integer|nil Instance, ou nil si aucun.
- **renvoie** : table|nil Infos du périphérique.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/input/virtualInput.lua`.*
