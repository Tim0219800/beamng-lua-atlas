---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/pin.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Pin de flowgraph. Champs notables : graph, id, name, type (string ou liste de types), direction ('in'/'out'), node, default, defaultValue, description, hidden, links, hardTemplates, impulse, chainFlow, tableType, pinMode, quickAccess.
---@class flowgraph_pin
local flowgraph_pin = {}

--- Dessine un pin d'entrée dans l'éditeur (icône de type, nom, valeur constante éventuelle avec cadenas).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/pin.lua:99
---@param builder any Constructeur de nœud.
---@param style table Style ImGui.
---@param alpha number Opacité.
---@param simpleDraw string Mode d'affichage ('simple' masque le nom).
---@param constValue any Valeur constante à afficher, ou nil.
---@param outWidth number Largeur de la colonne.
function flowgraph_pin:_draw_in(builder, style, alpha, simpleDraw, constValue, outWidth) end

--- Dessine un pin de sortie dans l'éditeur (nom aligné à droite puis icône).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/pin.lua:132
---@param builder any Constructeur de nœud.
---@param style table Style ImGui.
---@param alpha number Opacité.
---@param simpleDraw string Mode d'affichage.
---@param const any Non utilisé pour une sortie.
---@param outWidth number Largeur de la colonne.
function flowgraph_pin:_draw_out(builder, style, alpha, simpleDraw, const, outWidth) end

--- Calcule la largeur d'affichage du pin (icône + texte + marge).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/pin.lua:164
---@param simpleDraw any Non utilisé (le mode est lu dans les préférences).
---@return number  Largeur.
function flowgraph_pin:_getCalculatedWidth(simpleDraw) end

--- Appelé quand un lien est créé : remplace `links[1]` (entrée hors flux) ou ajoute le lien ; rend le pin visible.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/pin.lua:347
---@param link table Lien ajouté.
function flowgraph_pin:_onLink(link) end

--- Appelé quand un lien est supprimé : le retire de la liste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/pin.lua:356
---@param link table Lien retiré.
function flowgraph_pin:_onUnlink(link) end

--- Dessine le pin (selon `direction`) avec la bonne opacité, gère le clic (sélection du nœud) et mémorise le survol.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/pin.lua:262
---@param builder any Constructeur de nœud.
---@param style table Style ImGui.
---@param isHeader boolean Non utilisé dans le code.
---@param constValue any Valeur constante à afficher.
---@param outWidth number Largeur.
---@return boolean  Résultat de `isActive()`.
function flowgraph_pin:draw(builder, style, isHeader, constValue, outWidth) end

--- Affiche l'infobulle ImGui du pin : nom, type valide ou connecté, type de table et description.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/pin.lua:188
---@param mgr table Manager de flowgraph.
function flowgraph_pin:drawTooltip(mgr) end

--- Renvoie le premier lien du pin (`links[1]`), ou nil.
---Source : lua/ge/extensions/flowgraph/pin.lua:79
---@return table|nil  Premier lien.
function flowgraph_pin:getFirstConnectedLink() end

--- Si le pin est de type table (ou inclut table), renvoie `tableType` (ou 'generic') ; sinon une chaîne vide.
---Source : lua/ge/extensions/flowgraph/pin.lua:156
---@return string  Sous-type de table.
function flowgraph_pin:getTableType() end

--- Renvoie 'impulse' si le pin est une impulsion, 'chainFlow' s'il est en flux chaîné, sinon son type (utilisé pour choisir l'icône).
---Source : lua/ge/extensions/flowgraph/pin.lua:152
---@return string|table  Type d'affichage.
function flowgraph_pin:getTypeWithImpulseAndChain() end

--- Marque tous les liens du pin comme surlignés (`_highlight = true`).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/pin.lua:256
function flowgraph_pin:highlightLinks() end

--- Si le pin est survolé, surligne ses liens et affiche son infobulle.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/pin.lua:299
---@param mgr table Manager.
function flowgraph_pin:hoverDraw(mgr) end

--- Constructeur : enregistre le graphe, obtient un id unique du manager (`getNextFreePinLinkId`), stocke nom/type/direction/valeur par défaut et active le suivi d'usage de `value`. Un pin de sortie de type `delegate` reçoit `hasOutputDelegates = true`.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/pin.lua:13
---@param graph table Graphe qui contient le pin.
---@param node table Nœud propriétaire.
---@param direction string 'in' ou 'out'.
---@param type string|table Type du pin (flow, number, string, bool, vec3, quat, color, table, any…) ou liste de types.
---@param name string Nom du pin.
---@param default any Valeur par défaut.
---@param description string Texte d'aide affiché dans le tooltip.
function flowgraph_pin:init(graph, node, direction, type, name, default, description) end

--- Pendant la création d'un lien, dit si ce pin peut servir de cible (actif) ou s'il doit être grisé.
---Source : lua/ge/extensions/flowgraph/pin.lua:180
---@return boolean  true si utilisable.
function flowgraph_pin:isActive() end

--- Renvoie true si le pin a au moins un lien ou si sa valeur est codée en dur (`pinMode == 'hardcoded'`). Utilisé par certains nœuds pour sauter des calculs inutiles.
---Source : lua/ge/extensions/flowgraph/pin.lua:369
---@return boolean  true si utilisé.
function flowgraph_pin:isUsed() end

--- Menu contextuel du pin dans l'éditeur : accès rapide, masquer le pin (si sans lien), afficher/masquer ses liens, debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/pin.lua:306
---@param menuPos any Position du menu.
---@param main table Éditeur principal.
function flowgraph_pin:showContextMenu(menuPos, main) end

--- Écrit un quaternion dans `value` sous forme de table {x, y, z, w} réutilisée.
---Source : lua/ge/extensions/flowgraph/pin.lua:383
---@param v quat Quaternion source.
function flowgraph_pin:valueSetQuat(v) end

--- Écrit un vecteur dans `value` sous forme de table {x, y, z} réutilisée (sans allocation).
---Source : lua/ge/extensions/flowgraph/pin.lua:373
---@param v vec3 Vecteur source.
function flowgraph_pin:valueSetVec3(v) end

