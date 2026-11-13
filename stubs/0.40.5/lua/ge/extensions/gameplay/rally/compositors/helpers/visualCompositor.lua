---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/helpers/visualCompositor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Compositeur visuel renvoyé par le constructeur du module.
---@class gameplay_rally_compositors_helpers_visualCompositor
local gameplay_rally_compositors_helpers_visualCompositor = {}

--- Distance maximale (seuil du dernier lien) en dessous de laquelle deux notes sont enchaînées ('into').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/visualCompositor.lua:24
---@return number  Distance en mètres.
function gameplay_rally_compositors_helpers_visualCompositor:_getMaxLinkDistance() end

--- Construit la liste de visuels d'une note structurée.
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/visualCompositor.lua:204
---@param pacenote table Note (name, id) pour les identifiants des visuels.
---@param structured table Contenu structuré de la note (éléments par emplacement).
---@param distBeforeMeters number|nil Distance depuis la note précédente en mètres.
---@param distAfterMeters number|nil Distance jusqu'à la note suivante en mètres (affichée sous le dernier visuel).
---@return table[]  Visuels (4 au plus).
function gameplay_rally_compositors_helpers_visualCompositor:compositeVisual(pacenote, structured, distBeforeMeters, distAfterMeters) end

--- Mémorise le compositeur de texte dont on lit la configuration.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/compositors/helpers/visualCompositor.lua:20
---@param textCompositor table Instance de textCompositor.
function gameplay_rally_compositors_helpers_visualCompositor:init(textCompositor) end

