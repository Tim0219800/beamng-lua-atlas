---@meta
-- tim19Atlas stub generated from lua/objectpool/main.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Métatable de _G : la lecture d'une globale absente est cherchée dans objData.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/objectpool/main.lua:100
---@param t table _G
---@param key any nom de la globale
---@return any  valeur trouvée dans objData, ou nil
function __indexHandler(t, key) end

--- Métatable de _G : une affectation de globale est stockée dans objData au lieu de _G.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/objectpool/main.lua:96
---@param t table _G
---@param key any nom de la globale
---@param val any valeur
function __newIndexHandler(t, key, val) end

--- Sélectionne l'objet courant : pose les globales obj, objectId et objData (= objPool[objId]) avec rawset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/objectpool/main.lua:90
---@param objId integer identifiant de l'objet
---@param _obj any handle moteur de l'objet
function _setObj(objId, _obj) end

--- Supprime l'objet du pool.
---Source : lua/objectpool/main.lua:40
---@param objId integer identifiant de l'objet
function deleteObject(objId) end

--- Retourne l'objet du pool encodé en chaîne lpack, sans le retirer.
---Source : lua/objectpool/main.lua:24
---@param objId integer identifiant de l'objet
---@return string  données encodées
function getObject(objId) end

--- Appelée dans la VM Lua de l'objet : décode initData (lpack), charge le véhicule avec jbeam/stage2 (loadVehicleStage2) et le range dans objPool[obj:getId()] = {v = objet}. Journalise une erreur et retourne false (décharge la Lua) si les données sont invalides.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/objectpool/main.lua:49
---@param path string chemin de l'objet (non utilisé)
---@param initData string données de spawn encodées par lpack, avec un champ vdata
---@return boolean  vrai si l'objet est chargé, faux sinon
function init(path, initData) end

--- Initialisation de la VM « thread » du pool ; ne fait rien.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/objectpool/main.lua:45
function initPool() end

--- Retourne l'objet encodé et le retire du pool (transfert vers une autre VM).
---Source : lua/objectpool/main.lua:28
---@param objId integer identifiant de l'objet
---@return string  données encodées
function moveObject(objId) end

--- Hook appelé par le moteur quand une poutre casse ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/objectpool/main.lua:81
---@param id integer identifiant de la poutre
---@param energy number énergie de la rupture
function onBeamBroke(id, energy) end

--- Hook appelé par le moteur quand une poutre se déforme ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/objectpool/main.lua:84
---@param id integer identifiant de la poutre
---@param ratio number taux de déformation
function onBeamDeformed(id, ratio) end

--- Hook de collision de nœud appelé par le moteur ; corps vide dans cette VM.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/objectpool/main.lua:74
---@param id1 integer identifiant du nœud
---@param pos any position du contact (déduit du code)
---@param normal any normale du contact
---@param nodeVel any vitesse du nœud
---@param perpendicularVel any vitesse perpendiculaire
---@param slipVec any vecteur de glissement
---@param slipVel number vitesse de glissement
---@param slipForce number force de glissement
---@param normalForce number force normale
---@param depth number profondeur de pénétration
---@param materialId1 integer matériau du nœud
---@param materialId2 integer matériau de l'autre surface
function onNodeCollision(id1, pos, normal, nodeVel, perpendicularVel, slipVec, slipVel, slipForce, normalForce, depth, materialId1, materialId2) end

--- Hook appelé par le moteur lors d'un reset ; corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/objectpool/main.lua:78
---@param retainDebug boolean indicateur de conservation du debug (non utilisé)
function onVehicleReset(retainDebug) end

--- Remplace print : écrit dans le journal avec le niveau 'A' et le tag 'print'. Seul le premier argument est converti (tostring(...)).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/objectpool/main.lua:18
---@param ... any
function print(...) end

--- Décode une chaîne lpack et la range dans le pool sous objId.
---Source : lua/objectpool/main.lua:35
---@param objId integer identifiant de l'objet
---@param objDataStr string données encodées par lpack
function setObject(objId, objDataStr) end

---@type vec3
float3 = nil
---@type table
objData = nil
---@type string
vmType = nil
