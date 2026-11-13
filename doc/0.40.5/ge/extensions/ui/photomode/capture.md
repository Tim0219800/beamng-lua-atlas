# `ui_photomode_capture`

*Fichier : `lua/ge/extensions/ui/photomode/capture.lua` · VM : Game Engine (GE) · 1686 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_photomode_capture` : `extensions.load("ui_photomode_capture")`, puis la globale `ui_photomode_capture`

**Dépendances (chargées avant) :** `ui_photomode_flash`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_photomode_capture.applyCaptureStatePatch(currentCaptureSettings, partialState)` |  | 816 |
| `ui_photomode_capture.applyResolutionPreset(preset)` |  | 393 |
| `ui_photomode_capture.applySelectedResolutionPresetBeforeCapture(selectedResolutionPresetId)` |  | 412 |
| `ui_photomode_capture.buildCaptureRescaleFactor(downscaleLevel)` |  | 524 |
| `ui_photomode_capture.buildCaptureState(captureSettings)` |  | 716 |
| `ui_photomode_capture.buildDefaultSettings()` |  | 254 |
| `ui_photomode_capture.buildMetadataState()` |  | 1043 |
| `ui_photomode_capture.buildNormalizedCaptureSettings(captureSettings)` |  | 529 |
| `ui_photomode_capture.buildResolutionPresetState()` |  | 1039 |
| `ui_photomode_capture.buildState()` |  | 1035 |
| `ui_photomode_capture.findResolutionPreset(presetId)` |  | 278 |
| `ui_photomode_capture.finishPendingMotionCapture(immediateAttachRelease)` |  | 959 |
| `ui_photomode_capture.getCaptureState()` |  | 1065 |
| `ui_photomode_capture.getResolutionPresetState()` |  | 1074 |
| `ui_photomode_capture.handlePreRender(dtReal, dtSim, dtRaw)` |  | 1596 |
| `ui_photomode_capture.isCaptureInProgress()` |  | 1029 |
| `ui_photomode_capture.isResolutionPresetFeatureEnabled()` |  | 266 |
| `ui_photomode_capture.markCaptureInProgress(frames)` |  | 1018 |
| `ui_photomode_capture.normalizeCaptureSuperSampling(value, safeMax)` |  | 451 |
| `ui_photomode_capture.onScreenshotAllDone()` | *(hook)* | 1680 |
| `ui_photomode_capture.refreshSessionDefaults()` |  | 1007 |
| `ui_photomode_capture.requestScreenshot(options)` |  | 1532 |
| `ui_photomode_capture.resetSettings()` |  | 995 |
| `ui_photomode_capture.restoreCaptureRuntimeState()` |  | 1001 |
| `ui_photomode_capture.setCaptureState(partialState)` |  | 1081 |
| `ui_photomode_capture.setResolutionPreset(presetId)` |  | 1560 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `DEFAULTS` | table |  |
| `dependencies` | table |  |

## Appels vers le moteur (C++)

- `scenetree.` `findObject`

**Charge les extensions :** `util/photomodeAttach`, `util/resolution`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/photomode/capture.lua`.*
