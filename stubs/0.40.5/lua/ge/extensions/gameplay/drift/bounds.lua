---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/drift/bounds.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Limites de zone du mode drift. Charge un fichier de sites (zones) avec setBounds, puis, à chaque frame, regarde pour chaque véhicule suivi par gameplay_drift_drift s'il est dans au moins une zone ; sinon il est « hors limites ». Un moddeur de mission de drift lit getIsOutOfBounds(vehId) pour pénaliser le joueur. Contient aussi une fenêtre ImGui de debug et un profileur.
--- Accès : extension `gameplay_drift_bounds` : `extensions.load("gameplay_drift_bounds")`, puis la globale `gameplay_drift_bounds`
---@class gameplay_drift_bounds
gameplay_drift_bounds = {}

--- Table de configuration du debug de l'extension : {default = false, canBeChanged = true}.
---Source : lua/ge/extensions/gameplay/drift/bounds.lua:115
---@return table  Infos de debug.
function gameplay_drift_bounds.getDriftDebugInfo() end

--- Garbage Lua produit par la dernière frame mesurée par le profileur (0 si le debug général est coupé).
---Source : lua/ge/extensions/gameplay/drift/bounds.lua:119
---@return number  Quantité de garbage mesurée.
function gameplay_drift_bounds.getGC() end

--- Indique si un véhicule est hors des zones de limites.
---Source : lua/ge/extensions/gameplay/drift/bounds.lua:103
---@param vehId integer|nil ID du véhicule ; nil = vrai si un véhicule suivi quelconque est hors limites.
---@return boolean  true si hors limites.
function gameplay_drift_bounds.getIsOutOfBounds(vehId) end

--- Hook par frame : met à jour l'état hors-limites de chaque véhicule suivi, la fenêtre de debug et le profileur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/drift/bounds.lua:88
function gameplay_drift_bounds.onUpdate() end

--- Charge le fichier de sites qui définit les zones autorisées (gameplay_sites_sitesManager.loadSites puis finalizeSites) et vide l'état des véhicules.
---Source : lua/ge/extensions/gameplay/drift/bounds.lua:24
---@param filePath string Chemin du fichier de sites contenant les zones.
---@param drawBounds_ boolean|nil Dessin des zones (nil = actif) ; voir notes, la valeur fournie est ignorée.
function gameplay_drift_bounds.setBounds(filePath, drawBounds_) end

