---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/searchUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de recherche.
---@class editor_util_searchUtil_C
local editor_util_searchUtil_C = {}

--- Dessine un combo imgui avec champ de recherche, bouton X et liste filtrée (140 px de haut, mise à l'échelle UI). Renvoie l'élément cliqué.
---Source : lua/ge/extensions/editor/util/searchUtil.lua:131
---@param im table Module imgui.
---@param string_label string Libellé/identifiant.
---@param string_preview_value string|nil Texte affiché, défaut « (None Selected) ».
---@param elementsAsList string[] Candidats.
---@param ImGuiComboFlags_flags integer|nil Drapeaux du combo.
---@return string|nil  Élément choisi, sinon nil.
function editor_util_searchUtil_C:beginSearchableSimpleCombo(im, string_label, string_preview_value, elementsAsList, ImGuiComboFlags_flags) end

--- Calcule frecency et finalScore de chaque résultat, trie (finalScore décroissant) et renvoie la liste.
---Source : lua/ge/extensions/editor/util/searchUtil.lua:77
---@return table  Résultats triés.
function editor_util_searchUtil_C:finishSearch() end

--- Renvoie la table de frecency.
---Source : lua/ge/extensions/editor/util/searchUtil.lua:98
---@return table|nil  Données de frecency.
function editor_util_searchUtil_C:getFrecencyData() end

--- Score de récence entre 0 et 1 (0 si inconnu).
---Source : lua/ge/extensions/editor/util/searchUtil.lua:122
---@param fId any Identifiant frecency.
---@return number  1/1.25^(secondes/86400).
function editor_util_searchUtil_C:getFrecencyScore(fId) end

--- Installe la fonction de score et de départage par défaut (par nom) et frecencyWeight = 0.5.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/searchUtil.lua:48
function editor_util_searchUtil_C:init() end

--- Évalue un élément : écrit elem.score et l'ajoute aux résultats si le score est > 0.
---Source : lua/ge/extensions/editor/util/searchUtil.lua:69
---@param elem table Élément (name, frecencyId…).
---@param scoringFunction function|nil Fonction de score ponctuelle.
function editor_util_searchUtil_C:queryElement(elem, scoringFunction) end

--- Définit la table frecencyId -> horodatage.
---Source : lua/ge/extensions/editor/util/searchUtil.lua:94
---@param frecencyData table Données de frecency.
function editor_util_searchUtil_C:setFrecencyData(frecencyData) end

--- Remplace la fonction de départage (a, b) -> boolean utilisée à score final égal.
---Source : lua/ge/extensions/editor/util/searchUtil.lua:59
---@param fun function Comparateur.
function editor_util_searchUtil_C:setSameScoreResolvingFunction(fun) end

--- Remplace la fonction de score (element, match) -> number.
---Source : lua/ge/extensions/editor/util/searchUtil.lua:55
---@param fun function Renvoie un score ; > 0 garde l'élément.
function editor_util_searchUtil_C:setScoringFunction(fun) end

--- Démarre une recherche : vide les résultats, mémorise la chaîne cherchée et oublie l'annulation de frecency.
---Source : lua/ge/extensions/editor/util/searchUtil.lua:63
---@param matchString string Texte recherché.
function editor_util_searchUtil_C:startSearch(matchString) end

--- Marque un identifiant comme utilisé maintenant (os.time()). Si la mise à jour précédente date de 10 s ou moins, elle est d'abord annulée.
---Source : lua/ge/extensions/editor/util/searchUtil.lua:103
---@param fId any Identifiant frecency ; ignoré si nil.
function editor_util_searchUtil_C:updateFrecencyEntry(fId) end

--- Champs de fonction posés sur l'instance par init.
---@class editor_util_searchUtil_self
local editor_util_searchUtil_self = {}

--- Départage par défaut : a.name < b.name.
---Source : lua/ge/extensions/editor/util/searchUtil.lua:43
---@param a table Élément.
---@param b table Élément.
---@return boolean  Vrai si a passe avant b.
function editor_util_searchUtil_self.sameScoreResolvingFunction(a, b) end

--- Score par défaut : matchStringScore(element.name, match).
---Source : lua/ge/extensions/editor/util/searchUtil.lua:38
---@param element table Élément avec name.
---@param match string Texte cherché.
---@return number  Score.
function editor_util_searchUtil_self.scoringFunction(element, match) end

