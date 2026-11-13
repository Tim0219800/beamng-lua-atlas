# `ui_appContainers`

*Fichier : `lua/ge/extensions/ui/appContainers.lua` · VM : Game Engine (GE) · 255 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_appContainers` : `extensions.load("ui_appContainers")`, puis la globale `ui_appContainers`

Registre générique des « conteneurs » d'apps d'interface (topLeft, topCenter, topRight) et de la visibilité de chaque app. Les extensions topLeft/topCenter/topRight s'enregistrent avec registerContainer ; ce module garde l'état visible/caché de chaque app et prévient l'interface Vue via guihooks.trigger sur le trigger du conteneur. Il sauvegarde et restaure la visibilité via onSerialize/onDeserialize (rechargement Lua) et propose une fenêtre ImGui de debug.

## Remarques

- Anciens identifiants acceptés partout : utilityApps -> topLeft, gameplayApps -> topCenter, secondaryApps -> topRight (resolveContainerId).
- setVerboseLogging ne fait rien d'utile : elle renvoie simplement enabled en booléen sans rien mémoriser.
- Les fonctions d'écriture loguent une erreur et retournent sans rien faire si le conteneur ou l'app est inconnu ; getAppVisibility renvoie alors false.
- onDeserialize rappelle setAppVisibility pour chaque app, donc émet un trigger UI par app restaurée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_appContainers.getAppVisibility(containerId, appId)` | Renvoie la visibilité actuelle d'une app (false si conteneur ou app inconnus). | 78 |
| `ui_appContainers.getAvailableApps(containerId)` | Renvoie une copie de la table des apps d'un conteneur sous la forme {[appId]={visible=boolean}}. | 142 |
| `ui_appContainers.getVisibleApps(containerId)` | Liste les identifiants des apps visibles d'un conteneur (ordre non garanti, itération pairs). | 125 |
| `ui_appContainers.hideAllApps(containerId)` | Cache toutes les apps d'un conteneur, envoie {hideAll=true, allApps} à l'interface puis émet le hook onUIContainerAppsHidden(containerId résolu). | 94 |
| `ui_appContainers.hideApp(containerId, appId)` | Raccourci pour setAppVisibility(containerId, appId, false). | 117 |
| `ui_appContainers.onDeserialize(data)` | Hook de restauration après rechargement : réapplique la visibilité sauvegardée via setAppVisibility (accepte les anciens identifiants). *(interne)* *(hook)* | 163 |
| `ui_appContainers.onExtensionLoaded()` | Hook de chargement de l'extension ; ne fait rien. *(interne)* *(hook)* | 186 |
| `ui_appContainers.onExtensionUnloaded()` | Hook de déchargement : vide la table des conteneurs. *(interne)* *(hook)* | 189 |
| `ui_appContainers.onSerialize()` | Hook de sérialisation (rechargement des extensions) : renvoie {[containerId]={[appId]=visible}}. *(interne)* *(hook)* | 152 |
| `ui_appContainers.onUpdate()` | Appelé à chaque frame par le système d'extensions ; dessine la fenêtre ImGui de debug uniquement si setDebug(true). *(interne)* *(hook)* | 193 |
| `ui_appContainers.registerContainer(config)` | Enregistre un nouveau conteneur. Exige config.id ; refuse (avec avertissement) un identifiant déjà enregistré. Copie la table apps (visible forcé en booléen). | 35 |
| `ui_appContainers.resolveContainerId(containerId)` | Convertit un ancien identifiant de conteneur (utilityApps, gameplayApps, secondaryApps) en identifiant actuel ; renvoie l'argument tel quel sinon. | 18 |
| `ui_appContainers.setAppVisibility(containerId, appId, visible)` | Affiche ou cache une app d'un conteneur et envoie {appId, visible, allApps} à l'interface via le trigger du conteneur. | 56 |
| `ui_appContainers.setDebug(enabled)` | Active ou désactive la fenêtre ImGui « App Containers Debug » (boutons Show/Hide par app, Hide All, Show All). | 178 |
| `ui_appContainers.setVerboseLogging(enabled)` | Sans effet réel : renvoie enabled converti en booléen. | 182 |
| `ui_appContainers.showApp(containerId, appId)` | Raccourci pour setAppVisibility(containerId, appId, true). | 113 |
| `ui_appContainers.toggleApp(containerId, appId)` | Inverse la visibilité d'une app. | 121 |

### Détail des paramètres

#### `ui_appContainers.getAppVisibility(containerId, appId)`

Renvoie la visibilité actuelle d'une app (false si conteneur ou app inconnus).

- `containerId` (*string*) : Identifiant du conteneur.
- `appId` (*string*) : Identifiant de l'app.
- **renvoie** : boolean true si visible.

#### `ui_appContainers.getAvailableApps(containerId)`

Renvoie une copie de la table des apps d'un conteneur sous la forme {[appId]={visible=boolean}}.

- `containerId` (*string*) : Conteneur.
- **renvoie** : table<string, table> Copie des apps ; vide si conteneur inconnu.

#### `ui_appContainers.getVisibleApps(containerId)`

Liste les identifiants des apps visibles d'un conteneur (ordre non garanti, itération pairs).

- `containerId` (*string*) : Conteneur.
- **renvoie** : table<integer, string> Tableau d'appId ; vide si conteneur inconnu.

#### `ui_appContainers.hideAllApps(containerId)`

Cache toutes les apps d'un conteneur, envoie {hideAll=true, allApps} à l'interface puis émet le hook onUIContainerAppsHidden(containerId résolu).

- `containerId` (*string*) : Identifiant du conteneur.

#### `ui_appContainers.hideApp(containerId, appId)`

Raccourci pour setAppVisibility(containerId, appId, false).

- `containerId` (*string*) : Conteneur.
- `appId` (*string*) : App.

#### `ui_appContainers.onDeserialize(data)`

Hook de restauration après rechargement : réapplique la visibilité sauvegardée via setAppVisibility (accepte les anciens identifiants).

- `data` (*table*) : Table produite par onSerialize.

#### `ui_appContainers.onSerialize()`

Hook de sérialisation (rechargement des extensions) : renvoie {[containerId]={[appId]=visible}}.

- **renvoie** : table Visibilité de toutes les apps.

#### `ui_appContainers.registerContainer(config)`

Enregistre un nouveau conteneur. Exige config.id ; refuse (avec avertissement) un identifiant déjà enregistré. Copie la table apps (visible forcé en booléen).

- `config` (*table*) : {id=string, trigger=string (nom du guihook), debugLabel=string|nil, apps={[appId]={visible=boolean}}}.
- **renvoie** : boolean true si enregistré, false sinon.

#### `ui_appContainers.resolveContainerId(containerId)`

Convertit un ancien identifiant de conteneur (utilityApps, gameplayApps, secondaryApps) en identifiant actuel ; renvoie l'argument tel quel sinon.

- `containerId` (*string*) : Identifiant de conteneur, ancien ou nouveau.
- **renvoie** : string Identifiant actuel.

#### `ui_appContainers.setAppVisibility(containerId, appId, visible)`

Affiche ou cache une app d'un conteneur et envoie {appId, visible, allApps} à l'interface via le trigger du conteneur.

- `containerId` (*string*) : Identifiant du conteneur.
- `appId` (*string*) : Identifiant de l'app (doit être déclaré dans le conteneur).
- `visible` (*boolean*) : Nouvelle visibilité.

#### `ui_appContainers.setDebug(enabled)`

Active ou désactive la fenêtre ImGui « App Containers Debug » (boutons Show/Hide par app, Hide All, Show All).

- `enabled` (*boolean*) : true pour afficher la fenêtre.

#### `ui_appContainers.setVerboseLogging(enabled)`

Sans effet réel : renvoie enabled converti en booléen.

- `enabled` (*boolean*) : Ignoré.
- **renvoie** : boolean enabled en booléen.

#### `ui_appContainers.showApp(containerId, appId)`

Raccourci pour setAppVisibility(containerId, appId, true).

- `containerId` (*string*) : Conteneur.
- `appId` (*string*) : App.

#### `ui_appContainers.toggleApp(containerId, appId)`

Inverse la visibilité d'une app.

- `containerId` (*string*) : Conteneur.
- `appId` (*string*) : App.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUIContainerAppsHidden`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/appContainers.lua`.*
