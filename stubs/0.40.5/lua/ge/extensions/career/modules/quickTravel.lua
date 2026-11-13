---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/quickTravel.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Voyage rapide payant en carrière : calcule un prix selon la distance de route entre le joueur et une destination, puis téléporte le joueur (en mode marche) et le débite. Sert à rejoindre un garage.
--- Accès : extension `career_modules_quickTravel` : `extensions.load("career_modules_quickTravel")`, puis la globale `career_modules_quickTravel`
---@class career_modules_quickTravel
---@field dependencies table<integer, string> Extensions chargées avant : career_career.
career_modules_quickTravel = {}

--- Calcule le prix et la distance de route jusqu'à pos.
---Source : lua/ge/extensions/career/modules/quickTravel.lua:19
---@param pos vec3 Destination.
---@return number  Prix en argent.
---@return number  Distance de route en mètres.
function career_modules_quickTravel.getPriceForQuickTravel(pos) end

--- Prix du voyage jusqu'à la position du garage donnée par freeroam_facilities.getGaragePosRot.
---Source : lua/ge/extensions/career/modules/quickTravel.lua:54
---@param garage table Garage.
---@return number  Prix.
---@return number  Distance en mètres.
function career_modules_quickTravel.getPriceForQuickTravelToGarage(garage) end

--- Voyage rapide vers le premier emplacement de stationnement du garage (en mode marche, libellé quickTravelGarageTaxi).
---Source : lua/ge/extensions/career/modules/quickTravel.lua:45
---@param garagePoi table POI du garage (champ id).
function career_modules_quickTravel.quickTravelToGarage(garagePoi) end

--- Si le joueur peut payer, active le mode marche, téléporte le véhicule en sécurité vers pos et oriente le joueur vers pos, puis débite le prix (tags quickTravel, buying).
---Source : lua/ge/extensions/career/modules/quickTravel.lua:33
---@param pos vec3 Destination.
---@param useWalkingMode boolean|nil Si vrai, effectue la téléportation en mode marche.
---@param reasonString string|nil Clé de traduction du libellé, ui.career.attributeLog.quickTravelPaid par défaut.
function career_modules_quickTravel.quickTravelToPos(pos, useWalkingMode, reasonString) end

