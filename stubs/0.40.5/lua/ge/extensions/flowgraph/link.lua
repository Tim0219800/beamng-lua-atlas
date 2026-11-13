---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/link.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet lien renvoyé par le constructeur.
---@class flowgraph_link
local flowgraph_link = {}

--- Restaure l'état masqué depuis data[5].
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/link.lua:280
---@param data table données sérialisées
function flowgraph_link:__onDeserialized(data) end

--- Renvoie {sourceNode.id, sourcePin.name, targetNode.id, targetPin.name, hidden}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/link.lua:270
---@return table  données du lien
function flowgraph_link:__onSerialize() end

--- Transforme les liens partant de la pin source en accès rapide nommé (voir notes) puis supprime la sélection.
---Source : lua/ge/extensions/flowgraph/link.lua:233
function flowgraph_link:convertToQuickAccess() end

--- Demande une animation de flux à la prochaine frame de dessin.
---Source : lua/ge/extensions/flowgraph/link.lua:182
function flowgraph_link:doFlow() end

--- Dessine le lien dans l'éditeur avec animation de flux quand la pin source est active à la frame courante (jamais si le manager est arrêté, vitesse nulle en pause).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/link.lua:111
function flowgraph_link:draw() end

--- Dessine l'étiquette (nom de la pin source) au milieu d'un lien d'état.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/link.lua:186
---@param sPin table pin de transition source (imPos requis)
---@param tPin table pin de transition cible
function flowgraph_link:drawLabel(sPin, tPin) end

--- Affiche l'infobulle du lien survolé : icône et type de la pin source et sa valeur courante.
---Source : lua/ge/extensions/flowgraph/link.lua:68
function flowgraph_link:drawLinkTooltip() end

--- Pour les liens d'états : renvoie la paire de directions ('E','W' / 'W','E' / 'S','N' / 'N','S') selon la position des nœuds, ou nil,nil sans positions.
---Source : lua/ge/extensions/flowgraph/link.lua:92
---@return string|nil  direction côté source
---@return string|nil  direction côté cible
function flowgraph_link:getDirPins() end

--- Crée le lien, l'enregistre dans le graphe et notifie pins et nœuds.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/link.lua:9
---@param graph table graphe
---@param sourcePin table pin source
---@param targetPin table pin cible
function flowgraph_link:init(graph, sourcePin, targetPin) end

--- Menu contextuel du lien : masquer / afficher, supprimer (si l'édition est autorisée) et, si la préférence flowgraph.debug.displayIds est active, ids.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/flowgraph/link.lua:214
---@param menuPos ImVec2 position du menu (inutilisé dans le code)
function flowgraph_link:showContextMenu(menuPos) end

