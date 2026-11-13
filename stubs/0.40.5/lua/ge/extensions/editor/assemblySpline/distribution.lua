---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/assemblySpline/distribution.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Calcule, pour l'outil Assembly Spline, quel mesh placer à chaque emplacement le long de la spline pour chaque composant rigide et chaque pont (bridge) de la molécule. Chaque composant est un groupe (mesh de base + variations) : si isRandom, chaque emplacement tire une variation selon ses poids randomWeight normalisés ; sinon les variations activées sont alternées en tourniquet (round robin). Ne tient compte que des composants activés pour la spline (mol.getRigidEnabled / getBridgeEnabled).
--- Accès : extension `editor_assemblySpline_distribution` : `extensions.load("editor_assemblySpline_distribution")`, puis la globale `editor_assemblySpline_distribution`
---@class editor_assemblySpline_distribution
editor_assemblySpline_distribution = {}

--- Calcule les cartes de meshes pour tous les composants rigides et ponts de la molécule.
---Source : lua/ge/extensions/editor/assemblySpline/distribution.lua:114
---@param molecule table Molécule avec les listes rigids et bridges (chaque entrée : mesh, variations, isRandom, randomWeight).
---@param numPlacements integer Nombre d'emplacements le long de la spline.
---@param spline table Assembly spline (pour l'état activé/désactivé des composants).
---@return table  rigidMaps : pour chaque rigide (même indice que molecule.rigids), tableau des meshPath par emplacement.
---@return table  bridgeMaps : idem pour les ponts, sur numPlacements - 1 emplacements.
function editor_assemblySpline_distribution.computeMeshMap(molecule, numPlacements, spline) end

