---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/advancedwheeldebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de débogage qui calcule pour chaque roue les angles de carrossage (camber), de pincement (toe), de chasse (caster), d'inclinaison de pivot (SAI) et la pression de la roue, par rapport à la surface sous le véhicule, et les envoie à l'UI via gui.send('advancedWheelDebugData'). Actif seulement si au moins un 'utilisateur de debug' l'a activé par registerDebugUser.
--- Accès : extension `advancedwheeldebug` : `extensions.load (VM véhicule)("advancedwheeldebug")`, puis la globale `advancedwheeldebug`
---@class advancedwheeldebug
advancedwheeldebug = {}

--- Hook appelé à l'initialisation de l'extension : efface les utilisateurs de debug et désactive le calcul.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/advancedwheeldebug.lua:12
function advancedwheeldebug.onInit() end

--- Enregistre ou retire un demandeur du debug ; le calcul est actif tant qu'au moins une valeur est vraie.
---Source : lua/vehicle/extensions/advancedwheeldebug.lua:17
---@param user string Identifiant du demandeur.
---@param value boolean true pour demander l'affichage, false pour le retirer.
function advancedwheeldebug.registerDebugUser(user, value) end

--- Appelé chaque frame : calcule et envoie les données de roue si le debug est actif.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/extensions/advancedwheeldebug.lua:26
---@param dt number Pas de temps en secondes (non utilisé).
function advancedwheeldebug.updateGFX(dt) end

