---@meta
-- tim19Atlas stub generated from lua/common/jbeam/utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fonctions utilitaires partagées du chargeur jbeam : ajout de nœuds et de poutres au véhicule en construction (compteurs maxIDs, copie des options), ajout de rotators, et calcul des transformations nodeRotate / nodeOffset / nodeMove appliquées aux positions de nœuds et de flexbodies (avec cache), plus deux helpers d'encodage string.buffer. Utilisé par les gestionnaires de roues, par le chargeur et par l'éditeur ; un mod qui génère des véhicules par code peut s'en servir pour ajouter des nœuds/poutres.
--- Accès : `require("jbeam/utils")`
---@class jbeam_utils
---@field ignoreSections table<string, boolean> Sections jbeam ignorées par certains traitements : {maxIDs = true, options = true}.
local jbeam_utils = {}

--- addBeamWithOptions de type NORMALTYPE (0) avec les options du véhicule.
---Source : lua/common/jbeam/utils.lua:100
---@param vehicle table véhicule en construction
---@param id1 integer|string premier nœud
---@param id2 integer|string second nœud
---@return table|nil  poutre créée
function jbeam_utils.addBeam(vehicle, id1, id2) end

--- Ajoute une poutre entre deux nœuds existants avec les options copiées, plus cid, id1, id2 (cid des nœuds) et beamType. Avec id3, crée une poutre en L (BEAM_LBEAM). Renvoie nil avec un avertissement si un nœud est introuvable.
---Source : lua/common/jbeam/utils.lua:51
---@param vehicle table véhicule en construction
---@param id1 integer|string|nil premier nœud (clé dans vehicle.nodes ; nil = options.id1)
---@param id2 integer|string|nil second nœud (nil = options.id2)
---@param beamType integer type de poutre (0 normale, 1 anisotrope, 3 pressurisée, 7 soutien… valeurs du moteur C)
---@param options table|nil options de la poutre (beamSpring, beamDamp, beamStrength…)
---@param id3 integer|string|nil troisième nœud pour une poutre en L
---@return table|nil  poutre créée (avec cid), nil si échec
function jbeam_utils.addBeamWithOptions(vehicle, id1, id2, beamType, options, id3) end

--- addNodeWithOptions avec les options globales du véhicule (vehicle.options).
---Source : lua/common/jbeam/utils.lua:47
---@param vehicle table véhicule en construction
---@param pos vec3 position
---@param ntype integer type de nœud
---@return integer  cid du nœud créé
function jbeam_utils.addNode(vehicle, pos, ntype) end

--- Ajoute un nœud au véhicule (table.insert dans vehicle.nodes) avec les champs de `options` copiés, plus cid, pos et ntype.
---Source : lua/common/jbeam/utils.lua:29
---@param vehicle table véhicule en construction
---@param pos vec3 position du nœud
---@param ntype integer type de nœud (0 = NORMALTYPE, valeurs du moteur C)
---@param options table|nil options à copier dans le nœud (nodeWeight, collision, group…)
---@return integer  cid du nœud créé
function jbeam_utils.addNodeWithOptions(vehicle, pos, ntype, options) end

--- Prépare un rotator (roue sans pneu) : frictionCoef vaut 1 par défaut ; collecte les nœuds des groupes _group_nodes et _rotatorGroup_nodes dans wheel.nodes (références vers vehicle.nodes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/utils.lua:104
---@param vehicle table véhicule en construction
---@param wheelKey integer indice du rotator (non utilisé)
---@param wheel table définition du rotator (modifiée)
function jbeam_utils.addRotator(vehicle, wheelKey, wheel) end

--- Position et rotation (degrés, rx/ry/rz) d'un flexbody après application des transformations nodeRotate/nodeOffset/nodeMove. Sans transformation (opCount == 0) ne renvoie rien (nil). Sans rotation, renvoie seulement x, y, z décalés.
---Source : lua/common/jbeam/utils.lua:281
---@param jbeamData table bloc jbeam avec les opérations
---@param x number x
---@param y number y
---@param z number z
---@param rx number rotation x (degrés)
---@param ry number rotation y (degrés)
---@param rz number rotation z (degrés)
---@return number|nil  x
---@return number|nil  y
---@return number|nil  z
---@return number|nil  rx (degrés), seulement s'il y a une rotation
---@return number|nil  ry
---@return number|nil  rz
function jbeam_utils.getFlexbodyPosRotAfterNodeRotateOffsetMove(jbeamData, x, y, z, rx, ry, rz) end

--- Position (x, y, z) après application des transformations nodeRotate / nodeOffset / nodeMove contenues dans jbeamData. Sans transformation, renvoie x, y, z inchangés.
---Source : lua/common/jbeam/utils.lua:267
---@param jbeamData table bloc jbeam contenant les clés nodeRotateN / nodeOffsetN / nodeMoveN
---@param x number x d'origine
---@param y number y d'origine
---@param z number z d'origine
---@return number  x transformé
---@return number  y transformé
---@return number  z transformé
function jbeam_utils.getPosAfterNodeRotateOffsetMove(jbeamData, x, y, z) end

--- Opération inverse : retrouve la position et la rotation d'origine (avant nodeRotate/nodeOffset/nodeMove) à partir de valeurs transformées. Teste les signes de x (1, 0, puis -1) car nodeOffset dépend du signe de posX.
---Source : lua/common/jbeam/utils.lua:300
---@param jbeamData table bloc jbeam avec les opérations
---@param x number x transformé
---@param y number y transformé
---@param z number z transformé
---@param rx number rotation x (degrés)
---@param ry number rotation y (degrés)
---@param rz number rotation z (degrés)
---@return number  x d'origine
---@return number  y d'origine
---@return number  z d'origine
---@return number  rx d'origine
---@return number  ry d'origine
---@return number  rz d'origine
function jbeam_utils.getPosRotBeforeNodeRotateOffsetMove(jbeamData, x, y, z, rx, ry, rz) end

--- Réserve le prochain identifiant : renvoie vehicle.maxIDs[name] (0 si nil) puis incrémente le compteur.
---Source : lua/common/jbeam/utils.lua:23
---@param vehicle table véhicule en construction (doit avoir maxIDs)
---@param name string nom du compteur ('nodes', 'beams', 'wheels'…)
---@return integer  identifiant réservé (cid)
function jbeam_utils.increaseMax(vehicle, name) end

--- Décode la valeur en tête d'un string.buffer SANS la consommer (buf:peekdecode()).
---Source : lua/common/jbeam/utils.lua:343
---@param buf string.buffer buffer produit par stringBufferEncode
---@return any  valeur décodée
function jbeam_utils.stringBufferDecode(buf) end

--- Encode data avec string.buffer (buf:encode) dans un nouveau buffer et le renvoie (format binaire LuaJIT).
---Source : lua/common/jbeam/utils.lua:337
---@param data any valeur encodable
---@return string.buffer  buffer contenant les données encodées
function jbeam_utils.stringBufferEncode(data) end

return jbeam_utils
