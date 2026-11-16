# `util_screenshotCreator_thumbnailComposerRun`

*Fichier : `lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua` · VM : Game Engine (GE) · 569 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_thumbnailComposerRun` : `extensions.load("util_screenshotCreator_thumbnailComposerRun")`, puis la globale `util_screenshotCreator_thumbnailComposerRun`

Moteur d'exécution du « Thumbnail Composer » (v2) : orchestre une série de captures de vignettes de véhicules pour une interface appelante (identifiée par ownerId) qui reçoit des évènements via une table de handlers. Il valide les cibles (thumbnailTargets), filtre éventuellement celles qui ont déjà une vignette (missingOnly), prend le contrôle de la physique, applique pour la durée du travail des réglages graphiques de référence (qualité Ultra, SMAA, pas de flou de mouvement, pas d'occupants…), puis traite chaque élément dans une coroutine (thumbnailCapturePipeline.processWorkItem). Il gère aussi un aperçu de la caméra, un flou d'arrière-plan par profondeur de champ calé sur le mur du fond du showroom, une exposition forcée, et le panneau ImGui « Showroom Tools » (drawShowroomTools) du graphe de flux showroom_thumbnails.

## Remarques

- Évènements émis vers handlers.emit(ownerId, nom, données) : Status, Catalog, Progress {runId, stage = "capture", completed, total, current}, ItemResult {runId, itemId, index, total, current, status...}, RunComplete {runId}, Failed {runId, error, cancelled}. Les erreurs de handler sont attrapées (pcall) et journalisées.
- Un seul travail à la fois : start renvoie false et émet Failed si une capture est déjà en cours, si les cibles sont invalides, si missingOnly ne laisse rien à faire ou si la physique ne peut pas être prise en charge.
- Options de message pour start : targets (liste {model, config} ; absent = config du véhicule du joueur), captureMode (« defaults » = default.jpg, sinon une vignette par config), missingOnly, outputWidth/outputHeight (16 à 8192, défaut 500x281), backgroundBlur (0 à 1), blurStartDistance (0,5 à 30 m, défaut 8), forceExposure, exposureEV (défaut 8,3).
- Les réglages graphiques d'origine sont sauvegardés (settings.getValue) et rétablis à la fin, à l'annulation ou au déchargement ; l'environnement du showroom est restauré via util_screenshotCreator_settings.
- Le flou d'arrière-plan lance un rayon (Engine.castRay) depuis la caméra pour trouver le mur et règle DOFPostEffect (focalDist, farSlope…) à chaque frame ; l'exposition utilise PostEffectLocalExposureObject. Ces deux effets ne sont actifs que pendant un aperçu ou un travail.
- Le premier échec d'un élément arrête tout le travail (failRun) ; l'annulation émet Failed avec cancelled = true.

**Dépendances (chargées avant) :** `ui_imgui`, `util_screenshotCreator_settings`, `util_screenshotCreator_lightingSetup`, `util_screenshotCreator_thumbnailCapturePipeline`, `util_screenshotCreator_thumbnailConfig`, `util_screenshotCreator_thumbnailPaths`, `util_screenshotCreator_thumbnailTargets`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_thumbnailComposerRun.cancel(ownerId)` | Annule le travail en cours (émet Failed avec cancelled = true). Si ownerId est donné, il doit correspondre à l'appelant du travail. | 385 |
| `util_screenshotCreator_thumbnailComposerRun.drawShowroomTools()` | Dessine dans la fenêtre ImGui du graphe de flux le panneau des outils vignettes : options de flou et d'exposition, résolution, grille de sélection des véhicules, boutons « Capture current config », « Capture all configs » et « Capture missing thumbnails », barre de progression et bouton Cancel. *(interne)* | 542 |
| `util_screenshotCreator_thumbnailComposerRun.isActive(ownerId)` | Indique si un travail est en cours (pour cet ownerId si précisé). | 392 |
| `util_screenshotCreator_thumbnailComposerRun.onExtensionUnloaded()` | Hook de déchargement : arrête le travail, restaure l'exposition, le flou, les réglages graphiques, l'environnement et la physique. *(interne)* *(hook)* | 415 |
| `util_screenshotCreator_thumbnailComposerRun.onPreRender()` | Hook appelé à chaque frame avant le rendu : fait avancer la coroutine de travail (une erreur la fait échouer) et met à jour le flou DOF et l'exposition forcée pendant un aperçu ou un travail. *(interne)* *(hook)* | 397 |
| `util_screenshotCreator_thumbnailComposerRun.sendStatus(ownerId, handlers)` | Émet l'évènement Status : {active, runId, currentModel, currentConfig, currentFlipped} (currentFlipped = rotation de vignette de 180°). | 311 |
| `util_screenshotCreator_thumbnailComposerRun.setViewOptions(message)` | Fixe les options de vue (flou d'arrière-plan, distance de début du flou, exposition forcée) à partir d'un message. | 85 |
| `util_screenshotCreator_thumbnailComposerRun.start(ownerId, message, handlers)` | Démarre un travail de capture pour l'appelant ownerId. Résout les cibles, applique les réglages de capture et lance la coroutine de travail. Renvoie false (et émet « Failed ») en cas de refus. | 335 |
| `util_screenshotCreator_thumbnailComposerRun.startPreview(message)` | Aperçu : place la caméra libre du joueur sur le cadrage calculé pour le véhicule du joueur (cadrage legacy du pipeline) et ajuste l'éclairage. Ne fait rien s'il n'y a pas de véhicule ou si un travail est actif. | 159 |
| `util_screenshotCreator_thumbnailComposerRun.stopPreview()` | Termine l'aperçu : restaure l'état de caméra mémorisé et l'éclairage. | 152 |
| `util_screenshotCreator_thumbnailComposerRun.subscribe(ownerId, handlers)` | Enregistre un appelant : émet Status puis Catalog {models = catalogue des véhicules, resolutions = préréglages de résolution}. | 324 |

### Détail des paramètres

#### `util_screenshotCreator_thumbnailComposerRun.cancel(ownerId)`

Annule le travail en cours (émet Failed avec cancelled = true). Si ownerId est donné, il doit correspondre à l'appelant du travail.

- `ownerId` (*string|nil*) : Identifiant de l'appelant.
- **renvoie** : boolean true si un travail a été annulé.

#### `util_screenshotCreator_thumbnailComposerRun.isActive(ownerId)`

Indique si un travail est en cours (pour cet ownerId si précisé).

- `ownerId` (*string|nil*) : Identifiant de l'appelant.
- **renvoie** : boolean true si actif.

#### `util_screenshotCreator_thumbnailComposerRun.sendStatus(ownerId, handlers)`

Émet l'évènement Status : {active, runId, currentModel, currentConfig, currentFlipped} (currentFlipped = rotation de vignette de 180°).

- `ownerId` (*string*) : Identifiant de l'appelant.
- `handlers` (*table*) : Handlers avec emit.

#### `util_screenshotCreator_thumbnailComposerRun.setViewOptions(message)`

Fixe les options de vue (flou d'arrière-plan, distance de début du flou, exposition forcée) à partir d'un message.

- `message` (*table*) : {backgroundBlur, blurStartDistance, forceExposure, exposureEV}.

#### `util_screenshotCreator_thumbnailComposerRun.start(ownerId, message, handlers)`

Démarre un travail de capture pour l'appelant ownerId. Résout les cibles, applique les réglages de capture et lance la coroutine de travail. Renvoie false (et émet « Failed ») en cas de refus.

- `ownerId` (*string*) : Identifiant de l'appelant (converti en chaîne).
- `message` (*table*) : Options : targets, captureMode, missingOnly, outputWidth, outputHeight, backgroundBlur, blurStartDistance, forceExposure, exposureEV.
- `handlers` (*table*) : {emit = function(ownerId, nom, données)} qui reçoit les évènements.
- **renvoie** : boolean true si le travail a démarré.

#### `util_screenshotCreator_thumbnailComposerRun.startPreview(message)`

Aperçu : place la caméra libre du joueur sur le cadrage calculé pour le véhicule du joueur (cadrage legacy du pipeline) et ajuste l'éclairage. Ne fait rien s'il n'y a pas de véhicule ou si un travail est actif.

- `message` (*table*) : Options de vue et outputWidth/outputHeight.

#### `util_screenshotCreator_thumbnailComposerRun.subscribe(ownerId, handlers)`

Enregistre un appelant : émet Status puis Catalog {models = catalogue des véhicules, resolutions = préréglages de résolution}.

- `ownerId` (*string*) : Identifiant de l'appelant.
- `handlers` (*table*) : Handlers avec emit.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | string[] | Extensions chargées avant : ui_imgui et util_screenshotCreator_settings, lightingSetup, thumbnailCapturePipeline, thumbnailConfig, thumbnailPaths, thumbnailTargets. |
| `onClientEndMission` | function | Alias de onExtensionUnloaded : nettoie à la fin du niveau. |
| `onExit` | function | Alias de onExtensionUnloaded : nettoie à la fermeture du jeu. |

## Appels vers le moteur (C++)

- `Engine.` `castRay`
- `be:` `getPhysicsRunning`, `getPhysicsSpeedFactor`, `setPhysicsRunning`, `setPhysicsSpeedFactor`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua`.*
