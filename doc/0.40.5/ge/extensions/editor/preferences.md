# `editor_preferences`

*Fichier : `lua/ge/extensions/editor/preferences.lua` · VM : Game Engine (GE) · 461 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_preferences` : `extensions.load("editor_preferences")`, puis la globale `editor_preferences`

Fenêtre « Preferences » de l'éditeur de monde. Elle affiche à gauche la liste des pages (catégories du registre editor.preferencesRegistry) et à droite les préférences de la page choisie via un valueInspector, avec un filtre de recherche et un bouton « Reset All To Defaults ». Le module enregistre aussi les catégories general, camera et ui avec leurs préférences par défaut (échelle UI, vitesse de la caméra libre, etc.) et réagit aux changements de valeur. Un moddeur d'outil d'éditeur peut ouvrir la fenêtre avec editor.showPreferences(categorie).

## Exemple

```lua
editor.showPreferences('camera')  -- ouvre la fenêtre sur la page Camera
local v = editor.getPreference('ui.general.scale')
```

## Remarques

- Préférences déclarées : general.internal (cleanExit, lastLevel, cachées), ui.general (floatDigitCount, hexColorInput, scale 0.92 par défaut [0.4 à 3], dpiAware, iconButtonSize 28, singleLineToolbar, enableVehicleControls, sceneMetric, useSlidersInInspector, showCompleteSceneTree, showInternalName, playSoundOnNotifications, muteGameAudioOnEditorActivate, lockedObjectTextColor, inspectorFieldNameHoverCopyPaste, forceExpandWindowOnFirstShow, recentWindowMenuCount), camera.general (freeCameraMoveSmoothness 0.3, freeCameraRotateSmoothness 0.3, freeCameraMoveSpeed 30, smoothCameraMove, smoothCameraRotate, setVehicleCameraWhenExitingEditor).
- Les modifications de préférence passent par editor.setPreference sans support d'annulation (commentaire TODO dans le code).
- Le « Reset All To Defaults » est irréversible (confirmation modale).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_preferences.onDeserialized(state)` | Appelé au rechargement de l'extension (après un rechargement Lua) avec l'état sauvegardé ; restaure la page de préférences courante (currentCategoryName). *(interne)* *(hook)* | 435 |
| `editor_preferences.onEditorActivated()` | Appelé à l'ouverture de l'éditeur ; applique l'échelle UI de la préférence ui.general.scale. *(interne)* *(hook)* | 447 |
| `editor_preferences.onEditorDeactivated()` | Appelé à la fermeture de l'éditeur ; remet l'échelle UI à 1 et, si la préférence camera.general.setVehicleCameraWhenExitingEditor est vraie (et que ce n'est pas la caméra libre du jeu ni editor.skipCameraOnExit), repasse sur la caméra de jeu. *(interne)* *(hook)* | 439 |
| `editor_preferences.onEditorGui()` | Appelé à chaque frame par l'éditeur. Dessine la fenêtre Preferences : liste des pages, recherche, contenu de la page (ou de toutes les pages si « All ») et bouton de réinitialisation. *(interne)* *(hook)* | 237 |
| `editor_preferences.onEditorInitialized()` | Enregistre la fenêtre (800x600), configure le valueInspector (nom « preferencesInspector », classe « Preferences », callback d'écriture via editor.setPreference), construit les pages et installe editor.showPreferences et editor.updatePreferencePages. *(interne)* *(hook)* | 408 |
| `editor_preferences.onEditorPreferenceValueChanged(path, value)` | Appelé quand une préférence change. Répercute immédiatement certaines valeurs : ui.general.scale / dpiAware (échelle UI), iconButtonSize, showCompleteSceneTree (rafraîchit l'arbre de scène), et les réglages de la caméra libre (vitesse, lissage de déplacement et de rotation). *(interne)* *(hook)* | 321 |
| `editor_preferences.onEditorRegisterPreferences(prefsRegistry)` | Appelé lors de l'enregistrement des préférences : déclare les catégories general, camera, ui (« User Interface ») et leurs sous-catégories avec valeurs par défaut, descriptions et bornes. *(interne)* *(hook)* | 341 |
| `editor_preferences.onExtensionLoaded()` | Appelé au chargement de l'extension ; ne fait rien. *(interne)* *(hook)* | 309 |
| `editor_preferences.onSerialize(state)` | Appelé avant un rechargement Lua ; renvoie {currentCategoryName = ...} pour conserver la page affichée. *(interne)* *(hook)* | 431 |

### Détail des paramètres

#### `editor_preferences.onDeserialized(state)`

Appelé au rechargement de l'extension (après un rechargement Lua) avec l'état sauvegardé ; restaure la page de préférences courante (currentCategoryName).

- `state` (*table*) : Table renvoyée par onSerialize ({currentCategoryName}).

#### `editor_preferences.onEditorPreferenceValueChanged(path, value)`

Appelé quand une préférence change. Répercute immédiatement certaines valeurs : ui.general.scale / dpiAware (échelle UI), iconButtonSize, showCompleteSceneTree (rafraîchit l'arbre de scène), et les réglages de la caméra libre (vitesse, lissage de déplacement et de rotation).

- `path` (*string*) : Chemin de la préférence, ex. « camera.general.freeCameraMoveSpeed ».
- `value` (*any*) : Nouvelle valeur.

#### `editor_preferences.onEditorRegisterPreferences(prefsRegistry)`

Appelé lors de l'enregistrement des préférences : déclare les catégories general, camera, ui (« User Interface ») et leurs sous-catégories avec valeurs par défaut, descriptions et bornes.

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur (registerCategory, registerSubCategory).

#### `editor_preferences.onSerialize(state)`

Appelé avant un rechargement Lua ; renvoie {currentCategoryName = ...} pour conserver la page affichée.

- `state` (*table*) : Non utilisé.
- **renvoie** : table État à sauvegarder.

## Classe `editor`

La table globale editor (pas créée ici) : le module y installe deux fonctions pendant onEditorInitialized.

Objet `editor` construit dans le module (par ex. par `new`), avec ces méthodes :

| Méthode | Description | Ligne |
|---|---|---|
| `editor.showPreferences(categoryName)` | Ouvre la fenêtre Preferences. Si categoryName est donné, sélectionne cette page. | 304 |
| `editor.updatePreferencePages()` | Reconstruit la liste des pages à partir du registre : enregistre la catégorie « general », ne garde que les catégories ayant au moins un élément non caché, et ajoute la page « All ». | 386 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/preferences.lua`.*
