# `render_openxr`

*Fichier : `lua/ge/extensions/render/openxr.lua` · VM : Game Engine (GE) · 371 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `render_openxr` : `extensions.load("render_openxr")`, puis la globale `render_openxr`

Interface Lua de la réalité virtuelle OpenXR (casque VR). Pilote le moteur C++ (objet global OpenXR) : activation/désactivation avec une boîte de dialogue de bienvenue, état de session reçu du moteur (stateChanged), recentrage, gestion des erreurs, et une fenêtre ImGui de debug (réglages d'affichage 2D, UI CEF dans le casque, ancrage, mode debug, résolutions, FOV, IPD). L'extension se décharge toute seule à la désactivation. Global : render_openxr.

## Exemple

```lua
extensions.render_openxr.toggle()   -- disabled -> welcome -> enabled -> disabled
extensions.render_openxr.center()   -- recentre la vue (ctrl+numpad5)
if extensions.render_openxr.isSessionRunning() then ... end
```

## Remarques

- stateString : 'disabled', 'welcome' (boîte de dialogue de confirmation affichée) ou 'enabled'. setStateUI('welcome') n'ouvre le dialogue avec le bouton OK que si l'adaptateur est Vulkan ou Direct3D12 ; sinon seul un bouton d'annulation est proposé (texte « no Vulkan »).
- Les callbacks Lua des boutons de la boîte de dialogue sont des chaînes exécutées par l'UI : `extensions.render_openxr.closeWelcome(true|false)`.
- M.state est la table reçue du moteur C++ via stateChanged(state) ; l'UI est notifiée par guihooks 'OpenXRStateChanged' quand l'un des champs suivis change (enabled, sessionRunning, headsetActive, systemName, targetRefreshRate, renderedWidth/Height, recommendedWidth/Height, sourceCount, activeSourceCount, poseValidSourceCount, inputSourcesKey). Les champs sourceCount… et les accesseurs getInputSourceStates/getSourcePoseStates sont commentés (TODO, API non finalisée).
- onPreRender (et non onUpdate) est utilisé volontairement : core_camera s'exécute au preRender, donc OpenXR doit passer après elle pour éviter une frame de retard de pose (d'où la dépendance à core_camera).
- Réglages persistés (via settings) : openXRuiEnabled, openXRuiMode, openXRwindowViewMode, openXRdebugEnabled, openXRquadCompositionEnabled (défaut false), plus openXRimguiEnabled (lu seul) ; changer le mode debug pendant une session redémarre OpenXR.
- La fenêtre ImGui de debug n'est dessinée que si le réglage openXRimguiEnabled est vrai et la session en cours ; fermer la fenêtre désactive OpenXR.
- Raccourcis annoncés dans l'UI de debug : ctrl+numpad0 (activer/désactiver), ctrl+numpad5 (centrer).
- Si enable échoue côté C++, un simple log de debug est émis et l'état repasse à 'disabled'.

**Dépendances (chargées avant) :** `core_camera`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `render_openxr.center(value)` | Recentre la vue VR. Sans argument, recentre une fois (OpenXR.centerNow) ; avec une valeur, active/désactive le recentrage continu quand value > 0.2 (OpenXR.centerContinuous). | 328 |
| `render_openxr.closeWelcome(enable)` | Fermeture de la boîte de dialogue de bienvenue (appelée par ses boutons) : enable=true active OpenXR, sinon le désactive. | 162 |
| `render_openxr.errorDetected(err)` | Appelé par le moteur en cas d'erreur OpenXR : logue l'erreur et affiche un toast d'erreur avec la traduction `ui.openXR.errors.<err>`. *(interne)* | 340 |
| `render_openxr.isSessionRunning()` | Indique si une session OpenXR est en cours. | 336 |
| `render_openxr.onInit()` | Hook d'initialisation : passe l'extension en déchargement manuel et charge les réglages. *(interne)* *(hook)* | 157 |
| `render_openxr.onPreRender(...)` | Hook avant rendu : appelle la fonction de mise à jour courante (onUpdate quand OpenXR est activé, sinon rien). *(interne)* *(hook)* | 36 |
| `render_openxr.onSettingsChanged()` | Hook de changement de réglages : relit les réglages OpenXR, redémarre OpenXR si le mode debug change pendant une session, et régénère la courbure de l'UI (OpenXR.generateUiCurvature) si OpenXR est actif. *(interne)* *(hook)* | 143 |
| `render_openxr.setStateUI(stateString)` | Change l'état de l'interface OpenXR : 'welcome' ouvre la boîte de dialogue, 'enabled' active OpenXR.setEnable(true) (retombe sur 'disabled' en cas d'échec), 'disabled' le coupe et décharge l'extension ; toute autre valeur est une erreur (désactive). Enregistre une action joueur « set VR state … ». | 289 |
| `render_openxr.stateChanged(state)` | Appelé par le moteur C++ à chaque changement d'état OpenXR : met à jour M.state (le target refresh rate garde le maximum vu ; une fréquence infinie est ramenée à 0), synchronise stateString avec enabled et notifie l'UI. *(interne)* | 98 |
| `render_openxr.toggle()` | Fait avancer l'état : disabled -> welcome ; welcome -> enabled ; enabled -> disabled. | 321 |
| `render_openxr.updateUI(forced)` | Envoie 'OpenXRStateChanged' à l'UI si un champ suivi a changé, ou si forced (alors logue aussi l'état). | 82 |

### Détail des paramètres

#### `render_openxr.center(value)`

Recentre la vue VR. Sans argument, recentre une fois (OpenXR.centerNow) ; avec une valeur, active/désactive le recentrage continu quand value > 0.2 (OpenXR.centerContinuous).

- `value` (*number|nil*) : Valeur analogique d'une action d'entrée (déduit du code).

#### `render_openxr.closeWelcome(enable)`

Fermeture de la boîte de dialogue de bienvenue (appelée par ses boutons) : enable=true active OpenXR, sinon le désactive.

- `enable` (*boolean*) : Choix de l'utilisateur.

#### `render_openxr.errorDetected(err)`

Appelé par le moteur en cas d'erreur OpenXR : logue l'erreur et affiche un toast d'erreur avec la traduction `ui.openXR.errors.<err>`.

- `err` (*string*) : Identifiant d'erreur (clé de traduction).

#### `render_openxr.isSessionRunning()`

Indique si une session OpenXR est en cours.

- **renvoie** : boolean M.state.sessionRunning ou false.

#### `render_openxr.onPreRender(...)`

Hook avant rendu : appelle la fonction de mise à jour courante (onUpdate quand OpenXR est activé, sinon rien).

- `...` (*any*) : dtReal, dtSim, dtRaw (déduit du code).

#### `render_openxr.setStateUI(stateString)`

Change l'état de l'interface OpenXR : 'welcome' ouvre la boîte de dialogue, 'enabled' active OpenXR.setEnable(true) (retombe sur 'disabled' en cas d'échec), 'disabled' le coupe et décharge l'extension ; toute autre valeur est une erreur (désactive). Enregistre une action joueur « set VR state … ».

- `stateString` (*string*) : 'welcome', 'enabled' ou 'disabled'.

#### `render_openxr.stateChanged(state)`

Appelé par le moteur C++ à chaque changement d'état OpenXR : met à jour M.state (le target refresh rate garde le maximum vu ; une fréquence infinie est ramenée à 0), synchronise stateString avec enabled et notifie l'UI.

- `state` (*table*) : Nouvel état OpenXR.

#### `render_openxr.updateUI(forced)`

Envoie 'OpenXRStateChanged' à l'UI si un champ suivi a changé, ou si forced (alors logue aussi l'état).

- `forced` (*boolean|nil*) : Forcer l'envoi.

## Champs

| Champ | Type | Description |
|---|---|---|
| `cefDialogOpen` | boolean|nil | true tant que la boîte de dialogue de bienvenue est ouverte. |
| `dependencies` | string[] | {'core_camera'} |
| `state` | table | État OpenXR reçu du moteur : systemName ('?' par défaut), enabled, sessionRunning, sessionState, renderedWidth/Height, recommendedWidth/Height, supportedWidth/Height, supportedLayers, fov0hz/fov0vt/fov1hz/fov1vt, ipd (m), currentRefreshRate/targetRefreshRate… |
| `stateString` | string | 'disabled' (défaut), 'welcome' ou 'enabled'. |

**Évènements UI (guihooks.trigger) :** `ConfirmationDialogClose`, `ConfirmationDialogOpen`, `OpenXRStateChanged`, `toastrMsg`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/render/openxr.lua`.*
