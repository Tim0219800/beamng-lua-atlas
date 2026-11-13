---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/tirePressureControl.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur auxiliaire de gonflage/dégonflage centralisé des pneus (CTIS, véhicules tout-terrain/militaires). Les roues sont regroupées en « groupes » (essieux, côtés…) ; le conducteur active/désactive des groupes, puis lance gonflage, dégonflage ou arrêt pour tous les groupes actifs. Le contrôleur modifie directement la pression des groupes de pression des roues (obj:setGroupPressure), égalise les pressions dans un groupe et publie la pression moyenne des groupes actifs et l'état actif de chaque groupe dans electrics. Enregistre un menu radial « Contrôle de pression des pneus ».
--- Accès : contrôleur `tirePressureControl` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_tirePressureControl
---@field type string "auxiliary".
local controller_tirePressureControl = {}

--- État sauvegardable : variation de pression active, état actif de chaque groupe et pression de chaque roue (clés préfixées par le nom du contrôleur).
---Source : lua/vehicle/controller/tirePressureControl.lua:126
---@return table  Table d'état.
function controller_tirePressureControl.getState() end

--- Ne fait rien (voir initSecondStage).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/tirePressureControl.lua:280
---@param jbeamData table Données jbeam.
function controller_tirePressureControl.init(jbeamData) end

--- Construit les groupes de roues, lit débits et limites de pression et enregistre le menu radial. Appelé après l'init des autres contrôleurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/tirePressureControl.lua:283
---@param jbeamData table Données jbeam.
function controller_tirePressureControl.initSecondStage(jbeamData) end

--- Désactive tous les groupes, arrête les changements de pression et remet le lisseur de l'electric à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/tirePressureControl.lua:265
---@param jbeamData table Données jbeam.
function controller_tirePressureControl.reset(jbeamData) end

--- Active ou désactive un groupe de roues et affiche un message. Un nom de groupe inconnu logue une erreur et ne fait rien.
---Source : lua/vehicle/controller/tirePressureControl.lua:84
---@param groupName string Nom du groupe (jbeam groupName).
---@param state boolean Actif ?
function controller_tirePressureControl.setGroupState(groupName, state) end

--- Restaure activations, variation de pression et pressions des roues (bornées entre pression ambiante et maxPressure, roues cassées ignorées).
---Source : lua/vehicle/controller/tirePressureControl.lua:148
---@param data table|nil Table produite par getState.
function controller_tirePressureControl.setState(data) end

--- Lance le dégonflage (variation = -deflateMaxFlow par seconde) des groupes actifs et affiche un message.
---Source : lua/vehicle/controller/tirePressureControl.lua:116
function controller_tirePressureControl.startDeflateActiveGroups() end

--- Lance le gonflage (variation = +inflateMaxFlow par seconde) des groupes actifs et affiche un message.
---Source : lua/vehicle/controller/tirePressureControl.lua:111
function controller_tirePressureControl.startInflateActiveGroups() end

--- Arrête le gonflage/dégonflage en cours et affiche un message.
---Source : lua/vehicle/controller/tirePressureControl.lua:121
function controller_tirePressureControl.stopActiveGroups() end

--- Bascule l'activation d'un groupe de roues.
---Source : lua/vehicle/controller/tirePressureControl.lua:103
---@param groupName string Nom du groupe.
function controller_tirePressureControl.toggleGroupState(groupName) end

--- Chaque frame : lit les pressions, égalise entre roues d'un groupe, applique gonflage/dégonflage aux groupes actifs et publie les electrics.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/tirePressureControl.lua:28
---@param dt number Pas de temps en secondes.
function controller_tirePressureControl.updateGFX(dt) end

return controller_tirePressureControl
