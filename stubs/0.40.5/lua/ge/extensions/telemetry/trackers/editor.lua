---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/trackers/editor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Suiveur de télémétrie de l'éditeur de monde : mesure la durée d'ouverture de l'éditeur (activité « editorActive ») et enregistre les fenêtres d'outils ouvertes (évènement « editorToolWindowOpened » avec nom d'outil et point d'entrée). Seuls les noms d'outils sont rapportés, jamais les chemins de niveaux ou d'assets. Le constructeur de pistes est suivi par un autre suiveur de gameplay.
--- Accès : extension `telemetry_trackers_editor` : `extensions.load("telemetry_trackers_editor")`, puis la globale `telemetry_trackers_editor`
---@class telemetry_trackers_editor
---@field dependencies string[] telemetry_core.
telemetry_trackers_editor = {}

--- Hook appelé à l'activation de l'éditeur : démarre l'activité editorActive (sans effet si déjà ouverte).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/editor.lua:19
function telemetry_trackers_editor.onEditorActivated() end

--- Hook appelé à la fermeture de l'éditeur : termine l'activité editorActive.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/editor.lua:25
function telemetry_trackers_editor.onEditorDeactivated() end

--- Hook appelé à l'ouverture d'une fenêtre d'outil : enregistre l'évènement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/editor.lua:31
---@param toolName string Nom de l'outil.
---@param entryPoint string Point d'entrée (menu, raccourci, etc., déduit du code).
function telemetry_trackers_editor.onEditorToolWindowOpened(toolName, entryPoint) end

--- Hook appelé à la fermeture du jeu : ferme l'activité éditeur ouverte.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/editor.lua:45
function telemetry_trackers_editor.onExit() end

--- Hook appelé au chargement : déchargement manuel, et démarre l'activité si l'éditeur est déjà actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/editor.lua:39
function telemetry_trackers_editor.onExtensionLoaded() end

--- Hook appelé au déchargement : ferme l'activité éditeur ouverte (même fonction que onExit).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/telemetry/trackers/editor.lua:45
function telemetry_trackers_editor.onExtensionUnloaded() end

