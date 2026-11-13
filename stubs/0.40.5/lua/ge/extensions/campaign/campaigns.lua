---@meta
-- tim19Atlas stub generated from lua/ge/extensions/campaign/campaigns.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Moteur d'exécution d'une campagne en cours. Il tient la campagne active (variable locale campaign = {meta, state}), enchaîne les scénarios d'après la clé « nextScenario » ou les événements onSucceed/onFail, tient le statut de chaque lieu (state ready/failed/completed, medal, attempts), vérifie les prérequis (scénarios terminés, véhicule imposé), traite les récompenses, les bandes dessinées, les succès (OnlineServiceProvider.unlockAchievement), l'écran de fin (boutons retry/next/cancel/menu/freeroam/finish) et la sérialisation. Les lieux sont dans meta.subsections[s].locations[l] ; la clé d'un lieu dans state.locationStatus est « sous-section.lieu ».
--- Accès : extension `campaign_campaigns` : `extensions.load("campaign_campaigns")`, puis la globale `campaign_campaigns`
---@class campaign_campaigns
---@field dependencies string[] {'scenario_scenarios'}
---@field onDeserialized nil Toujours nil : référence à une variable non définie dans le fichier.
campaign_campaigns = {}

--- Vrai si la médaille obtenue pour ce lieu n'est pas déjà « gold ».
---Source : lua/ge/extensions/campaign/campaigns.lua:182
---@param locationKey string Clé du lieu.
---@return boolean|nil  Résultat.
function campaign_campaigns.canImproveResult(locationKey) end

--- Vérifie les prérequis (champ requires) d'un lieu : tous les scénarios listés « completed » dans la même sous-section, et/ou véhicule du joueur dans la liste imposée.
---Source : lua/ge/extensions/campaign/campaigns.lua:155
---@param scenarioKey string Clé du lieu.
---@return boolean  true si le scénario peut démarrer.
function campaign_campaigns.canStartScenario(scenarioKey) end

--- Appelle une seule fois le callback de fin de campagne (meta.endCampaignCallback) s'il existe.
---Source : lua/ge/extensions/campaign/campaigns.lua:189
function campaign_campaigns.execEndCallback() end

--- Retourne la sous-section active (state.activeSubsection).
---Source : lua/ge/extensions/campaign/campaigns.lua:540
---@return table|nil  Sous-section active.
function campaign_campaigns.getActiveSubsection() end

--- Comme getLocationData mais dans la sous-section active.
---Source : lua/ge/extensions/campaign/campaigns.lua:551
---@param locationKey string Clé du lieu.
---@return table|nil  Données du lieu.
function campaign_campaigns.getActiveSubsectionLocationData(locationKey) end

--- Retourne la campagne en cours ({meta, state}).
---Source : lua/ge/extensions/campaign/campaigns.lua:529
---@return table|nil  Campagne.
function campaign_campaigns.getCampaign() end

--- Indique si une campagne est active (state.campaignActive).
---Source : lua/ge/extensions/campaign/campaigns.lua:525
---@return boolean|nil  Vrai si active.
function campaign_campaigns.getCampaignActive() end

--- Titre de la campagne active (meta.title).
---Source : lua/ge/extensions/campaign/campaigns.lua:54
---@return string|nil  Titre.
function campaign_campaigns.getCampaignTitle() end

--- Retourne state.currentLocation (format « sous-section.lieu ») si une campagne est active.
---Source : lua/ge/extensions/campaign/campaigns.lua:555
---@return string|nil  Lieu courant.
function campaign_campaigns.getCurrentLocation() end

--- Retourne les données d'un lieu dans une sous-section.
---Source : lua/ge/extensions/campaign/campaigns.lua:544
---@param subsectionKey string Clé de la sous-section.
---@param locationKey string Clé du lieu.
---@return table|nil  Données du lieu.
function campaign_campaigns.getLocationData(subsectionKey, locationKey) end

--- Retourne state.locationStatus (« sous-section.lieu » vers {attempts, state, medal}).
---Source : lua/ge/extensions/campaign/campaigns.lua:721
---@return table  Table des statuts.
function campaign_campaigns.getLocationStatusTable() end

--- Retourne la sous-section de la campagne qui contient le lieu donné.
---Source : lua/ge/extensions/campaign/campaigns.lua:28
---@param locationKey string Clé du lieu.
---@return table|nil  La sous-section ou nil.
function campaign_campaigns.getOwningSubsection(locationKey) end

--- Retourne une sous-section par clé (nil si aucune campagne active).
---Source : lua/ge/extensions/campaign/campaigns.lua:533
---@param subsectionKey string Clé de la sous-section.
---@return table|nil  Sous-section.
function campaign_campaigns.getSubsection(subsectionKey) end

--- Vrai si le scénario n'a pas de scénario suivant (clé « END » ou absente) ; faux tant qu'il n'a pas de résultat.
---Source : lua/ge/extensions/campaign/campaigns.lua:45
---@param scenario table Scénario avec scenarioKey et result.
---@return boolean  Fin de campagne ou non.
function campaign_campaigns.isCampaignOver(scenario) end

--- Vrai si le lieu a l'état « completed ».
---Source : lua/ge/extensions/campaign/campaigns.lua:175
---@param locationKey string Clé du lieu.
---@return boolean|nil  Résultat, ou nil/false si inconnu.
function campaign_campaigns.isLocationCompleted(locationKey) end

--- Vrai si le lieu est un site de sous-type missionGiver.
---Source : lua/ge/extensions/campaign/campaigns.lua:618
---@param subsectionKey string Sous-section.
---@param locationKey string Lieu.
---@return boolean|nil  Résultat.
function campaign_campaigns.isMissionGiver(subsectionKey, locationKey) end

--- Vrai si le lieu est un site de sous-type playerHQ.
---Source : lua/ge/extensions/campaign/campaigns.lua:613
---@param subsectionKey string Sous-section.
---@param locationKey string Lieu.
---@return boolean|nil  Résultat.
function campaign_campaigns.isPlayerHQ(subsectionKey, locationKey) end

--- Vrai si le lieu n'est ni un « site » ni un contre-la-montre (subtype timeTrial).
---Source : lua/ge/extensions/campaign/campaigns.lua:628
---@param subsectionKey string Sous-section.
---@param locationKey string Lieu.
---@return boolean|nil  Résultat.
function campaign_campaigns.isScenarioLocation(subsectionKey, locationKey) end

--- Vrai si le lieu est de type « site ».
---Source : lua/ge/extensions/campaign/campaigns.lua:623
---@param subsectionKey string Sous-section.
---@param locationKey string Lieu.
---@return boolean|nil  Résultat.
function campaign_campaigns.isSiteLocation(subsectionKey, locationKey) end

--- Vrai si un lieu de la sous-section a entryMarker ou exitLocation égal au nom de marqueur donné.
---Source : lua/ge/extensions/campaign/campaigns.lua:638
---@param subsectionKey string Sous-section.
---@param markerName string Nom du marqueur.
---@return boolean  Résultat.
function campaign_campaigns.isSubsectionMarker(subsectionKey, markerName) end

--- Vrai si le lieu est un site de sous-type transitionPoint.
---Source : lua/ge/extensions/campaign/campaigns.lua:608
---@param subsectionKey string Sous-section.
---@param locationKey string Lieu.
---@return boolean|nil  Résultat.
function campaign_campaigns.isTransitionPoint(subsectionKey, locationKey) end

--- Marque un lieu comme « completed » dans locationStatus.
---Source : lua/ge/extensions/campaign/campaigns.lua:445
---@param subsection table Sous-section (clé key utilisée).
---@param locationKey string Clé du lieu.
function campaign_campaigns.markCompleted(subsection, locationKey) end

--- Hook appelé au déchargement de l'extension : arrête la campagne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/campaign/campaigns.lua:701
function campaign_campaigns.onExtensionUnloaded() end

--- Hook de remise à zéro du gameplay ; ne fait rien dans cette version.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/campaign/campaigns.lua:732
---@param playerID integer Joueur concerné.
function campaign_campaigns.onResetGameplay(playerID) end

--- Hook de sauvegarde : appelle saveCallback(M.__globalAlias__, campaign.state + sourceFile).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/campaign/campaigns.lua:725
---@param saveCallback function Fournie par campaign_campaignsLoader.
function campaign_campaigns.onSaveCampaign(saveCallback) end

--- Hook de changement de scénario : décharge cette extension si aucune campagne n'est active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/campaign/campaigns.lua:705
---@param scenario table|nil Scénario courant (non utilisé).
function campaign_campaigns.onScenarioChange(scenario) end

--- Hook de sérialisation : retourne campaign.state avec sourceFile, ou {} si aucune campagne n'est active.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/campaign/campaigns.lua:562
---@return table  Données.
function campaign_campaigns.onSerialize() end

--- Reprend une campagne sauvegardée : remplace campaign.state par data et relance l'exécution au lieu courant.
---Source : lua/ge/extensions/campaign/campaigns.lua:711
---@param campaignInProgress table Campagne traitée.
---@param data table State sauvegardé.
function campaign_campaigns.resumeCampaign(campaignInProgress, data) end

--- Callback appelé par l'UI quand le joueur choisit une récompense de véhicule ; mémorise l'index dans state.selectedRewardIndex.
---Source : lua/ge/extensions/campaign/campaigns.lua:496
---@param itemIndex integer Index (à partir de 1) du véhicule choisi.
function campaign_campaigns.rewardSelectionCallback(itemIndex) end

--- Appelé à la fin d'un scénario (état « post ») : met à jour statut et médaille du lieu, calcule les récompenses (campaign_rewards.processRewards), construit les boutons de l'écran de fin, débloque les succès et joue les événements onSucceed/onFail.
---Source : lua/ge/extensions/campaign/campaigns.lua:453
---@param scenario table Scénario terminé avec result et stats.
function campaign_campaigns.scenarioFinished(scenario) end

--- Appelé par le système de scénarios au démarrage : à l'état « pre-start » joue l'événement onIntro du lieu (comic, inventaire) et incrémente le compteur attempts du lieu.
---Source : lua/ge/extensions/campaign/campaigns.lua:382
---@param scenario table Scénario qui démarre.
function campaign_campaigns.scenarioStarted(scenario) end

--- Active la campagne préparée (state.campaignActive = true), fixe currentLocation à meta.startingLocation, joue onStart puis démarre l'exécution (premier scénario). Ne fait rien sans meta.startingLocation.
---Source : lua/ge/extensions/campaign/campaigns.lua:686
---@param newCampaign table Campagne traitée {meta, state}.
function campaign_campaigns.startCampaign(newCampaign) end

--- Charge (si non fourni) et lance le scénario d'un lieu : met à jour currentLocation, scenarioKey, activeSubsection, sauvegarde la campagne puis appelle scenario_scenarios.executeScenario. Journalise une erreur si le lieu est inconnu.
---Source : lua/ge/extensions/campaign/campaigns.lua:61
---@param key string Clé du lieu/scénario.
---@param processedScenario table|nil Scénario déjà chargé ; sinon chargé via scenario_scenariosLoader.loadScenario(location.path).
function campaign_campaigns.startScenarioFromKey(key, processedScenario) end

--- Oublie la campagne en cours (variable locale mise à nil).
---Source : lua/ge/extensions/campaign/campaigns.lua:113
function campaign_campaigns.stop() end

--- Bouton Annuler de l'écran de fin : masque le menu (guihooks MenuHide), navigue vers « menu » et arrête le scénario.
---Source : lua/ge/extensions/campaign/campaigns.lua:504
function campaign_campaigns.uiEventCancel() end

--- Bouton Suivant de l'écran de fin : applique le choix de récompense, arrête le scénario courant et lance le suivant ; affiche le résumé et arrête la campagne s'il n'y en a plus. Ignoré (avertissement) si aucune campagne n'est active.
---Source : lua/ge/extensions/campaign/campaigns.lua:512
function campaign_campaigns.uiEventNext() end

