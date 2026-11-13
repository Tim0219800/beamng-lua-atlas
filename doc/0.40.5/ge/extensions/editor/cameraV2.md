# `editor_cameraV2`

*Fichier : `lua/ge/extensions/editor/cameraV2.lua` · VM : Game Engine (GE) · 564 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_cameraV2` : `extensions.load("editor_cameraV2")`, puis la globale `editor_cameraV2`

Extension de l'éditeur qui active « Camera V2 », un jeu alternatif de contrôles souris pour la caméra libre du World Editor (panoramique, orbite, zoom, WASD en plan). Elle s'enregistre comme contrôleur de caméra (core/cameraControllerRegistry, id « editor.cameraV2 ») seulement quand la préférence camera.general.activeCamera vaut « cameraV2 » ou quand setTemporaryEnabled(true) a été appelé, et que l'éditeur est actif. Elle déclare les préférences camera.cameraV2.*, affiche une fenêtre de debug et peut récupérer une caméra aux coordonnées invalides. Le travail réel est délégué à editor/cameraV2/controller.

## Remarques

- Préférences camera.cameraV2.* (défaut) : swapPanOrbitButtons (bool, true : clic droit = pan, molette = orbite), orbitAroundViewCenter (bool, true), wasdMode ('standard' ou 'pan', défaut 'standard'), wasdPanSpeedMultiplier (0,5), wasdPanFastSpeedMultiplier (1,5), showDebugWindow (bool, false), zoomFactorPerNotch (1,5), zoomMinDistance (0,25 m), zoomMaxDistance (2500 m), zoomResponse (20), inertiaDuration (0,35 s).
- Si la pose caméra est invalide (NaN, > 1e7 m, quaternion non valide) onUpdate appelle recoverCamera() et abandonne la frame si la récupération échoue.
- onUpdate limite le dt passé au contrôleur à 0,05 s.
- Quand la caméra est au-dessus de 1500 m de hauteur, un cylindre rouge de référence est dessiné de l'origine (posée sur le terrain) jusqu'à zoomMaxDistance.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_cameraV2.consumeFocusDoubleClick()` | Si Camera V2 est enregistré, relaie controller.consumeFocusDoubleClick() (double clic de focalisation consommé ou non). | 542 |
| `editor_cameraV2.onEditorActivated()` | Appelé à l'activation de l'éditeur ; réévalue l'état d'activation de Camera V2. *(interne)* *(hook)* | 504 |
| `editor_cameraV2.onEditorDeactivated()` | Appelé à la désactivation de l'éditeur ; coupe la translation planaire et désenregistre le contrôleur. *(interne)* *(hook)* | 508 |
| `editor_cameraV2.onEditorGui()` | Dessine la fenêtre « Camera V2 Debug » (bouton Recover Camera, état du contrôleur, distances de rayon curseur/centre, hauteur au-dessus du terrain, réglages de zoom) si showDebugWindow n'est pas false et que le contrôleur est enregistré. *(interne)* *(hook)* | 546 |
| `editor_cameraV2.onEditorInitialized()` | Enregistre la fenêtre de debug « cameraV2Debug » (360x250 mis à l'échelle) puis évalue l'état d'activation. *(interne)* *(hook)* | 496 |
| `editor_cameraV2.onEditorPreferenceValueChanged(path, value)` | Réagit aux changements de préférences : activeCamera réévalue l'activation, wasdMode resynchronise le mode WASD, showDebugWindow montre/cache la fenêtre, toute autre préférence camera.cameraV2.* annule le geste en cours du contrôleur. *(interne)* *(hook)* | 513 |
| `editor_cameraV2.onEditorRegisterPreferences(prefsRegistry)` | Hook d'enregistrement des préférences : crée la catégorie « camera », la sous-catégorie « general » (activeCamera : stock ou cameraV2) et « cameraV2 » (préférences ci-dessus), et réordonne les sous-catégories. *(interne)* *(hook)* | 420 |
| `editor_cameraV2.onExtensionUnloaded()` | Au déchargement : coupe le mode planaire, désenregistre le contrôleur et la fenêtre de debug. *(interne)* *(hook)* | 552 |
| `editor_cameraV2.onUpdate(dtReal)` | Appelé à chaque frame. Si Camera V2 est actif : valide/récupère la pose, met à jour le contrôleur avec dt limité à 0,05 s, dessine la référence d'altitude et les repères de pivot (sphère rouge d'orbite, cylindre bleu de pan). *(interne)* *(hook)* | 529 |
| `editor_cameraV2.setTemporaryEnabled(enabled)` | Force l'activation de Camera V2 indépendamment de la préférence (utile à un outil qui veut ces contrôles temporairement). Met à jour l'état d'enregistrement du contrôleur. | 205 |

### Détail des paramètres

#### `editor_cameraV2.consumeFocusDoubleClick()`

Si Camera V2 est enregistré, relaie controller.consumeFocusDoubleClick() (double clic de focalisation consommé ou non).

- **renvoie** : boolean false si Camera V2 n'est pas actif

#### `editor_cameraV2.onEditorPreferenceValueChanged(path, value)`

Réagit aux changements de préférences : activeCamera réévalue l'activation, wasdMode resynchronise le mode WASD, showDebugWindow montre/cache la fenêtre, toute autre préférence camera.cameraV2.* annule le geste en cours du contrôleur.

- `path` (*string*) : Chemin de la préférence
- `value` (*any*) : Nouvelle valeur

#### `editor_cameraV2.onEditorRegisterPreferences(prefsRegistry)`

Hook d'enregistrement des préférences : crée la catégorie « camera », la sous-catégorie « general » (activeCamera : stock ou cameraV2) et « cameraV2 » (préférences ci-dessus), et réordonne les sous-catégories.

- `prefsRegistry` (*table*) : Registre de préférences de l'éditeur

#### `editor_cameraV2.onUpdate(dtReal)`

Appelé à chaque frame. Si Camera V2 est actif : valide/récupère la pose, met à jour le contrôleur avec dt limité à 0,05 s, dessine la référence d'altitude et les repères de pivot (sphère rouge d'orbite, cylindre bleu de pan).

- `dtReal` (*number|nil*) : Delta de temps réel en secondes ; à défaut ui_imgui.GetIO().DeltaTime

#### `editor_cameraV2.setTemporaryEnabled(enabled)`

Force l'activation de Camera V2 indépendamment de la préférence (utile à un outil qui veut ces contrôles temporairement). Met à jour l'état d'enregistrement du contrôleur.

- `enabled` (*boolean*) : true pour activer, tout le reste est traité comme false

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `debugDrawer:` `drawCylinder`, `drawSphere`
- `ui_imgui.` `Button`, `GetIO`, `ImVec2`, `ImVec4`, `PopStyleColor`, `PushStyleColor2`, `RadioButton1`, `SameLine`, `Separator`, `TextColored`, `TextUnformatted`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/cameraV2.lua`.*
