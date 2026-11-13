---@meta
-- tim19Atlas stub generated from lua/ge/extensions/mcp/shared.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- État et petites aides partagés par les modules d'outils MCP (mcp/tools/*.lua). Chargé par `require('mcp/shared')`, donc singleton via le cache de require (ce n'est pas une extension chargée par extensions.load en usage normal). Contient les résultats des appels asynchrones (GE <-> VM véhicule / UI), le journal des instabilités physiques et des helpers pour résoudre l'id de véhicule et lire beamng.log.
--- Accès : extension `mcp_shared` : `extensions.load("mcp_shared")`, puis la globale `mcp_shared`
---@class mcp_shared
---@field asyncResults table<string, any> Résultats des aller-retours asynchrones, indexés par type : `vue`, `ui`, `vehLua` (table vehId -> résultat), `ai`, `electrics`, `hydro`, `testConfigs`. Remplis par les callbacks `mcp_tools._cb.*`, consommés par l'appel d'outil suivant.
---@field instabilityLog table Liste (max 50) des instabilités physiques détectées : {time, vid, jbeam}. Le commentaire du code dit à tort « async round-trip results » pour ce champ : il s'agit bien du journal d'instabilité.
---@field vehIdProp table Fragment de schéma JSON réutilisé par les outils véhicule : {id = {type='integer', description='Vehicle id (default: current player vehicle)'}}.
mcp_shared = {}

--- Modèle pris dans args.model, sinon le fichier JBeam du véhicule joueur courant.
---Source : lua/ge/extensions/mcp/shared.lua:22
---@param args table|nil Arguments de l'outil ; champ `model`.
---@return string|nil  Clé du modèle, nil s'il n'y a ni argument ni véhicule joueur.
function mcp_shared.argModel(args) end

--- Id de véhicule pris dans args.id, sinon celui du véhicule joueur 0.
---Source : lua/ge/extensions/mcp/shared.lua:16
---@param args table|nil Arguments de l'outil ; champ `id` lu avec tonumber.
---@return integer  Id du véhicule (peut être -1 ou invalide s'il n'y a pas de véhicule joueur).
function mcp_shared.argVehId(args) end

--- Lit beamng.log depuis l'octet `pos` jusqu'à la fin. Avec pos=nil, démarre à la fin (renvoie "") : sert à mesurer la taille actuelle. Si le fichier a rétréci (rotation, troncature), repart de 0.
---Source : lua/ge/extensions/mcp/shared.lua:31
---@param pos integer|nil Offset en octets où commencer.
---@return string|nil  Texte lu (nil si le fichier n'a pas pu être ouvert).
---@return integer  Taille du fichier (position de fin) à réutiliser comme prochain `pos`.
function mcp_shared.readLogFrom(pos) end

--- Renvoie le paquet de données du véhicule spawné (parts, config, fichiers, ioCtx) via core_vehicle_manager.getVehicleData.
---Source : lua/ge/extensions/mcp/shared.lua:19
---@param args table|nil Arguments de l'outil (voir argVehId).
---@return table|nil  Données du véhicule, ou nil.
function mcp_shared.vehData(args) end

