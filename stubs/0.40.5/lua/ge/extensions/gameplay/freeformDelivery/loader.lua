---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/freeformDelivery/loader.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Charge un fichier de définition de livraison libre (JSON) : lit les données, charge le fichier de sites (sitesFile), fait apparaître les prefabs (prefabFile ou prefabFiles) à l'origine du monde, indexe les véhicules qu'ils contiennent par leur internalName, puis recharge la collision et le navgraph si les prefabs en contiennent. Utilisé par gameplay_freeformDelivery_freeformDelivery.load.
--- Accès : extension `gameplay_freeformDelivery_loader` : `extensions.load("gameplay_freeformDelivery_loader")`, puis la globale `gameplay_freeformDelivery_loader`
---@class gameplay_freeformDelivery_loader
gameplay_freeformDelivery_loader = {}

--- Charge une livraison : renvoie la table de données du JSON enrichie des sites, prefabs et index de véhicules. Renvoie nil (erreur loggée) si le fichier, les sites ou un prefab ne peuvent pas être chargés.
---Source : lua/ge/extensions/gameplay/freeformDelivery/loader.lua:142
---@param deliveryPath string Chemin du fichier JSON de la livraison.
---@return table|nil  Données de la livraison (vehicles, targetAreas, sites, _prefabIds, _vehicleIndex, ...).
function gameplay_freeformDelivery_loader.load(deliveryPath) end

