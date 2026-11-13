---@meta
-- tim19Atlas stub generated from lua/common/libs/binaryheap/binaryheap.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- binaryheap : bibliothèque tierce (Lua binary heap, utilisée notamment par copas pour ses minuteries) implémentant un tas binaire (file de priorité). Deux familles : « plain heap » (minHeap/maxHeap, gérés par position, valeurs dans heap.values) et « unique heap » (minUnique/maxUnique, chaque élément a une charge `payload` unique retrouvée en O(1) via heap.reverse). Le module renvoie la table M.
--- Accès : `require("libs/binaryheap/binaryheap")`
---@class libs_binaryheap_binaryheap
local libs_binaryheap_binaryheap = {}

--- Cœur de toutes les files : construit un tas à partir de fonctions de swap, d'effacement et de comparaison. Renvoie une table avec les méthodes bubbleUp(pos) et sinkDown(pos) et les listes values et payloads.
---Source : lua/common/libs/binaryheap/binaryheap.lua:58
---@param swap function swap(heap, idx1, idx2) échange deux éléments
---@param erase function erase(heap, position) suppression brute
---@param lt function lt(a, b) vrai quand a doit être au-dessus de b
---@return table  Tas de base
function libs_binaryheap_binaryheap.binaryHeap(swap, erase, lt) end

--- Crée un tas simple dont la plus grande valeur est au sommet.
---Source : lua/common/libs/binaryheap/binaryheap.lua:227
---@param gt function|nil Comparaison « supérieur à » (défaut a > b)
---@return table  Le tas
function libs_binaryheap_binaryheap.maxHeap(gt) end

--- Crée un tas à payloads uniques, plus grande valeur au sommet.
---Source : lua/common/libs/binaryheap/binaryheap.lua:396
---@param gt function|nil Comparaison (défaut a > b)
---@return table  Le tas
function libs_binaryheap_binaryheap.maxUnique(gt) end

--- Crée un tas simple dont la plus petite valeur est au sommet.
---Source : lua/common/libs/binaryheap/binaryheap.lua:217
---@param lt function|nil Comparaison « inférieur à » (défaut a < b)
---@return table  Le tas
function libs_binaryheap_binaryheap.minHeap(lt) end

--- Crée un tas à payloads uniques, plus petite valeur au sommet.
---Source : lua/common/libs/binaryheap/binaryheap.lua:382
---@param lt function|nil Comparaison (défaut a < b)
---@return table  Le tas
function libs_binaryheap_binaryheap.minUnique(lt) end

--- Méthodes des tas créés par minHeap/maxHeap (par position) et minUnique/maxUnique (par payload). Pour un unique heap, les paramètres désignés payload remplacent les positions.
---@class libs_binaryheap_binaryheap_h
local libs_binaryheap_binaryheap_h = {}

--- Insère un élément. Sur un unique heap, lève une erreur si le payload existe déjà.
---Source : lua/common/libs/binaryheap/binaryheap.lua:267
---@param value any Valeur de tri
---@param payload any Charge associée (unique heap)
function libs_binaryheap_binaryheap_h:insert(value, payload) end

--- Renvoie le sommet sans le retirer.
---Source : lua/common/libs/binaryheap/binaryheap.lua:307
---@return any  Payload (unique heap), puis valeur ; nil si vide
function libs_binaryheap_binaryheap_h:peek() end

--- Renvoie la valeur du sommet sans le retirer (unique heap).
---Source : lua/common/libs/binaryheap/binaryheap.lua:321
---@return any  Valeur du sommet ou nil
function libs_binaryheap_binaryheap_h:peekValue() end

--- Retire et renvoie le sommet du tas.
---Source : lua/common/libs/binaryheap/binaryheap.lua:295
---@return any  Payload (unique heap), puis valeur ; nil si vide
function libs_binaryheap_binaryheap_h:pop() end

--- Retire un élément du tas.
---Source : lua/common/libs/binaryheap/binaryheap.lua:280
---@param payload any Payload (unique heap) ou position (plain heap)
---@return any  Valeur retirée, puis payload (unique) ; nil si introuvable
function libs_binaryheap_binaryheap_h:remove(payload) end

--- Nombre d'éléments du tas.
---Source : lua/common/libs/binaryheap/binaryheap.lua:338
---@return integer  Taille
function libs_binaryheap_binaryheap_h:size() end

--- Change la valeur d'un élément et le replace dans le tas.
---Source : lua/common/libs/binaryheap/binaryheap.lua:257
---@param payload any Payload (unique heap) ou position (plain heap)
---@param newValue any Nouvelle valeur
function libs_binaryheap_binaryheap_h:update(payload, newValue) end

--- Renvoie la valeur associée à un payload (unique heap).
---Source : lua/common/libs/binaryheap/binaryheap.lua:330
---@param payload any Payload recherché
---@return any  Valeur ou nil
function libs_binaryheap_binaryheap_h:valueByPayload(payload) end

--- Méthodes de bas niveau du tas de base (déduit du code : swap et erase passés à binaryHeap).
---@class libs_binaryheap_binaryheap_heap
local libs_binaryheap_binaryheap_heap = {}

--- Efface brutalement l'élément à la position pos.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/binaryheap/binaryheap.lua:195
---@param pos integer Position
function libs_binaryheap_binaryheap_heap:erase(pos) end

--- Échange les éléments aux positions a et b.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/libs/binaryheap/binaryheap.lua:191
---@param a integer Position
---@param b integer Position
function libs_binaryheap_binaryheap_heap:swap(a, b) end

return libs_binaryheap_binaryheap
