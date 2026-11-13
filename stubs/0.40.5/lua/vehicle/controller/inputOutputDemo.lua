---@meta
-- tim19Atlas stub generated from lua/vehicle/controller/inputOutputDemo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Contrôleur de démonstration (type "auxiliary", defaultOrder 100000) montrant comment lire des données du véhicule, générer des entrées et communiquer par UDP. À chaque image il enregistre temps, accélérateur, frein, énergie de batterie et puissance moteur dans un tableau CSV en mémoire, envoie des entrées aléatoires (throttle, brake, steering en FILTER_DIRECT) et échange un message JSON avec 127.0.0.1:54812. N'est pas destiné à un véhicule jouable.
--- Accès : contrôleur `inputOutputDemo` déclaré dans le jbeam (`controller`), accessible par `controller.getController("nom")`
---@class controller_inputOutputDemo
---@field defaultOrder number 100000 (exécuté en dernier).
---@field type string "auxiliary".
local controller_inputOutputDemo = {}

--- Prépare l'en-tête CSV, remet le chrono à 0 et configure le socket UDP vers 127.0.0.1:54812.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/inputOutputDemo.lua:125
function controller_inputOutputDemo.init() end

--- Vide le journal CSV (en-tête seul) et remet le chrono à 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/inputOutputDemo.lua:119
function controller_inputOutputDemo.reset() end

--- Écrit le journal accumulé dans testLog.csv.
---Source : lua/vehicle/controller/inputOutputDemo.lua:37
function controller_inputOutputDemo.saveLogToCSV() end

--- Incrémente le chrono interne.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/inputOutputDemo.lua:112
---@param dt number Pas de temps (s).
function controller_inputOutputDemo.update(dt) end

--- Ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/inputOutputDemo.lua:102
---@param dt number Pas de temps (s).
function controller_inputOutputDemo.updateFixedStep(dt) end

--- Journalise les données, génère des entrées aléatoires et communique par UDP.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/controller/inputOutputDemo.lua:95
---@param dt number Pas de temps (s).
function controller_inputOutputDemo.updateGFX(dt) end

return controller_inputOutputDemo
