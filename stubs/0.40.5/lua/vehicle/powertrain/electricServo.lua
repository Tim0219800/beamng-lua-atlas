---@meta
-- tim19Atlas stub generated from lua/vehicle/powertrain/electricServo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant powertrain `electricServo` : servomoteur électrique qui fait tourner une roue « rotor » (clé jbeam `connectedRotator`, une roue déclarée comme rotator) vers un angle cible, avec un régulateur proportionnel (angularSpring) et un couple limité (stallTorque). Catégorie `engine` mais sans port de sortie : il n'a pas de parent powertrain et applique directement `propulsionTorque` à la roue. L'angle cible se règle par setTargetAngle ou par une valeur electrics (`electricsTargetAngleName`). Un moddeur l'utilise pour des bras, bennes ou articulations motorisés.
--- Accès : type de composant powertrain `electricServo` (jbeam `powertrain`), accessible par `powertrain.getDevice("nom")`
---@class powertrain_electricServo
---@field deviceCategories table<string, boolean> {engine=true}.
---@field outputPorts table Table vide : aucun port de sortie (le servo agit directement sur la roue).
local powertrain_electricServo = {}

--- Construit le servo, le relie à la roue rotor connectedRotator (déclarée via wheels.setWheelRotatorType(wheelID, 'rotator')), calcule maxTorque et maxAV, détermine les modes disponibles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricServo.lua:147
---@param jbeamData table Données jbeam du composant (maxRPM obligatoire).
---@return table  Le device (classe `device`).
function powertrain_electricServo.new(jbeamData) end

--- Objet renvoyé par new(jbeamData). velocityUpdate vaut nop (ou une fonction vide si déconnecté) ; torqueUpdate est servoUpdateTorque ou la version déconnectée.
---@class powertrain_electricServo_device
local powertrain_electricServo_device = {}

--- Calcule l'inertie de la roue rotor autour de son axe (somme masse * distance² des nœuds de la roue) puis cumulativeInertia = inertie / gearRatio². Appelée à l'initialisation du powertrain.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricServo.lua:118
function powertrain_electricServo_device:calculateInertia() end

--- Marque le servo comme cassé, met le couple de sortie et le couple de la roue à 0 et passe aux fonctions déconnectées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricServo.lua:107
function powertrain_electricServo_device:onBreak() end

--- Remet à zéro le couple, la vitesse de sortie et les angles cible et courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricServo.lua:140
---@param jbeamData table Données jbeam (inutilisées).
function powertrain_electricServo_device:reset(jbeamData) end

--- Définit les bornes d'angle utilisées par le mode 'shortest' (sans effet en mode 'absolute').
---Source : lua/vehicle/powertrain/electricServo.lua:68
---@param minAngle number|nil Angle minimal en radians.
---@param maxAngle number|nil Angle maximal en radians.
function powertrain_electricServo_device:setMinMaxAngles(minAngle, maxAngle) end

--- Change le mode ('connected' ou 'disconnected') sans vérifier availableModes, puis réselectionne les fonctions de mise à jour. 'disconnected' : couple nul.
---Source : lua/vehicle/powertrain/electricServo.lua:102
---@param mode string 'connected' ou 'disconnected'.
function powertrain_electricServo_device:setMode(mode) end

--- Fixe l'angle cible en radians. Mode 'absolute' : valeur telle quelle. Mode 'shortest' : repliée sur ]-2π, 2π[, bornée à [minAngle, maxAngle] si définis, et currentAngle est ajusté pour choisir le chemin le plus court.
---Source : lua/vehicle/powertrain/electricServo.lua:47
---@param angle number Angle cible en radians.
function powertrain_electricServo_device:setTargetAngle(angle) end

--- Ajoute angle à l'angle cible actuel (via setTargetAngle).
---Source : lua/vehicle/powertrain/electricServo.lua:64
---@param angle number Variation d'angle en radians.
function powertrain_electricServo_device:setTargetAngleRelative(angle) end

--- Appelée à chaque pas physique : intègre l'angle courant avec la vitesse de la roue, calcule l'erreur d'angle, un couple proportionnel borné par stallTorque et atténué par la vitesse, soustrait le frottement, et écrit wheel.propulsionTorque. Déconnecté ou cassé : couple 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricServo.lua:39
---@param dt number Pas de temps en secondes.
function powertrain_electricServo_device:torqueUpdate(dt) end

--- Défini seulement si electricsTargetAngleName est renseigné. Lit l'angle cible dans electrics.values et appelle setTargetAngle. Appelée à chaque image.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricServo.lua:73
---@param dt number Durée de l'image en secondes (inutilisé).
function powertrain_electricServo_device:updateGFX(dt) end

--- Appelée après construction du powertrain ; renvoie toujours true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricServo.lua:98
---@return boolean  true.
function powertrain_electricServo_device:validate() end

--- Appelée à chaque pas physique ; ne fait rien (nop ou fonction vide en mode déconnecté ou cassé).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/powertrain/electricServo.lua:36
function powertrain_electricServo_device:velocityUpdate() end

return powertrain_electricServo
