# `ui_photomode_shared`

*Fichier : `lua/ge/extensions/ui/photomode/shared.lua` · VM : Game Engine (GE) · 372 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_photomode_shared` : `extensions.load("ui_photomode_shared")`, puis la globale `ui_photomode_shared`

Bibliothèque d'outils et état partagé de tous les modules du mode photo (ui_photomode_*). Elle contient la table d'état de session S, le journal de debug, des fonctions de normalisation (nombres, booléens, chemins), des accès protégés (pcall) à VariableRegistry, aux réglages (settings) et à l'API de capture « screenshot », ainsi que le calcul de la disponibilité des actions média (téléversement, Steam, ouverture d'URL de partage).

## Remarques

- Le journal utilise l'étiquette "ui_pause_photomode" (reste d'un ancien nom) et le debug est activé par défaut (isDebugEnabled = true).
- S.routePayloadContractVersion = 8 et S.photomodeMetadataStateVersion = 2 (versions des formats de charge utile de route et de métadonnées d'état).
- S contient notamment : sessionActive, activeProfile ("pause" par défaut), photoModeOpen, les états de restauration de session (caméra, scène, effets, rendu avancé, node grabber), les bookmarks sauvegardés, pendingPreviewPlayback, pendingMotionCapture, captureInProgressFramesRemaining, exitConfirmationBypass, pendingExitNavigation, persistentSessionState et panelSurfaceMode ("hidden" par défaut).
- Actions média : le téléversement exige un backend screenshot.publish, onlineFeatures == "enable", OnlineServiceProvider.isWorking et un compte connecté ; l'action Steam exige les mêmes conditions sauf le compte ; l'ouverture d'URL exige openWebBrowser. Raisons possibles : backend_unavailable, online_features_disabled, online_service_unavailable, online_account_required, browser_unavailable.
- La table de libellés interne contient aussi shipping_build_required, mais buildMediaActions ne produit jamais cette raison.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_photomode_shared.buildDescribedState(source, fieldDescriptors)` | Construit une table de sortie à partir de source en ne copiant que les champs décrits et non nil, en appliquant field.normalize si présent et en renommant la clé en field.outputKey si défini. | 143 |
| `ui_photomode_shared.buildMediaActions()` | Calcule la disponibilité des actions média du mode photo à partir du contexte d'exécution (build shipping, fonctionnalités en ligne, service en ligne, compte connecté, backends screenshot, navigateur). | 313 |
| `ui_photomode_shared.clampNumber(value, minValue, maxValue, fallback)` | Convertit en nombre et borne entre minValue et maxValue ; renvoie fallback si la valeur n'est pas numérique. | 95 |
| `ui_photomode_shared.getCoreCameraFunction(name)` | Renvoie la fonction core_camera[name] si elle existe, sinon nil. | 160 |
| `ui_photomode_shared.getScreenshotApi()` | Charge le module « screenshot » avec pcall(require) et le renvoie, ou nil s'il est indisponible. | 263 |
| `ui_photomode_shared.hasAnyDescribedField(state, fieldDescriptors)` | Indique si la table state contient au moins un des champs décrits par fieldDescriptors (clé field.key non nil). | 131 |
| `ui_photomode_shared.isDebugEnabled()` | Indique si le journal de debug du mode photo est activé. | 55 |
| `ui_photomode_shared.logDebug(message)` | Écrit un message de niveau Info préfixé par « [Photomode] » si le debug est activé. | 68 |
| `ui_photomode_shared.normalizeBoolean(value, fallback)` | Convertit une valeur en booléen : booléen inchangé, nombre (~= 0), chaînes "true"/"1" et "false"/"0" (insensible à la casse) ; sinon fallback == true. nil donne fallback == true. | 109 |
| `ui_photomode_shared.normalizePathForCompare(value)` | Normalise un chemin pour comparaison : antislashs convertis en /, slashs initiaux et espaces finaux retirés, passage en minuscules. | 171 |
| `ui_photomode_shared.normalizePreviewNumberArray(values, expectedLength)` | Vérifie qu'une table contient au moins expectedLength nombres convertibles et renvoie une copie des expectedLength premiers ; nil si l'un manque. | 179 |
| `ui_photomode_shared.notifySettingsUi()` | Demande à l'interface de se rafraîchir en appelant settings.notifyUI (protégé par pcall). | 254 |
| `ui_photomode_shared.playPhotoCaptureSound()` | Joue le son de capture photo (événement FMOD "event:>UI>Main>Photo" sur AudioGui). | 89 |
| `ui_photomode_shared.readSettingValue(settingName)` | Lit un réglage via settings.getValue (protégé par pcall) ; nil en cas d'indisponibilité ou d'erreur. | 218 |
| `ui_photomode_shared.readVariableRegistryValue(variableName)` | Lit une variable de VariableRegistry (protégé par pcall). Renvoie nil si le registre est indisponible ou en cas d'erreur. | 194 |
| `ui_photomode_shared.setDebugEnabled(value)` | Active ou désactive le debug du mode photo et propage le réglage à l'API screenshot (setDebugTracingEnabled) si elle est disponible. | 59 |
| `ui_photomode_shared.stringifyDebugPayload(payload)` | Convertit une charge utile en texte pour le journal : chaîne vide pour nil, chaîne inchangée, sinon JSON (jsonEncode) ou tostring en cas d'échec. | 75 |
| `ui_photomode_shared.writeSettingValue(settingName, value)` | Écrit un réglage via settings.setValue (protégé par pcall, erreur journalisée). | 230 |
| `ui_photomode_shared.writeSettingsState(partialState)` | Applique plusieurs réglages d'un coup via settings.setState (protégé par pcall). | 242 |
| `ui_photomode_shared.writeVariableRegistryValue(variableName, value)` | Écrit une variable de VariableRegistry (protégé par pcall, erreur journalisée). | 206 |

### Détail des paramètres

#### `ui_photomode_shared.buildDescribedState(source, fieldDescriptors)`

Construit une table de sortie à partir de source en ne copiant que les champs décrits et non nil, en appliquant field.normalize si présent et en renommant la clé en field.outputKey si défini.

- `source` (*table*) : Table source ; un non-table donne {}.
- `fieldDescriptors` (*table[]*) : Liste de descripteurs {key, outputKey?, normalize?}.
- **renvoie** : table État construit.

#### `ui_photomode_shared.buildMediaActions()`

Calcule la disponibilité des actions média du mode photo à partir du contexte d'exécution (build shipping, fonctionnalités en ligne, service en ligne, compte connecté, backends screenshot, navigateur).

- **renvoie** : table {runtime={shippingBuild, uiDevMode, onlineFeaturesEnabled, onlineServiceWorking, onlineAccountLoggedIn}, capture={upload, steam}, preview={openShareUrl}} ; chaque action vaut {visible, enabled, reason, reasonLabel}.

#### `ui_photomode_shared.clampNumber(value, minValue, maxValue, fallback)`

Convertit en nombre et borne entre minValue et maxValue ; renvoie fallback si la valeur n'est pas numérique.

- `value` (*any*) : Valeur à convertir avec tonumber.
- `minValue` (*number*) : Borne basse.
- `maxValue` (*number*) : Borne haute.
- `fallback` (*any*) : Valeur renvoyée si la conversion échoue (non bornée).
- **renvoie** : number|any Nombre borné ou fallback.

#### `ui_photomode_shared.getCoreCameraFunction(name)`

Renvoie la fonction core_camera[name] si elle existe, sinon nil.

- `name` (*string*) : Nom de la fonction de core_camera (par exemple setPosRot, setFOV).
- **renvoie** : function|nil La fonction, ou nil.

#### `ui_photomode_shared.getScreenshotApi()`

Charge le module « screenshot » avec pcall(require) et le renvoie, ou nil s'il est indisponible.

- **renvoie** : table|nil Module screenshot.

#### `ui_photomode_shared.hasAnyDescribedField(state, fieldDescriptors)`

Indique si la table state contient au moins un des champs décrits par fieldDescriptors (clé field.key non nil).

- `state` (*table*) : Table à tester ; un non-table donne false.
- `fieldDescriptors` (*table[]*) : Liste de descripteurs {key, outputKey?, normalize?}.
- **renvoie** : boolean true si un champ est présent.

#### `ui_photomode_shared.isDebugEnabled()`

Indique si le journal de debug du mode photo est activé.

- **renvoie** : boolean true si le debug est activé.

#### `ui_photomode_shared.logDebug(message)`

Écrit un message de niveau Info préfixé par « [Photomode] » si le debug est activé.

- `message` (*any*) : Message (converti avec tostring).

#### `ui_photomode_shared.normalizeBoolean(value, fallback)`

Convertit une valeur en booléen : booléen inchangé, nombre (~= 0), chaînes "true"/"1" et "false"/"0" (insensible à la casse) ; sinon fallback == true. nil donne fallback == true.

- `value` (*any*) : Valeur à normaliser.
- `fallback` (*any*) : Valeur par défaut (seul fallback == true compte).
- **renvoie** : boolean Booléen normalisé.

#### `ui_photomode_shared.normalizePathForCompare(value)`

Normalise un chemin pour comparaison : antislashs convertis en /, slashs initiaux et espaces finaux retirés, passage en minuscules.

- `value` (*any*) : Chemin (nil donne chaîne vide).
- **renvoie** : string Chemin normalisé.

#### `ui_photomode_shared.normalizePreviewNumberArray(values, expectedLength)`

Vérifie qu'une table contient au moins expectedLength nombres convertibles et renvoie une copie des expectedLength premiers ; nil si l'un manque.

- `values` (*table*) : Tableau d'entrée.
- `expectedLength` (*integer*) : Nombre d'éléments attendus (3 pour une position, 4 pour un quaternion).
- **renvoie** : number[]|nil Tableau normalisé ou nil.

#### `ui_photomode_shared.readSettingValue(settingName)`

Lit un réglage via settings.getValue (protégé par pcall) ; nil en cas d'indisponibilité ou d'erreur.

- `settingName` (*string*) : Nom du réglage.
- **renvoie** : any Valeur du réglage ou nil.

#### `ui_photomode_shared.readVariableRegistryValue(variableName)`

Lit une variable de VariableRegistry (protégé par pcall). Renvoie nil si le registre est indisponible ou en cas d'erreur.

- `variableName` (*string*) : Nom de la variable.
- **renvoie** : any Valeur ou nil.

#### `ui_photomode_shared.setDebugEnabled(value)`

Active ou désactive le debug du mode photo et propage le réglage à l'API screenshot (setDebugTracingEnabled) si elle est disponible.

- `value` (*any*) : Activé uniquement si value == true.

#### `ui_photomode_shared.stringifyDebugPayload(payload)`

Convertit une charge utile en texte pour le journal : chaîne vide pour nil, chaîne inchangée, sinon JSON (jsonEncode) ou tostring en cas d'échec.

- `payload` (*any*) : Valeur à convertir.
- **renvoie** : string Texte à journaliser.

#### `ui_photomode_shared.writeSettingValue(settingName, value)`

Écrit un réglage via settings.setValue (protégé par pcall, erreur journalisée).

- `settingName` (*string*) : Nom du réglage.
- `value` (*any*) : Nouvelle valeur.
- **renvoie** : boolean true si l'écriture a réussi.

#### `ui_photomode_shared.writeSettingsState(partialState)`

Applique plusieurs réglages d'un coup via settings.setState (protégé par pcall).

- `partialState` (*table<string, any>*) : Réglages à modifier.
- **renvoie** : boolean true si l'appel a réussi.

#### `ui_photomode_shared.writeVariableRegistryValue(variableName, value)`

Écrit une variable de VariableRegistry (protégé par pcall, erreur journalisée).

- `variableName` (*string*) : Nom de la variable.
- `value` (*any*) : Valeur à écrire.
- **renvoie** : boolean true si l'écriture a réussi.

## Champs

| Champ | Type | Description |
|---|---|---|
| `S` | table | Table d'état mutable partagée par tous les modules du mode photo (session active, états de restauration, lecture d'aperçu en attente, etc.). Les autres modules la lisent et l'écrivent directement via ui_photomode_shared.S. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/photomode/shared.lua`.*
