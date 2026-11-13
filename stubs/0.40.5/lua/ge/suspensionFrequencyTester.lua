---@meta
-- tim19Atlas stub generated from lua/ge/suspensionFrequencyTester.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de développement qui mesure la fréquence de la suspension d'un véhicule. Il affiche une fenêtre ImGui « Suspension Frequency Tester » : pour deux noeuds (essieu avant 279, essieu arrière 425 par défaut) il lit la hauteur z à chaque frame et la passe dans 1000 filtres de détection de fréquence (newFreqExists) entre 0.5 Hz et 5 Hz, puis compare à des catégories (Too Soft 0.9 Hz, Luxury 1.1, Average 1.2, Sporty 1.4, Rally 1.8, Racetrack 2.2, Aero-Critical 5.0). Le fichier explique l'usage : poser la voiture sur la glace, retirer l'amortissement, puis lancer extensions.suspensionFrequencyTester.run() depuis la console.
--- Accès : `require("suspensionFrequencyTester")`
---@class suspensionFrequencyTester
local suspensionFrequencyTester = {}

--- Hook appelé chaque frame par le système d'extensions : dessine la fenêtre si elle est ouverte, puis (si un véhicule joueur existe) met à jour pour chaque noeud les amplitudes de tous les filtres de fréquence à partir de la position z du noeud (veh:getNodePositionXYZ) et de dtSim.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/suspensionFrequencyTester.lua:176
---@param dtReal number Durée réelle de la frame (s) ; non utilisée.
---@param dtSim number Durée simulée de la frame (s), passée aux filtres.
---@param dtRaw number Durée brute de la frame (s) ; non utilisée.
function suspensionFrequencyTester.onUpdate(dtReal, dtSim, dtRaw) end

--- Ouvre la fenêtre et remet à zéro les amplitudes et les filtres de fréquence de chaque noeud pour recommencer une mesure.
---Source : lua/ge/suspensionFrequencyTester.lua:190
function suspensionFrequencyTester.run() end

return suspensionFrequencyTester
