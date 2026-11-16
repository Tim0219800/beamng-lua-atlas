# `ui_photomode_session`

*Fichier : `lua/ge/extensions/ui/photomode/session.lua` · VM : Game Engine (GE) · 648 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_photomode_session` : `extensions.load("ui_photomode_session")`, puis la globale `ui_photomode_session`

Orchestrateur de la session du mode photo. Il ouvre et ferme la session : pause de la simulation (demande de pause « ui_pause_photomode »), vue solo en écran partagé, capture puis restauration des états caméra / scène / effets / rendu avancé / node grabber, caméra libre de session, drapeau global photoModeOpen. Il gère aussi les profils de route (pause, garage), la session persistante (réglage photomodePersistentSession), le mode de surface du panneau, la confirmation de sortie et la charge utile (route payload) envoyée à l'interface Vue.

## Exemple

```lua
ui_photomode_session.beginPhotomodeSession({profile = "garage"})
-- ... réglages via ui_photomode_scene / _camera / _effects ...
ui_photomode_session.endPhotomodeSession()
```

## Remarques

- Profils : "pause" (par défaut, aucun contrôle masqué) et "garage" (masque timeOfDay et cloudCover de la scène, motionBlur des effets, terrainLodScale/grassDensity/cloudQuality du rendu avancé, et désactive la feature motionBlurCapture). Un profil inconnu retombe sur "pause". Ce n'est qu'une politique de visibilité de l'interface : les appels Lua directs ne sont pas bloqués.
- Ordre de beginPhotomodeSession : profil, pause, vue solo, rafraîchissement des défauts de capture, captureRestoreState (caméra, scène, effets, rendu avancé), captureNodeGrabberRestoreState, presets par défaut, caméra libre, suppressions (photoModeOpen = true), sessionActive = true, puis restauration de l'état persistant si activé. endPhotomodeSession fait l'inverse et remet le profil à "pause".
- L'application de qualité « Prioritize Resolution » (applyPlatformPhotomodeQualityMode) est commentée dans begin/end : elle n'est pas utilisée dans cette version.
- La confirmation de sortie affiche un dialogue via guihooks.trigger("showConfirmationDialog", ...) avec les rappels Lua ui_photomode_session.cancelExitConfirmation() et confirmExit() ; confirmExit navigue ensuite vers la route demandée via extensions.ui_router.navigate avec un contournement unique de la confirmation.
- Bug du jeu : isDebugEnabled et setDebugEnabled de ce module lisent/écrivent une variable globale isDebugEnabled, non déclarée dans ce fichier, et non l'état de ui_photomode_shared ; isDebugEnabled() renvoie donc nil tant qu'aucun appel à setDebugEnabled n'a eu lieu, et logDebug de ui_photomode_shared n'est pas affecté.
- setHiddenCameraInputEnabled empile/dépile l'action map "PhotoModeCamera" (joueur 0).

**Dépendances (chargées avant) :** `ui_photomode_shared`, `ui_photomode_camera`, `ui_photomode_scene`, `ui_photomode_flash`, `ui_photomode_effects`, `ui_photomode_advancedRender`, `ui_photomode_capture`, `ui_photomode_presets`, `core_settings_graphic`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_photomode_session.beginPhotomodeSession(options)` | Démarre la session du mode photo (pause, caméra libre, états de restauration, suppressions du monde). Ignorée si une session est déjà active. | 540 |
| `ui_photomode_session.buildCapabilities()` | Calcule les capacités affichées par l'interface : profil actif, contrôles masqués, sections, features (upload, steam, openShareUrl, overlays, resolutionPresets, motionBlurCapture, advancedRenderTuning, developerTools…), build (shipping/developer) et état du rendu avancé. Les features du profil actif prévalent. | 271 |
| `ui_photomode_session.cancelExitConfirmation()` | Annule la sortie en attente (bouton « retour » du dialogue) et réactive l'entrée caméra cachée si elle l'était. | 484 |
| `ui_photomode_session.confirmExit()` | Confirme la sortie : active le contournement de confirmation puis navigue vers la route mémorisée avec extensions.ui_router.navigate. | 495 |
| `ui_photomode_session.consumeExitConfirmationBypass()` | Lit et consomme le drapeau de contournement de la confirmation de sortie (utilisé par la garde de route du mode photo). | 434 |
| `ui_photomode_session.endPhotomodeSession()` | Termine la session : termine la capture en cours, sauvegarde l'état persistant si activé, restaure scène, effets, rendu avancé, caméra, node grabber, vue solo, suppressions et pause, puis réinitialise les presets temporaires. Ne fait rien si tout est déjà inactif. | 578 |
| `ui_photomode_session.getPanelSurfaceMode()` | Renvoie le mode de surface du panneau, "hidden" ou "settings" ("hidden" si la valeur stockée est invalide). | 415 |
| `ui_photomode_session.getRoutePayload()` | Construit la charge utile envoyée à l'interface : contractVersion, sessionActive, capabilities, capture, persistentSession, panelSurfaceMode, mediaActions, resolutionPresets, suppressions. | 362 |
| `ui_photomode_session.handleExtensionLoaded()` | Appelée au chargement de l'extension : efface les bookmarks (caméra, caméra relative, environnement, rendu avancé) et réinitialise l'état local de session. *(interne)* | 625 |
| `ui_photomode_session.handleExtensionUnloaded()` | Appelée au déchargement de l'extension : termine la session, efface les bookmarks et réinitialise l'état local. *(interne)* | 633 |
| `ui_photomode_session.isCaptureInProgress()` | Indique si une capture est en cours (délègue à ui_photomode_capture). | 385 |
| `ui_photomode_session.isDebugEnabled()` | Renvoie la variable globale isDebugEnabled (voir bug dans les notes). | 510 |
| `ui_photomode_session.isPersistentSessionEnabled()` | Lit le réglage photomodePersistentSession (si activé, les réglages de la session sont mémorisés à la fermeture et réappliqués à la prochaine ouverture). | 389 |
| `ui_photomode_session.isPhotomodeSessionActive()` | Indique si une session de mode photo est active. | 381 |
| `ui_photomode_session.onPhotomodeRouteEnter(routeName)` | Hook appelé à l'entrée dans une route du mode photo (routeName en argument) ; journalise seulement. *(interne)* *(hook)* | 532 |
| `ui_photomode_session.onPhotomodeRouteLeave(routeName)` | Hook appelé à la sortie d'une route du mode photo ; journalise seulement. *(interne)* *(hook)* | 536 |
| `ui_photomode_session.requestExitConfirmation(route, params, context)` | Mémorise la navigation de sortie demandée et affiche un dialogue de confirmation (texte différent si la session persistante est activée). Ne fait rien de plus si une confirmation est déjà en attente. | 442 |
| `ui_photomode_session.setDebugEnabled(value)` | Définit la globale isDebugEnabled, propage le réglage à l'API screenshot (setDebugTracingEnabled) et journalise. | 514 |
| `ui_photomode_session.setHiddenCameraInputEnabled(enabled)` | Active ou désactive les entrées de la caméra photo cachée en empilant/dépilant l'action map "PhotoModeCamera". Sans effet si l'état ne change pas. | 97 |
| `ui_photomode_session.setPanelSurfaceMode(mode)` | Change le mode de surface du panneau ; refuse les valeurs autres que "hidden" et "settings". | 420 |
| `ui_photomode_session.setPersistentSessionEnabled(value)` | Écrit le réglage de session persistante ; à la désactivation, efface l'état persistant mémorisé, puis notifie l'interface des réglages. | 396 |
| `ui_photomode_session.traceCaptureDebug(scope, payload)` | Journalise un message de debug de capture : « scope » suivi du payload sérialisé (JSON). | 523 |

### Détail des paramètres

#### `ui_photomode_session.beginPhotomodeSession(options)`

Démarre la session du mode photo (pause, caméra libre, états de restauration, suppressions du monde). Ignorée si une session est déjà active.

- `options` (*table|nil*) : options.profile : "pause" (défaut) ou "garage".
- **renvoie** : boolean true si la session a démarré, false si elle était déjà active.

#### `ui_photomode_session.buildCapabilities()`

Calcule les capacités affichées par l'interface : profil actif, contrôles masqués, sections, features (upload, steam, openShareUrl, overlays, resolutionPresets, motionBlurCapture, advancedRenderTuning, developerTools…), build (shipping/developer) et état du rendu avancé. Les features du profil actif prévalent.

- **renvoie** : table Table de capacités.

#### `ui_photomode_session.confirmExit()`

Confirme la sortie : active le contournement de confirmation puis navigue vers la route mémorisée avec extensions.ui_router.navigate.

- **renvoie** : boolean|any false si aucune navigation en attente, sinon le résultat de ui_router.navigate.

#### `ui_photomode_session.consumeExitConfirmationBypass()`

Lit et consomme le drapeau de contournement de la confirmation de sortie (utilisé par la garde de route du mode photo).

- **renvoie** : boolean true si le contournement était armé (il est alors désarmé).

#### `ui_photomode_session.endPhotomodeSession()`

Termine la session : termine la capture en cours, sauvegarde l'état persistant si activé, restaure scène, effets, rendu avancé, caméra, node grabber, vue solo, suppressions et pause, puis réinitialise les presets temporaires. Ne fait rien si tout est déjà inactif.

- **renvoie** : boolean true si une fermeture a été faite, false si la session était déjà inactive.

#### `ui_photomode_session.getPanelSurfaceMode()`

Renvoie le mode de surface du panneau, "hidden" ou "settings" ("hidden" si la valeur stockée est invalide).

- **renvoie** : string "hidden" ou "settings".

#### `ui_photomode_session.getRoutePayload()`

Construit la charge utile envoyée à l'interface : contractVersion, sessionActive, capabilities, capture, persistentSession, panelSurfaceMode, mediaActions, resolutionPresets, suppressions.

- **renvoie** : table Charge utile de route du mode photo.

#### `ui_photomode_session.isCaptureInProgress()`

Indique si une capture est en cours (délègue à ui_photomode_capture).

- **renvoie** : boolean true si une capture est en cours.

#### `ui_photomode_session.isDebugEnabled()`

Renvoie la variable globale isDebugEnabled (voir bug dans les notes).

- **renvoie** : boolean|nil Valeur de la globale isDebugEnabled.

#### `ui_photomode_session.isPersistentSessionEnabled()`

Lit le réglage photomodePersistentSession (si activé, les réglages de la session sont mémorisés à la fermeture et réappliqués à la prochaine ouverture).

- **renvoie** : boolean true si la session persistante est activée.

#### `ui_photomode_session.isPhotomodeSessionActive()`

Indique si une session de mode photo est active.

- **renvoie** : boolean Valeur de S.sessionActive.

#### `ui_photomode_session.onPhotomodeRouteEnter(routeName)`

Hook appelé à l'entrée dans une route du mode photo (routeName en argument) ; journalise seulement.

- `routeName` (*string*) : Nom de la route.

#### `ui_photomode_session.onPhotomodeRouteLeave(routeName)`

Hook appelé à la sortie d'une route du mode photo ; journalise seulement.

- `routeName` (*string*) : Nom de la route.

#### `ui_photomode_session.requestExitConfirmation(route, params, context)`

Mémorise la navigation de sortie demandée et affiche un dialogue de confirmation (texte différent si la session persistante est activée). Ne fait rien de plus si une confirmation est déjà en attente.

- `route` (*table|any*) : Route visée (utilise route.name si context.routeName est absent).
- `params` (*any*) : Paramètres de la route à mémoriser.
- `context` (*table|nil*) : {routeName?, options?} .
- **renvoie** : boolean false si aucun nom de route valide, sinon true.

#### `ui_photomode_session.setDebugEnabled(value)`

Définit la globale isDebugEnabled, propage le réglage à l'API screenshot (setDebugTracingEnabled) et journalise.

- `value` (*any*) : Activé uniquement si value == true.

#### `ui_photomode_session.setHiddenCameraInputEnabled(enabled)`

Active ou désactive les entrées de la caméra photo cachée en empilant/dépilant l'action map "PhotoModeCamera". Sans effet si l'état ne change pas.

- `enabled` (*boolean*) : Activé uniquement si enabled == true.
- **renvoie** : boolean Toujours true.

#### `ui_photomode_session.setPanelSurfaceMode(mode)`

Change le mode de surface du panneau ; refuse les valeurs autres que "hidden" et "settings".

- `mode` (*string*) : "hidden" ou "settings".
- **renvoie** : table {ok=boolean, mode=string}.

#### `ui_photomode_session.setPersistentSessionEnabled(value)`

Écrit le réglage de session persistante ; à la désactivation, efface l'état persistant mémorisé, puis notifie l'interface des réglages.

- `value` (*boolean|any*) : Nouvelle valeur (normalisée en booléen).
- **renvoie** : table {ok=boolean, enabled=boolean}.

#### `ui_photomode_session.traceCaptureDebug(scope, payload)`

Journalise un message de debug de capture : « scope » suivi du payload sérialisé (JSON).

- `scope` (*string|nil*) : Libellé ("capture" par défaut).
- `payload` (*any*) : Données à ajouter.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : ui_photomode_shared, _camera, _scene, _flash, _effects, _advancedRender, _capture, _presets, core_settings_graphic. |

**Évènements UI (guihooks.trigger) :** `showConfirmationDialog`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/photomode/session.lua`.*
