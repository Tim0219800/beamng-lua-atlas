---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/rentals.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Ébauche non terminée d'un système de location de véhicules en carrière : la plupart des fonctions ne contiennent que des commentaires, et les hooks (onExtensionLoaded, onSaveCurrentProfile, onUpdate) sont commentés. Seule isRenting est exportée.
--- Accès : extension `career_modules_rentals` : `extensions.load("career_modules_rentals")`, puis la globale `career_modules_rentals`
---@class career_modules_rentals
career_modules_rentals = {}

--- API UI : indique si un véhicule de location est en cours (currRentalVeh non nil).
---Source : lua/ge/extensions/career/modules/rentals.lua:42
---@return boolean  Toujours false en l'état.
function career_modules_rentals.isRenting() end

