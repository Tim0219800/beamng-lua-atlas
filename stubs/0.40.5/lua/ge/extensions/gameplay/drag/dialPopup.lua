---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drag/dialPopup.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre ImGui « Drag - Set Dial » pour le bracket racing : le joueur local saisit son dial (temps annoncé, en secondes) dans un champ décimal, de 0 à 999 (10 par défaut, ou la valeur mémorisée dans le carnet de dial du véhicule). À la confirmation, en solo le callback applique le dial ; en multijoueur la valeur est envoyée à l'hôte via drag.updateTimerValue(raceId, vehId, 'dial', val). Ne s'affiche que si la piste est de type bracketRace.
--- Accès : extension `gameplay_drag_dialPopup` : `extensions.load("gameplay_drag_dialPopup")`, puis la globale `gameplay_drag_dialPopup`
---@class gameplay_drag_dialPopup
---@field dependencies string[] gameplay_drag_core, gameplay_drag_saveSystem, ui_imgui.
gameplay_drag_dialPopup = {}

--- Ouvre la fenêtre de saisie du dial pour un véhicule. Pré-remplit avec le dial mémorisé (clé importantTimerId, sinon time_1_4) ou 10.
---Source : lua/ge/extensions/gameplay/drag/dialPopup.lua:59
---@param vehId integer ID du véhicule du joueur (ignoré si nil ou -1).
---@param callback function|nil Appelé avec la valeur confirmée (number) après validation.
function gameplay_drag_dialPopup.requestDial(vehId, callback) end

--- Dessine la fenêtre si elle est ouverte (une seule fois par frame). Prévu pour être appelé manuellement chaque frame, pas comme hook d'extension.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drag/dialPopup.lua:173
---@param dtReal number Delta temps réel (s), non utilisé.
---@param dtSim number Delta temps simulé (s), non utilisé.
---@param dtRaw number Delta brut (s), non utilisé.
function gameplay_drag_dialPopup.tick(dtReal, dtSim, dtRaw) end

