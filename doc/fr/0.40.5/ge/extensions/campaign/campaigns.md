# `campaign_campaigns`

*Fichier : `lua/ge/extensions/campaign/campaigns.lua` · VM : Game Engine (GE) · 777 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `campaign_campaigns` : `extensions.load("campaign_campaigns")`, puis la globale `campaign_campaigns`

Moteur d'exécution d'une campagne en cours. Il tient la campagne active (variable locale campaign = {meta, state}), enchaîne les scénarios d'après la clé « nextScenario » ou les événements onSucceed/onFail, tient le statut de chaque lieu (state ready/failed/completed, medal, attempts), vérifie les prérequis (scénarios terminés, véhicule imposé), traite les récompenses, les bandes dessinées, les succès (OnlineServiceProvider.unlockAchievement), l'écran de fin (boutons retry/next/cancel/menu/freeroam/finish) et la sérialisation. Les lieux sont dans meta.subsections[s].locations[l] ; la clé d'un lieu dans state.locationStatus est « sous-section.lieu ».

## Remarques

- Types de lieu (info.type / info.subtype) : « site » avec subtype transitionPoint, playerHQ ou missionGiver ; « race » avec subtype timeTrial. isScenarioLocation = type différent de « site » et subtype différent de « timeTrial ».
- Les fins de campagne : isCampaignOver est vrai si la clé du scénario suivant est « END » ou absente ; processNextScenario affiche alors le résumé (ui_router « scenario.chapter.end ») et arrête la campagne.
- Dans scenarioFinished, le statut d'un lieu n'est mis à jour que si le sous-type n'est pas « timeTrial » et si le lieu est « ready » ou si la nouvelle médaille est meilleure (statistics_statistics.getMedalRanking).
- Bug : M.onDeserialized = onDeserialized exporte une variable non définie dans le fichier (nil).
- Bug : uiEventRetry est définie mais vide et n'est pas exportée ; le bouton Retry appelle scenario_scenarios.uiEventRetry().
- isOverallResultFail retourne toujours false ; displayCampaignSummary affiche aussi des valeurs en dur (community = 20, player = 78, achievements « Not Implemented »).
- rewardSelectionCallback lit campaign.state.scenarioRewards.choices.vehicles : seuls les choix de la clé « vehicles » sont donc gérés.
- scenarioStarted et scenarioFinished ignorent les scénarios dont le nom diffère de campaign.meta.scenarioName.
- Un véhicule requis (dataType « vehicles ») est comparé avec model et config du véhicule actuel du joueur (extractVehicleData).

**Dépendances (chargées avant) :** `scenario_scenarios`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `campaign_campaigns.canImproveResult(locationKey)` | Vrai si la médaille obtenue pour ce lieu n'est pas déjà « gold ». | 182 |
| `campaign_campaigns.canStartScenario(scenarioKey)` | Vérifie les prérequis (champ requires) d'un lieu : tous les scénarios listés « completed » dans la même sous-section, et/ou véhicule du joueur dans la liste imposée. | 155 |
| `campaign_campaigns.execEndCallback()` | Appelle une seule fois le callback de fin de campagne (meta.endCampaignCallback) s'il existe. | 189 |
| `campaign_campaigns.getActiveSubsection()` | Retourne la sous-section active (state.activeSubsection). | 540 |
| `campaign_campaigns.getActiveSubsectionLocationData(locationKey)` | Comme getLocationData mais dans la sous-section active. | 551 |
| `campaign_campaigns.getCampaign()` | Retourne la campagne en cours ({meta, state}). | 529 |
| `campaign_campaigns.getCampaignActive()` | Indique si une campagne est active (state.campaignActive). | 525 |
| `campaign_campaigns.getCampaignTitle()` | Titre de la campagne active (meta.title). | 54 |
| `campaign_campaigns.getCurrentLocation()` | Retourne state.currentLocation (format « sous-section.lieu ») si une campagne est active. | 555 |
| `campaign_campaigns.getLocationData(subsectionKey, locationKey)` | Retourne les données d'un lieu dans une sous-section. | 544 |
| `campaign_campaigns.getLocationStatusTable()` | Retourne state.locationStatus (« sous-section.lieu » vers {attempts, state, medal}). | 721 |
| `campaign_campaigns.getOwningSubsection(locationKey)` | Retourne la sous-section de la campagne qui contient le lieu donné. | 28 |
| `campaign_campaigns.getSubsection(subsectionKey)` | Retourne une sous-section par clé (nil si aucune campagne active). | 533 |
| `campaign_campaigns.isCampaignOver(scenario)` | Vrai si le scénario n'a pas de scénario suivant (clé « END » ou absente) ; faux tant qu'il n'a pas de résultat. | 45 |
| `campaign_campaigns.isLocationCompleted(locationKey)` | Vrai si le lieu a l'état « completed ». | 175 |
| `campaign_campaigns.isMissionGiver(subsectionKey, locationKey)` | Vrai si le lieu est un site de sous-type missionGiver. | 618 |
| `campaign_campaigns.isPlayerHQ(subsectionKey, locationKey)` | Vrai si le lieu est un site de sous-type playerHQ. | 613 |
| `campaign_campaigns.isScenarioLocation(subsectionKey, locationKey)` | Vrai si le lieu n'est ni un « site » ni un contre-la-montre (subtype timeTrial). | 628 |
| `campaign_campaigns.isSiteLocation(subsectionKey, locationKey)` | Vrai si le lieu est de type « site ». | 623 |
| `campaign_campaigns.isSubsectionMarker(subsectionKey, markerName)` | Vrai si un lieu de la sous-section a entryMarker ou exitLocation égal au nom de marqueur donné. | 638 |
| `campaign_campaigns.isTransitionPoint(subsectionKey, locationKey)` | Vrai si le lieu est un site de sous-type transitionPoint. | 608 |
| `campaign_campaigns.markCompleted(subsection, locationKey)` | Marque un lieu comme « completed » dans locationStatus. | 445 |
| `campaign_campaigns.onExtensionUnloaded()` | Hook appelé au déchargement de l'extension : arrête la campagne. *(interne)* *(hook)* | 701 |
| `campaign_campaigns.onResetGameplay(playerID)` | Hook de remise à zéro du gameplay ; ne fait rien dans cette version. *(interne)* *(hook)* | 732 |
| `campaign_campaigns.onSaveCampaign(saveCallback)` | Hook de sauvegarde : appelle saveCallback(M.__globalAlias__, campaign.state + sourceFile). *(interne)* *(hook)* | 725 |
| `campaign_campaigns.onScenarioChange(scenario)` | Hook de changement de scénario : décharge cette extension si aucune campagne n'est active. *(interne)* *(hook)* | 705 |
| `campaign_campaigns.onSerialize()` | Hook de sérialisation : retourne campaign.state avec sourceFile, ou {} si aucune campagne n'est active. *(interne)* *(hook)* | 562 |
| `campaign_campaigns.resumeCampaign(campaignInProgress, data)` | Reprend une campagne sauvegardée : remplace campaign.state par data et relance l'exécution au lieu courant. | 711 |
| `campaign_campaigns.rewardSelectionCallback(itemIndex)` | Callback appelé par l'UI quand le joueur choisit une récompense de véhicule ; mémorise l'index dans state.selectedRewardIndex. | 496 |
| `campaign_campaigns.scenarioFinished(scenario)` | Appelé à la fin d'un scénario (état « post ») : met à jour statut et médaille du lieu, calcule les récompenses (campaign_rewards.processRewards), construit les boutons de l'écran de fin, débloque les succès et joue les événements onSucceed/onFail. | 453 |
| `campaign_campaigns.scenarioStarted(scenario)` | Appelé par le système de scénarios au démarrage : à l'état « pre-start » joue l'événement onIntro du lieu (comic, inventaire) et incrémente le compteur attempts du lieu. | 382 |
| `campaign_campaigns.startCampaign(newCampaign)` | Active la campagne préparée (state.campaignActive = true), fixe currentLocation à meta.startingLocation, joue onStart puis démarre l'exécution (premier scénario). Ne fait rien sans meta.startingLocation. | 686 |
| `campaign_campaigns.startScenarioFromKey(key, processedScenario)` | Charge (si non fourni) et lance le scénario d'un lieu : met à jour currentLocation, scenarioKey, activeSubsection, sauvegarde la campagne puis appelle scenario_scenarios.executeScenario. Journalise une erreur si le lieu est inconnu. | 61 |
| `campaign_campaigns.stop()` | Oublie la campagne en cours (variable locale mise à nil). | 113 |
| `campaign_campaigns.uiEventCancel()` | Bouton Annuler de l'écran de fin : masque le menu (guihooks MenuHide), navigue vers « menu » et arrête le scénario. | 504 |
| `campaign_campaigns.uiEventNext()` | Bouton Suivant de l'écran de fin : applique le choix de récompense, arrête le scénario courant et lance le suivant ; affiche le résumé et arrête la campagne s'il n'y en a plus. Ignoré (avertissement) si aucune campagne n'est active. | 512 |

### Détail des paramètres

#### `campaign_campaigns.canImproveResult(locationKey)`

Vrai si la médaille obtenue pour ce lieu n'est pas déjà « gold ».

- `locationKey` (*string*) : Clé du lieu.
- **renvoie** : boolean|nil Résultat.

#### `campaign_campaigns.canStartScenario(scenarioKey)`

Vérifie les prérequis (champ requires) d'un lieu : tous les scénarios listés « completed » dans la même sous-section, et/ou véhicule du joueur dans la liste imposée.

- `scenarioKey` (*string*) : Clé du lieu.
- **renvoie** : boolean true si le scénario peut démarrer.

#### `campaign_campaigns.getActiveSubsection()`

Retourne la sous-section active (state.activeSubsection).

- **renvoie** : table|nil Sous-section active.

#### `campaign_campaigns.getActiveSubsectionLocationData(locationKey)`

Comme getLocationData mais dans la sous-section active.

- `locationKey` (*string*) : Clé du lieu.
- **renvoie** : table|nil Données du lieu.

#### `campaign_campaigns.getCampaign()`

Retourne la campagne en cours ({meta, state}).

- **renvoie** : table|nil Campagne.

#### `campaign_campaigns.getCampaignActive()`

Indique si une campagne est active (state.campaignActive).

- **renvoie** : boolean|nil Vrai si active.

#### `campaign_campaigns.getCampaignTitle()`

Titre de la campagne active (meta.title).

- **renvoie** : string|nil Titre.

#### `campaign_campaigns.getCurrentLocation()`

Retourne state.currentLocation (format « sous-section.lieu ») si une campagne est active.

- **renvoie** : string|nil Lieu courant.

#### `campaign_campaigns.getLocationData(subsectionKey, locationKey)`

Retourne les données d'un lieu dans une sous-section.

- `subsectionKey` (*string*) : Clé de la sous-section.
- `locationKey` (*string*) : Clé du lieu.
- **renvoie** : table|nil Données du lieu.

#### `campaign_campaigns.getLocationStatusTable()`

Retourne state.locationStatus (« sous-section.lieu » vers {attempts, state, medal}).

- **renvoie** : table Table des statuts.

#### `campaign_campaigns.getOwningSubsection(locationKey)`

Retourne la sous-section de la campagne qui contient le lieu donné.

- `locationKey` (*string*) : Clé du lieu.
- **renvoie** : table|nil La sous-section ou nil.

#### `campaign_campaigns.getSubsection(subsectionKey)`

Retourne une sous-section par clé (nil si aucune campagne active).

- `subsectionKey` (*string*) : Clé de la sous-section.
- **renvoie** : table|nil Sous-section.

#### `campaign_campaigns.isCampaignOver(scenario)`

Vrai si le scénario n'a pas de scénario suivant (clé « END » ou absente) ; faux tant qu'il n'a pas de résultat.

- `scenario` (*table*) : Scénario avec scenarioKey et result.
- **renvoie** : boolean Fin de campagne ou non.

#### `campaign_campaigns.isLocationCompleted(locationKey)`

Vrai si le lieu a l'état « completed ».

- `locationKey` (*string*) : Clé du lieu.
- **renvoie** : boolean|nil Résultat, ou nil/false si inconnu.

#### `campaign_campaigns.isMissionGiver(subsectionKey, locationKey)`

Vrai si le lieu est un site de sous-type missionGiver.

- `subsectionKey` (*string*) : Sous-section.
- `locationKey` (*string*) : Lieu.
- **renvoie** : boolean|nil Résultat.

#### `campaign_campaigns.isPlayerHQ(subsectionKey, locationKey)`

Vrai si le lieu est un site de sous-type playerHQ.

- `subsectionKey` (*string*) : Sous-section.
- `locationKey` (*string*) : Lieu.
- **renvoie** : boolean|nil Résultat.

#### `campaign_campaigns.isScenarioLocation(subsectionKey, locationKey)`

Vrai si le lieu n'est ni un « site » ni un contre-la-montre (subtype timeTrial).

- `subsectionKey` (*string*) : Sous-section.
- `locationKey` (*string*) : Lieu.
- **renvoie** : boolean|nil Résultat.

#### `campaign_campaigns.isSiteLocation(subsectionKey, locationKey)`

Vrai si le lieu est de type « site ».

- `subsectionKey` (*string*) : Sous-section.
- `locationKey` (*string*) : Lieu.
- **renvoie** : boolean|nil Résultat.

#### `campaign_campaigns.isSubsectionMarker(subsectionKey, markerName)`

Vrai si un lieu de la sous-section a entryMarker ou exitLocation égal au nom de marqueur donné.

- `subsectionKey` (*string*) : Sous-section.
- `markerName` (*string*) : Nom du marqueur.
- **renvoie** : boolean Résultat.

#### `campaign_campaigns.isTransitionPoint(subsectionKey, locationKey)`

Vrai si le lieu est un site de sous-type transitionPoint.

- `subsectionKey` (*string*) : Sous-section.
- `locationKey` (*string*) : Lieu.
- **renvoie** : boolean|nil Résultat.

#### `campaign_campaigns.markCompleted(subsection, locationKey)`

Marque un lieu comme « completed » dans locationStatus.

- `subsection` (*table*) : Sous-section (clé key utilisée).
- `locationKey` (*string*) : Clé du lieu.

#### `campaign_campaigns.onResetGameplay(playerID)`

Hook de remise à zéro du gameplay ; ne fait rien dans cette version.

- `playerID` (*integer*) : Joueur concerné.

#### `campaign_campaigns.onSaveCampaign(saveCallback)`

Hook de sauvegarde : appelle saveCallback(M.__globalAlias__, campaign.state + sourceFile).

- `saveCallback` (*function*) : Fournie par campaign_campaignsLoader.

#### `campaign_campaigns.onScenarioChange(scenario)`

Hook de changement de scénario : décharge cette extension si aucune campagne n'est active.

- `scenario` (*table|nil*) : Scénario courant (non utilisé).

#### `campaign_campaigns.onSerialize()`

Hook de sérialisation : retourne campaign.state avec sourceFile, ou {} si aucune campagne n'est active.

- **renvoie** : table Données.

#### `campaign_campaigns.resumeCampaign(campaignInProgress, data)`

Reprend une campagne sauvegardée : remplace campaign.state par data et relance l'exécution au lieu courant.

- `campaignInProgress` (*table*) : Campagne traitée.
- `data` (*table*) : State sauvegardé.

#### `campaign_campaigns.rewardSelectionCallback(itemIndex)`

Callback appelé par l'UI quand le joueur choisit une récompense de véhicule ; mémorise l'index dans state.selectedRewardIndex.

- `itemIndex` (*integer*) : Index (à partir de 1) du véhicule choisi.

#### `campaign_campaigns.scenarioFinished(scenario)`

Appelé à la fin d'un scénario (état « post ») : met à jour statut et médaille du lieu, calcule les récompenses (campaign_rewards.processRewards), construit les boutons de l'écran de fin, débloque les succès et joue les événements onSucceed/onFail.

- `scenario` (*table*) : Scénario terminé avec result et stats.

#### `campaign_campaigns.scenarioStarted(scenario)`

Appelé par le système de scénarios au démarrage : à l'état « pre-start » joue l'événement onIntro du lieu (comic, inventaire) et incrémente le compteur attempts du lieu.

- `scenario` (*table*) : Scénario qui démarre.

#### `campaign_campaigns.startCampaign(newCampaign)`

Active la campagne préparée (state.campaignActive = true), fixe currentLocation à meta.startingLocation, joue onStart puis démarre l'exécution (premier scénario). Ne fait rien sans meta.startingLocation.

- `newCampaign` (*table*) : Campagne traitée {meta, state}.

#### `campaign_campaigns.startScenarioFromKey(key, processedScenario)`

Charge (si non fourni) et lance le scénario d'un lieu : met à jour currentLocation, scenarioKey, activeSubsection, sauvegarde la campagne puis appelle scenario_scenarios.executeScenario. Journalise une erreur si le lieu est inconnu.

- `key` (*string*) : Clé du lieu/scénario.
- `processedScenario` (*table|nil*) : Scénario déjà chargé ; sinon chargé via scenario_scenariosLoader.loadScenario(location.path).

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | {'scenario_scenarios'} |
| `onDeserialized` | nil | Toujours nil : référence à une variable non définie dans le fichier. ⚠ référence `onDeserialized` non définie dans le fichier (vaut probablement nil) |

**Évènements UI (guihooks.trigger) :** `MenuHide`

## Appels vers le moteur (C++)

- `be:` `getPlayerVehicleID`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/campaign/campaigns.lua`.*
