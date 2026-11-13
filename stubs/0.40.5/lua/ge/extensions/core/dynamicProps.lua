---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/dynamicProps.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Remplace à la volée des objets de la forêt (théForest) par de vrais véhicules « props » physiques (ex. lampadaire, poubelle) quand le joueur s'en approche, pour qu'ils puissent être heurtés et déformés. Un pool de véhicules désactivés est créé ; à chaque image, les emplacements de forêt les plus proches du joueur (dans spawnInViewRange) reçoivent un véhicule du pool et l'objet de forêt est déplacé sous la carte (z = -999) ; les emplacements trop loin sont rendus à la forêt. Module expérimental : il contient des appels dump() de débogage.
--- Accès : extension `core_dynamicProps` : `extensions.load("core_dynamicProps")`, puis la globale `core_dynamicProps`
---@class core_dynamicProps
core_dynamicProps = {}

--- Crée un gestionnaire de props dynamiques : indexe les objets de forêt portant forestItemName dans un quadtree, spawne poolSize véhicules désactivés (setActive(0)), recharge la collision (be:reloadCollision) et l'ajoute à la liste mise à jour par onUpdate.
---Source : lua/ge/extensions/core/dynamicProps.lua:91
---@param data table forestItemName, propName, poolSize, spawnInViewRange, spawnOffset, name, artifacts (voir notes). Une table vide est refusée (journal d'erreur, aucun objet créé).
function core_dynamicProps.createDynamicProps(data) end

--- Hook par image : mémorise la position de la caméra et du joueur 0, puis met à jour chaque gestionnaire (échange objets de forêt <-> props).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/dynamicProps.lua:278
function core_dynamicProps.onUpdate() end

--- Renvoie tous les objets de forêt échangés à leur place, supprime les véhicules props du pool et recharge la collision (voir notes sur l'état conservé).
---Source : lua/ge/extensions/core/dynamicProps.lua:286
function core_dynamicProps.unloadAll() end

--- Préréglage pour West Coast USA : remplace « postbox_blue » par le véhicule « trashbin » (pool 9, portée 150 m).
---Source : lua/ge/extensions/core/dynamicProps.lua:306
function core_dynamicProps.westCoastBin() end

--- Préréglage pour West Coast USA : remplace « pole_city1 » par le véhicule « streetlight » (pool 1, portée 100 m, décalage z -0.22).
---Source : lua/ge/extensions/core/dynamicProps.lua:296
function core_dynamicProps.westCoastPole() end

--- Un gestionnaire (pool) de props dynamiques pour un type d'objet de forêt. Champs : name, forestItemName, propName, poolSize, spawnInViewRange, spawnOffset, props (table<vehId, boolean> : true = utilisé), locationsInfo (liste d'emplacements {forestItem, switched, originPos, distance, linkedPropId, id}), forestQt (quadtree).
---@class core_dynamicProps_DynamicProps
local core_dynamicProps_DynamicProps = {}

--- Texte « Pool name : ... Forest item : ... Prop Item : ... ».
---Source : lua/ge/extensions/core/dynamicProps.lua:63
function core_dynamicProps_DynamicProps:__tostring() end

--- Remet le véhicule à neuf (resetBrokenFlexMesh), le désactive et rend l'objet de forêt à sa position d'origine.
---Source : lua/ge/extensions/core/dynamicProps.lua:164
---@param locationInfo table emplacement actuellement échangé
function core_dynamicProps_DynamicProps:despawnProp(locationInfo) end

--- Cherche l'objet « theForest », liste ses items dont le nom de donnée vaut forestItemName et construit le quadtree des emplacements (journal si pas de forêt).
---Source : lua/ge/extensions/core/dynamicProps.lua:111
function core_dynamicProps_DynamicProps:findForestItems() end

--- Prend le premier véhicule libre du pool et le marque utilisé.
---Source : lua/ge/extensions/core/dynamicProps.lua:139
---@return integer|nil  id du véhicule, nil si le pool est épuisé
function core_dynamicProps_DynamicProps:getFirstPropAvailable() end

--- Constructeur ; renvoie nil (journal d'erreur) si data est vide.
---Source : lua/ge/extensions/core/dynamicProps.lua:67
---@param data table mêmes clés que createDynamicProps
---@return DynamicProps|nil  objet créé
function core_dynamicProps_DynamicProps:new(data) end

--- Choisit les emplacements dans la portée du joueur, les trie par distance, rend à la forêt ceux qui sortent de portée ou excèdent le pool, et donne un véhicule aux plus proches.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/dynamicProps.lua:178
function core_dynamicProps_DynamicProps:onUpdate() end

--- Cache l'objet de forêt (le déplace sous la carte), active le véhicule et le place à la position d'origine + spawnOffset avec la rotation de l'objet de forêt.
---Source : lua/ge/extensions/core/dynamicProps.lua:149
---@param locationInfo table emplacement de locationsInfo
---@param propId integer id du véhicule du pool
function core_dynamicProps_DynamicProps:spawnProp(locationInfo, propId) end

--- Spawne poolSize véhicules propName (nommés propName..i, désactivés, sans entrer dedans) et les marque libres.
---Source : lua/ge/extensions/core/dynamicProps.lua:99
function core_dynamicProps_DynamicProps:spawnProps() end

--- Rend tous les emplacements échangés puis supprime les véhicules du pool (retire aussi de l'éditeur si présent).
---Source : lua/ge/extensions/core/dynamicProps.lua:254
function core_dynamicProps_DynamicProps:unload() end

