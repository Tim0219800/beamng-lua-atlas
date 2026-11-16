# `career_modules_tutorialPopups`

*Fichier : `lua/ge/extensions/career/modules/tutorialPopups.lua` · VM : Game Engine (GE) · 304 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `career_modules_tutorialPopups` : `extensions.load("career_modules_tutorialPopups")`, puis la globale `career_modules_tutorialPopups`

Gère les popups d'introduction (tutoriel et aides contextuelles) de la carrière : mémorise lesquelles ont déjà été vues (drapeaux sauvegardés dans <profil>/career/tutorialData.json), les ouvre via ui_popup depuis /gameplay/tutorials/pages/, et met en file d'attente celles qui arriveraient pendant une popup « véhicule endommagé » du tutoriel. Expose aussi des fonctions nommées (showWelcomeSplashscreen, onCareerTuningStarted, onEnterCargoOverviewScreen…) qui servent de hooks ou d'appels directs pour afficher la popup associée une seule fois.

## Exemple

```lua
career_modules_tutorialPopups.introPopup("tuning")        -- une seule fois
career_modules_tutorialPopups.introPopup("tuning", true)  -- forcée
```

## Remarques

- Des fonctions sont générées dynamiquement depuis la table interne introPopupTable : showWelcomeSplashscreen (welcome), showBeforeDrivingSplashscreen (driving), showCrashRecoverSplashScreen (crashRecover), onRefuelingStartTransaction (refueling), onAvailableMissionsSentToUi (missions), showPostMissionSplash (postMission), onCareerTuningStarted (tuning), garageModeStartStep (garage), showLogbookSplash (logbook), showTutorialOverSplash (finishing, logbook, leagues, performanceIndex), onEnterCargoOverviewScreen (delivery/cargoScreen), onComputerInsurance (insurance), onVehiclePaintingUiOpened (vehiclePainting). D'autres entrées (addWalkingModeLogbookEntry, addCamerasLogbookEntry, showTraversalSplashScreen, showBasicTutorialComplete, onVehicleBought) existent mais n'ouvrent aucune popup (liste vide). Ces fonctions ne figurent pas dans la liste auto des pages.
- introPopup marque le drapeau comme vu avant l'ouverture, puis appelle ui_popup.openPopupById avec root /gameplay/tutorials/pages/.
- Si le tutoriel est actif, qu'un crash a eu lieu et que la popup de dégâts (v2/damagedVehicle, v2/damagedVehicleTimeTrial, v2/damagedVehicleCareer) n'est pas encore fermée, la popup demandée est mise en attente et rouverte à la fermeture de la suivante.
- Le champ allTutorialFlags est défini à la fin du fichier ; showAllSplashscreensAndLogbookEntries remet tous ces drapeaux à false avant de tout réafficher.

**Dépendances (chargées avant) :** `ui_popup`, `gameplay_tutorial_damageTracker`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `career_modules_tutorialPopups.drawDebugFunctions()` | Dessine le menu imgui de debug « Intro Popups » : tout revoir, tout marquer non vu, cases à cocher par popup, bouton d'édition du contenu. *(interne)* | 236 |
| `career_modules_tutorialPopups.getTutorialFlag(key)` | Lit le drapeau d'une popup (true si vue). | 24 |
| `career_modules_tutorialPopups.introPopup(id, force)` | Ouvre une popup d'intro. Sans force, ne fait rien si elle a déjà été vue. Peut être mise en attente après une popup de dégâts du tutoriel. | 83 |
| `career_modules_tutorialPopups.introPopupSequence(ids, force)` | Ouvre plusieurs popups à la suite (ui_popup.openPopupsByIds) et marque tous les ids comme vus. | 105 |
| `career_modules_tutorialPopups.onExtensionLoaded()` | Hook de chargement : lit les drapeaux depuis tutorialData.json du profil courant. *(interne)* *(hook)* | 41 |
| `career_modules_tutorialPopups.onIntroPopupCareerClosed(id)` | Hook émis à la fermeture d'une popup : si c'est une popup de dégâts, marque la fermeture, puis rouvre la première popup en attente. *(interne)* *(hook)* | 71 |
| `career_modules_tutorialPopups.onSaveCurrentProfile(currentSavePath)` | Hook de sauvegarde du profil : écrit les drapeaux dans tutorialData.json. *(interne)* *(hook)* | 47 |
| `career_modules_tutorialPopups.setFlagsTable(flagsTable)` | Remplace la table complète des drapeaux « popup vue ». | 20 |
| `career_modules_tutorialPopups.setTutorialFlag(key, value)` | Met à jour le drapeau d'une popup. | 28 |
| `career_modules_tutorialPopups.showAllSplashscreensAndLogbookEntries()` | Remet tous les drapeaux à false puis ré-affiche toutes les popups d'accueil et toutes les popups de la table interne (utile pour revoir les aides). | 186 |
| `career_modules_tutorialPopups.showNonTutorialWelcomeSplashscreen()` | Affiche (forcées) les popups d'accueil sans tutoriel : welcomeNoTutorial, leagues, performanceIndex, logbook. | 171 |
| `career_modules_tutorialPopups.wasIntroPopupsSeen(pages)` | Indique si toutes les popups listées ont déjà été vues. | 32 |

### Détail des paramètres

#### `career_modules_tutorialPopups.getTutorialFlag(key)`

Lit le drapeau d'une popup (true si vue).

- `key` (*string*) : Id de la popup.
- **renvoie** : boolean|nil Valeur du drapeau.

#### `career_modules_tutorialPopups.introPopup(id, force)`

Ouvre une popup d'intro. Sans force, ne fait rien si elle a déjà été vue. Peut être mise en attente après une popup de dégâts du tutoriel.

- `id` (*string*) : Id de la page (ex. "v2/basicControls").
- `force` (*boolean|nil*) : Si vrai, ignore le drapeau « déjà vue ».

#### `career_modules_tutorialPopups.introPopupSequence(ids, force)`

Ouvre plusieurs popups à la suite (ui_popup.openPopupsByIds) et marque tous les ids comme vus.

- `ids` (*string[]*) : Ids de pages.
- `force` (*boolean|nil*) : Si faux ou nil, ne marque que les pages non encore vues ; la séquence est ouverte dans tous les cas.

#### `career_modules_tutorialPopups.onIntroPopupCareerClosed(id)`

Hook émis à la fermeture d'une popup : si c'est une popup de dégâts, marque la fermeture, puis rouvre la première popup en attente.

- `id` (*string*) : Id de la popup fermée.

#### `career_modules_tutorialPopups.onSaveCurrentProfile(currentSavePath)`

Hook de sauvegarde du profil : écrit les drapeaux dans tutorialData.json.

- `currentSavePath` (*string*) : Dossier de sauvegarde du profil.

#### `career_modules_tutorialPopups.setFlagsTable(flagsTable)`

Remplace la table complète des drapeaux « popup vue ».

- `flagsTable` (*table<string, boolean>|nil*) : Nouvelle table ; nil donne une table vide.

#### `career_modules_tutorialPopups.setTutorialFlag(key, value)`

Met à jour le drapeau d'une popup.

- `key` (*string*) : Id de la popup.
- `value` (*boolean*) : Vue ou non.

#### `career_modules_tutorialPopups.wasIntroPopupsSeen(pages)`

Indique si toutes les popups listées ont déjà été vues.

- `pages` (*string[]|nil*) : Ids de popups.
- **renvoie** : boolean true si toutes ont leur drapeau (true aussi pour une liste vide).

## Champs

| Champ | Type | Description |
|---|---|---|
| `allTutorialFlags` | string[] | Liste des ids de popups connus (welcome, driving, crashRecover, bigmap, refueling, missions, tuning, insurance, leagues, etc.). |
| `dependencies` | string[] | {'ui_popup', 'gameplay_tutorial_damageTracker'}. |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/career/modules/tutorialPopups.lua`.*
