---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Objet renvoyé par le constructeur (new(rallyEditor)). Champs : rallyEditor, cache {path, snaproad, entries}.
---@class editor_rallyEditor_ghostNotebook_ghostRenderer
local editor_rallyEditor_ghostNotebook_ghostRenderer = {}

--- Construit la liste des entrées du carnet fantôme : pour chaque pacenote non manquant ayant un début et une fin de virage, calcule les positions de route, la position du libellé et la distance le long de la route, puis trie par distance. Stocke le résultat dans self.cache.
---Source : lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua:137
---@param path table Carnet fantôme (utilise path.pacenotes.sorted).
---@param snaproad table Objet snaproad de la route (closestSnapResult, driveline).
---@return table  Cache {path, snaproad, entries}.
function editor_rallyEditor_ghostNotebook_ghostRenderer:buildCache(path, snaproad) end

--- Appelée à chaque image : localise la caméra sur la snaproad, sélectionne les entrées dans la fenêtre de distance, décide quelles étiquettes afficher (sélection et voisins précédent/suivant selon les préférences) et appelle drawEntry.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua:205
---@param path table Carnet fantôme à afficher.
---@param snaproad table Snaproad de la route.
---@param globalOpacity number|nil Multiplicateur d'opacité, 1.0 par défaut.
---@param pacenoteToolsState table|nil État des outils pacenote (selected_pn_id, selected_wp_id).
---@param activePath table|nil Carnet actuellement édité, pour retrouver le pacenote sélectionné.
function editor_rallyEditor_ghostNotebook_ghostRenderer:draw(path, snaproad, globalOpacity, pacenoteToolsState, activePath) end

--- Dessine le libellé d'une entrée à sa position de début de virage. Le texte vient de rallyEditor.getGhostNotebookLabelForPacenote, sinon du nom du pacenote. Ne dessine rien si drawLabel est faux ou si le texte est vide.
---Source : lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua:179
---@param entry table Entrée du cache {pacenote, positions, labelPos, distanceAlongRoute}.
---@param lineColor ColorF Couleur de ligne (inutilisée tant que le tracé est désactivé).
---@param textAlpha number Opacité du texte, 0 à 1.
---@param textBgAlpha integer Opacité du fond du texte, 0 à 255.
---@param drawLabel boolean Dessiner ou non le libellé.
---@param prismWidth number Largeur du prisme (inutilisée tant que le tracé est désactivé).
function editor_rallyEditor_ghostNotebook_ghostRenderer:drawEntry(entry, lineColor, textAlpha, textBgAlpha, drawLabel, prismWidth) end

--- Renvoie le cache courant s'il correspond au même carnet et à la même snaproad, sinon le reconstruit.
---Source : lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua:172
---@param path table Carnet fantôme.
---@param snaproad table Snaproad.
---@return table  Cache.
function editor_rallyEditor_ghostNotebook_ghostRenderer:getCache(path, snaproad) end

--- Constructeur interne : mémorise l'éditeur et vide le cache.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/ghostNotebook/ghostRenderer.lua:13
---@param rallyEditor table Instance de l'éditeur (fournit les préférences et getGhostNotebookLabelForPacenote).
function editor_rallyEditor_ghostNotebook_ghostRenderer:init(rallyEditor) end

