---@meta
-- tim19Atlas stub generated from lua/ge/extensions/campaign/campaignsLoader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chargeur de campagnes : trouve les fichiers /campaigns/*.json dont header.type vaut « campaign », les charge (avec infos de mod et image d'aperçu), valide et prépare une campagne, la démarre (ou reprend une sauvegarde) et gère les sauvegardes dans /saves/campaigns/ (fichiers slotN.json de header.type « campaignSave »). Les modules de la campagne sont campaign_campaigns, campaign_comics, campaign_rewards, campaign_dealer et campaign_photoSafari (M.campaignModules).
--- Accès : extension `campaign_campaignsLoader` : `extensions.load("campaign_campaignsLoader")`, puis la globale `campaign_campaignsLoader`
---@class campaign_campaignsLoader
---@field campaignModules string[] Modules d'extension chargés pour une campagne.
---@field onInit nil Toujours nil : référence à une variable non définie dans le fichier.
campaign_campaignsLoader = {}

--- Retourne le nom du fichier de sauvegarde correspondant à un titre de campagne, ou nil.
---Source : lua/ge/extensions/campaign/campaignsLoader.lua:308
---@param title string Titre de la campagne.
---@param savesEnabled boolean Si faux, retourne nil sans rien chercher.
---@return string|nil  Chemin de la sauvegarde.
function campaign_campaignsLoader.checkSaveExists(title, savesEnabled) end

--- Liste les fichiers JSON de /campaigns/ (1 niveau) dont header.type == 'campaign'. Retourne {} si le dossier n'existe pas.
---Source : lua/ge/extensions/campaign/campaignsLoader.lua:45
---@return string[]  Chemins des fichiers de campagne.
function campaign_campaignsLoader.getCampaignFilenames() end

--- Retourne la liste mise en cache scenariosInAllCampaigns (vide dans ce fichier : jamais remplie ici ; generateCampaignScenariosList existe mais n'est pas appelée).
---Source : lua/ge/extensions/campaign/campaignsLoader.lua:85
---@return string[]  Chemins de scénarios.
function campaign_campaignsLoader.getCampaignScenarios() end

--- Charge toutes les campagnes trouvées avec loadCampaign et les retourne ; coopère avec util_asyncBulkLoader si un chargement groupé est en cours.
---Source : lua/ge/extensions/campaign/campaignsLoader.lua:61
---@return table[]  Liste des campagnes.
function campaign_campaignsLoader.getList() end

--- Lit le JSON d'une campagne et ajoute sourceFile, sourcePath, official, modID/modName/modTitle (valeurs « BeamNG » / « BeamNG.drive » si ce n'est pas un mod) et previews (image .jpg du dossier de la campagne).
---Source : lua/ge/extensions/campaign/campaignsLoader.lua:12
---@param campaignfile string Chemin du fichier JSON de la campagne.
---@return table  Données de la campagne enrichies.
function campaign_campaignsLoader.loadCampaign(campaignfile) end

--- Relit un fichier de sauvegarde, rappelle onResumeCampaign de chaque module concerné, puis campaign_campaigns.resumeCampaign.
---Source : lua/ge/extensions/campaign/campaignsLoader.lua:364
---@param campaign table Campagne traitée à reprendre.
---@param saveFilename string Chemin du fichier de sauvegarde.
function campaign_campaignsLoader.resumeSavedCampaign(campaign, saveFilename) end

--- Sauvegarde l'état de la campagne (voir notes) dans /saves/campaigns/ ; réutilise le fichier existant du même titre, sinon prend le prochain « slotN.json ».
---Source : lua/ge/extensions/campaign/campaignsLoader.lua:346
---@param campaign table Campagne traitée ({meta, state}) ; meta.enableSaves et meta.title sont lus.
function campaign_campaignsLoader.saveCampaign(campaign) end

--- Découpe une chaîne par un caractère jeton (en excluant aussi le point) et retourne les morceaux.
---Source : lua/ge/extensions/campaign/campaignsLoader.lua:134
---@param field string Chaîne à découper.
---@param token string Jeton de séparation.
---@return string[]  Morceaux.
function campaign_campaignsLoader.splitFieldByToken(field, token) end

--- Démarre une campagne choisie dans l'interface. Si un niveau est chargé, attend sa fermeture ; sinon décharge les extensions automatiques, charge celles du scénario, du quick race et de la campagne, prépare la campagne, puis reprend une sauvegarde existante ou appelle campaign_campaigns.startCampaign.
---Source : lua/ge/extensions/campaign/campaignsLoader.lua:249
---@param newCampaign table Campagne (issue de loadCampaign).
---@param endCallback function|nil Mémorisée comme endCampaignCallback.
function campaign_campaignsLoader.start(newCampaign, endCallback) end

--- Cherche la campagne dont sourcePath est path et la démarre.
---Source : lua/ge/extensions/campaign/campaignsLoader.lua:279
---@param path string Dossier source de la campagne.
---@param endCallback function|nil Callback de fin.
function campaign_campaignsLoader.startByFolder(path, endCallback) end

