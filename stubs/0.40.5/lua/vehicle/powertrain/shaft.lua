---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/shaft.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `shaft` : un arbre de transmission avec rapport de réduction fixe, pertes par frottement et inertie cumulée. Il peut aussi être relié directement à une roue (clé jbeam `connectedWheel`), auquel cas il applique le couple de propulsion et le couple de frottement à la roue. Il peut être déconnecté (mode `disconnected`) ou cassé ; il accélère alors une masse virtuelle au lieu de la chaîne cinématique aval. Un moddeur l'utilise via le jbeam `powertrain` ; le module n'expose que `new`.
--- Accès : type de composant powertrain `shaft` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_shaft
---@field deviceCategories table<string, boolean> Catégories du composant : {shaft=true}. Sert aux recherches comme 'remonter jusqu'au différentiel parent'.
---@field outputPorts table<integer, boolean> Ports de sortie par défaut : {[1]=true}. Copié dans chaque device (remplacé si outputPortOverride).
local powertrain_shaft = {}

--- Construit un device shaft à partir d'une entrée jbeam. Lit gearRatio, frictions, connectedWheel, outputPortOverride, canDisconnect et breakTriggerBeam, choisit les noms de champs de sortie et sélectionne les fonctions de mise à jour.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/shaft.lua:277
---@param jbeamData table Données jbeam du composant (name, type, gearRatio, friction, connectedWheel…).
---@return table  Le device (classe `device`).
function powertrain_shaft.new(jbeamData) end

--- Objet renvoyé par new(jbeamData). Les méthodes sont posées sur l'instance ; velocityUpdate/torqueUpdate sont affectées dynamiquement.
---@class powertrain_shaft_device
local powertrain_shaft_device = {}

--- Augmente damageFrictionCoef proportionnellement aux dégâts reçus (0.01 de dégât = +0.1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/shaft.lua:88
---@param damageAmount number Quantité de dégâts du groupe de déformation.
function powertrain_shaft_device:applyDeformGroupDamage(damageAmount) end

--- Calcule cumulativeInertia, invCumulativeInertia, cumulativeGearRatio et maxCumulativeGearRatio. Prend l'inertie du premier enfant, ou l'inertie des nœuds de la roue autour de l'axe (somme masse * distance²), ou virtualInertia. Divisée par gearRatio². Appelée par le powertrain lors de l'init.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/shaft.lua:219
function powertrain_shaft_device:calculateInertia() end

--- Renvoie l'état de la pièce pour la sauvegarde : intégrité 0..1 (0 si cassé) et table {damageFrictionCoef, isBroken}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/shaft.lua:107
---@return number  Intégrité 0..1.
---@return table  {damageFrictionCoef, isBroken}.
function powertrain_shaft_device:getPartCondition() end

--- Défini seulement si le shaft a plusieurs modes. Renvoie la table stateData contenant la clé '<nom>Mode' = mode courant.
---Source : lua/vehicle/powertrain/shaft.lua:197
---@return table  stateData.
function powertrain_shaft_device:getState() end

--- Marque le shaft comme cassé (isBroken = true) et passe aux fonctions de mise à jour déconnectées. Appelée par le système de poutres cassées / setPartCondition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/shaft.lua:213
function powertrain_shaft_device:onBreak() end

--- Réinitialise l'état dynamique (inputAV, virtualMassAV, coefficients d'usure, isBroken, sorties à 0) et relit gearRatio et friction depuis jbeamData. Appelée au reset du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/shaft.lua:253
---@param jbeamData table Données jbeam du composant.
---@return table  Le device.
function powertrain_shaft_device:reset(jbeamData) end

--- Change le mode ('connected' ou 'disconnected') s'il figure dans availableModes. Ignoré sinon. Un shaft physiquement déconnecté reste 'disconnected'. Réselectionne les fonctions de mise à jour et met à jour le bouton UI.
---Source : lua/vehicle/powertrain/shaft.lua:178
---@param mode string 'connected' ou 'disconnected' (disponible seulement si canDisconnect).
function powertrain_shaft_device:setMode(mode) end

--- Applique l'état d'usure/dégâts d'une pièce : wearFrictionCoef selon l'odomètre, damageFrictionCoef selon l'intégrité. Si l'intégrité est une table avec isBroken, appelle onBreak.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/shaft.lua:92
---@param subSystem any Sous-système (non utilisé ici).
---@param odometer number Distance parcourue en mètres (échelle 30000 km à 1000000 km pour 1 à 1.5 de coefficient d'usure).
---@param integrity number|table Nombre 0..1, ou table {damageFrictionCoef, isBroken}.
---@param visual any Non utilisé.
function powertrain_shaft_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Défini seulement si le shaft a plusieurs modes. Restaure le mode depuis data['<nom>Mode'] si c'est une chaîne différente du mode actuel.
---Source : lua/vehicle/powertrain/shaft.lua:202
---@param data table|nil Table d'état produite par getState.
function powertrain_shaft_device:setState(data) end

--- Appelée à chaque pas de physique, de l'amont vers l'aval. Calcule le couple de sortie = (couple parent - pertes de frottement) * gearRatio ; pour une roue, écrit propulsionTorque et frictionTorque. Version déconnectée : accélère la masse virtuelle et met outputTorque à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/shaft.lua:58
---@param dt number Pas de temps en secondes (utilisé par les versions déconnectées).
function powertrain_shaft_device:torqueUpdate(dt) end

--- Si le shaft a plusieurs modes et uiSimpleModeControl, met à jour le bouton d'interface simple (extensions.ui_simplePowertrainControl.setButton) qui appelle powertrain.toggleDeviceMode(nom).
---Source : lua/vehicle/powertrain/shaft.lua:157
function powertrain_shaft_device:updateSimpleControlButtons() end

--- Appelée par le powertrain après construction. Force le mode déconnecté si isPhysicallyDisconnected. Pour un shaft sans enfant ni roue, prend la virtualInertia par défaut du différentiel ancêtre. Pour un shaft de roue, retrouve le torsionReactor ancêtre et déclare ses nœuds de réaction à la roue (setEngineAxisCoupleNodes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/shaft.lua:116
---@return boolean  Toujours true.
function powertrain_shaft_device:validate() end

--- Appelée à chaque pas de physique, de l'aval vers l'amont. Calcule inputAV = outputAV * gearRatio et l'écrit dans le champ de vitesse du parent. Version roue : lit wheel.angularVelocity * wheelDirection. Version déconnectée : utilise virtualMassAV à la place.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/shaft.lua:52
---@param dt number Pas de temps en secondes (inutilisé sauf par convention).
function powertrain_shaft_device:velocityUpdate(dt) end

return powertrain_shaft
