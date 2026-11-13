---@meta
-- tim19Atlas stub generated from lua/common/jbeam/variables.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère les variables jbeam (réglages de véhicule de type range : géométrie, alignement, etc.) et la substitution des '$...' dans les pièces. Il collecte les variables de la pièce racine et de toutes les pièces choisies en respectant la portée des slots (un slot peut fournir des variables à sa pièce enfant), calcule leur valeur (valeur de l'utilisateur ou défaut, bornée), remplace les références '$nom', '$=expression', '$>>composant' dans les valeurs ET les clés des tables, fusionne les sections 'components' et prépare vehicle.variables pour l'UI. Utilisé par le chargeur jbeam.
--- Accès : `require("jbeam/variables")`
---@class jbeam_variables
local jbeam_variables = {}

--- Nettoyage final : supprime les fonctions dans vehicle.components et les variables hidden de vehicle.variables.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/variables.lua:502
---@param vehicle table véhicule (components et variables)
---@return boolean  toujours true
function jbeam_variables.cleanup(vehicle) end

--- Collecte toutes les variables connues (pièce racine puis pièces du journal, de l'enfant vers le parent) en évaluant uniquement les '$=' dans leurs listes (sans renommer de clés), selon la portée de chaque slot. Renvoie la table nom -> définition avec val calculée (utilisateur ou défaut, bornée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/variables.lua:321
---@param rootPart table pièce principale (variables, components)
---@param unifyJournal table[] journal de fusion de slotSystem.findParts (entrées {parent, pièce, niveau, options, chemin, slotDef})
---@param vehicleConfig table configuration (vars = valeurs choisies par l'utilisateur)
---@return table<string, table>  variables résolues indexées par nom (ex. '$AAA')
function jbeam_variables.getAllVariables(rootPart, unifyJournal, vehicleConfig) end

--- Place dans vehicle.variables la table des variables indexées par leur nom (v.name), à partir de la table de getAllVariables (ignore '$components' et les valeurs non-table).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/variables.lua:427
---@param vehicle table véhicule en construction (reçoit variables)
---@param allVariables table variables résolues
function jbeam_variables.postProcessVariables(vehicle, allVariables) end

--- Fusionne les sections 'components' de toutes les pièces dans rootPart.components (substitutions de variables appliquées, y compris sur les clés '$' des tables 'variables' imbriquées, comportement historique) puis retire 'components' des pièces sources.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/variables.lua:462
---@param rootPart table pièce principale (reçoit components)
---@param unifyJournal table[] journal de fusion
---@param vehicleConfig table configuration (non utilisée directement)
---@param vars table variables résolues
---@return boolean  toujours true
function jbeam_variables.processComponents(rootPart, unifyJournal, vehicleConfig, vars) end

--- Applique les substitutions de variables dans la pièce racine (composants d'abord) puis dans chaque pièce du journal et dans ses options de slot, avec la portée propre à chaque slot. Modifie les pièces en place.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/variables.lua:382
---@param rootPart table pièce principale
---@param unifyJournal table[] journal de fusion
---@param vehicleConfig table configuration du véhicule (non utilisée directement ici)
---@param vars table variables résolues de getAllVariables (reçoit aussi '$components')
---@return table  vars
function jbeam_variables.processParts(rootPart, unifyJournal, vehicleConfig, vars) end

return jbeam_variables
