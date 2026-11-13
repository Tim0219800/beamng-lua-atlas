---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/core.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Noyau de la télémétrie de BeamNG (extension GE telemetry_core, dépend de telemetry_configManager). Il décide si la télémétrie est active (consentement dans les réglages, arguments de lancement, config serveur), tamponne les événements envoyés par les trackers (addEvent), les écrit en JSON Lines dans /telemetry/sessions/<id>.jsonl, charge automatiquement les trackers du dossier telemetry/trackers/ activés par la config et le reporter jsonFileReporter qui envoie les sessions des exécutions précédentes. Un moddeur n'a normalement pas à l'appeler ; il peut seulement observer le hook onTelemetryEventAdded.
--- Accès : extension `telemetry_core` : `extensions.load("telemetry_core")`, puis la globale `telemetry_core`
---@class telemetry_core
---@field dependencies string[] {'telemetry_configManager'} : déclarée mais non appelée à la demande, pour que les trackers ne démarrent pas avant l'initialisation de la config.
telemetry_core = {}

--- Ajoute un événement au tampon de la session. L'événement doit être une table avec un champ name (chaîne non vide). Lui ajoute t = os.clockhp(), appelle le hook onTelemetryEventAdded(event), l'encode en JSON sur une ligne et vide le tampon sur disque tous les 100 événements.
---Source : lua/ge/extensions/telemetry/core.lua:75
---@param event table Événement : name obligatoire, autres champs libres, t interdit.
---@return boolean  true si l'événement a été stocké, false s'il a été refusé (télémétrie inactive, table invalide, name manquant).
function telemetry_core.addEvent(event) end

--- Ajoute l'événement {name = activityName, type = 'end'} fusionné avec data.
---Source : lua/ge/extensions/telemetry/core.lua:479
---@param activityName string Nom de l'activité commencée.
---@param data table|nil Champs supplémentaires de l'événement.
function telemetry_core.endActivity(activityName, data) end

--- Dossier des données de télémétrie : '/telemetry/local/' en mode -telemetryLocal (sessions et sondages séparés, jamais envoyés par le reporter d'une exécution normale), sinon '/telemetry/'.
---Source : lua/ge/extensions/telemetry/core.lua:30
---@return string  Chemin du dossier.
function telemetry_core.getDataFolder() end

--- Liste des exécutions de télémétrie (runIds de la config serveur) pour lesquelles la session collecte. Fixée avant le chargement des trackers.
---Source : lua/ge/extensions/telemetry/core.lua:457
---@return string[]|nil  Identifiants de run.
function telemetry_core.getRunIds() end

--- Temps écoulé en secondes (os.clockhp()), utilisé par les trackers pour mesurer des durées.
---Source : lua/ge/extensions/telemetry/core.lua:452
---@return number  Secondes.
function telemetry_core.getRunTime() end

--- Fichier .jsonl de la session en cours. Le reporter ne doit ni l'envoyer ni le supprimer.
---Source : lua/ge/extensions/telemetry/core.lua:40
---@return string|nil  Chemin, ou nil si aucune session.
function telemetry_core.getSessionFile() end

--- Identifiant de la session : horodatage plus octets aléatoires, sans lien avec le jeton de compte ni une identité. Sert à reconnaître un renvoi en double après une réponse perdue.
---Source : lua/ge/extensions/telemetry/core.lua:47
---@return string|nil  Identifiant de session.
function telemetry_core.getSessionId() end

--- Renvoie false pour les plateformes 'ps5' et 'ps5pro', true sinon.
---Source : lua/ge/extensions/telemetry/core.lua:123
---@param platform string Valeur de Engine.Platform.getPlatform() ('' sur PC).
---@return boolean  true si la télémétrie peut tourner.
function telemetry_core.isPlatformSupported(platform) end

--- Indique si la session actuelle reprend celle d'avant un rechargement Lua.
---Source : lua/ge/extensions/telemetry/core.lua:461
---@return boolean  true si la session est reprise.
function telemetry_core.isSessionContinued() end

--- Hook appelé à la fermeture du jeu ; même fonction que onExtensionUnloaded.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/core.lua:436
function telemetry_core.onExit() end

--- Hook de chargement : met le mode de déchargement en manuel, active la télémétrie si shouldTelemetryBeActive() ; sinon clôt la session précédente et reste en mode sans effet.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/core.lua:403
---@param previousSession table|nil Données renvoyées par onSerialize avant un rechargement Lua (sessionId, runIds).
---@return boolean  Toujours true (reste chargée).
function telemetry_core.onExtensionLoaded(previousSession) end

--- Hook de déchargement : désactive la télémétrie (écrit les événements restants, décharge trackers et reporter) et coupe le polling de la config.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/core.lua:436
function telemetry_core.onExtensionUnloaded() end

--- Hook de sérialisation : lors d'un rechargement Lua (reason == 'reload') avec une session valide, renvoie {sessionId, runIds} pour reprendre la session ensuite.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/core.lua:443
---@param reason string Motif de la sérialisation ('reload'…).
---@return table|nil  Données de reprise.
function telemetry_core.onSerialize(reason) end

--- Hook appelé quand les réglages changent : active ou désactive la télémétrie selon le consentement, et coupe le polling de config si elle est inactive.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/core.lua:421
function telemetry_core.onSettingsChanged() end

--- Ajoute l'événement {name = activityName, type = 'start'} fusionné avec data, pour mesurer une durée avec endActivity.
---Source : lua/ge/extensions/telemetry/core.lua:473
---@param activityName string Nom de l'activité.
---@param data table|nil Champs supplémentaires de l'événement.
function telemetry_core.startActivity(activityName, data) end

--- Écrit immédiatement les événements en tampon dans le fichier de session, pour qu'ils survivent à un plantage.
---Source : lua/ge/extensions/telemetry/core.lua:466
function telemetry_core.triggerReportWrite() end

