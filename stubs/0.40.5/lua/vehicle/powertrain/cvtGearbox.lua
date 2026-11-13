---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/cvtGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `cvtGearbox` : boîte à variation continue (CVT) à rapport variable entre minGearRatio et maxGearRatio. Le rapport n'est pas choisi par ce fichier : un contrôleur extérieur appelle setGearRatio chaque pas. Les modes possibles sont posés par setMode : 'neutral' (masse virtuelle), 'park' (verrou de parking par ressort), 'reverse' (inverse le sens), sinon marche avant. Un accouplement visqueux à sens unique empêche le recul. Le fichier ne contient pas de logique de commande automatique.
--- Accès : type de composant powertrain `cvtGearbox` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_cvtGearbox
---@field deviceCategories table<string, boolean> {gearbox=true}.
---@field outputPorts table<integer, boolean> {[1]=true}.
---@field requiredExternalInertiaOutputs table<integer, integer> {1}.
local powertrain_cvtGearbox = {}

--- Construit la boîte CVT : paramètres de rapport minimal/maximal, verrou de parking, accouplement à sens unique, puis règle le rapport sur maxGearRatio.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/cvtGearbox.lua:180
---@param jbeamData table Données jbeam du composant.
---@return table  Le device (classe `device`).
function powertrain_cvtGearbox.new(jbeamData) end

--- Objet renvoyé par new(jbeamData). velocityUpdate/torqueUpdate dépendent du mode (normal, neutral, park).
---@class powertrain_cvtGearbox_device
local powertrain_cvtGearbox_device = {}

--- Augmente le coefficient de frottement de dégâts (0.01 de dégât = +0.1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/cvtGearbox.lua:82
---@param damageAmount number Quantité de dégâts du groupe de déformation.
function powertrain_cvtGearbox_device:applyDeformGroupDamage(damageAmount) end

--- Prend l'inertie et les rapports cumulés du premier enfant ; calcule cumulativeInertia (divisée par maxGearRatio²), les paramètres du verrou de parking (ressort, amortissement, angle max) et les rapports cumulés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/cvtGearbox.lua:130
function powertrain_cvtGearbox_device:calculateInertia() end

--- Renvoie l'intégrité 0..1 (0 si cassé) et {damageFrictionCoef, isBroken}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/cvtGearbox.lua:101
---@return number  Intégrité 0..1.
---@return table  État sauvegardable.
function powertrain_cvtGearbox_device:getPartCondition() end

--- Remet à zéro vitesses, couple, masse virtuelle, coefficients, lisseur de sens unique et angle de parking, puis règle le rapport sur maxGearRatio.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/cvtGearbox.lua:152
---@param jbeamData table Données jbeam du composant (gearRatio, friction).
function powertrain_cvtGearbox_device:reset(jbeamData) end

--- Fixe le rapport courant, borné entre minGearRatio et maxGearRatio. Appelée par un contrôleur de CVT.
---Source : lua/vehicle/powertrain/cvtGearbox.lua:120
---@param ratio number Rapport voulu (entrée / sortie, sans signe).
function powertrain_cvtGearbox_device:setGearRatio(ratio) end

--- Verrouille (lockCoef = 0 : aucune vitesse ni couple transmis) ou déverrouille (1) la transmission.
---Source : lua/vehicle/powertrain/cvtGearbox.lua:126
---@param enabled boolean true pour verrouiller.
function powertrain_cvtGearbox_device:setLock(enabled) end

--- Change le mode de la boîte (aucune validation de la chaîne). 'reverse' inverse le sens (reverseGearRatioCoef = -1) ; 'neutral' et 'park' sélectionnent des fonctions de mise à jour dédiées avec masse virtuelle ; toute autre valeur = marche avant.
---Source : lua/vehicle/powertrain/cvtGearbox.lua:114
---@param mode string 'neutral', 'park', 'reverse' ou autre (marche avant).
function powertrain_cvtGearbox_device:setMode(mode) end

--- Applique l'usure (odomètre, coefficient de 1 à 2) et les dégâts (intégrité nombre 0..1 ou table {damageFrictionCoef, isBroken}). Appelle onBreak si isBroken, qui n'est pas défini sur ce device (voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/cvtGearbox.lua:86
---@param subSystem any Non utilisé.
---@param odometer number Distance parcourue en mètres.
---@param integrity number|table Nombre 0..1 ou table d'état.
---@param visual any Non utilisé.
function powertrain_cvtGearbox_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Appelée à chaque pas physique : calcule outputTorque1 selon le mode. Normal : transmission avec frottement et accouplement à sens unique ; neutre : couple de sortie 0 et accélération de la masse virtuelle ; park : couple de verrouillage ressort/amortisseur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/cvtGearbox.lua:48
---@param dt number Pas de temps en secondes (utilisé en neutre et park).
function powertrain_cvtGearbox_device:torqueUpdate(dt) end

--- Appelée après construction du powertrain ; renvoie toujours true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/cvtGearbox.lua:110
---@return boolean  true.
function powertrain_cvtGearbox_device:validate() end

--- Appelée à chaque pas physique : inputAV = outputAV1 * gearRatio * lockCoef * reverseGearRatioCoef, écrit dans le parent. En neutre et en park : utilise la masse virtuelle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/cvtGearbox.lua:43
---@param dt number Pas de temps en secondes.
function powertrain_cvtGearbox_device:velocityUpdate(dt) end

return powertrain_cvtGearbox
