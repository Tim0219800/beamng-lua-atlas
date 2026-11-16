# `ui_photomode_flash`

*Fichier : `lua/ge/extensions/ui/photomode/flash.lua` · VM : Game Engine (GE) · 164 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_photomode_flash` : `extensions.load("ui_photomode_flash")`, puis la globale `ui_photomode_flash`

Réglages du flash du mode photo. Garde en mémoire l'état du flash (activé, tir à la capture, intensité, angle, teinte, saturation) et le transmet à l'extension util/photomodeFlash, qu'il charge à la demande. Sert de façade au panneau UI du mode photo et au module de capture (ui_photomode_capture) qui déclenche les captures avec flash.

## Exemple

```lua
ui_photomode_flash.applyStatePatch({enabled = true, intensity = 30000})
ui_photomode_flash.applyRuntimeSettings()
```

## Remarques

- Valeurs par défaut : enabled=false, fireOnCapture=false, intensity=25000, outerAngle=55, hue=0, saturation=0.
- applyStatePatch ne modifie que l'état Lua ; il faut appeler applyRuntimeSettings (ou applyPresetState) pour que util/photomodeFlash soit réellement mis à jour. Les valeurs numériques ne sont pas validées.
- Les fonctions qui échouent renvoient false plus une raison : extensions_unavailable, flash_unavailable, flash_apply_failed, screenshot_request_failed.
- getCaptureUiHoldFrames vaut 5 seulement si le flash est activé et tire à la capture, sinon 0.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_photomode_flash.applyPresetState(flashState)` | Applique un état de preset (fusion puis applyRuntimeSettings). Ne fait rien si l'argument n'est pas une table. | 95 |
| `ui_photomode_flash.applyRuntimeSettings()` | Si le flash est désactivé, coupe util/photomodeFlash (enable(false)). Sinon charge cette extension et appelle applyFromUi avec les réglages courants. | 103 |
| `ui_photomode_flash.applyStatePatch(partialState)` | Fusionne dans l'état les champs présents de partialState (enabled et fireOnCapture convertis en booléens). N'agit pas sur le moteur de rendu. | 82 |
| `ui_photomode_flash.buildState()` | Renvoie une copie de l'état du flash : enabled, fireOnCapture, intensity, outerAngle, hue, saturation. | 63 |
| `ui_photomode_flash.captureDefaultPresetState()` | Renvoie un état de flash aux valeurs par défaut, sans modifier l'état courant. | 78 |
| `ui_photomode_flash.capturePresetState()` | État du flash à enregistrer dans un preset (identique à buildState). | 74 |
| `ui_photomode_flash.getCaptureUiHoldFrames()` | Nombre d'images pendant lesquelles garder l'UI masquée/figée lors d'une capture avec flash : 5 si flash activé et fireOnCapture, sinon 0. | 147 |
| `ui_photomode_flash.resetSettings()` | Coupe le flash côté moteur puis remet les réglages Lua aux valeurs par défaut. | 154 |
| `ui_photomode_flash.restoreRuntimeState()` | Coupe le flash côté moteur (util/photomodeFlash.enable(false)) s'il est chargé, sans toucher aux réglages Lua. | 159 |
| `ui_photomode_flash.runCapture(kind, ...)` | Délègue une capture à util/photomodeFlash.runCapture(kind, ...) en protégeant l'appel par pcall. | 130 |

### Détail des paramètres

#### `ui_photomode_flash.applyPresetState(flashState)`

Applique un état de preset (fusion puis applyRuntimeSettings). Ne fait rien si l'argument n'est pas une table.

- `flashState` (*table*) : État du flash issu d'un preset
- **renvoie** : boolean succès
- **renvoie** : string|nil raison de l'échec

#### `ui_photomode_flash.applyRuntimeSettings()`

Si le flash est désactivé, coupe util/photomodeFlash (enable(false)). Sinon charge cette extension et appelle applyFromUi avec les réglages courants.

- **renvoie** : boolean succès
- **renvoie** : string|nil raison de l'échec (flash_unavailable, flash_apply_failed…)

#### `ui_photomode_flash.applyStatePatch(partialState)`

Fusionne dans l'état les champs présents de partialState (enabled et fireOnCapture convertis en booléens). N'agit pas sur le moteur de rendu.

- `partialState` (*table*) : Champs à modifier ; tout autre type est ignoré
- **renvoie** : boolean toujours true

#### `ui_photomode_flash.buildState()`

Renvoie une copie de l'état du flash : enabled, fireOnCapture, intensity, outerAngle, hue, saturation.

- **renvoie** : table État sérialisable du flash

#### `ui_photomode_flash.captureDefaultPresetState()`

Renvoie un état de flash aux valeurs par défaut, sans modifier l'état courant.

- **renvoie** : table Valeurs par défaut

#### `ui_photomode_flash.capturePresetState()`

État du flash à enregistrer dans un preset (identique à buildState).

- **renvoie** : table État courant

#### `ui_photomode_flash.getCaptureUiHoldFrames()`

Nombre d'images pendant lesquelles garder l'UI masquée/figée lors d'une capture avec flash : 5 si flash activé et fireOnCapture, sinon 0.

- **renvoie** : integer 0 ou 5

#### `ui_photomode_flash.runCapture(kind, ...)`

Délègue une capture à util/photomodeFlash.runCapture(kind, ...) en protégeant l'appel par pcall.

- `kind` (*any*) : Type de capture transmis tel quel à util/photomodeFlash (déduit du code)
- `...` (*any*) : Arguments supplémentaires transmis tels quels
- **renvoie** : boolean true si la capture a été demandée
- **renvoie** : string|nil raison de l'échec (screenshot_request_failed par défaut)

**Charge les extensions :** `util/photomodeFlash`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/photomode/flash.lua`.*
