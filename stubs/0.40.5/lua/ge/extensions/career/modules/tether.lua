---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tether.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Système de « laisses » (tethers) du mode carrière : une zone (boîte, sphère, capsule, porte ou véhicule) autour de laquelle le joueur doit rester. Quand le joueur (véhicule joueur 0, ou unicycle à pied) sort de la zone, le callback est appelé une fois et la laisse est retirée. Le hook onUpdate de l'extension n'est branché que tant qu'au moins une laisse est active.
--- Accès : extension `career_modules_tether` : `extensions.load("career_modules_tether")`, puis la globale `career_modules_tether`
---@class career_modules_tether
---@field onUpdate function Vaut nop au départ ; remplacé par la vraie boucle de vérification dès qu'une laisse est ajoutée, remis à nil quand la dernière est retirée (avec extensions.hookUpdate pour (dés)enregistrer le hook).
career_modules_tether = {}

--- Ajoute une table de laisse (avec checkfun et callback) à la liste active et active le hook onUpdate si c'est la première.
---Source : lua/ge/extensions/career/modules/tether.lua:205
---@param t table Laisse avec checkfun(t) et callback(t).
function career_modules_tether.addTether(t) end

--- Dessine une boîte translucide avec debugDrawer (faces en triangles, arêtes noires), utile pour visualiser une laisse en boîte.
---Source : lua/ge/extensions/career/modules/tether.lua:228
---@param corner vec3 Coin de la boîte.
---@param x vec3 Vecteur d'arête X.
---@param y vec3 Vecteur d'arête Y.
---@param z vec3 Vecteur d'arête Z.
---@param clr any Couleur des faces, défaut color(128,64,64,32).
function career_modules_tether.drawAxisBox(corner, x, y, z, clr) end

--- Retire une laisse de la liste sans appeler son callback. Sans effet si t est nil ou absente.
---Source : lua/ge/extensions/career/modules/tether.lua:213
---@param t table|nil Laisse retournée par un start*Tether.
function career_modules_tether.removeTether(t) end

--- Crée une laisse en boîte orientée : se déclenche quand le joueur sort de la boîte définie par le coin p1 et les vecteurs d'arêtes x1, y1, z1.
---Source : lua/ge/extensions/career/modules/tether.lua:27
---@param p1 vec3 Coin de la boîte.
---@param x1 vec3 Vecteur d'arête X.
---@param y1 vec3 Vecteur d'arête Y.
---@param z1 vec3 Vecteur d'arête Z.
---@param callback function Appelé avec la laisse quand le joueur est sorti.
---@param data any Données libres conservées dans la laisse (t.data).
---@return table  La table de la laisse (à passer à removeTether).
function career_modules_tether.startBoxTether(p1, x1, y1, z1, callback, data) end

--- Prévue pour une capsule entre un point fixe et un véhicule (p2 suit le véhicule). Voir notes : checkfun référence une fonction non définie.
---Source : lua/ge/extensions/career/modules/tether.lua:112
---@param p1 vec3 Point fixe.
---@param r1 number Rayon au point fixe.
---@param vehId integer Id du véhicule.
---@param r2 number Rayon côté véhicule.
---@param callback function Appelé quand le joueur sort.
---@param data any Données libres.
---@return table  La laisse.
function career_modules_tether.startCapsuleTetherBetweenStaticAndVehicle(p1, r1, vehId, r2, callback, data) end

--- Crée une laisse en capsule conique entre deux points fixes, le rayon variant linéairement de r1 à r2 le long du segment.
---Source : lua/ge/extensions/career/modules/tether.lua:94
---@param p1 vec3 Premier point.
---@param r1 number Rayon au premier point.
---@param p2 vec3 Second point.
---@param r2 number Rayon au second point.
---@param callback function Appelé quand le joueur sort.
---@param data any Données libres.
---@return table  La laisse.
function career_modules_tether.startCapsuleTetherBetweenStatics(p1, r1, p2, r2, callback, data) end

--- Crée une laisse en boîte à partir d'un objet de zone de la scène (door[1] = nom de l'objet), agrandie de bufferLength mètres sur chaque axe. Ne retourne rien si l'objet n'est pas trouvé.
---Source : lua/ge/extensions/career/modules/tether.lua:38
---@param door table Table dont le premier élément est le nom de l'objet de la scène.
---@param bufferLength number|nil Marge ajoutée à chaque axe, défaut 1.
---@param callback function Appelé quand le joueur sort.
---@param data any Données libres.
---@return table|nil  La laisse, ou nil si l'objet est introuvable.
function career_modules_tether.startDoorTether(door, bufferLength, callback, data) end

--- Crée une laisse sphérique : se déclenche quand le véhicule du joueur est à plus de r1 mètres de p1.
---Source : lua/ge/extensions/career/modules/tether.lua:63
---@param p1 vec3 Centre.
---@param r1 number Rayon en mètres.
---@param callback function Appelé quand le joueur sort.
---@param data any Données libres.
---@return table  La laisse.
function career_modules_tether.startSphereTether(p1, r1, callback, data) end

--- Crée une laisse autour d'un véhicule : se déclenche quand le joueur est à plus de radius mètres du véhicule, ou, si inverse est vrai, quand il est à moins de radius mètres.
---Source : lua/ge/extensions/career/modules/tether.lua:156
---@param vehId integer Id du véhicule suivi.
---@param radius number Rayon en mètres.
---@param inverse boolean|nil Si vrai, déclenche à l'approche plutôt qu'à l'éloignement.
---@param callback function Appelé au déclenchement.
---@return table  La laisse.
function career_modules_tether.startVehicleTether(vehId, radius, inverse, callback) end

