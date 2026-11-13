---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Moteur d'exécution du « Thumbnail Composer » (v2) : orchestre une série de captures de vignettes de véhicules pour une interface appelante (identifiée par ownerId) qui reçoit des évènements via une table de handlers. Il valide les cibles (thumbnailTargets), filtre éventuellement celles qui ont déjà une vignette (missingOnly), prend le contrôle de la physique, applique pour la durée du travail des réglages graphiques de référence (qualité Ultra, SMAA, pas de flou de mouvement, pas d'occupants…), puis traite chaque élément dans une coroutine (thumbnailCapturePipeline.processWorkItem). Il gère aussi un aperçu de la caméra, un flou d'arrière-plan par profondeur de champ calé sur le mur du fond du showroom, une exposition forcée, et le panneau ImGui « Showroom Tools » (drawShowroomTools) du graphe de flux showroom_thumbnails.
--- Accès : extension `util_screenshotCreator_thumbnailComposerRun` : `extensions.load("util_screenshotCreator_thumbnailComposerRun")`, puis la globale `util_screenshotCreator_thumbnailComposerRun`
---@class util_screenshotCreator_thumbnailComposerRun
---@field dependencies string[] Extensions chargées avant : ui_imgui et util_screenshotCreator_settings, lightingSetup, thumbnailCapturePipeline, thumbnailConfig, thumbnailPaths, thumbnailTargets.
---@field onClientEndMission function Alias de onExtensionUnloaded : nettoie à la fin du niveau.
---@field onExit function Alias de onExtensionUnloaded : nettoie à la fermeture du jeu.
util_screenshotCreator_thumbnailComposerRun = {}

--- Annule le travail en cours (émet Failed avec cancelled = true). Si ownerId est donné, il doit correspondre à l'appelant du travail.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:385
---@param ownerId string|nil Identifiant de l'appelant.
---@return boolean  true si un travail a été annulé.
function util_screenshotCreator_thumbnailComposerRun.cancel(ownerId) end

--- Dessine dans la fenêtre ImGui du graphe de flux le panneau des outils vignettes : options de flou et d'exposition, résolution, grille de sélection des véhicules, boutons « Capture current config », « Capture all configs » et « Capture missing thumbnails », barre de progression et bouton Cancel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:542
function util_screenshotCreator_thumbnailComposerRun.drawShowroomTools() end

--- Indique si un travail est en cours (pour cet ownerId si précisé).
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:392
---@param ownerId string|nil Identifiant de l'appelant.
---@return boolean  true si actif.
function util_screenshotCreator_thumbnailComposerRun.isActive(ownerId) end

--- Hook de déchargement : arrête le travail, restaure l'exposition, le flou, les réglages graphiques, l'environnement et la physique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:415
function util_screenshotCreator_thumbnailComposerRun.onExtensionUnloaded() end

--- Hook appelé à chaque frame avant le rendu : fait avancer la coroutine de travail (une erreur la fait échouer) et met à jour le flou DOF et l'exposition forcée pendant un aperçu ou un travail.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:397
function util_screenshotCreator_thumbnailComposerRun.onPreRender() end

--- Émet l'évènement Status : {active, runId, currentModel, currentConfig, currentFlipped} (currentFlipped = rotation de vignette de 180°).
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:311
---@param ownerId string Identifiant de l'appelant.
---@param handlers table Handlers avec emit.
function util_screenshotCreator_thumbnailComposerRun.sendStatus(ownerId, handlers) end

--- Fixe les options de vue (flou d'arrière-plan, distance de début du flou, exposition forcée) à partir d'un message.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:85
---@param message table {backgroundBlur, blurStartDistance, forceExposure, exposureEV}.
function util_screenshotCreator_thumbnailComposerRun.setViewOptions(message) end

--- Démarre un travail de capture pour l'appelant ownerId. Résout les cibles, applique les réglages de capture et lance la coroutine de travail. Renvoie false (et émet « Failed ») en cas de refus.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:335
---@param ownerId string Identifiant de l'appelant (converti en chaîne).
---@param message table Options : targets, captureMode, missingOnly, outputWidth, outputHeight, backgroundBlur, blurStartDistance, forceExposure, exposureEV.
---@param handlers table {emit = function(ownerId, nom, données)} qui reçoit les évènements.
---@return boolean  true si le travail a démarré.
function util_screenshotCreator_thumbnailComposerRun.start(ownerId, message, handlers) end

--- Aperçu : place la caméra libre du joueur sur le cadrage calculé pour le véhicule du joueur (cadrage legacy du pipeline) et ajuste l'éclairage. Ne fait rien s'il n'y a pas de véhicule ou si un travail est actif.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:159
---@param message table Options de vue et outputWidth/outputHeight.
function util_screenshotCreator_thumbnailComposerRun.startPreview(message) end

--- Termine l'aperçu : restaure l'état de caméra mémorisé et l'éclairage.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:152
function util_screenshotCreator_thumbnailComposerRun.stopPreview() end

--- Enregistre un appelant : émet Status puis Catalog {models = catalogue des véhicules, resolutions = préréglages de résolution}.
---Source : lua/ge/extensions/util/screenshotCreator/thumbnailComposerRun.lua:324
---@param ownerId string Identifiant de l'appelant.
---@param handlers table Handlers avec emit.
function util_screenshotCreator_thumbnailComposerRun.subscribe(ownerId, handlers) end

