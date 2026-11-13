---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/foliageScatter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Moteur de plantation de végétation (objets Forest, ForestItemData) pour les outils de l'éditeur. Il disperse des instances dans un polygone (scatterArea, avec espacement type Poisson), le long d'une ligne (scatterLine) ou sur des points précis (scatterPoints), pose chaque plante sur le terrain (core_terrain.getTerrainHeight) en retirant le plancher du mesh, et gère le retrait, la mise en attente pendant une sauvegarde de niveau (lift/relay) et le re-calage sur le terrain (redrape).
--- Accès : extension `editor_toolUtilities_foliageScatter` : `extensions.load("editor_toolUtilities_foliageScatter")`, puis la globale `editor_toolUtilities_foliageScatter`
---@class editor_toolUtilities_foliageScatter
editor_toolUtilities_foliageScatter = {}

--- Enregistre un fournisseur de listes d'items pour le re-calage au terrain : fn(out) doit ajouter à out chaque liste d'items (un slot peut être false). Sert aux outils dont les plantes doivent rester posées sur le sol quand il bouge.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:602
---@param fn function Fonction fn(out) qui ajoute ses listes à out.
function editor_toolUtilities_foliageScatter.addDraped(fn) end

--- Comme defaultSpeciesSelection mais orientée arbuste : première espèce dont le nom contient bush, shrub, fern, hedge, flower, plant, grass ou reed, sinon la première de la liste.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:124
---@return table<string, boolean>  Ensemble { nom = true }.
function editor_toolUtilities_foliageScatter.defaultShrubSelection() end

--- Choisit une sélection d'espèces par défaut parmi celles du niveau : la première trouvée parmi tree_oak_forest_a, tree_beech_forest_a, tree_aspen_forest_a, sinon la première espèce de la liste.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:111
---@return table<string, boolean>  Ensemble { nom = true } (vide si le niveau n'a aucune espèce).
function editor_toolUtilities_foliageScatter.defaultSpeciesSelection() end

--- Renvoie l'objet Forest du niveau et ses données, en créant un Forest vide si le niveau n'en a pas. En cas d'échec, journalise une erreur et renvoie nil, nil.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:81
---@return userdata|nil  Objet Forest.
---@return userdata|nil  ForestData (forest:getData()).
function editor_toolUtilities_foliageScatter.ensureForest() end

--- Renvoie l'ordre stable des classes pour l'interface : forest, dense, sparse, shrub, orchard.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:545
---@return string[]  Noms de classes.
function editor_toolUtilities_foliageScatter.getClassOrder() end

--- Renvoie la table des presets par classe (forest, dense, sparse, shrub, orchard) avec spacingM et scaleVariance. C'est la table interne, non copiée.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:542
---@return table<string, table>  Presets.
function editor_toolUtilities_foliageScatter.getClassPresets() end

--- Renvoie une copie fraîche des paramètres de distribution par défaut, pour initialiser une nouvelle zone.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:539
---@return table  { class, spacingM, densityScale, scaleVariance, alignToNormal, slopeMaxDeg, seed }.
function editor_toolUtilities_foliageScatter.getDefaultDistribution() end

--- Rayon de couronne d'un ForestItemData à l'échelle 1 : plus grand côté horizontal de sa boîte englobante autour de l'origine, valable quelle que soit l'orientation. Plante un item temporaire pour obtenir sa boîte, puis le retire.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:70
---@param fd userdata ForestData du niveau (celui de forest:getData()).
---@param obj userdata Objet ForestItemData de l'espèce.
---@return number  Rayon en mètres, 0 si indisponible.
function editor_toolUtilities_foliageScatter.itemCrownR(fd, obj) end

--- Sort du forest la plantation vivante d'un outil avant une sauvegarde de niveau (qui écrit le forest tel quel). Mémorise donnée, transform et échelle de chaque item et conserve les emplacements. Renvoie nil s'il n'y a pas de forest.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:169
---@param lists table[] Liste de listes d'items ; un slot peut être false.
---@return table|nil  Jeton 'held' à repasser à relay.
function editor_toolUtilities_foliageScatter.lift(lists) end

--- Liste triée des noms de ForestItemData du niveau, c'est-à-dire les espèces plantables par les outils.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:96
---@return string[]  Noms triés.
function editor_toolUtilities_foliageScatter.listForestItemData() end

--- Plante un item déjà décidé (espèce, échelle, rotation, position) en le posant sur le terrain, plancher du mesh retiré. Renvoie nil si l'espèce n'existe pas dans le niveau.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:551
---@param it table { x, y, sp (nom d'espèce), s (échelle, défaut 1), rx, ry, a (angles Euler en rad, défaut 0) }.
---@param fd userdata ForestData.
---@param byName table Cache des espèces entre appels (à fournir, par exemple {}).
---@return userdata|nil  Poignée de l'item créé.
function editor_toolUtilities_foliageScatter.plantOne(it, fd, byName) end

--- Remet sur le terrain toutes les plantes enregistrées via addDraped situées dans la boîte monde donnée, si leur hauteur diffère de plus de 0.005 m. L'item déplacé est réécrit dans sa liste (updateItem).
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:606
---@param x0 number X minimal de la boîte.
---@param y0 number Y minimal.
---@param x1 number X maximal.
---@param y1 number Y maximal.
---@return integer  Nombre de plantes déplacées (0 s'il n'y a pas de forest).
function editor_toolUtilities_foliageScatter.redrape(x0, y0, x1, y1) end

--- Remet en place les items retirés par lift, dans les mêmes slots des mêmes listes (nouvelles poignées créées avec createNewItem), une fois la sauvegarde faite. Sans effet si held est nil.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:188
---@param held table|nil Résultat de lift.
function editor_toolUtilities_foliageScatter.relay(held) end

--- Retire du forest les items listés (issus d'une dispersion précédente) et vide la table items.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:159
---@param fd userdata|nil ForestData ; sans effet si nil.
---@param items table|nil Liste de poignées d'items ; les slots false sont ignorés.
function editor_toolUtilities_foliageScatter.removeItems(fd, items) end

--- Disperse des instances dans un polygone (avec trous éventuels) par candidats à faible discrépance (suite R2) filtrés par espacement minimal, pente maximale et occupation. L'espèce est tirée au hasard pondéré pour chaque instance. Renvoie ({}, 0) si l'anneau a moins de 3 points ou si aucune espèce n'est résolue.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:243
---@param params table ring (points du contour, z ignoré), holes (anneaux de trous), forestData (sinon ensureForest), species, speciesWeights, spacingM (min 0.5, défaut 6), densityScale (min 0.01), scaleVariance, scaleBase (min 0.05), alignToNormal (booléen), slopeMaxDeg (défaut 35), seed, occupiedFn, holdFn (true = l'emplacement reste dans le plan mais rien n'est planté, slot false), maxInstances, record (table remplie avec { x, y, sp, s, a, ... } de ce qui est planté).
---@return table  Liste des items placés (slots possibles à false avec holdFn).
---@return integer  Nombre d'instances placées.
function editor_toolUtilities_foliageScatter.scatterArea(params) end

--- Dispose une rangée de plantes régulièrement espacées le long d'une ligne centrale ré-échantillonnée, avec dispersion latérale optionnelle.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:372
---@param params table divPoints (ligne), binormals, forestData, species, speciesWeights, spacingM (min 0.5), posVariance (m, dispersion de position), scaleVariance, scaleBase, alignToNormal, slopeMaxDeg (défaut 89), seed, occupiedFn, maxInstances.
---@return table  Items placés.
---@return integer  Nombre d'instances placées.
function editor_toolUtilities_foliageScatter.scatterLine(params) end

--- Plante exactement une instance à chaque point monde fourni. Par défaut la plante se pose sur le terrain ; avec onPointZ elle se pose sur le z du point (+ zLift), par exemple des buissons dans un bac.
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:489
---@param params table points, forestData, species, speciesWeights, scaleVariance, scaleBase, seed, occupiedFn, onPointZ, zLift, record (voir scatterArea).
---@return table  Items placés.
---@return integer  Nombre d'instances placées.
function editor_toolUtilities_foliageScatter.scatterPoints(params) end

--- Sème un plan complet : liste de groupes d'ancrage. Un groupe avec items est planté tel quel (plantOne) ; un groupe avec points et species passe par scatterPoints (size -> scaleBase, vary -> scaleVariance, seed défaut 1, drape faux = z du point).
---Source : lua/ge/extensions/editor/toolUtilities/foliageScatter.lua:581
---@param groups table[]|nil Groupes { items } ou { points, species, speciesWeights, size, vary, seed, drape }.
---@param fd userdata|nil ForestData (sinon ensureForest).
---@return table  Tous les items plantés.
function editor_toolUtilities_foliageScatter.sowGroups(groups, fd) end

