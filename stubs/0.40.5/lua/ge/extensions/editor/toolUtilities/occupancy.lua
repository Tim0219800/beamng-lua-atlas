---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/occupancy.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Grille d'occupation 2D grossière (cellules de 1 m) partagée par l'écartement des piles de pont et celui de la végétation. Les routes (groupes à divPoints/binormales) et les jonctions sont fournies à rebuild ; le Rail Network poste ses voies et jonctions via setRail ; tout est estampillé ensemble, avec les obstacles statiques (rivières, bâtiments, clôtures, lacs), les terrains revendiqués par d'autres outils (groundClaims) et une couche propre aux plantes (setPlantKeepOut). Chaque cellule garde un propriétaire (chaîne), ou false si plusieurs se la partagent. Les requêtes (occupiedAt, transportAt, blocked, overhangAt…) répondent « y a-t-il quelque chose ici ».
--- Accès : extension `editor_toolUtilities_occupancy` : `extensions.load("editor_toolUtilities_occupancy")`, puis la globale `editor_toolUtilities_occupancy`
---@class editor_toolUtilities_occupancy
editor_toolUtilities_occupancy = {}

--- Vrai si une cellule de l'empreinte alignée sur les axes appartient à un propriétaire hors du cluster. pass(owner), si fourni, laisse passer d'autres propriétaires.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:629
---@param cluster table Cluster (avec _pierAllow mis en cache) ; voir railCluster.
---@param x number x du centre.
---@param y number y du centre.
---@param halfX number Demi-étendue en x.
---@param halfY number Demi-étendue en y.
---@param pass function|nil pass(owner) renvoie true pour tolérer ce propriétaire.
---@return boolean  true si l'empreinte est bloquée.
function editor_toolUtilities_occupancy.blocked(cluster, x, y, halfX, halfY, pass) end

--- Vrai si une cellule de BÂTIMENT (propriétaire 'b', empreinte estampillée + 1 m) se trouve dans le rayon.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:852
---@param x number x.
---@param y number y.
---@param radius number|nil Rayon (0 si nil).
---@return boolean  true si un bâtiment est présent.
function editor_toolUtilities_occupancy.buildingAt(x, y, radius) end

--- Efface l'ensemble de propriétaires autorisés mis en cache dans un cluster (_pierAllow), à appeler quand le cluster change.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:870
---@param cluster table|nil Cluster concerné.
function editor_toolUtilities_occupancy.clearClusterCache(cluster) end

--- Efface tous les obstacles statiques (rivières, bâtiments, clôtures, lacs).
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:894
function editor_toolUtilities_occupancy.clearStatics() end

--- Hauteur de la route (à son point le plus proche de x, y) ou de la jonction estampillée sous ce propriétaire ; nil pour tout autre propriétaire.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:651
---@param owner string Chaîne propriétaire.
---@param x number x.
---@param y number y.
---@return number|nil  Hauteur z.
function editor_toolUtilities_occupancy.heightAt(owner, x, y) end

--- Vrai si quelque chose est estampillé dans le rayon (tous propriétaires, couche des plantes comprise) hors souterrain : un arbre se tient sur la colline au-dessus d'un tunnel. Sert à l'écartement de la végétation.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:701
---@param x number x.
---@param y number y.
---@param radius number|nil Rayon (0 si nil).
---@return boolean  true si occupé.
function editor_toolUtilities_occupancy.occupiedAt(x, y, radius) end

--- Comme occupiedAt mais IGNORE les cellules appartenant uniquement à ownerId (le ruban de l'appelant, tronçons de tablier et de tunnel compris). Ne tient pas compte de la couche des plantes.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:725
---@param x number x.
---@param y number y.
---@param radius number|nil Rayon (0 si nil).
---@param ownerId string|nil Propriétaire à ignorer, voir ownerFor.
---@return boolean  true si autre chose occupe la zone.
function editor_toolUtilities_occupancy.occupiedAtExcluding(x, y, radius, ownerId) end

--- Vrai si le centre d'une cellule de route, de rail ou de jonction, ou une cellule CONSTRUITE de la couche des plantes, se trouve dans le rayon : ce qu'une couronne de cette largeur surplomberait ou traverserait en poussant. Un disque (et non la boîte de roadRailAt), exact sur les cellules partagées. Les blocs sans route ni construction sont sautés d'un coup, donc un point éloigné coûte quelques lectures quel que soit le rayon. Le milieu rempli d'une jonction ne marque aucun bloc, mais rien d'extérieur ne l'atteint sans traverser la peau du bord, qui en marque.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:814
---@param x number x.
---@param y number y.
---@param radius number Rayon de la couronne en mètres.
---@return boolean  true si une couronne de ce rayon surplomberait quelque chose.
function editor_toolUtilities_occupancy.overhangAt(x, y, radius) end

--- Chaîne propriétaire d'un groupe (« g » suivi de son id), à passer à occupiedAtExcluding.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:745
---@param g table Groupe (route) avec un champ id.
---@return string  Propriétaire.
function editor_toolUtilities_occupancy.ownerFor(g) end

--- Test point dans polygone en 2D (lancer de rayon, règle pair-impair).
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:248
---@param px number x du point.
---@param py number y du point.
---@param poly table Liste de sommets {x,y}.
---@return boolean  true si le point est à l'intérieur.
function editor_toolUtilities_occupancy.pointInPoly(px, py, poly) end

--- Construit le cluster de ce sous lequel les piles d'un pont ferroviaire peuvent se tenir, pour blocked : les tronçons de pont de ces voies et ces jonctions.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:881
---@param trackIds table Identifiants de voies.
---@param jctIds table Identifiants de jonctions.
---@return table  Cluster { _pierAllow = ensemble de propriétaires }.
function editor_toolUtilities_occupancy.railCluster(trackIds, jctIds) end

--- Révision du rail (0 si non enregistré). Les routes restampillent la grille elles-mêmes une fois stabilisées ; les changements du rail sont repérés à partir de cette révision.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:90
---@return integer  Révision du rail.
function editor_toolUtilities_occupancy.railRev() end

--- Restampille la grille depuis les routes et jonctions. Mémorise les entrées pour pouvoir estampiller plus tard un terrain revendiqué sans remaillage du réseau.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:472
---@param groups table Liste de groupes (routes) avec id, divPoints, binormales, divWidths, leftExtM, rightExtM, isEnabled.
---@param jcts table Liste de jonctions.
---@param clearSegs function|nil clearSegs(g, kind) renvoie le masque par segment d'une liaison (false sur ses portées de ce type, 'bridge' ou 'tunnel'), ou nil si elle n'en a pas. Fournie par le réseau qui possède les portées.
function editor_toolUtilities_occupancy.rebuild(groups, jcts, clearSegs) end

--- Compteur qui change chaque fois que la grille change : un outil qui garde des choses hors de la grille compare cette valeur au lieu de redemander pour chaque point.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:719
---@return integer  Révision de la grille.
function editor_toolUtilities_occupancy.revision() end

--- Vrai si une route ou jonction autre que celle de skip (son ownerFor, tronçons de tablier compris) est estampillée dans le rayon autour de (x, y) à une hauteur strictement comprise entre zLo et zHi.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:663
---@param x number x.
---@param y number y.
---@param radius number Rayon de recherche en mètres.
---@param zLo number Hauteur minimale.
---@param zHi number Hauteur maximale.
---@param skip string|nil Propriétaire à ignorer (ainsi que ses suffixes b et t).
---@return boolean  true si une route se trouve entre ces hauteurs.
function editor_toolUtilities_occupancy.roadBetween(x, y, radius, zLo, zHi, skip) end

--- Comme transportAt mais les CHEMINS sont ignorés : vrai seulement pour un ruban de route ou de rail 'g' ou une jonction 'j' (ou une cellule multi-propriétaire, gardée par prudence car ses propriétaires sont perdus).
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:774
---@param x number x.
---@param y number y.
---@param radius number|nil Rayon (0 si nil).
---@return boolean  true si une route, un rail ou une jonction est présent.
function editor_toolUtilities_occupancy.roadRailAt(x, y, radius) end

--- Enregistre les bâtiments (polygones remplis) comme obstacles statiques.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:891
---@param list table|nil Liste d'anneaux {x,y}.
function editor_toolUtilities_occupancy.setBuildings(list) end

--- Enregistre les clôtures, murs et haies (polylignes fines) comme obstacles statiques.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:892
---@param list table|nil Liste de polylignes {x,y}.
function editor_toolUtilities_occupancy.setFences(list) end

--- Enregistre les lacs (polygones de rivage remplis) comme obstacles statiques.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:893
---@param list table|nil Liste d'anneaux {x,y}.
function editor_toolUtilities_occupancy.setLakes(list) end

--- Source du terrain que les plantes évitent en plus du reste : get() renvoie `paved, built` où paved = { { ring = r, holes = { r, ... } }, ... } (un tronc ne peut pas s'y tenir) et built = { r, ... } (une couronne ne peut pas non plus l'atteindre). rev() change quand l'un ou l'autre change. Source unique ; voir occupiedAt et overhangAt.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:847
---@param get function Renvoie paved, built.
---@param rev function Renvoie la révision de la source.
function editor_toolUtilities_occupancy.setPlantKeepOut(get, rev) end

--- Côté Rail Network : get() renvoie ses voies (lues comme des groupes de route), ses plates-formes de jonction ({ id, pos, lines = { { pts, halfW } } }) et les clearSegs de ses voies ; rev() est incrémentée à chaque changement.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:876
---@param get function Fournit voies, jonctions et clearSegs.
---@param rev function Renvoie la révision du rail.
function editor_toolUtilities_occupancy.setRail(get, rev) end

--- Enregistre les rivières comme obstacles statiques (importeur). Remplace la liste précédente ; la liste survit à rebuild().
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:890
---@param list table|nil Liste de { pts = {{x,y},...}, halfW = n }.
function editor_toolUtilities_occupancy.setRivers(list) end

--- Vrai si une cellule de TRANSPORT (route 'g', chemin 'p', jonction 'j', ou cellule multi-propriétaire) se trouve dans le rayon.
---Source : lua/ge/extensions/editor/toolUtilities/occupancy.lua:750
---@param x number x.
---@param y number y.
---@param radius number|nil Rayon (0 si nil).
---@return boolean  true si du transport est présent.
function editor_toolUtilities_occupancy.transportAt(x, y, radius) end

