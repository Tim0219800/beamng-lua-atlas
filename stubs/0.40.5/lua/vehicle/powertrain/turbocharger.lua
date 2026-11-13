---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/turbocharger.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-système de suralimentation par turbo, rattaché à un moteur (ce n'est pas un device de la chaîne de transmission : init(device, jbeamData) reçoit le moteur). Simule la vitesse de l'arbre du turbo (couple des gaz d'échappement - contre-pression - frottement, inertie), la pression de suralimentation via une courbe pression/régime turbo, une soupape de décharge (wastegate, régulée par un PID), une soupape de décharge à l'admission (BOV/flutter), l'antilag, la température du turbo (dégâts) et les sons (sifflement, rotation, BOV). Écrit le coefficient forcedInductionCoef du moteur et plusieurs valeurs electrics (turboRPM, turboSpin, turboBoost, turboBoostMax, turboRpmRatio).
--- Accès : type de composant powertrain `turbocharger` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_turbocharger
---@field isExisting boolean Toujours true : permet au moteur de savoir qu'un module turbo existe.
---@field turboAV number|nil Vitesse angulaire de l'arbre du turbo en rad/s ; nil avant init, mise à jour à chaque pas de physique.
local powertrain_turbocharger = {}

--- Aggrave le frottement et réduit la puissance d'échappement quand un groupe de déformation du turbo est endommagé ; signale 'inductionSystemDamaged' au suivi de dégâts.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/turbocharger.lua:115
---@param damageAmount number Quantité de dégât.
function powertrain_turbocharger.applyDeformGroupDamage(damageAmount) end

--- Renvoie l'intégrité du turbo.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/turbocharger.lua:136
---@return number  Intégrité 0..1.
---@return table  {damageFrictionCoef, damageExhaustPowerCoef}.
function powertrain_turbocharger.getPartCondition() end

--- Estime, pour chaque régime de la courbe de couple du moteur, le coefficient de gain de couple apporté par le turbo (en supposant le turbo en régime stabilisé et la wastegate à sa consigne moyenne). Sert aux outils de courbes de puissance.
---Source : lua/vehicle/powertrain/turbocharger.lua:507
---@return table<integer, number>  Table indexée par rpm+1 : coefficient (1 = pas de gain).
function powertrain_turbocharger.getTorqueCoefs() end

--- Initialise le turbo pour un moteur donné : copie le jbeam, construit les courbes pression/échappement/efficacité (createCurve), les tables de wastegate par rapport de boîte, les lisseurs, les coefficients et installe updateGFX/updateFixedStep/updateSounds. Appelée par le moteur à l'initialisation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/turbocharger.lua:324
---@param device table Device moteur auquel le turbo est rattaché.
---@param jbeamData table|nil Table jbeam 'turbocharger' (voir notes). Si nil, le turbo reste inactif.
function powertrain_turbocharger.init(device, jbeamData) end

--- Crée les sources audio hiss et whine sur le noeud du moteur et lit les coefficients sonores du jbeam.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/turbocharger.lua:482
---@param jbeamData table Non utilisé (la copie interne du jbeam sert).
function powertrain_turbocharger.initSounds(jbeamData) end

--- Remet à zéro l'état du turbo (vitesse, pressions, BOV, PID de wastegate, antilag, coefficients de dégâts/usure) et les lisseurs. Appelée au reset du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/turbocharger.lua:290
---@param jbeamData table Non utilisé.
function powertrain_turbocharger.reset(jbeamData) end

--- Ne fait rien (fonction vide), appelée au reset des sons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/turbocharger.lua:504
---@param jbeamData table Non utilisé.
function powertrain_turbocharger.resetSounds(jbeamData) end

--- Règle le niveau d'antilag (relance de l'arbre du turbo pendant les levers de pied) : puissance antilag = coef * maxAntilagPower. Est aussi pris en compte dans le calcul de charge pour la BOV.
---Source : lua/vehicle/powertrain/turbocharger.lua:533
---@param coef number Coefficient 0..1.
function powertrain_turbocharger.setAntilagCoef(coef) end

--- Applique l'usure (odomètre) et l'intégrité d'une pièce chargée depuis une sauvegarde.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/turbocharger.lua:121
---@param odometer number Odomètre de la pièce.
---@param integrity number|table Intégrité 0..1 ou table {damageFrictionCoef, damageExhaustPowerCoef}.
---@param visual any Non utilisé.
function powertrain_turbocharger.setPartCondition(odometer, integrity, visual) end

--- Décale la consigne de pression de la wastegate (boost control).
---Source : lua/vehicle/powertrain/turbocharger.lua:529
---@param offset number Décalage en psi (ajouté à la consigne, peut être négatif).
function powertrain_turbocharger.setWastegateOffset(offset) end

--- Pas de physique : PID de wastegate, bilan de couple de l'arbre (échappement + antilag, contre-pression, frottement), vitesse du turbo, pression brute puis lissée, et application à forcedInductionCoef du moteur. Remplace le nop initial après init. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/turbocharger.lua:dyn
---@param dt number Pas de physique (s).
function powertrain_turbocharger.updateFixedStep(dt) end

--- Frame graphique : température et dégâts du turbo, logique de BOV/flutter et ses sons, consigne de wastegate selon le rapport, valeurs electrics (turboRPM, turboSpin, turboRpmRatio, turboBoost) et flux 'forcedInductionInfo' vers l'UI. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/turbocharger.lua:dyn
---@param dt number Pas de temps de la frame (s).
function powertrain_turbocharger.updateGFX(dt) end

--- Règle volume/pitch du sifflement de pression (hiss) et du bruit de rotation (whine) du turbo. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/turbocharger.lua:dyn
---@param dt number Pas de temps (s). Non utilisé.
function powertrain_turbocharger.updateSounds(dt) end

return powertrain_turbocharger
