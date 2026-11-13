# `campaign_campaignsLoader`

*Fichier : `lua/ge/extensions/campaign/campaignsLoader.lua` · VM : Game Engine (GE) · 393 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `campaign_campaignsLoader` : `extensions.load("campaign_campaignsLoader")`, puis la globale `campaign_campaignsLoader`

Chargeur de campagnes : trouve les fichiers /campaigns/*.json dont header.type vaut « campaign », les charge (avec infos de mod et image d'aperçu), valide et prépare une campagne, la démarre (ou reprend une sauvegarde) et gère les sauvegardes dans /saves/campaigns/ (fichiers slotN.json de header.type « campaignSave »). Les modules de la campagne sont campaign_campaigns, campaign_comics, campaign_rewards, campaign_dealer et campaign_photoSafari (M.campaignModules).

## Remarques

- Sauvegarde : saveCampaign lance le hook onSaveCampaign(callback) ; chaque module appelle le callback avec (alias global, données) ; le résultat est écrit en JSON avec un header {version = 1, type = 'campaignSave', title}. Rien n'est sauvegardé si meta.enableSaves est faux.
- La sauvegarde correspond à une campagne par son titre (meta.title).
- resumeSavedCampaign appelle onResumeCampaign sur chaque module sauvegardé via _G (sauf campaign_campaigns, repris en dernier avec campaign_campaigns.resumeCampaign).
- Bug : M.onInit = onInit exporte une variable non définie dans ce fichier (nil).
- Bug : startByFolder appelle campaign_campaigns.start, qui n'est pas exportée par campaigns.lua (celui-ci exporte startCampaign) ; l'appel échoue. Utiliser plutôt campaign_campaignsLoader.start.
- Bug : processCampaignStartInternal teste « if campaign then stop() » avec des globales non définies dans ce fichier ; seul un échec de validation (inatteignable car validate retourne toujours true) ferait retourner nil.
- splitFieldByToken construit le motif "([^"..token..".]+)" : le point est toujours exclu en plus du jeton donné.
- start attend la fin du niveau courant (scenetree.MissionGroup) avant de lancer la campagne, via endActiveGameMode et triggerDelayedStartGenerator.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `campaign_campaignsLoader.checkSaveExists(title, savesEnabled)` | Retourne le nom du fichier de sauvegarde correspondant à un titre de campagne, ou nil. | 308 |
| `campaign_campaignsLoader.getCampaignFilenames()` | Liste les fichiers JSON de /campaigns/ (1 niveau) dont header.type == 'campaign'. Retourne {} si le dossier n'existe pas. | 45 |
| `campaign_campaignsLoader.getCampaignScenarios()` | Retourne la liste mise en cache scenariosInAllCampaigns (vide dans ce fichier : jamais remplie ici ; generateCampaignScenariosList existe mais n'est pas appelée). | 85 |
| `campaign_campaignsLoader.getList()` | Charge toutes les campagnes trouvées avec loadCampaign et les retourne ; coopère avec util_asyncBulkLoader si un chargement groupé est en cours. | 61 |
| `campaign_campaignsLoader.loadCampaign(campaignfile)` | Lit le JSON d'une campagne et ajoute sourceFile, sourcePath, official, modID/modName/modTitle (valeurs « BeamNG » / « BeamNG.drive » si ce n'est pas un mod) et previews (image .jpg du dossier de la campagne). | 12 |
| `campaign_campaignsLoader.resumeSavedCampaign(campaign, saveFilename)` | Relit un fichier de sauvegarde, rappelle onResumeCampaign de chaque module concerné, puis campaign_campaigns.resumeCampaign. | 364 |
| `campaign_campaignsLoader.saveCampaign(campaign)` | Sauvegarde l'état de la campagne (voir notes) dans /saves/campaigns/ ; réutilise le fichier existant du même titre, sinon prend le prochain « slotN.json ». | 346 |
| `campaign_campaignsLoader.splitFieldByToken(field, token)` | Découpe une chaîne par un caractère jeton (en excluant aussi le point) et retourne les morceaux. | 134 |
| `campaign_campaignsLoader.start(newCampaign, endCallback)` | Démarre une campagne choisie dans l'interface. Si un niveau est chargé, attend sa fermeture ; sinon décharge les extensions automatiques, charge celles du scénario, du quick race et de la campagne, prépare la campagne, puis reprend une sauvegarde existante ou appelle campaign_campaigns.startCampaign. | 249 |
| `campaign_campaignsLoader.startByFolder(path, endCallback)` | Cherche la campagne dont sourcePath est path et la démarre. | 279 |

### Détail des paramètres

#### `campaign_campaignsLoader.checkSaveExists(title, savesEnabled)`

Retourne le nom du fichier de sauvegarde correspondant à un titre de campagne, ou nil.

- `title` (*string*) : Titre de la campagne.
- `savesEnabled` (*boolean*) : Si faux, retourne nil sans rien chercher.
- **renvoie** : string|nil Chemin de la sauvegarde.

#### `campaign_campaignsLoader.getCampaignFilenames()`

Liste les fichiers JSON de /campaigns/ (1 niveau) dont header.type == 'campaign'. Retourne {} si le dossier n'existe pas.

- **renvoie** : string[] Chemins des fichiers de campagne.

#### `campaign_campaignsLoader.getCampaignScenarios()`

Retourne la liste mise en cache scenariosInAllCampaigns (vide dans ce fichier : jamais remplie ici ; generateCampaignScenariosList existe mais n'est pas appelée).

- **renvoie** : string[] Chemins de scénarios.

#### `campaign_campaignsLoader.getList()`

Charge toutes les campagnes trouvées avec loadCampaign et les retourne ; coopère avec util_asyncBulkLoader si un chargement groupé est en cours.

- **renvoie** : table[] Liste des campagnes.

#### `campaign_campaignsLoader.loadCampaign(campaignfile)`

Lit le JSON d'une campagne et ajoute sourceFile, sourcePath, official, modID/modName/modTitle (valeurs « BeamNG » / « BeamNG.drive » si ce n'est pas un mod) et previews (image .jpg du dossier de la campagne).

- `campaignfile` (*string*) : Chemin du fichier JSON de la campagne.
- **renvoie** : table Données de la campagne enrichies.

#### `campaign_campaignsLoader.resumeSavedCampaign(campaign, saveFilename)`

Relit un fichier de sauvegarde, rappelle onResumeCampaign de chaque module concerné, puis campaign_campaigns.resumeCampaign.

- `campaign` (*table*) : Campagne traitée à reprendre.
- `saveFilename` (*string*) : Chemin du fichier de sauvegarde.

#### `campaign_campaignsLoader.saveCampaign(campaign)`

Sauvegarde l'état de la campagne (voir notes) dans /saves/campaigns/ ; réutilise le fichier existant du même titre, sinon prend le prochain « slotN.json ».

- `campaign` (*table*) : Campagne traitée ({meta, state}) ; meta.enableSaves et meta.title sont lus.

#### `campaign_campaignsLoader.splitFieldByToken(field, token)`

Découpe une chaîne par un caractère jeton (en excluant aussi le point) et retourne les morceaux.

- `field` (*string*) : Chaîne à découper.
- `token` (*string*) : Jeton de séparation.
- **renvoie** : string[] Morceaux.

#### `campaign_campaignsLoader.start(newCampaign, endCallback)`

Démarre une campagne choisie dans l'interface. Si un niveau est chargé, attend sa fermeture ; sinon décharge les extensions automatiques, charge celles du scénario, du quick race et de la campagne, prépare la campagne, puis reprend une sauvegarde existante ou appelle campaign_campaigns.startCampaign.

- `newCampaign` (*table*) : Campagne (issue de loadCampaign).
- `endCallback` (*function|nil*) : Mémorisée comme endCampaignCallback.

#### `campaign_campaignsLoader.startByFolder(path, endCallback)`

Cherche la campagne dont sourcePath est path et la démarre.

- `path` (*string*) : Dossier source de la campagne.
- `endCallback` (*function|nil*) : Callback de fin.

## Champs

| Champ | Type | Description |
|---|---|---|
| `campaignModules` | string[] | Modules d'extension chargés pour une campagne. |
| `onInit` | nil | Toujours nil : référence à une variable non définie dans le fichier. ⚠ référence `onInit` non définie dans le fichier (vaut probablement nil) |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onSaveCampaign` — écouté par 5 module(s)

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/campaign/campaignsLoader.lua`.*
