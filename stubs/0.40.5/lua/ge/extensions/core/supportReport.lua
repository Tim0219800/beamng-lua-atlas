---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/supportReport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Envoi d'un rapport de support au serveur BeamNG depuis l'UI. send déclenche Engine.SupportReport.send ; le moteur rappelle onSupportReportSent avec l'identifiant de support (ou une erreur). L'identifiant est gardé 15 minutes dans settings/lastSupportReport.json puis oublié. L'état est publié à l'UI par guihooks 'SupportReportState'.
--- Accès : extension `core_supportReport` : `extensions.load("core_supportReport")`, puis la globale `core_supportReport`
---@class core_supportReport
core_supportReport = {}

--- Hook de chargement : relit le dernier rapport sauvegardé et oublie celui qui a expiré.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/supportReport.lua:60
function core_supportReport.onExtensionLoaded() end

--- Callback du moteur quand l'envoi se termine. Si supportId n'est pas vide, le mémorise (fichier JSON) ; sinon mémorise l'erreur et l'indicateur outdated. Republie l'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/supportReport.lua:48
---@param supportId string Identifiant de support, '' en cas d'échec.
---@param err string Message d'erreur en cas d'échec.
---@param outdated boolean Vrai si le jeu est trop ancien pour envoyer un rapport (déduit du code).
function core_supportReport.onSupportReportSent(supportId, err, outdated) end

--- Oublie le rapport expiré (supprime le fichier) puis envoie l'état courant à l'UI (guihooks SupportReportState).
---Source : lua/ge/extensions/core/supportReport.lua:28
function core_supportReport.requestState() end

--- Lance l'envoi du rapport (Engine.SupportReport.send) s'il n'y en a pas déjà un en cours, puis publie l'état.
---Source : lua/ge/extensions/core/supportReport.lua:39
function core_supportReport.send() end

