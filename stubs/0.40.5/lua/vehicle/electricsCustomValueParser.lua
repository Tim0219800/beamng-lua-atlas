---@meta
-- tim19Atlas stub generated from lua/vehicle/electricsCustomValueParser.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Compile et exécute les valeurs électriques personnalisées déclarées dans le jbeam (electrics.customValues : champs electricsName, electricsFunction, electricsDefault). Chaque expression est évaluée chaque frame dans un environnement bac à sable (fonctions math, round, clamp, smoothstep, case, pwm…, et une copie de `electrics`) puis le résultat est recopié dans electrics.values. Utilisé uniquement par electrics.lua.
--- Accès : `require("electricsCustomValueParser")`
---@class electricsCustomValueParser
local electricsCustomValueParser = {}

--- Construit l'environnement bac à sable, analyse chaque valeur custom, initialise electrics.values avec electricsDefault et compile une fonction unique exécutant toutes les affectations.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/electricsCustomValueParser.lua:165
---@param customValueData table<integer, table> Liste d'entrées {electricsName, electricsFunction?, electricsDefault?}.
---@return nil  Rien (nil aussi si la compilation échoue, erreur journalisée).
function electricsCustomValueParser.compileCustomValueUpdates(customValueData) end

--- Remet dans electrics.values les valeurs electricsDefault de toutes les valeurs custom (appelé au reset).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/electricsCustomValueParser.lua:117
function electricsCustomValueParser.resetCustomValues() end

--- Copie electrics.values dans l'environnement, exécute la fonction compilée puis recopie dans electrics.values les clés personnalisées. Appelé par electrics.updateGFXSecondStep.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/electricsCustomValueParser.lua:106
---@param dt number Pas de temps en secondes.
function electricsCustomValueParser.updateGFX(dt) end

--- Classe locale `customElectricsEnv` de lua/vehicle/electricsCustomValueParser.lua
---@class electricsCustomValueParser_customElectricsEnv
local electricsCustomValueParser_customElectricsEnv = {}

--- function used as a case selector, input can be both int and bool as the first argument, any number of arguments after that
--- in case it's a bool, it works like a ternary if, returning the second param if true, the third if false
--- if the selector is an int n, it simply returns the nth+1 param it was given, if n > #params it returns the last given param
---Source : lua/vehicle/electricsCustomValueParser.lua:20
---@param selector any
---@param ... any
function electricsCustomValueParser_customElectricsEnv.case(selector, ...) end

---Source : lua/vehicle/electricsCustomValueParser.lua:36
---@param input any
---@param frequency any
---@param dutyCycle any
---@param timeOffset any
function electricsCustomValueParser_customElectricsEnv.pwm(input, frequency, dutyCycle, timeOffset) end

---Source : lua/vehicle/electricsCustomValueParser.lua:36
---@param input any
---@param frequency any
---@param dutyCycle any
---@param timeOffset any
function pwm(input, frequency, dutyCycle, timeOffset) end

return electricsCustomValueParser
