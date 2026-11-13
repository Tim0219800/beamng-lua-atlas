---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/rangeBox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `rangeBox` : boîte de gamme (réducteur à deux plages « high » / « low », ex. boîte de transfert 4x4 réduite ou gamme de camion). Le rapport ne change que par setMode : 'high' sélectionne le rapport le plus petit, 'low' le plus grand. La transmission reste toujours engagée (pas de neutre ni de synchro). Un moddeur l'utilise pour basculer entre gamme haute et basse ; le contrôle utilisateur passe par powertrain.toggleDeviceMode(nom) ou le bouton d'interface simple.
--- Accès : type de composant powertrain `rangeBox` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_rangeBox
---@field deviceCategories table<string, boolean> {gearbox=true}.
---@field outputPorts table<integer, boolean> {[1]=true}.
---@field requiredExternalInertiaOutputs table<integer, integer> {1}.
local powertrain_rangeBox = {}

--- Construit la boîte de gamme : table des rapports (avant et arrière), indices de gamme haute et basse, mode initial et état sauvegardable.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/rangeBox.lua:143
---@param jbeamData table Données jbeam du composant (gearRatios obligatoire).
---@return table  Le device (classe `device`).
function powertrain_rangeBox.new(jbeamData) end

--- Objet renvoyé par new(jbeamData).
---@class powertrain_rangeBox_device
local powertrain_rangeBox_device = {}

--- Augmente le coefficient de frottement de dégâts (0.01 de dégât = +0.1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/rangeBox.lua:82
---@param damageAmount number Quantité de dégâts du groupe de déformation.
function powertrain_rangeBox_device:applyDeformGroupDamage(damageAmount) end

--- Prend l'inertie et les rapports cumulés du premier enfant ; cumulativeInertia = inertie / gearRatio² (maxGearRatio si le rapport est 0).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/rangeBox.lua:110
function powertrain_rangeBox_device:calculateInertia() end

--- Renvoie l'intégrité 0..1 (0 si cassé) et {damageFrictionCoef, isBroken}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/rangeBox.lua:101
---@return number  Intégrité 0..1.
---@return table  État sauvegardable.
function powertrain_rangeBox_device:getPartCondition() end

--- Renvoie stateData avec la clé '<nom>Mode' = mode courant (pour la sauvegarde).
---Source : lua/vehicle/powertrain/rangeBox.lua:66
---@return table  stateData.
function powertrain_rangeBox_device:getState() end

--- Remet à zéro vitesses, couple, inertie cumulée, coefficients d'usure/dégâts et isBroken ; relit friction. Ne remet pas le rapport.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/rangeBox.lua:127
---@param jbeamData table Données jbeam du composant.
function powertrain_rangeBox_device:reset(jbeamData) end

--- Choisit le rapport par son indice (borné à [minGearIndex, maxGearIndex]) et recalcule l'inertie du groupe motopropulseur, sauf si omitInertiaCaculation est vrai.
---Source : lua/vehicle/powertrain/rangeBox.lua:24
---@param index integer Indice de rapport voulu.
---@param omitInertiaCaculation boolean|nil true pour ne pas appeler powertrain.calculateTreeInertia().
function powertrain_rangeBox_device:setGearIndex(index, omitInertiaCaculation) end

--- Passe en gamme 'high' (rapport le plus petit) ou 'low' (rapport le plus grand). Toute autre valeur est ignorée. Met à jour le bouton UI.
---Source : lua/vehicle/powertrain/rangeBox.lua:52
---@param mode string 'high' ou 'low'.
function powertrain_rangeBox_device:setMode(mode) end

--- Applique l'usure (odomètre, coefficient de 1 à 2) et les dégâts (intégrité nombre 0..1 ou table) ; appelle onBreak si isBroken, qui n'est pas défini sur ce device.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/rangeBox.lua:86
---@param subSystem any Non utilisé.
---@param odometer number Distance parcourue en mètres.
---@param integrity number|table Nombre 0..1 ou table {damageFrictionCoef, isBroken}.
---@param visual any Non utilisé.
function powertrain_rangeBox_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Restaure le mode depuis data['<nom>Mode'] si c'est une chaîne différente du mode actuel.
---Source : lua/vehicle/powertrain/rangeBox.lua:71
---@param data table|nil Table d'état produite par getState.
function powertrain_rangeBox_device:setState(data) end

--- Appelée à chaque pas physique : outputTorque1 = (couple parent - frottements) * gearRatio.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/rangeBox.lua:20
function powertrain_rangeBox_device:torqueUpdate() end

--- Si plusieurs modes et uiSimpleModeControl : met à jour le bouton d'interface simple (icônes powertrain_rangebox_high / low) pour powertrain.toggleDeviceMode(nom).
---Source : lua/vehicle/powertrain/rangeBox.lua:33
function powertrain_rangeBox_device:updateSimpleControlButtons() end

--- Appelée à chaque pas physique : inputAV = outputAV1 * gearRatio, écrit dans le parent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/rangeBox.lua:15
---@param dt number Pas de temps en secondes (inutilisé).
function powertrain_rangeBox_device:velocityUpdate(dt) end

return powertrain_rangeBox
