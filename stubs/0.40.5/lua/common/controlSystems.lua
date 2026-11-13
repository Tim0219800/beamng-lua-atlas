---@meta
-- tim19Atlas stub generated from lua/common/controlSystems.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet renvoyé par newPIDParallel. Champs publics : kP, kI, kD, error, integral, output, minOutput, maxOutput, minIntegral, maxIntegral, errorDeadzone, integralInCoef, integralOutCoef, lastProcessVariable, debugEnabled, get.
---@class controlSystems_PIDParallel
local controlSystems_PIDParallel = {}

--- Envoie error, integral et output au graphe debug via guihooks.graph.
---Source : lua/common/controlSystems.lua:89
function controlSystems_PIDParallel:drawDebug() end

--- Affiche la configuration du PID avec print.
---Source : lua/common/controlSystems.lua:98
function controlSystems_PIDParallel:dump() end

--- Alias de champ vers getMethod (ou getWithDebugMethod en mode debug). Utilisation : pid:get(processVariable, setPoint, dt).
---Source : lua/common/controlSystems.lua:dyn
---@param processVariable number Mesure actuelle.
---@param setPoint number Consigne.
---@param dt number Pas de temps en secondes.
---@return number  Sortie bornée du PID.
---@return number  Erreur (consigne - mesure) après zone morte.
function controlSystems_PIDParallel:get(processVariable, setPoint, dt) end

--- Calcule la sortie du PID pour ce pas de temps et met à jour error, integral, output, lastProcessVariable.
---Source : lua/common/controlSystems.lua:58
---@param processVariable number Mesure actuelle.
---@param setPoint number Consigne.
---@param dt number Pas de temps en secondes (> 0).
---@return number  Sortie bornée.
---@return number  Erreur.
function controlSystems_PIDParallel:getMethod(processVariable, setPoint, dt) end

--- Comme getMethod mais appelle aussi drawDebug. Ne renvoie que la sortie (pas l'erreur).
---Source : lua/common/controlSystems.lua:76
---@param processVariable number Mesure actuelle.
---@param setPoint number Consigne.
---@param dt number Pas de temps en secondes.
---@return number  Sortie bornée.
function controlSystems_PIDParallel:getWithDebugMethod(processVariable, setPoint, dt) end

--- Remet error, output, integral et lastProcessVariable à 0.
---Source : lua/common/controlSystems.lua:82
function controlSystems_PIDParallel:reset() end

--- Modifie les paramètres ; chaque argument nil conserve la valeur actuelle.
---Source : lua/common/controlSystems.lua:41
---@param kP number|nil Gain proportionnel.
---@param kI number|nil Gain intégral.
---@param kD number|nil Gain dérivé.
---@param minOutput number|nil Sortie min.
---@param maxOutput number|nil Sortie max.
---@param integralInCoef number|nil Coefficient d'accumulation.
---@param integralOutCoef number|nil Coefficient de résorption.
---@param minIntegral number|nil Borne basse de l'intégrale.
---@param maxIntegral number|nil Borne haute de l'intégrale.
---@param errorDeadzone number|nil Zone morte.
function controlSystems_PIDParallel:setConfig(kP, kI, kD, minOutput, maxOutput, integralInCoef, integralOutCoef, minIntegral, maxIntegral, errorDeadzone) end

--- Active/désactive le tracé debug en changeant la méthode get.
---Source : lua/common/controlSystems.lua:93
---@param debugEnabled boolean true pour utiliser getWithDebugMethod.
function controlSystems_PIDParallel:setDebug(debugEnabled) end

--- Objet renvoyé par newPIDStandard. Champs publics : kP, tICoef (1/tI), tD, error, integral, output, minOutput, maxOutput, minIntegral, maxIntegral, errorDeadzone, integralInCoef, integralOutCoef, lastProcessVariable, debugEnabled, get.
---@class controlSystems_PIDStandard
local controlSystems_PIDStandard = {}

--- Envoie error, integral et output au graphe debug via guihooks.graph.
---Source : lua/common/controlSystems.lua:179
function controlSystems_PIDStandard:drawDebug() end

--- Affiche la configuration du PID avec print.
---Source : lua/common/controlSystems.lua:188
function controlSystems_PIDStandard:dump() end

--- Alias de champ vers getMethod (ou getWithDebugMethod en mode debug). Utilisation : pid:get(processVariable, setPoint, dt).
---Source : lua/common/controlSystems.lua:dyn
---@param processVariable number Mesure actuelle.
---@param setPoint number Consigne.
---@param dt number Pas de temps en secondes.
---@return number  Sortie bornée du PID.
---@return number  Erreur.
function controlSystems_PIDStandard:get(processVariable, setPoint, dt) end

--- Calcule la sortie du PID standard pour ce pas de temps.
---Source : lua/common/controlSystems.lua:151
---@param processVariable number Mesure actuelle.
---@param setPoint number Consigne.
---@param dt number Pas de temps en secondes (> 0).
---@return number  Sortie bornée.
---@return number  Erreur.
function controlSystems_PIDStandard:getMethod(processVariable, setPoint, dt) end

--- Comme getMethod mais appelle drawDebug ; ne renvoie que la sortie.
---Source : lua/common/controlSystems.lua:168
---@param processVariable number Mesure actuelle.
---@param setPoint number Consigne.
---@param dt number Pas de temps en secondes.
---@return number  Sortie bornée.
function controlSystems_PIDStandard:getWithDebugMethod(processVariable, setPoint, dt) end

--- Remet integral et lastProcessVariable à 0 (error et output non touchés).
---Source : lua/common/controlSystems.lua:174
function controlSystems_PIDStandard:reset() end

--- Modifie les paramètres ; nil conserve la valeur. tI n'est pris en compte que s'il est > 0.
---Source : lua/common/controlSystems.lua:134
---@param kP number|nil Gain proportionnel.
---@param tI number|nil Temps intégral.
---@param tD number|nil Temps dérivé.
---@param minOutput number|nil Sortie min.
---@param maxOutput number|nil Sortie max.
---@param integralInCoef number|nil Coefficient d'accumulation.
---@param integralOutCoef number|nil Coefficient de résorption.
---@param minIntegral number|nil Borne basse de l'intégrale.
---@param maxIntegral number|nil Borne haute de l'intégrale.
---@param errorDeadzone number|nil Zone morte.
function controlSystems_PIDStandard:setConfig(kP, tI, tD, minOutput, maxOutput, integralInCoef, integralOutCoef, minIntegral, maxIntegral, errorDeadzone) end

--- Active/désactive le tracé debug en changeant la méthode get.
---Source : lua/common/controlSystems.lua:183
---@param debugEnabled boolean true pour utiliser getWithDebugMethod.
function controlSystems_PIDStandard:setDebug(debugEnabled) end

--- Crée un PID en forme parallèle : sortie = kP*erreur + kI*intégrale + kD*(−dPV/dt).
---Source : lua/common/controlSystems.lua:18
---@param kP number Gain proportionnel.
---@param kI number Gain intégral.
---@param kD number Gain dérivé (appliqué à la variation de la variable de process).
---@param minOutput number|nil Sortie minimale (défaut -math.huge).
---@param maxOutput number|nil Sortie maximale (défaut math.huge).
---@param integralInCoef number|nil Coefficient d'accumulation de l'intégrale quand elle s'éloigne de zéro (défaut 1).
---@param integralOutCoef number|nil Coefficient appliqué quand l'intégrale se résorbe (défaut 1).
---@param minIntegral number|nil Borne basse de l'intégrale (défaut -maxIntegral).
---@param maxIntegral number|nil Borne haute de l'intégrale (défaut maxOutput / kI).
---@param errorDeadzone number|nil Zone morte sur |erreur| (défaut 0).
---@return table  Objet PIDParallel (méthodes get, setConfig, reset, setDebug, dump, drawDebug).
function newPIDParallel(kP, kI, kD, minOutput, maxOutput, integralInCoef, integralOutCoef, minIntegral, maxIntegral, errorDeadzone) end

--- Crée un PID en forme standard : sortie = kP*(erreur + intégrale/tI + tD*(−dPV/dt)).
---Source : lua/common/controlSystems.lua:111
---@param kP number Gain proportionnel global.
---@param tI number Temps intégral ; si <= 0, le terme intégral est désactivé (coefficient 0).
---@param tD number Temps dérivé.
---@param minOutput number|nil Sortie minimale (défaut -math.huge).
---@param maxOutput number|nil Sortie maximale (défaut math.huge).
---@param integralInCoef number|nil Coefficient d'accumulation de l'intégrale (défaut 1).
---@param integralOutCoef number|nil Coefficient de résorption de l'intégrale (défaut 1).
---@param minIntegral number|nil Borne basse de l'intégrale (défaut -maxIntegral).
---@param maxIntegral number|nil Borne haute de l'intégrale (défaut maxOutput).
---@param errorDeadzone number|nil Zone morte sur |erreur| (défaut 0).
---@return table  Objet PIDStandard (mêmes méthodes que PIDParallel).
function newPIDStandard(kP, tI, tD, minOutput, maxOutput, integralInCoef, integralOutCoef, minIntegral, maxIntegral, errorDeadzone) end

