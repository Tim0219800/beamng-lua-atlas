# `editor_engineAudioDebug`

*Fichier : `lua/ge/extensions/editor/engineAudioDebug.lua` · VM : Game Engine (GE) · 329 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_engineAudioDebug` : `extensions.load("editor_engineAudioDebug")`, puis la globale `editor_engineAudioDebug`

Fenêtre d'éditeur « Engine Audio Debug » (menu Audio) pour régler en direct le son moteur du véhicule joueur. Elle récupère les données de sons moteur côté véhicule (sounds.getEngineSoundData via queueLuaCommand), propose une liste de moteurs/sons et des curseurs (gain principal, on/off-load, shelves bas/haut, EQ bas/haut, fréquence fondamentale par nombre de cylindres, étouffement), affiche la direction d'échappement, et permet de copier les valeurs en JSON dans le presse-papiers ou de tout remettre à 0. Les fréquences en Hz sont converties en valeurs FMOD (table 20 Hz à 22 kHz).

## Exemple

```lua
extensions.load('editor_engineAudioDebug'); editor_engineAudioDebug.open()
```

## Remarques

- M.onUpdate vaut nop par défaut ; il n'est remplacé par la vraie fonction que lorsque la fenêtre est affichée (onEditorToolWindowShow) et remis à nop à sa fermeture, avec extensions.hookUpdate("onUpdate") pour reconstruire la liste des hooks.
- M.onDebugDrawActive est exporté mais la variable locale onDebugDrawActive n'est jamais définie dans le fichier : le champ vaut nil.
- Les données moteur sont écrites par le véhicule dans editor_engineAudioDebug.engine (engineSoundData, engineNameStrings) via queueGameEngineLua : elles arrivent avec un léger retard.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_engineAudioDebug.onEditorActivated()` | Hook : recharge les données moteur à l'entrée dans l'éditeur. *(interne)* *(hook)* | 297 |
| `editor_engineAudioDebug.onEditorDeactivated()` | Hook : masque l'affichage de la direction d'échappement du moteur sélectionné. *(interne)* *(hook)* | 290 |
| `editor_engineAudioDebug.onEditorInitialized()` | Enregistre la fenêtre (500x200) et l'entrée de menu (groupe Audio). *(interne)* *(hook)* | 279 |
| `editor_engineAudioDebug.onEditorToolWindowHide(windowName)` | Hook appelé au masquage d'une fenêtre d'outil ; si c'est la fenêtre du module, remet onUpdate à nop. *(interne)* *(hook)* | 301 |
| `editor_engineAudioDebug.onEditorToolWindowShow(windowName)` | Hook appelé à l'affichage d'une fenêtre d'outil ; si c'est la fenêtre du module, active onUpdate. *(interne)* *(hook)* | 308 |
| `editor_engineAudioDebug.onExtensionLoaded()` | Hook appelé au chargement : lit les données de sons moteur du véhicule joueur. *(interne)* *(hook)* | 275 |
| `editor_engineAudioDebug.onVehicleSwitched(oldVehicle, newVehicle, player)` | Hook appelé au changement de véhicule ; recharge les données si l'éditeur est actif. *(interne)* *(hook)* | 284 |
| `editor_engineAudioDebug.open()` | Affiche la fenêtre « Engine Audio Debug » et force un rafraîchissement des valeurs. | 269 |

### Détail des paramètres

#### `editor_engineAudioDebug.onEditorToolWindowHide(windowName)`

Hook appelé au masquage d'une fenêtre d'outil ; si c'est la fenêtre du module, remet onUpdate à nop.

- `windowName` (*string*) : Nom de la fenêtre

#### `editor_engineAudioDebug.onEditorToolWindowShow(windowName)`

Hook appelé à l'affichage d'une fenêtre d'outil ; si c'est la fenêtre du module, active onUpdate.

- `windowName` (*string*) : Nom de la fenêtre

#### `editor_engineAudioDebug.onVehicleSwitched(oldVehicle, newVehicle, player)`

Hook appelé au changement de véhicule ; recharge les données si l'éditeur est actif.

- `oldVehicle` (*any*) : Ancien véhicule
- `newVehicle` (*any*) : Nouveau véhicule
- `player` (*any*) : Joueur concerné

## Champs

| Champ | Type | Description |
|---|---|---|
| `onDebugDrawActive` | nil | Exporté mais toujours nil (variable locale non définie). ⚠ référence `onDebugDrawActive` non définie dans le fichier (vaut probablement nil) |
| `onUpdate` | function | nop tant que la fenêtre est fermée ; fonction de dessin/mise à jour quand elle est ouverte. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUpdate` — écouté par 186 module(s)

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/engineAudioDebug.lua`.*
