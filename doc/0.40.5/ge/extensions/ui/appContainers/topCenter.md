# `ui_appContainers_topCenter`

*Fichier : `lua/ge/extensions/ui/appContainers/topCenter.lua` · VM : Game Engine (GE) · 326 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_appContainers_topCenter` : `extensions.load("ui_appContainers_topCenter")`, puis la globale `ui_appContainers_topCenter`

Conteneur d'apps « topCenter » (haut-centre de l'interface : arrowGPS, rally, drift, drag, pointsBar, speedTargetBar, flashMessage, countdown, moveOff ; trigger UI setTopCenterAppVisibility). Il délègue la visibilité à ui_appContainers et ajoute une file de messages flash (événement TopCenterAppsFlashMessage), la gestion du compte à rebours de scénario et la cible de vitesse de la barre speedTargetBar. Un moddeur l'utilise surtout pour afficher un message flash ou une cible de vitesse.

## Exemple

```lua
ui_appContainers_topCenter.showFlashMessage('Bien joué !', 4, true)
ui_appContainers_topCenter.showApp('topCenter', 'pointsBar')
```

## Remarques

- Toutes les fonctions de visibilité (setAppVisibility, showApp, hideApp, toggleApp, hideAllApps, getVisibleApps, getAvailableApps) sont de simples passe-plats vers ui_appContainers.
- setContainerContext, getContainerContext, resetContainerContext et getAvailableContexts sont dépréciées (avertissement uniquement si setVerboseLogging(true)) : un « contexte » équivaut à une seule app visible.
- clearSpeedTarget remet seulement la valeur locale à nil : elle n'envoie rien à l'interface, contrairement à setSpeedTarget.
- onGameplayFlashMessage ignore le message si l'app correspondante (drift ou drag) n'est pas visible au moment de l'appel.
- La durée d'un message de la file est celle de messageData[1][2] (3 s par défaut) ; elle est décomptée en temps de simulation (dtSim), alors que showFlashMessage décompte en temps réel (dtReal).
- La file est limitée à 50 messages : au-delà, le plus ancien est supprimé.
- Le compte à rebours est détecté quand un message de scénario commence par un nombre ou par la clé 'ui.scenarios.go' ; l'app countdown est alors affichée puis cachée après le ttl du « go » (champ M._countdownHideTimer).

**Dépendances (chargées avant) :** `ui_appContainers`, `ui_firstDrive_moveOff`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_appContainers_topCenter.clearAllFlashMessages()` | Vide la file, le message courant et le message actif, et cache l'app flashMessage. | 183 |
| `ui_appContainers_topCenter.clearMessagesFromSource(source)` | Supprime de la file les messages d'une source donnée (drift, drag…) ; si le message en cours en provient, passe au suivant ou cache flashMessage. | 166 |
| `ui_appContainers_topCenter.clearSpeedTarget()` | Oublie la cible de vitesse mémorisée (sans prévenir l'interface). | 60 |
| `ui_appContainers_topCenter.getActiveFlashMessage()` | Utilisé par l'app HUD pour rattraper un message envoyé avant son montage : renvoie le message actif avec le ttl restant, ou nil s'il n'y en a pas ou si l'app flashMessage est cachée. | 200 |
| `ui_appContainers_topCenter.getAppVisibility(containerId, appId)` | Passe-plat vers ui_appContainers.getAppVisibility. | 27 |
| `ui_appContainers_topCenter.getAvailableApps(containerId)` | Renvoie la copie des apps déclarées du conteneur avec leur visibilité. | 64 |
| `ui_appContainers_topCenter.getAvailableContexts(containerId)` | Alias déprécié de getAvailableApps. | 64 |
| `ui_appContainers_topCenter.getContainerContext(containerId)` | Déprécié : renvoie la première app visible de la liste (l'ordre n'est pas garanti s'il y en a plusieurs). | 87 |
| `ui_appContainers_topCenter.getSpeedTarget()` | Renvoie la dernière cible de vitesse mémorisée. | 56 |
| `ui_appContainers_topCenter.getVisibleApps(containerId)` | Liste les apps visibles du conteneur (via ui_appContainers). | 47 |
| `ui_appContainers_topCenter.hideAllApps(containerId)` | Cache toutes les apps du conteneur (via ui_appContainers). | 31 |
| `ui_appContainers_topCenter.hideApp(containerId, appId)` | Cache une app du conteneur. | 39 |
| `ui_appContainers_topCenter.onExtensionLoaded()` | Hook de chargement : enregistre le conteneur topCenter et ses neuf apps (toutes cachées au départ). *(interne)* *(hook)* | 267 |
| `ui_appContainers_topCenter.onExtensionUnloaded()` | Hook de déchargement : vide la file et les messages actifs. *(interne)* *(hook)* | 285 |
| `ui_appContainers_topCenter.onGameplayFlashMessage(data)` | Hook : message flash de gameplay. Accepte seulement les sources 'drift' et 'drag', et seulement si l'app du même nom est visible ; met alors le message en file et lance le suivant. *(interne)* *(hook)* | 206 |
| `ui_appContainers_topCenter.onScenarioFlashMessage(data)` | Hook : message flash de scénario. Affiche flashMessage si la liste n'est pas vide, et countdown si un élément commence par un nombre ou 'ui.scenarios.go' (dans ce dernier cas, masque countdown après le ttl). *(interne)* *(hook)* | 103 |
| `ui_appContainers_topCenter.onScenarioFlashMessageClear()` | Hook : cache l'app flashMessage quand le scénario efface ses messages. *(interne)* *(hook)* | 130 |
| `ui_appContainers_topCenter.onScenarioNotRunning()` | Hook : cache flashMessage quand aucun scénario ne tourne. *(interne)* *(hook)* | 134 |
| `ui_appContainers_topCenter.onUpdate(dtReal, dtSim, dtRaw)` | Hook de frame : décompte le message actif, fait avancer la file de messages, gère le masquage différé du compte à rebours et dessine la fenêtre de debug. *(interne)* *(hook)* | 229 |
| `ui_appContainers_topCenter.resetContainerContext(containerId)` | Déprécié : équivaut à hideAllApps. | 80 |
| `ui_appContainers_topCenter.setAppVisibility(containerId, appId, visible)` | Passe-plat vers ui_appContainers.setAppVisibility. | 23 |
| `ui_appContainers_topCenter.setContainerContext(containerId, context)` | Déprécié. Cache toutes les apps puis affiche seulement l'app nommée par context (si context est nil, tout est caché). | 68 |
| `ui_appContainers_topCenter.setDebug(enabled)` | Active une petite fenêtre ImGui « TopCenter App Containers Debug » (taille de la file, message actif). | 95 |
| `ui_appContainers_topCenter.setSpeedTarget(data)` | Mémorise la cible de vitesse active et l'envoie à l'interface via guihooks.trigger('TechDriverTrainingSpeedBarTarget', data) pour la barre speedTargetBar. | 51 |
| `ui_appContainers_topCenter.setVerboseLogging(enabled)` | Active les avertissements de dépréciation et les logs de messages invalides. | 99 |
| `ui_appContainers_topCenter.showApp(containerId, appId)` | Affiche une app du conteneur. | 35 |
| `ui_appContainers_topCenter.showFlashMessage(msg, ttl, big)` | Affiche un message flash unique, affiche l'app flashMessage et envoie {msg, ttl, big} sur l'événement TopCenterAppsFlashMessage. Le message est mémorisé pendant ttl pour qu'une app montée en retard puisse le récupérer. | 191 |
| `ui_appContainers_topCenter.toggleApp(containerId, appId)` | Inverse la visibilité d'une app du conteneur. | 43 |

### Détail des paramètres

#### `ui_appContainers_topCenter.clearMessagesFromSource(source)`

Supprime de la file les messages d'une source donnée (drift, drag…) ; si le message en cours en provient, passe au suivant ou cache flashMessage.

- `source` (*string*) : Nom de la source.

#### `ui_appContainers_topCenter.getActiveFlashMessage()`

Utilisé par l'app HUD pour rattraper un message envoyé avant son montage : renvoie le message actif avec le ttl restant, ou nil s'il n'y en a pas ou si l'app flashMessage est cachée.

- **renvoie** : table|nil {msg, ttl (restant), big}.

#### `ui_appContainers_topCenter.getAppVisibility(containerId, appId)`

Passe-plat vers ui_appContainers.getAppVisibility.

- `containerId` (*string*) : Conteneur.
- `appId` (*string*) : App.
- **renvoie** : boolean true si visible.

#### `ui_appContainers_topCenter.getAvailableApps(containerId)`

Renvoie la copie des apps déclarées du conteneur avec leur visibilité.

- `containerId` (*string*) : Conteneur.
- **renvoie** : table<string, table> {[appId]={visible=boolean}}.

#### `ui_appContainers_topCenter.getAvailableContexts(containerId)`

Alias déprécié de getAvailableApps.

- `containerId` (*string*) : Conteneur.
- **renvoie** : table<string, table> Voir getAvailableApps.

#### `ui_appContainers_topCenter.getContainerContext(containerId)`

Déprécié : renvoie la première app visible de la liste (l'ordre n'est pas garanti s'il y en a plusieurs).

- `containerId` (*string*) : Conteneur.
- **renvoie** : string|nil appId ou nil.

#### `ui_appContainers_topCenter.getSpeedTarget()`

Renvoie la dernière cible de vitesse mémorisée.

- **renvoie** : table|nil Dernière valeur passée à setSpeedTarget.

#### `ui_appContainers_topCenter.getVisibleApps(containerId)`

Liste les apps visibles du conteneur (via ui_appContainers).

- `containerId` (*string*) : Conteneur.
- **renvoie** : table<integer, string> Identifiants des apps visibles.

#### `ui_appContainers_topCenter.hideAllApps(containerId)`

Cache toutes les apps du conteneur (via ui_appContainers).

- `containerId` (*string*) : Conteneur.

#### `ui_appContainers_topCenter.hideApp(containerId, appId)`

Cache une app du conteneur.

- `containerId` (*string*) : Conteneur.
- `appId` (*string*) : App.

#### `ui_appContainers_topCenter.onGameplayFlashMessage(data)`

Hook : message flash de gameplay. Accepte seulement les sources 'drift' et 'drag', et seulement si l'app du même nom est visible ; met alors le message en file et lance le suivant.

- `data` (*table*) : {source='drift'|'drag', data=liste de messages (data[1][2] = durée)}.

#### `ui_appContainers_topCenter.onScenarioFlashMessage(data)`

Hook : message flash de scénario. Affiche flashMessage si la liste n'est pas vide, et countdown si un élément commence par un nombre ou 'ui.scenarios.go' (dans ce dernier cas, masque countdown après le ttl).

- `data` (*table*) : Liste de messages {texte|nombre, ttl, …}.

#### `ui_appContainers_topCenter.onUpdate(dtReal, dtSim, dtRaw)`

Hook de frame : décompte le message actif, fait avancer la file de messages, gère le masquage différé du compte à rebours et dessine la fenêtre de debug.

- `dtReal` (*number*) : Temps réel écoulé (s).
- `dtSim` (*number*) : Temps de simulation écoulé (s).
- `dtRaw` (*number*) : Temps brut (non utilisé).

#### `ui_appContainers_topCenter.resetContainerContext(containerId)`

Déprécié : équivaut à hideAllApps.

- `containerId` (*string*) : Conteneur.

#### `ui_appContainers_topCenter.setAppVisibility(containerId, appId, visible)`

Passe-plat vers ui_appContainers.setAppVisibility.

- `containerId` (*string*) : Conteneur (normalement 'topCenter').
- `appId` (*string*) : App.
- `visible` (*boolean*) : Visibilité.

#### `ui_appContainers_topCenter.setContainerContext(containerId, context)`

Déprécié. Cache toutes les apps puis affiche seulement l'app nommée par context (si context est nil, tout est caché).

- `containerId` (*string*) : Conteneur.
- `context` (*string|nil*) : appId à afficher.

#### `ui_appContainers_topCenter.setDebug(enabled)`

Active une petite fenêtre ImGui « TopCenter App Containers Debug » (taille de la file, message actif).

- `enabled` (*boolean*) : true pour afficher.

#### `ui_appContainers_topCenter.setSpeedTarget(data)`

Mémorise la cible de vitesse active et l'envoie à l'interface via guihooks.trigger('TechDriverTrainingSpeedBarTarget', data) pour la barre speedTargetBar.

- `data` (*table*) : Données de la cible, transmises telles quelles à l'interface (structure non définie ici).

#### `ui_appContainers_topCenter.setVerboseLogging(enabled)`

Active les avertissements de dépréciation et les logs de messages invalides.

- `enabled` (*boolean*) : true pour activer.

#### `ui_appContainers_topCenter.showApp(containerId, appId)`

Affiche une app du conteneur.

- `containerId` (*string*) : Conteneur.
- `appId` (*string*) : App.

#### `ui_appContainers_topCenter.showFlashMessage(msg, ttl, big)`

Affiche un message flash unique, affiche l'app flashMessage et envoie {msg, ttl, big} sur l'événement TopCenterAppsFlashMessage. Le message est mémorisé pendant ttl pour qu'une app montée en retard puisse le récupérer.

- `msg` (*string*) : Texte (ou clé de traduction) du message.
- `ttl` (*number|nil*) : Durée en secondes, 3 par défaut.
- `big` (*boolean|nil*) : Affichage en grand.

#### `ui_appContainers_topCenter.toggleApp(containerId, appId)`

Inverse la visibilité d'une app du conteneur.

- `containerId` (*string*) : Conteneur.
- `appId` (*string*) : App.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | { "ui_appContainers", "ui_firstDrive_moveOff" } : chargés avant ce module. |

**Évènements UI (guihooks.trigger) :** `TechDriverTrainingSpeedBarTarget`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/appContainers/topCenter.lua`.*
