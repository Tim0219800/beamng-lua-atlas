---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/vehicleShoppingDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Onglet de debug carrière « Vehicle Shopping ». Relit les fichiers *.facilities.json du niveau courant pour obtenir les concessionnaires, simule le tirage de véhicules (util/configListGenerator) et affiche, par concessionnaire et par sous-filtre, les configurations qui correspondent (modèle, config, nom) avec probabilité normalisée, nombre d'éligibles et temps de calcul.
--- Accès : extension `career_modules_debug_vehicleShoppingDebug` : `extensions.load("career_modules_debug_vehicleShoppingDebug")`, puis la globale `career_modules_debug_vehicleShoppingDebug`
---@class career_modules_debug_vehicleShoppingDebug
---@field debugName string 'Vehicle Shopping'.
---@field debugOrder number Ordre de tri (0).
career_modules_debug_vehicleShoppingDebug = {}

--- Dessine la fenêtre 'Vehicle Shopping - SubFilter Matches' : bouton Refresh (recalcul), compteurs, champ Search et résultats par concessionnaire/sous-filtre.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/vehicleShoppingDebug.lua:127
function career_modules_debug_vehicleShoppingDebug.drawDebugMenu() end

