# `flowgraph_modules_uiModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/uiModule.lua` · VM : Game Engine (GE) · 711 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/uiModule")` (fichier sous extensions/ mais pas une extension classique)

Module flowgraph (moduleOrder 1000) qui construit les écrans de début et de fin de mission (« mission.control »). Les nœuds flowgraph appellent startUIBuilding, ajoutent des éléments (addUIElement, addObjectives, addRatings, addDriftStats…) et des boutons, puis finishUIBuilding envoie la mise en page à l'interface via guihooks. Il gère aussi le contexte des apps du haut de l'écran, le game state et le prompt de récupération pendant l'exécution du graphe. Dépend de ui_appContainers_topCenter.

## Exemple

```lua
local ui = mgr.modules.ui
ui:startUIBuilding('startScreen', node)
ui:addHeader({label = 'Ma mission'})
ui:addObjectives(nil, {main = true})
ui:finishUIBuilding()
```

## Remarques

- Hooks écoutés (C.hooks) : onRequestMissionScreenData, onMissionScreenButtonClicked, onGetIsMissionStartOrEndScreenActive.
- Les fonctions add* refusent d'agir (log E) si on n'est pas entre startUIBuilding et finishUIBuilding.
- Modes d'écran gérés par finishUIBuilding : 'startScreen' (ajoute le bouton Start) et 'endScreen'. Tout autre mode ne navigue pas vers mission.control.
- Bug possible : dans setupPages, `pageConfig[pageName].hideInCareer` plante si un élément déclare une page absente de pageConfig (pages connues : timeslip, main, rewards, unlocks, leaderboards, aiCompetitors, drift, lapTimes, rules, recording, crashAnalysisStep).
- Bug possible : nextPage utilise self.pageCounter qui n'est jamais initialisé dans ce fichier (erreur arithmétique sur nil si appelée).
- Bug possible : formatMission (local) met `order = i` avec `i` non défini (donc nil).
- Dans addRatings, quand dnq est vrai, la valeur newBestKeysByKey['highscore'] est forcée à 6 (« hack » signalé dans le code).
- Les temps de tours (addLaptimesForVehicle) sont affichés au format m:ss:mmm.

**Dépendances (chargées avant) :** `ui_appContainers_topCenter`

## Classe `C`

Classe du module UI (instance par gestionnaire flowgraph, accessible via mgr.modules.ui). Garde la mise en page en cours dans self.uiLayout.

| Méthode | Description | Ligne |
|---|---|---|
| `C:addButton(fun, meta)` | Enregistre une fonction de rappel et renvoie la table meta du bouton (avec mgrId et funId). Ne l'ajoute pas à l'écran. | 275 |
| `C:addCrashAnalysisStepDetails(stepDetails)` | Ajoute un panneau « crashTestStepDetails » avec les points de l'étape d'un crash test. | 484 |
| `C:addDriftStats(driftStats)` | Ajoute trois panneaux texte (statistiques de performance, paliers, évènements de drift) sur la page drift, avec une ligne de total. | 506 |
| `C:addHeader(header)` | Définit l'en-tête de l'écran. | 267 |
| `C:addLaptimesForVehicle(state, attempt)` | Ajoute un panneau « Lap Times » (page lapTimes) avec chaque tour, son temps et l'écart au meilleur (« Best » pour le meilleur). | 614 |
| `C:addObjectives(change, pages)` | Ajoute l'élément « objectives » (étoiles de la mission) calculé depuis les réglages utilisateur et, si change est fourni, les étoiles débloquées et récompenses. Sans effet s'il n'y a pas d'activité ou si aucune étoile n'est visible. | 301 |
| `C:addRatings(change)` | Ajoute les éléments de classement (« ratings » sur la page leaderboards), puis « rewards » (carrière, si récompenses) et « unlocks » (missions/ligues débloquées) quand change est fourni. | 397 |
| `C:addReplayPanelAndSupportsReplay()` | Ajoute le panneau « Replay Recording » (fichiers de replay de la mission) si l'activité supporte le replay et que le menu n'est pas simple. | 204 |
| `C:addScreenButton(fun, meta)` | Comme addButton, mais ajoute le bouton à la liste des boutons de l'écran. Ceux ajoutés avant finishUIBuilding apparaissent au-dessus du bouton Start. | 291 |
| `C:addUIElement(element)` | Ajoute un élément (table avec type, header, pages…) à la mise en page en cours. | 259 |
| `C:buildListText(items)` | Transforme une liste d'éléments en table de fragments HTML <ul><li>…</li></ul> (à concaténer). | 235 |
| `C:clear()` | Remet à zéro l'état : fade, construction en cours, mise en page et contexte d'app. | 18 |
| `C:clearButtonFunctions()` | Vide la table des fonctions de rappel des boutons. | 40 |
| `C:executionStarted()` | Appelée au démarrage du graphe : sauvegarde l'état du prompt de récupération et le game state, désactive le prompt, charge ui_apps_genericMissionData et ui_apps_pointsBar, vide la tasklist si une activité existe. | 669 |
| `C:executionStopped()` | Appelée à l'arrêt du graphe : nettoie les apps de données, réinitialise le contexte topCenter, restaure le prompt de récupération et (sauf keepGameState) le game state initial, vide la tasklist. | 684 |
| `C:finishUIBuilding()` | Termine la construction. En startScreen ajoute le bouton Start (qui appelle startFromUi du nœud) ; en startScreen/endScreen ajoute le panneau de replay, prépare les pages, navigue vers 'mission.control' et déclenche le guihook onRequestMissionScreenDataReady. | 166 |
| `C:getFreeId()` | Incrémente et renvoie un identifiant unique, utilisé pour le buildId. | 9 |
| `C:init()` | Appelée à la création du module ; appelle clear(). | 14 |
| `C:keepGameState(keep)` | Indique s'il faut conserver le game state à l'arrêt du graphe (sinon il est restauré à l'état du début). | 36 |
| `C:nextPage()` | Insère une page vide dans le layout (prévu pour startPage). | 664 |
| `C:onGetIsMissionStartOrEndScreenActive(screensActive)` | Hook : ajoute le mode de l'écran actif à la liste fournie. | 229 |
| `C:onMissionScreenButtonClicked(button)` | Hook appelé au clic sur un bouton de l'écran. Ignore les boutons d'un autre gestionnaire (mgrId), exécute la fonction enregistrée, puis efface la mise en page sauf si button.keepLayout. | 246 |
| `C:onRequestMissionScreenData(mode)` | Hook appelé quand l'UI demande les données de l'écran de mission. Renvoie la mise en page (guihook onRequestMissionScreenDataReady), émet le hook onMissionScreenReady et appelle activity:onMissionScreenReady(mode). Ignoré si le mode contient « test ». | 219 |
| `C:setAppContainerContext(context)` | Change le contexte du conteneur d'apps 'topCenter' si le contexte n'est pas vide et que ui_appContainers_topCenter existe, et le mémorise. | 29 |
| `C:setGameState(...)` | Relais vers core_gamestate.setGameState avec les mêmes arguments. | 25 |
| `C:setPageIcon(pageName, icon)` | Remplace l'icône d'une page pendant la construction. | 56 |
| `C:setStartButtonText(text)` | Définit le libellé du bouton Start (clé de traduction ou texte). | 393 |
| `C:setStartScreenAsSimple()` | Marque l'écran de départ comme simple (pas de panneau de replay). | 200 |
| `C:setupPages()` | Calcule la table des pages (ordre, icône, libellé, obligatoire) à partir des éléments du layout et la place dans uiLayout.pages. Ajoute un panneau texte « No layout elements found » si le layout est vide. Les pages 'mandatory' ne le sont qu'en endScreen ; 'rewards' est masquée hors carrière. | 61 |
| `C:startUIBuilding(uiMode, node)` | Commence la construction d'un écran : crée self.uiLayout (mode, header, layout, buttons, nœud d'origine, buildId). Refuse si une construction est déjà en cours. | 44 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onMissionScreenReady` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `ClearTasklist`, `onRequestMissionScreenDataReady`

**Charge les extensions :** `ui_apps_genericMissionData`, `ui_apps_pointsBar`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/uiModule.lua`.*
