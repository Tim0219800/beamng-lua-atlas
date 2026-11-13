---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/oneshotRaceSelector/core.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Socle commun des back-ends ui_gridSelector pour les trois sélecteurs « oneshot race » (quickraceSelector, lightRunnerSelector, busRouteSelector). Il fournit la recherche texte, la persistance des options d'affichage, des filtres vides, la construction du titre et du fil d'Ariane, et le dispatch de getDetails selon la forme du chemin (niveaux ou éléments d'un niveau : pistes/routes). Le formatage des tuiles et des détails est laissé à un « descriptor » passé à createBackend.
--- Accès : extension `ui_oneshotRaceSelector_core` : `extensions.load("ui_oneshotRaceSelector_core")`, puis la globale `ui_oneshotRaceSelector_core`
---@class ui_oneshotRaceSelector_core
ui_oneshotRaceSelector_core = {}

--- Construit un back-end gridSelector à partir d'un descriptor. Le back-end expose findLevel, findMiddle, getTiles, getFilters, getActiveFilters, getSearchText/setSearchText, getDisplayDataOptions/setDisplayDataOption/resetDisplayDataToDefaults, getScreenHeaderTitleAndPath, getDetails, getManagementDetails, executeButton, executeDoubleClick, toggleFavourite, profilerFinish et closedFromUI. Contrat du descriptor : backendName (string) ; middlePathKey ("tracks" ou "routes", path.keys[1] du niveau de détail) ; levelListTitleKey et middleListTitleKey (ids de traduction) ; getLevels() ; findLevel(levelName) optionnel (sinon recherche sur level.levelName) ; getMiddleItems(level) ; middleName(middle) ; levelDisplayName(level) et middleDisplayName(middle) (déjà traduits) ; levelToTile(level) ; middleToTile(middle, levelName) ; getLevelDetails(level) ; getMiddleDetails(middle, levelName).
---Source : lua/ge/extensions/ui/oneshotRaceSelector/core.lua:42
---@param descriptor table Table décrivant le mode (voir desc pour le contrat complet).
---@return table  Back-end utilisable par ui_gridSelector.
function ui_oneshotRaceSelector_core.createBackend(descriptor) end

--- Convertit une valeur de difficulté numérique (0-99) en libellé traduit (facile/moyen/difficile/très difficile) via _tr. Renvoie nil si la valeur n'est pas numérique ou hors des quatre paliers.
---Source : lua/ge/extensions/ui/oneshotRaceSelector/core.lua:23
---@param value number|string|nil Difficulté ; le palier est floor(value / 25).
---@return string|nil  Libellé traduit, ou nil.
function ui_oneshotRaceSelector_core.difficultyLabel(value) end

