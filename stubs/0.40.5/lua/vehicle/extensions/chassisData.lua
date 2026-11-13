---@meta
-- tim19Atlas stub generated from lua/vehicle/extensions/chassisData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension qui calcule l'empattement (wheelBase) et la largeur de voie (trackWidth) du véhicule à partir des positions des nœuds de roues dans les données jbeam, puis les renvoie par commande Lua à un autre objet (véhicule ou VM). Utilisée par des outils qui ont besoin de la géométrie du châssis.
--- Accès : extension `chassisData` : `extensions.load (VM véhicule)("chassisData")`, puis la globale `chassisData`
---@class chassisData
chassisData = {}

--- Calcule (ou lit du cache) les données de châssis et les envoie à l'objet objID en appelant la fonction Lua callback avec le JSON des données en argument.
---Source : lua/vehicle/extensions/chassisData.lua:101
---@param objID integer Identifiant de l'objet destinataire.
---@param callback string Nom de la fonction Lua à appeler sur le destinataire.
---@param forceRefresh boolean|nil true pour ignorer le cache.
function chassisData.requestChassisData(objID, callback, forceRefresh) end

