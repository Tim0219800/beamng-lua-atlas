# `campaign_photoSafari`

*Fichier : `lua/ge/extensions/campaign/photoSafari.lua` · VM : Game Engine (GE) · 188 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `campaign_photoSafari` : `extensions.load("campaign_photoSafari")`, puis la globale `campaign_photoSafari`

Logique de la mission « photo safari » de la campagne : le joueur doit photographier des lieux. À l'acceptation, un fichier JSON liste les lieux (clés = noms de triggers) avec leurs indices (hints), l'objet cible (objectName) et le trigger closeToPhoto. Les triggers BeamNG (onBeamNGTrigger) débloquent des indices et ouvrent le mode photo ; takepiccheck, appelée par photomode.js, vérifie que la cible est entièrement dans le champ de la caméra et assez proche.

## Remarques

- Les triggers d'indices sont codés en dur : prototype_2_trigger_CD, prototype_2_shady_trigger, prototype_2_ranger_trigger, prototype_2_stuntman_trigger, prototype_2_police_trigger. Le lieu spécial « on_site » utilise le trigger « on_site_obj » et l'objet « camtrig ».
- Valeurs lues dans le champ M : accept, photomodeOpen, location, targetObj, closeToPhoto, cameraDistanceToObject, msg, showhint, count, description, foundLocation, photoSafarimissions, photoSafariData.
- Bug : dans onBeamNGTrigger, logTag n'est pas défini dans ce fichier (nil) et le message d'erreur lit M.photoSafariData.objectName au lieu de l'objectName du lieu ; le message sera donc faux ou provoquera une erreur de concaténation.
- Pour une photo hors lieu « on_site », la photo est valide si la boîte englobante de l'objet est entièrement dans le frustum et si camdis <= M.cameraDistanceToObject.
- Pour « on_site », on_siteLocation exige que la caméra soit à moins de 5 m de l'objet « camtrig », et que le véhicule soit dans la zone (trigger on_site_obj).
- takepiccheck affiche le message via guihooks.trigger('ScenarioFlashMessage', {{msg, 2}}), retourne au menu (ui_router.navigate('menu')) et relance la simulation (simTimeAuthority.pause(false)).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `campaign_photoSafari.missionaccepted(file)` | Charge le fichier JSON de la mission (jsonReadFile), met accept à true, remet à zéro indices, lieux trouvés et vus, et mémorise les hints de chaque lieu. Ne fait rien si le fichier n'existe pas. | 22 |
| `campaign_photoSafari.onBeamNGTrigger(data)` | Hook appelé quand un trigger est franchi. Ignore tout sauf le véhicule du joueur. À l'entrée dans un trigger d'indice : débloque l'indice suivant de chaque lieu non trouvé ; dans un trigger de lieu : mémorise location/targetObj et ouvre le mode photo ; dans closeToPhoto : calcule la distance caméra-objet. À la sortie, referme le mode photo ou closeToPhoto. *(interne)* *(hook)* | 40 |
| `campaign_photoSafari.takepiccheck()` | Vérifie la photo : refuse si le joueur n'est pas assez proche, sinon teste la distance de la caméra à l'objet et que la boîte englobante de l'objet est entièrement dans le frustum (Engine.sceneGetCameraFrustum). En cas de succès, marque le lieu comme trouvé. Affiche le message résultat. | 144 |

### Détail des paramètres

#### `campaign_photoSafari.missionaccepted(file)`

Charge le fichier JSON de la mission (jsonReadFile), met accept à true, remet à zéro indices, lieux trouvés et vus, et mémorise les hints de chaque lieu. Ne fait rien si le fichier n'existe pas.

- `file` (*string*) : Chemin du JSON de la mission photo safari.

#### `campaign_photoSafari.onBeamNGTrigger(data)`

Hook appelé quand un trigger est franchi. Ignore tout sauf le véhicule du joueur. À l'entrée dans un trigger d'indice : débloque l'indice suivant de chaque lieu non trouvé ; dans un trigger de lieu : mémorise location/targetObj et ouvre le mode photo ; dans closeToPhoto : calcule la distance caméra-objet. À la sortie, referme le mode photo ou closeToPhoto.

- `data` (*table*) : Données du trigger : subjectID, event ('enter'/'exit'), triggerName.

#### `campaign_photoSafari.takepiccheck()`

Vérifie la photo : refuse si le joueur n'est pas assez proche, sinon teste la distance de la caméra à l'objet et que la boîte englobante de l'objet est entièrement dans le frustum (Engine.sceneGetCameraFrustum). En cas de succès, marque le lieu comme trouvé. Affiche le message résultat.

- **renvoie** : boolean|nil true si la photo est valide, false sinon, nil si le lieu est déjà trouvé ou si le joueur est trop loin.

## Champs

| Champ | Type | Description |
|---|---|---|
| `accept` | boolean | Vrai quand la mission a été acceptée et son JSON chargé. |
| `photomodeOpen` | boolean | Vrai quand le joueur est dans le trigger d'un lieu et peut prendre la photo. |
| `targetObj` | string|nil | Nom de l'objet de scène à photographier. |

**Évènements UI (guihooks.trigger) :** `ScenarioFlashMessage`

## Appels vers le moteur (C++)

- `Engine.` `sceneGetCameraFrustum`
- `FS:` `fileExists`
- `be:` `getPlayerVehicleID`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/campaign/photoSafari.lua`.*
