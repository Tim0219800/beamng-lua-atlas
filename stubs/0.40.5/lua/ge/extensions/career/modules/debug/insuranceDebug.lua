---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/debug/insuranceDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Onglet de debug carrière « Insurance ». Ajoute une seule entrée de menu '> Reset insurance data' qui appelle career_modules_insurance_insurance.resetPlPolicyData() (réinitialise les données de police d'assurance du joueur).
--- Accès : extension `career_modules_debug_insuranceDebug` : `extensions.load("career_modules_debug_insuranceDebug")`, puis la globale `career_modules_debug_insuranceDebug`
---@class career_modules_debug_insuranceDebug
---@field debugName string 'Insurance'.
---@field debugOrder number Ordre de tri (1).
career_modules_debug_insuranceDebug = {}

--- Dessine l'entrée '> Reset insurance data' ; au clic, réinitialise les données de police d'assurance.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/career/modules/debug/insuranceDebug.lua:9
function career_modules_debug_insuranceDebug.drawDebugFunctions() end

