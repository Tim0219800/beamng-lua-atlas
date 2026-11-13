---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/forestGenerator.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Utilitaire pour créer, modifier, lister et supprimer des objets de la forêt (système Forest) du niveau chargé : arbres, buissons, rochers, etc. Au chargement, il lit l'objet forêt du niveau (core_forest.getForestObject()) et indexe les templates de ForestItemData par nom interne. Un moddeur ou un script d'éditeur s'en sert pour semer de la végétation de façon aléatoire (rectangle avec bruit bleu, ou disque) ou pour déplacer/supprimer des éléments.
--- Accès : extension `util_forestGenerator` : `extensions.load("util_forestGenerator")`, puis la globale `util_forestGenerator`
---@class util_forestGenerator
util_forestGenerator = {}

--- Supprime tous les éléments de la forêt sauf les templates, puis rappelle initForest().
---Source : lua/ge/extensions/util/forestGenerator.lua:176
function util_forestGenerator.clearForest() end

--- Crée un élément de forêt à partir d'un template.
---Source : lua/ge/extensions/util/forestGenerator.lua:57
---@param itemType string Nom interne du template (voir getForestItemTypes)
---@param pos vec3|nil Position monde (défaut vec3())
---@param rotDeg number|nil Rotation en degrés autour de Z (défaut 0)
---@param scl number|nil Échelle uniforme (défaut 1)
---@return userdata|nil  Élément créé, ou nil si le template n'existe pas (erreur loguée)
function util_forestGenerator.createForestItem(itemType, pos, rotDeg, scl) end

--- Crée amount éléments aléatoires dans un disque de rayon radius autour de pos (getRandomPointInCircle).
---Source : lua/ge/extensions/util/forestGenerator.lua:109
---@param itemTypeArray string[]|nil Types possibles (défaut : tous les templates)
---@param amount integer Nombre d'éléments à créer
---@param pos vec3|nil Centre du disque (défaut 0,0,0)
---@param radius number|nil Rayon en mètres (défaut 50)
---@param rotSteps number|nil Nombre de pas de rotation sur 360° (défaut 360)
---@param minScl number|nil Échelle minimale (défaut 0.75)
---@param maxScl number|nil Échelle maximale (défaut 1.25)
---@return table  Liste des éléments créés
function util_forestGenerator.createRandomForestRadial(itemTypeArray, amount, pos, radius, rotSteps, minScl, maxScl) end

--- Crée amount éléments aléatoires dans un rectangle autour de pos. Les positions XY suivent un bruit bleu (getBlueNoise2d), le type est choisi au hasard dans itemTypeArray, la rotation par pas, l'échelle entre minScl et maxScl.
---Source : lua/ge/extensions/util/forestGenerator.lua:68
---@param itemTypeArray string[]|nil Types possibles (défaut : tous les templates)
---@param amount integer Nombre d'éléments à créer
---@param pos vec3|nil Centre de référence (défaut 0,0,0)
---@param minX number|nil Décalage minimal en X par rapport à pos (défaut -100)
---@param maxX number|nil Décalage maximal en X (défaut 100)
---@param minY number|nil Décalage minimal en Y (défaut -100)
---@param maxY number|nil Décalage maximal en Y (défaut 100)
---@param rotSteps number|nil Nombre de pas de rotation sur 360° (défaut 360, minimum 1)
---@param minScl number|nil Échelle minimale (défaut 0.75)
---@param maxScl number|nil Échelle maximale (défaut 1.25)
---@return table  Liste des éléments créés
function util_forestGenerator.createRandomForestRect(itemTypeArray, amount, pos, minX, maxX, minY, maxY, rotSteps, minScl, maxScl) end

--- Supprime un élément de la forêt.
---Source : lua/ge/extensions/util/forestGenerator.lua:171
---@param item userdata Élément à supprimer
function util_forestGenerator.deleteForestItem(item) end

--- Renvoie le dictionnaire nom interne -> élément template.
---Source : lua/ge/extensions/util/forestGenerator.lua:52
---@return table<string, userdata>  Templates
function util_forestGenerator.getForestItemDict() end

--- Renvoie la liste triée des noms internes des templates de forêt.
---Source : lua/ge/extensions/util/forestGenerator.lua:47
---@return string[]  Types d'éléments
function util_forestGenerator.getForestItemTypes() end

--- Renvoie les éléments situés dans un polygone 2D (projeté sur XY) ; sans polygone, renvoie tous les éléments.
---Source : lua/ge/extensions/util/forestGenerator.lua:148
---@param polygon vec3[]|nil Sommets du polygone
---@return table  Éléments de forêt
function util_forestGenerator.getForestItemsPolygon(polygon) end

--- Renvoie les éléments situés dans un cercle autour d'une position.
---Source : lua/ge/extensions/util/forestGenerator.lua:164
---@param pos vec3|nil Centre (défaut : position de la caméra)
---@param radius number|nil Rayon en mètres (défaut 20)
---@return table  Éléments de forêt
function util_forestGenerator.getForestItemsRadius(pos, radius) end

--- (Ré)initialise forestData depuis l'objet forêt du niveau, reconstruit le dictionnaire des templates par nom interne et la liste triée des types. Avertit (log W) si le niveau ou l'objet forêt est absent.
---Source : lua/ge/extensions/util/forestGenerator.lua:23
function util_forestGenerator.initForest() end

--- Met à jour la position, la rotation Z et l'échelle d'un élément existant (forestData:updateItem).
---Source : lua/ge/extensions/util/forestGenerator.lua:141
---@param item userdata Élément de forêt existant
---@param pos vec3 Nouvelle position
---@param rotDeg number|nil Rotation Z en degrés (défaut 0)
---@param scl number|nil Échelle (défaut 1)
---@return userdata  Élément mis à jour (retour de updateItem)
function util_forestGenerator.updateForestItem(item, pos, rotDeg, scl) end

