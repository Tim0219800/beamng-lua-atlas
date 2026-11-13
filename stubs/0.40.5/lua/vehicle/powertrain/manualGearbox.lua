---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/manualGearbox.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `manualGearbox` : boîte de vitesses manuelle à rapports fixes. Le rapport actif est choisi par setGearIndex (indices entiers : 0 neutre, positifs = marches avant, négatifs = marche arrière). Il simule des synchroniseurs (usure, craquement de vitesse avec couple de « grinding »), le neutre (masse virtuelle), le frottement, le verrouillage (setLock) et les sons de bruit d'engrenage/craquement. Son parent doit être un embrayage (catégorie `clutch`). Un moddeur ou un contrôleur (ex. controller de boîte manuelle) appelle setGearIndex ; le jeu lit gearIndex, gearRatio, outputAV1.
--- Accès : type de composant powertrain `manualGearbox` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_manualGearbox
---@field deviceCategories table<string, boolean> {gearbox=true}.
---@field outputPorts table<integer, boolean> {[1]=true} : un seul port de sortie.
---@field requiredExternalInertiaOutputs table<integer, integer> {1}.
local powertrain_manualGearbox = {}

--- Construit la boîte : lit gearRatios et construit les tables d'indices avant/arrière, les coefficients de bruit de dents (gearWhine), les réglages de synchronisateurs et le nœud de la transmission, puis passe au neutre via setGearIndex(0).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/manualGearbox.lua:486
---@param jbeamData table Données jbeam du composant (gearRatios obligatoire).
---@return table  Le device (classe `device`).
function powertrain_manualGearbox.new(jbeamData) end

--- Objet renvoyé par new(jbeamData).
---@class powertrain_manualGearbox_device
local powertrain_manualGearbox_device = {}

--- Augmente le coefficient de frottement de dégâts (0.01 de dégât = +0.1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/manualGearbox.lua:289
---@param damageAmount number Quantité de dégâts du groupe de déformation.
function powertrain_manualGearbox_device:applyDeformGroupDamage(damageAmount) end

--- Prend l'inertie et les rapports cumulés du premier enfant ; cumulativeInertia = inertie aval / gearRatio² (avec 2 * maxGearRatio si neutre).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/manualGearbox.lua:372
function powertrain_manualGearbox_device:calculateInertia() end

--- Renvoie l'intégrité 0..1 (0 si cassée) et la table {damageFrictionCoef, synchroWear, isBroken}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/manualGearbox.lua:316
---@return number  Intégrité 0..1.
---@return table  État sauvegardable.
function powertrain_manualGearbox_device:getPartCondition() end

--- Crée les objets son (craquement, bruit d'engrenage entrée et sortie), les lisseurs et les coefficients de hauteur/volume depuis le jbeam, et règle le paramètre FMOD c_gearboxMaxPower.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/manualGearbox.lua:403
---@param jbeamData table Données jbeam du composant.
function powertrain_manualGearbox_device:initSounds(jbeamData) end

--- Marque la boîte comme cassée et passe en mode neutre (virtualMassAV). Appelée quand la poutre breakTriggerBeam casse ou via setPartCondition.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/manualGearbox.lua:277
function powertrain_manualGearbox_device:onBreak() end

--- Réinitialise l'état (vitesses, couple, usure, rapports d'origine, synchros, dégâts) puis repasse au neutre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/manualGearbox.lua:446
---@param jbeamData table Données jbeam du composant.
function powertrain_manualGearbox_device:reset(jbeamData) end

--- Remet à zéro les lisseurs et valeurs de son (bruit d'engrenage).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/manualGearbox.lua:391
function powertrain_manualGearbox_device:resetSounds() end

--- Active ou arrête l'état de craquement : mémorise le rapport visé et le couple max, démarre ou arrête la boucle sonore de craquement.
---Source : lua/vehicle/powertrain/manualGearbox.lua:150
---@param active boolean true pour démarrer le craquement, false pour l'arrêter et tout remettre à zéro.
---@param targetGearIndex integer|nil Indice du rapport visé (si active).
---@param maxGrindingTorque number|nil Couple de craquement maximal en N·m (si active).
function powertrain_manualGearbox_device:setGearGrinding(active, targetGearIndex, maxGrindingTorque) end

--- Passe un rapport. L'indice est borné à [minGearIndex, maxGearIndex]. Sans availableSyncTime, le passage réussit toujours ; avec, simule les synchros et peut déclencher un craquement (passage refusé : le rapport reste l'ancien). Recalcule l'inertie du groupe motopropulseur si le rapport est non nul. 0 = neutre.
---Source : lua/vehicle/powertrain/manualGearbox.lua:196
---@param index integer Indice du rapport voulu (0 neutre, >0 avant, <0 arrière).
---@param availableSyncTime number|nil Durée en secondes pendant laquelle le synchro a pu travailler ; nil = ne pas simuler les synchros.
function powertrain_manualGearbox_device:setGearIndex(index, availableSyncTime) end

--- Verrouille ou déverrouille la transmission : lockCoef = 0 (verrouillé, aucun couple ni vitesse transmis) ou 1. Propage l'appel au parent (embrayage) s'il a setLock.
---Source : lua/vehicle/powertrain/manualGearbox.lua:282
---@param enabled boolean true pour verrouiller.
function powertrain_manualGearbox_device:setLock(enabled) end

--- Applique usure (odomètre), dégâts (intégrité nombre 0..1 ou table) et usure des synchros. Appelle onBreak si la table indique isBroken.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/manualGearbox.lua:293
---@param subSystem any Non utilisé.
---@param odometer number Distance parcourue en mètres.
---@param integrity number|table Nombre 0..1 ou table {damageFrictionCoef, synchroWear, isBroken}.
---@param visual any Non utilisé.
function powertrain_manualGearbox_device:setPartCondition(subSystem, odometer, integrity, visual) end

--- Appelée à chaque pas physique : outputTorque1 = (couple parent - frottements) * gearRatio * lockCoef, et alimente les lisseurs de son. Au neutre, appelle updateGrinding, intègre la masse virtuelle et renvoie la réaction du craquement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/manualGearbox.lua:71
---@param dt number Pas de temps en secondes (utilisé au neutre).
function powertrain_manualGearbox_device:torqueUpdate(dt) end

--- Mise à jour par image : actuellement vide (le code de débogage et de saut de vitesse est en commentaire).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/manualGearbox.lua:178
---@param dt number Durée de l'image en secondes.
function powertrain_manualGearbox_device:updateGFX(dt) end

--- Pendant un passage qui craque : calcule le couple de craquement et son signe, use le synchro de la vitesse visée, enclenche la vitesse quand l'écart de vitesse tombe sous 20 rad/s, joue le son de craquement et affiche des messages « Synchronizer damage ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/manualGearbox.lua:99
---@param dt number Pas de temps en secondes.
function powertrain_manualGearbox_device:updateGrinding(dt) end

--- Met à jour le volume et la hauteur des boucles sonores de bruit d'engrenage (entrée et sortie) d'après les vitesses/couples lissés et le rapport courant. Appelée à chaque image par le powertrain.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/manualGearbox.lua:19
---@param dt number Durée de l'image en secondes.
function powertrain_manualGearbox_device:updateSounds(dt) end

--- Vérifie que le parent est un embrayage (ou un faux), journalise une erreur et renvoie false sinon. Détermine transmissionNodeID et les valeurs attendues (couple et vitesse maxima du moteur, puissance) utilisées pour normaliser les sons.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/manualGearbox.lua:329
---@return boolean  false si le parent n'est pas un embrayage.
function powertrain_manualGearbox_device:validate() end

--- Appelée à chaque pas physique : inputAV = outputAV1 * gearRatio * lockCoef (ou masse virtuelle au neutre) et écrit dans le parent.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/manualGearbox.lua:66
---@param dt number Pas de temps en secondes (inutilisé).
function powertrain_manualGearbox_device:velocityUpdate(dt) end

return powertrain_manualGearbox
