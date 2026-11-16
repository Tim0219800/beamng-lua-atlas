# `gameplay_discover`

*Fichier : `lua/ge/extensions/gameplay/discover.lua` · VM : Game Engine (GE) · 537 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `gameplay_discover` : `extensions.load("gameplay_discover")`, puis la globale `gameplay_discover`

Gère les « discovers » (expériences de l'écran Découvrir/Play). Il charge tous les fichiers *.lua de /gameplay/discover/ : chacun peut exporter pageInfo (page avec sections et discoverIds), experiences (liste d'expériences avec id, type 'mission' ou 'freeroam', trigger, onLoaded, onUnloaded, playerCount…) et getProgressTag. getDiscoverPages assemble les pages pour l'UI (cartes, images, tags officiel/mod/joueurs/durée), startDiscover lance une expérience (mission ou fonction trigger), et le module gère la navigation après le fondu de chargement, des popups d'introduction et la configuration d'écran partagé (splitscreen).

## Exemple

```lua
gameplay_discover.startDiscover('myExperienceId')
```

## Remarques

- Peut être lancé en ligne de commande : -discover <id> ; -discover firstStart réaffiche la fenêtre d'accueil (onboardingPopupShown = false).
- Les extensions chargées via discover (loadExt) sont suivies ; la fonction onUnloaded de l'expérience est appelée quand l'extension est déchargée (onExtensionUnloaded est enveloppé).
- Une seule expérience en chargement à la fois : startDiscover ignore l'appel s'il y en a déjà une (lastDiscover non nil).
- Après le chargement d'un niveau, la route UI (playRoute, 'play' par défaut) est ouverte au fondu de l'écran de chargement (onLoadingScreenFadeout), sauf si un écran de début/fin de mission est actif.
- Image de repli : /gameplay/discover/images/freeroamTBD.jpg quand l'image est absente.
- Dans formatDiscover, la variable locale 'mission' n'est définie que dans une branche interne (portée locale) : le second bloc 'if mission' ne la voit pas, donc l'info officielle/mod d'une mission est toujours déduite du chemin du dossier et jamais du mission.modID. Incohérence du jeu.
- Le commentaire de loadDiscovers (extrait de code pour lister positions/partConfig des véhicules) est un bloc d'aide laissé là par les développeurs, sans rapport avec la fonction.
- startDiscover retourne false (en logguant) si la configuration de joueurs en écran partagé n'est pas valide ; dans les autres cas d'échec, il retourne nil.

**Dépendances (chargées avant) :** `ui_multiseat_multiseatConfiguration`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `gameplay_discover.basicControlsIntroPopup()` | Affiche la fenêtre d'introduction des commandes de base, en choisissant le premier popup basicDriving_<imagePack> existant selon les périphériques détectés (volant, joystick, xinput, gamepad, souris, clavier, puis fallback). | 437 |
| `gameplay_discover.canStartSplitscreenDiscover(minPlayers, maxPlayers)` | Indique si l'expérience peut démarrer avec le nombre de joueurs inscrits. | 523 |
| `gameplay_discover.clearTasksOnClientEndMission()` | Demande d'envoyer l'évènement UI 'ClearTasklist' à la prochaine fin de niveau. | 369 |
| `gameplay_discover.cycleSplitscreenDevicePlayer(deviceId, operation, direction)` | Change le joueur associé à un périphérique : 'toggle' bascule, 'move' déplace selon direction, sinon passe au joueur suivant. | 500 |
| `gameplay_discover.getDiscoverPages()` | Construit la liste des pages pour l'UI : chaque page est copiée, ses sections remplies de cartes (formatDiscover), les tags (joueurs, version, durée, type, progression, officiel, mod) ajoutés, l'image choisie, puis le tout est trié par date décroissante puis sortBias. | 213 |
| `gameplay_discover.getSplitscreenOptedInPlayers()` | Liste les joueurs inscrits à l'écran partagé. | 519 |
| `gameplay_discover.getSplitscreenPlayerOptIns()` | Retourne l'état d'inscription des joueurs à l'écran partagé (module gameplay/discover/multiseat/splitscreen). | 496 |
| `gameplay_discover.introPopup(id)` | Ouvre un popup d'introduction (/gameplay/discover/popups/<id>/content.json) via ui_popup, une seule fois par id et par session. | 466 |
| `gameplay_discover.joinSplitscreenDeviceGroup(groupId)` | Fait rejoindre un groupe de périphériques dans la configuration d'écran partagé. | 511 |
| `gameplay_discover.leaveSplitscreenMenuSetup()` | Quitte la configuration d'écran partagé du menu. | 527 |
| `gameplay_discover.loadDiscovers()` | Charge une fois tous les fichiers /gameplay/discover/*.lua : enregistre leurs pageInfo (avec dossier et métadonnées officiel/mod), leurs experiences par id et leurs tags de progression. Appelé automatiquement par getDiscoverPages et startDiscover. | 125 |
| `gameplay_discover.loadExt(extensionName)` | Charge une extension une seule fois (extensions.load) et, si l'expérience en cours possède onUnloaded, enveloppe le onExtensionUnloaded de l'extension pour appeler onUnloaded à son déchargement. | 386 |
| `gameplay_discover.navigateToPostLoadRoute()` | Libère lastDiscover et, si une navigation était attendue, ouvre la route UI de fin de chargement (playRoute ou 'play'), sauf si un écran de début/fin de mission est actif. *(interne)* | 350 |
| `gameplay_discover.onClientEndMission()` | Hook appelé à la fin d'un niveau : réinitialise la navigation si aucune expérience n'est en chargement, et vide la liste de tâches si demandé. *(interne)* *(hook)* | 375 |
| `gameplay_discover.onInit()` | Hook d'initialisation : passe le mode de déchargement en manuel et traite les arguments de ligne de commande -discover <id> et -discover firstStart. *(interne)* *(hook)* | 420 |
| `gameplay_discover.onLanguageChanged()` | Hook appelé au changement de langue : oublie les expériences chargées pour les recharger (traductions). *(interne)* *(hook)* | 152 |
| `gameplay_discover.onLoadingScreenFadeout()` | Hook appelé au fondu de l'écran de chargement ; même fonction que navigateToPostLoadRoute. *(interne)* *(hook)* | 350 |
| `gameplay_discover.setSplitscreenDevicePlayer(deviceId, personaNumber)` | Associe un périphérique à un joueur (persona). | 507 |
| `gameplay_discover.setSplitscreenPlayerOptIn(player, optedIn)` | Inscrit ou désinscrit un joueur de l'écran partagé. | 515 |
| `gameplay_discover.startDiscover(discoverId)` | Lance une expérience par id. Pour une mission (missionId), démarre via gameplay_missions_missionManager.startWithLoadingLevel ; pour une expérience à fonction trigger, appelle trigger(M) puis onLoaded(M). Valide d'abord la configuration d'écran partagé si playerCount est défini. | 285 |

### Détail des paramètres

#### `gameplay_discover.canStartSplitscreenDiscover(minPlayers, maxPlayers)`

Indique si l'expérience peut démarrer avec le nombre de joueurs inscrits.

- `minPlayers` (*integer*) : Nombre minimal de joueurs.
- `maxPlayers` (*integer*) : Nombre maximal de joueurs.
- **renvoie** : boolean Résultat de canStartWithOptIns (déduit du code).

#### `gameplay_discover.cycleSplitscreenDevicePlayer(deviceId, operation, direction)`

Change le joueur associé à un périphérique : 'toggle' bascule, 'move' déplace selon direction, sinon passe au joueur suivant.

- `deviceId` (*any*) : Identifiant du périphérique.
- `operation` (*string|nil*) : 'toggle', 'move' ou autre pour cycler.
- `direction` (*any*) : Direction pour 'move'.
- **renvoie** : any Résultat de la fonction du module splitscreen.

#### `gameplay_discover.getDiscoverPages()`

Construit la liste des pages pour l'UI : chaque page est copiée, ses sections remplies de cartes (formatDiscover), les tags (joueurs, version, durée, type, progression, officiel, mod) ajoutés, l'image choisie, puis le tout est trié par date décroissante puis sortBias.

- **renvoie** : table[] Pages avec title, image, description, sections[].cards[], tagList, pageKind ('minor' par défaut), date, version, duration, isOfficial, isMod, modID, modName, modTitle, showMultiseatControllers.

#### `gameplay_discover.getSplitscreenOptedInPlayers()`

Liste les joueurs inscrits à l'écran partagé.

- **renvoie** : any Joueurs inscrits (déduit du code).

#### `gameplay_discover.getSplitscreenPlayerOptIns()`

Retourne l'état d'inscription des joueurs à l'écran partagé (module gameplay/discover/multiseat/splitscreen).

- **renvoie** : table État des inscriptions (déduit du code).

#### `gameplay_discover.introPopup(id)`

Ouvre un popup d'introduction (/gameplay/discover/popups/<id>/content.json) via ui_popup, une seule fois par id et par session.

- `id` (*string*) : Identifiant du popup.

#### `gameplay_discover.joinSplitscreenDeviceGroup(groupId)`

Fait rejoindre un groupe de périphériques dans la configuration d'écran partagé.

- `groupId` (*any*) : Identifiant du groupe.
- **renvoie** : any Résultat de la fonction du module splitscreen.

#### `gameplay_discover.leaveSplitscreenMenuSetup()`

Quitte la configuration d'écran partagé du menu.

- **renvoie** : any Résultat de la fonction du module splitscreen.

#### `gameplay_discover.loadExt(extensionName)`

Charge une extension une seule fois (extensions.load) et, si l'expérience en cours possède onUnloaded, enveloppe le onExtensionUnloaded de l'extension pour appeler onUnloaded à son déchargement.

- `extensionName` (*string*) : Nom de l'extension à charger.

#### `gameplay_discover.navigateToPostLoadRoute()`

Libère lastDiscover et, si une navigation était attendue, ouvre la route UI de fin de chargement (playRoute ou 'play'), sauf si un écran de début/fin de mission est actif.

- **renvoie** : boolean true si la navigation a eu lieu.

#### `gameplay_discover.onLoadingScreenFadeout()`

Hook appelé au fondu de l'écran de chargement ; même fonction que navigateToPostLoadRoute.

- **renvoie** : boolean true si la navigation a eu lieu.

#### `gameplay_discover.setSplitscreenDevicePlayer(deviceId, personaNumber)`

Associe un périphérique à un joueur (persona).

- `deviceId` (*any*) : Identifiant du périphérique.
- `personaNumber` (*integer*) : Numéro du joueur.
- **renvoie** : any Résultat de la fonction du module splitscreen.

#### `gameplay_discover.setSplitscreenPlayerOptIn(player, optedIn)`

Inscrit ou désinscrit un joueur de l'écran partagé.

- `player` (*integer*) : Index du joueur.
- `optedIn` (*boolean*) : true pour inscrire.
- **renvoie** : any Résultat de la fonction du module splitscreen.

#### `gameplay_discover.startDiscover(discoverId)`

Lance une expérience par id. Pour une mission (missionId), démarre via gameplay_missions_missionManager.startWithLoadingLevel ; pour une expérience à fonction trigger, appelle trigger(M) puis onLoaded(M). Valide d'abord la configuration d'écran partagé si playerCount est défini.

- `discoverId` (*string*) : Id de l'expérience (clé id dans experiences).
- **renvoie** : boolean|nil false si la configuration d'écran partagé est invalide ; nil sinon (même en cas d'échec ou de succès).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table<integer, string> | Extensions chargées avant : {'ui_multiseat_multiseatConfiguration'}. |

**Évènements UI (guihooks.trigger) :** `ClearTasklist`

## Appels vers le moteur (C++)

- `Engine.` `getStartingArgs`
- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/gameplay/discover.lua`.*
