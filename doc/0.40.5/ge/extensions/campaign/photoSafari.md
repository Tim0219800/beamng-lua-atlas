# `campaign_photoSafari`

*Fichier : `lua/ge/extensions/campaign/photoSafari.lua` · VM : Game Engine (GE) · 188 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `campaign_photoSafari` : `extensions.load("campaign_photoSafari")`, puis la globale `campaign_photoSafari`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `campaign_photoSafari.missionaccepted(file)` | M.photoSafariData.subLocations[M.location].hints<br><br>is called when photosafari mission accepted<br>@file is json file of photsafari<br>this function reads json file in photosafaridata and added all the locations to photsafarimission table<br>also added hints to subLocationsHints table | 22 |
| `campaign_photoSafari.onBeamNGTrigger(data)` | *(hook)* | 40 |
| `campaign_photoSafari.takepiccheck()` | this function is called inside photomode.js<br>check if the object is in the scene or not and if the camera is adjusted or away from the object | 144 |

## Champs

| Champ | Type | Description |
|---|---|---|
| `accept` | boolean |  |
| `photomodeOpen` | boolean |  |
| `targetObj` | nil |  |

**Évènements UI (guihooks.trigger) :** `ScenarioFlashMessage`

## Appels vers le moteur (C++)

- `Engine.` `sceneGetCameraFrustum`
- `FS:` `fileExists`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/campaign/photoSafari.lua`.*
