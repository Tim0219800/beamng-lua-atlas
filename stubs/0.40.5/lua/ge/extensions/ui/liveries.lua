---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/liveries.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Orchestrateur de l'éditeur de livrées (peinture/décalcomanies) de l'UI. Il s'appuie sur l'API d'éditeur `editor_api_dynamicDecals` : à l'ouverture il mémorise le skin actuel du véhicule joueur, active le skin `dynamicTextures`, prépare la pile de calques (livrée vierge à la couleur du véhicule ou sauvegarde existante) et démarre la caméra. À la fermeture il restaure le skin d'origine.
--- Accès : extension `ui_liveries` : `extensions.load("ui_liveries")`, puis la globale `ui_liveries`
---@class ui_liveries
---@field dependencies table<integer, string> editor_api_dynamicDecals, ui_liveries_camera, ui_liveries_fill, ui_liveries_saves.
ui_liveries = {}

--- Indique si l'éditeur de livrées est actif.
---Source : lua/ge/extensions/ui/liveries.lua:115
---@return boolean  true entre setup et teardown.
function ui_liveries.isRunning() end

--- Hook appelé à chaque image par le système d'extensions ; appelle api.onUpdate_() tant que l'éditeur tourne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/liveries.lua:107
---@param dtReal number Delta temps réel (s).
---@param dtSim number Delta temps simulé (s).
---@param dtRaw number Delta temps brut (s).
function ui_liveries.onUpdate(dtReal, dtSim, dtRaw) end

--- Démarre l'éditeur de livrées sur le véhicule joueur (skin dynamicTextures, calques, historique vidé, caméra).
---Source : lua/ge/extensions/ui/liveries.lua:60
---@param saveName string|nil Nom d'une sauvegarde à charger ; nil = livrée vierge à la couleur du véhicule.
---@return boolean  true si la pile de calques a été initialisée correctement.
function ui_liveries.setup(saveName) end

--- Arrête l'éditeur : caméra, désactivation de l'API, restauration du skin précédent et nettoyage du fill. Sans effet si non démarré.
---Source : lua/ge/extensions/ui/liveries.lua:90
---@return nil
function ui_liveries.teardown() end

