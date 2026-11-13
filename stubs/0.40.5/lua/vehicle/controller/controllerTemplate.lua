---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/controllerTemplate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Modèle de départ pour écrire un contrôleur de véhicule. Un contrôleur est un module Lua placé dans lua/vehicle/controller/, déclaré dans le jbeam (section `controller` avec `fileName`, et éventuellement `name`) et chargé par `controller.lua`. Cycle de vie : `init(jbeamData)` à la création (jbeamData = déclaration fusionnée avec les données jbeam portant le nom du contrôleur), puis `initSecondStage`, `initSounds`, `initLastStage` (facultatifs) une fois les autres systèmes prêts ; au reset, `reset(jbeamData)` (ou, s'il est absent, `init` rappelé) ainsi que `resetLastStage` et `resetSounds`. En fonctionnement : `update(dt)` à chaque pas physique, `updateWheelsIntermediate(dt)`, `updateFixedStep(dt)` à pas fixe de 100 Hz, `updateGFX(dt)` à chaque frame graphique. Seules les fonctions réellement exportées dans M sont appelées. Autres hooks facultatifs : debugDraw, beamBroken, beamDeformed, nodeCollision, onCouplerFound/Attached/Detached, onGameplayEvent, settingsChanged, serialize/deserialize.
--- Accès : contrôleur `controllerTemplate` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_controllerTemplate
---@field type string "auxiliary" dans le modèle (contrôleur annexe). "main" pour le contrôleur principal du véhicule.
local controller_controllerTemplate = {}

--- Appelée par controller.lua à la création du contrôleur (et au reset si `reset` n'existe pas). Corps vide dans le modèle ; c'est ici qu'on lit les clés jbeam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/controllerTemplate.lua:64
---@param jbeamData table Données jbeam du contrôleur (fileName, name, clés personnalisées…).
function controller_controllerTemplate.init(jbeamData) end

--- Appelée au reset du véhicule (étape resetSecondStage de controller.lua). Corps vide dans le modèle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/controllerTemplate.lua:55
---@param jbeamData table Mêmes données jbeam que pour init.
function controller_controllerTemplate.reset(jbeamData) end

--- Appelée à chaque frame graphique. Corps vide dans le modèle. Les variantes `update` (pas physique), `updateWheelsIntermediate` et `updateFixedStep` (100 Hz) sont fournies en commentaire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/controllerTemplate.lua:22
---@param dt number Durée du pas en secondes.
function controller_controllerTemplate.updateGFX(dt) end

return controller_controllerTemplate
