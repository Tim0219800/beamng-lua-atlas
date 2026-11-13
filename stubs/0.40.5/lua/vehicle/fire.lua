---@meta
-- tim19Atlas stub generated from lua/vehicle/fire.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Simulation d'incendie du véhicule. Les noeuds jbeam qui ont un `flashPoint` deviennent des noeuds inflammables : chacun a une température, une énergie chimique (chemEnergy), une intensité de flamme, éventuellement un réservoir (containerBeam) dont la rupture libère des vapeurs. Ils chauffent par frottement/collision (nodeCollision), conduction et rayonnement depuis les noeuds en feu (hotNodes), refroidissent à l'air ou dans l'eau, émettent flammes, fumée et sons, et font éclater les pneus. Un moddeur ou un scénario peut allumer, faire exploser ou éteindre le véhicule avec igniteVehicle, explodeVehicle, extinguishVehicle…
--- Accès : globale `fire`
---@class fire
---@field debugData table Données de debug ; debugData.flammableNodes pointe vers la table des noeuds inflammables.
---@field flammableNodes table<integer, table> Noeuds inflammables par cid, avec temperature, intensity, chemEnergy, flashPoint, smokePoint, burnRate, isVapor, vaporState, canIgnite, etc.
---@field hotNodes table<integer, table> Sous-ensemble de flammableNodes actuellement en train de brûler (température au-dessus du point de fumée).
fire = {}

--- Fait exploser un seul noeud : température maximale, vapeurs maximales, réservoir considéré rompu, noeud ajouté aux noeuds chauds.
---Source : lua/vehicle/fire.lua:440
---@param cid integer Identifiant du noeud.
function fire.explodeNode(cid) end

--- Provoque l'explosion : tous les réservoirs sont considérés rompus et pleins de vapeur, tous les noeuds inflammables sont allumés à température maximale.
---Source : lua/vehicle/fire.lua:427
function fire.explodeVehicle() end

--- Éteint immédiatement : température ambiante, intensité 0 et particules d'extincteur sur chaque noeud inflammable.
---Source : lua/vehicle/fire.lua:453
function fire.extinguishVehicle() end

--- Met chemEnergy à 0 sur tous les noeuds : plus de combustible, les flammes disparaissent en refroidissant.
---Source : lua/vehicle/fire.lua:461
function fire.extinguishVehicleSlowly() end

--- Renvoie la température du noeud en feu le plus proche d'un noeud donné et la distance à lui.
---Source : lua/vehicle/fire.lua:43
---@param cid integer Noeud de référence.
---@return number  Température du noeud chaud le plus proche (0 s'il n'y en a pas).
---@return number  Distance en mètres (math.huge s'il n'y a pas de noeud chaud).
function fire.getClosestHotNodeTempDistance(cid) end

--- Porte un noeud inflammable à une température donnée (maxNodeTemp par défaut) ; il s'enflammera ensuite si possible. Sans effet si le noeud n'est pas inflammable.
---Source : lua/vehicle/fire.lua:375
---@param cid integer Identifiant (cid) du noeud.
---@param temp number|nil Température en °C (1950 si nil).
function fire.igniteNode(cid, temp) end

--- Allume à température maximale un noeud inflammable au hasard (hors roues, pouvant s'enflammer, sans flamme en cours).
---Source : lua/vehicle/fire.lua:383
function fire.igniteRandomNode() end

--- Allume un noeud au hasard à flashPoint + 10 °C seulement (départ de feu discret).
---Source : lua/vehicle/fire.lua:398
function fire.igniteRandomNodeMinimal() end

--- Allume tous les noeuds inflammables sauf les noeuds de roue (pour retarder l'éclatement des pneus).
---Source : lua/vehicle/fire.lua:419
function fire.igniteVehicle() end

--- Construit la liste des noeuds inflammables à partir de v.data.nodes, repère le noeud le plus central (référence des particules), les poutres réservoir et les noeuds de roue, et active updateGFX/nodeCollision s'il y a au moins un noeud inflammable. Appelée par main.lua à l'init.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/fire.lua:289
function fire.init() end

--- Appelée par main.lua:onNodeCollision : échauffe un noeud inflammable avec l'énergie de frottement (slipForce x slipVel x lastDt x selfIgnitionCoef / capacité thermique) et l'enflamme s'il atteint son point de fumée. Ignore les collisions avec profondeur > 0. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/fire.lua:dyn
---@param p table Données de collision (particlefilter.particleData) : id1, slipForce, slipVel, depth…
function fire.nodeCollision(p) end

--- Identique à init (M.reset = init) : réinitialise tout l'état d'incendie au reset du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/fire.lua:289
function fire.reset() end

--- Appelée à chaque frame par main.lua (nop si pas de feu simulé). Traite le noeud inflammable suivant : vapeurs de réservoir, vapeur d'eau, transfert de chaleur depuis les noeuds en feu, refroidissement, combustion (intensité, consommation de chemEnergy), émission de flammes/fumée/sons et éclatement des pneus. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/fire.lua:dyn
---@param dt number Pas de temps de simulation en secondes.
function fire.updateGFX(dt) end

