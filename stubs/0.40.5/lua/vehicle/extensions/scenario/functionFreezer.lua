---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/scenario/functionFreezer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Permet à un créateur de scénario d'empêcher l'exécution de certaines fonctions Lua du véhicule tant que le scénario n'a pas démarré (écran d'intro, caméra d'intro), par exemple pour qu'un canon ne tire pas pendant la lecture. À son chargement l'extension enveloppe controller.setFreeze : quand le jeu appelle setFreeze(1) les fonctions listées sont remplacées par `nop`, et setFreeze(autre valeur) les restaure. La liste vient du hook onVehicleScenarioData (tableau de chaînes comme "hydro_input.liftUp").
--- Accès : extension `scenario_functionFreezer` : `extensions.load (VM véhicule)("scenario_functionFreezer")`, puis la globale `scenario_functionFreezer`
---@class scenario_functionFreezer
scenario_functionFreezer = {}

--- Hook appelé au chargement de l'extension. Sauvegarde controller.setFreeze et le remplace par une fonction qui appelle l'original (s'il existe) puis applique le gel/dégel des fonctions listées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/scenario/functionFreezer.lua:38
function scenario_functionFreezer.onExtensionLoaded() end

--- Hook appelé au déchargement. Dégèle toutes les fonctions (setFreeze(0) interne) puis restaure controller.setFreeze d'origine.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/scenario/functionFreezer.lua:51
function scenario_functionFreezer.onExtensionUnloaded() end

--- Hook appelé avec la configuration du scénario. Dégèle d'abord tout, vide la liste, puis valide chaque nom de fonction du tableau et l'ajoute à la liste à geler (ne gèle pas immédiatement : le gel se fait au prochain controller.setFreeze(1)).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/scenario/functionFreezer.lua:57
---@param data string[] Tableau de chemins de fonctions globales sous forme de chaînes (ex. "controller.shiftDown").
function scenario_functionFreezer.onVehicleScenarioData(data) end

