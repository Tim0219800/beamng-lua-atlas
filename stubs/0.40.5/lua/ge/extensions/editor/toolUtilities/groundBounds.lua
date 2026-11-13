---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/groundBounds.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Répond aux questions que tout outil de l'éditeur posant une surface sur un contour dessiné au sol doit se poser : qu'est-ce qui est déjà là (routes, jonctions, bâtiments, terrains d'autres outils), que reste-t-il du contour une fois ces obstacles soustraits, et quels côtés sont coupés ou affleurants. Fait aussi l'inverse : publier ce que l'outil occupe. S'appuie sur groundClaims, networkState, polyBool et geom.
--- Accès : extension `editor_toolUtilities_groundBounds` : `extensions.load("editor_toolUtilities_groundBounds")`, puis la globale `editor_toolUtilities_groundBounds`
---@class editor_toolUtilities_groundBounds
editor_toolUtilities_groundBounds = {}

--- Soustrait les obstacles du contour et renvoie les morceaux restants à traiter un par un. Chaque morceau est { ring, holes, cut, flush } : cut[i] vrai si le côté i vient d'une soustraction (route ou bâtiment de l'autre côté), flush[i] vrai s'il touche un terrain déjà posé par un autre outil (jonction ouverte).
---Source : lua/ge/extensions/editor/toolUtilities/groundBounds.lua:122
---@param ring table Contour (au moins 3 points) ; sinon renvoie {}.
---@param obs table[]|nil Obstacles (résultat de obstacles) ; sans obstacle, un seul morceau égal au contour.
---@param owner any Propriétaire à exclure.
---@param site any|nil Étiquette de site ignorée.
---@return table[]  Liste de morceaux { ring, holes, cut, flush }.
function editor_toolUtilities_groundBounds.clip(ring, obs, owner, site) end

--- Renvoie le plus grand morceau (par aire absolue), pour un outil qui ne pose qu'UNE chose sur son contour.
---Source : lua/ge/extensions/editor/toolUtilities/groundBounds.lua:157
---@param areas table[]|nil Morceaux issus de clip.
---@return table|nil  Le plus grand morceau, ou nil.
function editor_toolUtilities_groundBounds.largest(areas) end

--- Liste ce que owner ne doit pas paver près de ce contour : surfaces de route et jonctions (networkState.surfaces, avec au moins 0.10 m de marge) et revendications des autres outils. Renvoie aussi une seconde liste où les routes sont agrandies de 0.6 m, pour y placer des éléments en retrait.
---Source : lua/ge/extensions/editor/toolUtilities/groundBounds.lua:40
---@param ring table Contour du site (points {x, y}).
---@param owner any Nom du propriétaire à exclure.
---@param site any|nil Dossier (étiquette) du site en édition : là où une copie existe déjà, elle est le contour et non un obstacle.
---@param roadMargin number|nil Marge de route supérieure au défaut.
---@return table[]  Anneaux obstacles.
---@return table[]  Mêmes obstacles, routes agrandies de 0.6 m.
function editor_toolUtilities_groundBounds.obstacles(ring, owner, site, roadMargin) end

--- Indique sur quel morceau tombe un point (dans l'anneau et hors de ses trous), ou nil s'il n'est sur aucun.
---Source : lua/ge/extensions/editor/toolUtilities/groundBounds.lua:169
---@param areas table[]|nil Morceaux issus de clip.
---@param x number X monde.
---@param y number Y monde.
---@return integer|nil  Indice du morceau dans areas, ou nil.
function editor_toolUtilities_groundBounds.pieceAt(areas, x, y) end

--- Annonce aux autres outils de terrain ce que celui-ci occupe, sans marge (groundClaims.publish avec marge 0), pour que deux surfaces contiguës se lisent comme une seule.
---Source : lua/ge/extensions/editor/toolUtilities/groundBounds.lua:184
---@param owner any Nom du propriétaire.
---@param rings table[] Anneaux occupés.
function editor_toolUtilities_groundBounds.publish(owner, rings) end

--- Empreinte de tout ce qui, hors du contour, détermine sa forme (réseau routier et revendications), pour reconstruire quand une route ou un bâtiment bouge. Calculée à chaque frame sans construire d'anneau.
---Source : lua/ge/extensions/editor/toolUtilities/groundBounds.lua:189
---@return number  networkState.sig() + groundClaims.sig() * 104729.
function editor_toolUtilities_groundBounds.sig() end

