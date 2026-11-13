---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/supercharger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-système de compresseur mécanique (supercharger) rattaché à un moteur : le compresseur est entraîné par le vilebrequin (rapport gearRatio, avec un embrayage progressif entre clutchEngageRPM et clutchDisengageRPM). Trois types : 'roots', 'screws', 'centrifugal', chacun avec sa courbe d'efficacité et son niveau de pulsation. Calcule la pression de suralimentation (psi/1000 tr/min, courbe boostController selon l'ouverture des gaz, soupape de décharge), l'applique à engine.forcedInductionCoef et prélève une perte de couple proportionnelle au régime (crankLossPer1kRPM). Génère aussi le sifflement du compresseur.
--- Accès : type de composant powertrain `supercharger` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_supercharger
---@field isExisting boolean Toujours true : indique au moteur qu'un compresseur existe.
local powertrain_supercharger = {}

--- Réduit la pression délivrée (damagePressureCoef, jusqu'à -0.1) quand un groupe de déformation est endommagé, et signale 'inductionSystemDamaged'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/supercharger.lua:72
---@param damageAmount number Quantité de dégât.
function powertrain_supercharger.applyDeformGroupDamage(damageAmount) end

--- Renvoie l'intégrité du compresseur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/supercharger.lua:91
---@return number  Intégrité 0..1.
---@return table  {damagePressureCoef}.
function powertrain_supercharger.getPartCondition() end

--- Estime le coefficient de gain de couple du compresseur pour chaque régime de la courbe de couple du moteur (embrayage et rapport pris en compte).
---Source : lua/vehicle/powertrain/supercharger.lua:320
---@return table<integer, number>  Table indexée par rpm+1 : coefficient (1 = aucun gain).
function powertrain_supercharger.getTorqueCoefs() end

--- Initialise le compresseur pour un moteur : lit le jbeam, génère la courbe de pression et celle du boostController, calcule la vitesse maximale du compresseur et installe updateGFX/updateFixedStep. Si jbeamData est nil, désactive updateGFX.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/supercharger.lua:209
---@param device table Device moteur.
---@param jbeamData table|nil Table jbeam 'supercharger'.
function powertrain_supercharger.init(device, jbeamData) end

--- Crée le son de sifflement du compresseur (soundObj) sur le noeud du moteur et calcule les coefficients de volume et de pitch.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/supercharger.lua:183
---@param jbeamData table Table jbeam 'supercharger'.
function powertrain_supercharger.initSounds(jbeamData) end

--- Remet à zéro le lisseur de pression et les coefficients de dégâts et d'usure, et efface 'superchargerDamaged'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/supercharger.lua:202
---@param jbeamData table Non utilisé.
function powertrain_supercharger.reset(jbeamData) end

--- Ne fait rien (fonction vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/supercharger.lua:180
---@param jbeamData table Non utilisé.
function powertrain_supercharger.resetSounds(jbeamData) end

--- Règle la pression à partir de laquelle la soupape de décharge limite la pression du compresseur.
---Source : lua/vehicle/powertrain/supercharger.lua:102
---@param pressurePSI number Pression de décharge en psi.
function powertrain_supercharger.setBypassPressure(pressurePSI) end

--- Applique l'usure (odomètre : pression jusqu'à 50 % à 1e9) et l'intégrité d'une pièce chargée depuis une sauvegarde. Voir le bug noté sur damagePressureCoef.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/supercharger.lua:77
---@param odometer number Odomètre de la pièce.
---@param integrity number|table Intégrité 0..1 ou table d'état.
---@param visual any Non utilisé.
function powertrain_supercharger.setPartCondition(odometer, integrity, visual) end

--- Pas de physique : multiplie assignedEngine.forcedInductionCoef par le gain de couple du compresseur (pression) moins la perte au vilebrequin. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/supercharger.lua:dyn
---@param dt number Pas de physique (s). Non utilisé.
function powertrain_supercharger.updateFixedStep(dt) end

--- Frame graphique : état de l'embrayage progressif, vitesse et régime du compresseur, pulsations, pression avec soupape de décharge et lissage, perte de couple, electrics.superchargerBoost et flux 'forcedInductionInfo'. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/supercharger.lua:dyn
---@param dt number Pas de temps de la frame (s).
function powertrain_supercharger.updateGFX(dt) end

--- Règle volume et pitch du sifflement selon la pression et le régime du compresseur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/supercharger.lua:106
---@param dt number Pas de temps (s). Non utilisé.
function powertrain_supercharger.updateSounds(dt) end

return powertrain_supercharger
