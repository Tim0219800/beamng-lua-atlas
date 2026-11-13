---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/automaticGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Type de device powertrain `automaticGearbox` : boîte automatique à train planétaire/hydraulique simplifié. Elle a des rapports indexés (gearIndex), des modes drive / neutral / park, une interpolation progressive du rapport lors des changements (simule l'ouverture/fermeture des embrayages internes), un frottement, une perte à la montée en rapport, un verrouillage de parking, un amortisseur visqueux anti-recul et des sons de sifflement d'engrenages. Le parent doit être un dispositif de couplage visqueux (catégorie viscouscoupling, en pratique un convertisseur de couple). Le choix des rapports est piloté par un contrôleur (gearbox controller), pas par ce module.
--- Accès : type de composant powertrain `automaticGearbox` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_automaticGearbox
---@field deviceCategories table<string, boolean> {gearbox = true}.
---@field outputPorts table<integer, boolean> {[1] = true}.
---@field requiredExternalInertiaOutputs integer[] {1} : powertrain ajoute un arbre factice sur ce port si rien n'y est connecté.
local powertrain_automaticGearbox = {}

--- Fabrique du device appelée par powertrain.init pour le type 'automaticGearbox'. Construit les tables de rapports, de sons, de verrouillage de parking et d'anti-recul, puis sélectionne le rapport 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/automaticGearbox.lua:366
---@param jbeamData table Données jbeam ; gearRatios est obligatoire.
---@return table  Le device automaticGearbox.
function powertrain_automaticGearbox.new(jbeamData) end

--- Objet renvoyé par new(jbeamData).
---@class powertrain_automaticGearbox_device
local powertrain_automaticGearbox_device = {}

--- Applique un dégât de déformation : augmente le frottement, réduit la vitesse de changement de rapport (plancher 0.2).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/automaticGearbox.lua:161
---@param damageAmount number Dégât ajouté.
function powertrain_automaticGearbox_device:applyDeformGroupDamage(damageAmount) end

--- Calcule l'inertie cumulée ramenée à l'entrée (inertie de l'enfant / rapport²), les paramètres du verrou de parking et les rapports cumulés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/automaticGearbox.lua:257
function powertrain_automaticGearbox_device:calculateInertia() end

--- Renvoie l'intégrité 0..1 (0 si cassé) et la table d'état {damageFrictionCoef, damageGearRatioChangeRateCoef, isBroken}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/automaticGearbox.lua:188
---@return number  Intégrité 0..1.
---@return table  État détaillé.
function powertrain_automaticGearbox_device:getPartCondition() end

--- Crée les boucles sonores de sifflement (entrée/sortie) et leurs lisseurs d'après les clés jbeam gearWhine*.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/automaticGearbox.lua:292
---@param jbeamData table Données jbeam.
function powertrain_automaticGearbox_device:initSounds(jbeamData) end

--- Remet tout à l'état initial (vitesses, mode 'drive', usure, dégâts, parking) et sélectionne le rapport 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/automaticGearbox.lua:328
---@param jbeamData table Données jbeam (gearRatio, friction).
function powertrain_automaticGearbox_device:reset(jbeamData) end

--- Remet à zéro les lisseurs et valeurs de bruit d'engrenages.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/automaticGearbox.lua:280
function powertrain_automaticGearbox_device:resetSounds() end

--- Choisit un rapport par son indice (borné à [minGearIndex, maxGearIndex]). Le rapport réel est ensuite interpolé dans updateGFX ; pendant le changement le couple est réduit par shiftEfficiency.
---Source : lua/vehicle/powertrain/automaticGearbox.lua:241
---@param index integer Indice de rapport (0 neutre, positifs avant, négatifs arrière).
---@param gearChangeTime number|nil Durée souhaitée du changement en s (au moins minimumGearChangeTime = gearChangeTime jbeam).
function powertrain_automaticGearbox_device:setGearIndex(index, gearChangeTime) end

--- Active (true) ou désactive le verrouillage : lockCoef = 0 déconnecte l'entrée et laisse seul le verrou de parking, 1 fonctionnement normal ; remet parkClutchAngle à 0.
---Source : lua/vehicle/powertrain/automaticGearbox.lua:252
---@param enabled boolean true pour déconnecter/verrouiller.
function powertrain_automaticGearbox_device:setLock(enabled) end

--- Change le mode ('drive', 'neutral' ou 'park') et sélectionne les fonctions de mise à jour correspondantes.
---Source : lua/vehicle/powertrain/automaticGearbox.lua:236
---@param mode string 'drive', 'neutral' ou 'park'.
function powertrain_automaticGearbox_device:setMode(mode) end

--- Applique usure et intégrité (nombre ou table) : coefficients de friction et de vitesse de changement de rapport ; appelle onBreak si isBroken (méthode inexistante, voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/automaticGearbox.lua:166
---@param subSystem string|nil Non utilisé.
---@param odometer number Usure cumulée.
---@param integrity number|table Intégrité 0..1 ou table d'état.
---@param visual any Non utilisé.
function powertrain_automaticGearbox_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Pas de physique (couples). Calcule outputTorque1 selon le mode, le frottement, le verrouillage de parking et l'anti-recul, et alimente les lisseurs de bruit d'engrenages.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/automaticGearbox.lua:79
---@param dt number Pas de physique en secondes.
function powertrain_automaticGearbox_device:torqueUpdate(dt) end

--- Une fois par frame : fait progresser gearRatio vers desiredGearRatio à la vitesse gearRatioChangeRate (influencée par usure/dégâts), recalcule l'inertie quand le rapport est atteint, met à jour isShifting*, et engage le parking si mode 'park' et vitesse basse.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/automaticGearbox.lua:115
---@param dt number Pas de temps en secondes.
function powertrain_automaticGearbox_device:updateGFX(dt) end

--- Appelée par powertrain.updateGFX : met à jour volume et hauteur des boucles de sifflement d'engrenages d'entrée et de sortie.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/automaticGearbox.lua:19
---@param dt number Pas de temps en secondes.
function powertrain_automaticGearbox_device:updateSounds(dt) end

--- Vérifie que le parent est un couplage visqueux (viscouscoupling) ; calcule les couples/vitesses attendus (depuis le moteur grand-parent si présent, sinon 100 N·m et 6000 tr/min) pour normaliser les sons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/automaticGearbox.lua:204
---@return boolean  false si le parent n'est pas un couplage visqueux.
function powertrain_automaticGearbox_device:validate() end

--- Pas de physique (vitesses). Fonction sélectionnée selon le mode : updateVelocity (drive), neutralUpdateVelocity ou parkUpdateVelocity (masse virtuelle). Écrit la vitesse d'entrée dans le parent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/automaticGearbox.lua:74
---@param dt number Pas de physique en secondes.
function powertrain_automaticGearbox_device:velocityUpdate(dt) end

return powertrain_automaticGearbox
