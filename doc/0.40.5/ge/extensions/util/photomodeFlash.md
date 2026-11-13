# `util_photomodeFlash`

*Fichier : `lua/ge/extensions/util/photomodeFlash.lua` · VM : Game Engine (GE) · 407 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_photomodeFlash` : `extensions.load("util_photomodeFlash")`, puis la globale `util_photomodeFlash`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_photomodeFlash.applyFromUi(enabled, fireOnCapture, intensity, outerAngle, hue, saturation)` |  | 330 |
| `util_photomodeFlash.enable(en)` |  | 268 |
| `util_photomodeFlash.onExtensionUnloaded()` | *(hook)* | 402 |
| `util_photomodeFlash.onPreRender(dtReal, dtSim, dtRaw)` | *(hook)* | 346 |
| `util_photomodeFlash.onScreenshotAllDone()` | *(hook)* | 394 |
| `util_photomodeFlash.runCapture(kind, ...)` |  | 291 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `capturePulseActive` | boolean |  |
| `enabled` | boolean |  |
| `hue` | any |  |
| `intensity` | any |  |
| `mode` | string |  |
| `outerAngle` | any |  |
| `saturation` | any |  |

## Appels vers le moteur (C++)

- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/photomodeFlash.lua`.*
