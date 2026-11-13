---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/hydraulicPump.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `hydraulicPump` : pompe hydraulique (à cylindrée variable ou fixe) entraînée par un arbre, avec un accumulateur intégré et une soupape de décharge. C'est un consommateur de couple sans port de sortie (feuille de l'arbre powertrain). Il crée aussi les consommateurs hydrauliques (`hydraulicCylinder`) déclarés dans `v.data.powertrainHydros` avec `connectedPump` = nom de la pompe, et les met à jour. Il peut alimenter un autre véhicule par un coupleur (PTO hydraulique) grâce à des valeurs electrics partagées.
--- Accès : type de composant powertrain `hydraulicPump` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_hydraulicPump
---@field deviceCategories table<string, boolean> {clutchlike=true, clutch=true, hydraulicPowerSource=true, torqueConsumer=true}.
---@field outputPorts table Table vide : aucun port de sortie.
local powertrain_hydraulicPump = {}

--- Construit la pompe : paramètres de cylindrée, pression de travail, accumulateur, soupape de décharge et PTO, puis crée les consommateurs hydrauliques déclarés pour cette pompe dans v.data.powertrainHydros.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicPump.lua:349
---@param jbeamData table Données jbeam du composant.
---@return table  Le device (classe `device`).
function powertrain_hydraulicPump.new(jbeamData) end

--- Objet renvoyé par new(jbeamData).
---@class powertrain_hydraulicPump_device
local powertrain_hydraulicPump_device = {}

--- Ne fait rien (corps vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicPump.lua:173
---@param damageAmount number Ignoré.
function powertrain_hydraulicPump_device:applyDeformGroupDamage(damageAmount) end

--- Inertie purement virtuelle : cumulativeInertia = virtualInertia / gearRatio² ; rapports cumulés = gearRatio.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicPump.lua:206
function powertrain_hydraulicPump_device:calculateInertia() end

--- Renvoie 1 (0 si cassé) et la table {isBroken}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicPump.lua:188
---@return number  Intégrité.
---@return table  {isBroken}.
function powertrain_hydraulicPump_device:getPartCondition() end

--- Renvoie l'état sauvegardable : volume d'huile de l'accumulateur (clé '<nom>_accumulatorOilVolume') fusionné avec les états des consommateurs.
---Source : lua/vehicle/powertrain/hydraulicPump.lua:219
---@return table  Table stateData.
function powertrain_hydraulicPump_device:getState() end

--- Crée la boucle sonore de la pompe (volume 0), calcule vitesse et débit maxima pour le son à partir du moteur entraîneur, lit les réglages de son du jbeam et initialise les sons des consommateurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicPump.lua:252
---@param jbeamData table Données jbeam du composant.
function powertrain_hydraulicPump_device:initSounds(jbeamData) end

--- Marque isBroken = true et passe à la version « cassée » de velocityUpdate (l'accumulateur se vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicPump.lua:201
function powertrain_hydraulicPump_device:onBreak() end

--- Hook de coupleur : quand un coupleur de prise PTO de cette pompe s'attache à un autre véhicule, crée la valeur electrics de débit pour ce véhicule et lui envoie son nom via beamstate.sendExportCouplerData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicPump.lua:134
---@param nodeId integer Nœud de ce véhicule portant le coupleur.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer Nœud de l'autre véhicule.
---@param attachForce number Force d'attache (non utilisée).
function powertrain_hydraulicPump_device:onCouplerAttached(nodeId, obj2id, obj2nodeId, attachForce) end

--- Hook de coupleur : quand le coupleur PTO de cette pompe se détache, supprime la valeur electrics de débit de l'autre véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicPump.lua:148
---@param nodeId integer Nœud de ce véhicule portant le coupleur.
---@param obj2id integer Id de l'autre véhicule.
---@param obj2nodeId integer Nœud de l'autre véhicule.
---@param breakForce number Force de rupture (non utilisée).
function powertrain_hydraulicPump_device:onCouplerDetached(nodeId, obj2id, obj2nodeId, breakForce) end

--- Remet à zéro vitesses, débits, accumulateur (pression et volume initiaux), état, valeurs electrics du PTO, puis réinitialise chaque consommateur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicPump.lua:301
---@param jbeamData table Données jbeam du composant (gearRatio, friction, isConnected).
---@return table  Le device.
function powertrain_hydraulicPump_device:reset(jbeamData) end

--- Appelle resetSounds de chaque consommateur ; ne touche pas au son de la pompe elle-même.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicPump.lua:293
---@param jbeamData table Données jbeam du composant.
function powertrain_hydraulicPump_device:resetSounds(jbeamData) end

--- Embraye (true) ou débraye (false) la pompe de son entraîneur : isConnectedCoef = 1 ou 0. Peut être appelée par un contrôleur de PTO.
---Source : lua/vehicle/powertrain/hydraulicPump.lua:159
---@param isConnected boolean true pour entraîner la pompe.
function powertrain_hydraulicPump_device:setConnected(isConnected) end

--- Applique isBroken de l'intégrité (nombre : pas cassé ; table : champ isBroken) en appelant onBreak si besoin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicPump.lua:176
---@param subSystem any Non utilisé.
---@param odometer number Non utilisé.
---@param integrity number|table Nombre 0..1 ou table {isBroken}.
---@param visual any Non utilisé.
function powertrain_hydraulicPump_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Restaure le volume d'huile de l'accumulateur (nombre fini, borné à 2 * accumulatorMaxVolume) et la pression correspondante, puis transmet l'état aux consommateurs.
---Source : lua/vehicle/powertrain/hydraulicPump.lua:233
---@param data table|nil Table d'état produite par getState.
function powertrain_hydraulicPump_device:setState(data) end

--- Appelée à chaque pas physique : calcule la pression d'accumulateur, le couple résistant torqueDiff = pression * cylindrée / (2π) / gearRatio, interroge chaque consommateur (consumer:update) pour obtenir ses débits, puis calcule le débit de décharge (déchargeur et soupape de décharge progressive).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicPump.lua:51
---@param dt number Pas de temps en secondes.
function powertrain_hydraulicPump_device:torqueUpdate(dt) end

--- Mise à jour par image : met à jour les consommateurs (updateGFX), publie la pression et le débit max sur electrics, soustrait le débit demandé par les consommateurs distants (PTO) de l'accumulateur et affiche un graphe de débogage si showDebugGraph.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicPump.lua:74
---@param dt number Durée de l'image en secondes.
function powertrain_hydraulicPump_device:updateGFX(dt) end

--- Règle volume, hauteur (selon la vitesse de la pompe) et couleur (selon la puissance hydraulique) du son de pompe et appelle updateSounds des consommateurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicPump.lua:96
---@param dt number Durée de l'image en secondes.
function powertrain_hydraulicPump_device:updateSounds(dt) end

--- Appelée après construction du powertrain ; renvoie toujours true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicPump.lua:197
---@return boolean  true.
function powertrain_hydraulicPump_device:validate() end

--- Appelée à chaque pas physique : calcule la cylindrée courante (variable ou fixe), inputAV = vitesse du parent / gearRatio * isConnectedCoef, le débit de la pompe et met à jour le volume d'huile de l'accumulateur (débit entrant moins sorties, décharge, déchargeur). Version cassée : tout à 0 et vidange.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/hydraulicPump.lua:44
---@param dt number Pas de temps en secondes.
function powertrain_hydraulicPump_device:velocityUpdate(dt) end

return powertrain_hydraulicPump
