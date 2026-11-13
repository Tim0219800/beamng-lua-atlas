---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/cameraModes/path.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Mode chemin. Champs : ctrlPoint, camT (temps courant en s), customData, path, pathName, fovOffset.
---@class core_cameraModes_path
local core_cameraModes_path = {}

--- Temps absolu du marqueur index depuis le début du chemin.
---Source : lua/ge/extensions/core/cameraModes/path.lua:174
---@param path table chemin
---@param index integer indice du marqueur
---@param looped boolean|nil chemin bouclé (le marqueur 1 vaut alors le temps du dernier + durée de boucle, mode JSON)
---@return number  secondes
function core_cameraModes_path:getGlobalTime(path, index, looped) end

--- Durée entre le marqueur index et le suivant (dernier marqueur : durée de boucle ou 2 s en mode JSON).
---Source : lua/ge/extensions/core/cameraModes/path.lua:165
---@param path table chemin
---@param index integer indice du marqueur
---@return number  secondes
function core_cameraModes_path:getTimeToNext(path, index) end

--- isGlobal = true, hidden = true, état initial.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/path.lua:16
function core_cameraModes_path:init() end

--- Remet temps, point de contrôle, décalage FOV et noms de chemin à zéro (appelle customData:reset s'il existe).
---Source : lua/ge/extensions/core/cameraModes/path.lua:560
function core_cameraModes_path:reset() end

--- Réinitialise le mode et fixe les données du parcours ; temps de départ = customData.offset. Si le chemin a un replay, le charge (ou l'ignore s'il n'existe pas).
---Source : lua/ge/extensions/core/cameraModes/path.lua:545
---@param data table customData : getNextPath, path, offset, useJsonVersion, useDtReal, onNextControlPoint, finishedPath, reset
function core_cameraModes_path:setCustomData(data) end

--- Avance le temps, interpole la caméra et écrit data.res (pos, rot, fov, nearClip), appelle les callbacks de customData et gère la fin/boucle du chemin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/cameraModes/path.lua:221
---@param data table camData
---@return boolean|nil  true ; nil si pas de chemin valide
function core_cameraModes_path:update(data) end

