---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/scenario/annotate.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exemple d'extension véhicule pilotée par un scénario. Elle affiche un texte flottant 2 m au-dessus du véhicule (avec un trait vertical) via obj.debugDrawProxy. Le texte vient du champ `text` de l'entrée `extensions.annotate` du véhicule dans le .json du scénario, transmis par le hook onVehicleScenarioData.
--- Accès : extension `scenario_annotate` : `extensions.load (VM véhicule)("scenario_annotate")`, puis la globale `scenario_annotate`
---@class scenario_annotate
---@field onExtensionLoaded nil Toujours nil : affecté depuis une variable non définie (voir notes).
scenario_annotate = {}

--- Hook de dessin debug appelé par main.lua (extensions.hook('onDebugDraw', focusPos)) à chaque frame graphique de debug. Dessine le texte `data.text` en noir à position véhicule + (0,0,2) et une ligne entre le véhicule et ce point.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/scenario/annotate.lua:29
---@param focusPos vec3 Position du focus caméra (non utilisée ici).
function scenario_annotate.onDebugDraw(focusPos) end

--- Hook appelé quand le scénario fournit les données de l'extension pour ce véhicule. Copie la table (deepcopy), vérifie que `text` est une chaîne (sinon log d'erreur) et la dumpe dans la console.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/scenario/annotate.lua:35
---@param _data table Table issue du .json du scénario (`extensions.annotate`), attendue avec un champ `text` (string).
function scenario_annotate.onVehicleScenarioData(_data) end

