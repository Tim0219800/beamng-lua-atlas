---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rallyEditor/recceTab.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de l'onglet Recce (windowDescription = 'Recce').
---@class editor_rallyEditor_recceTab
local editor_rallyEditor_recceTab = {}

--- Remplace la driveline du recce par une version sous-échantillonnée selon straightnessThreshold.
---Source : lua/ge/extensions/editor/rallyEditor/recceTab.lua:54
function editor_rallyEditor_recceTab:downsample() end

--- Dessine l'onglet (ne fait rien sans notebook).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/recceTab.lua:156
---@param mouseInfo table Informations souris de l'éditeur (non utilisé ici).
function editor_rallyEditor_recceTab:draw(mouseInfo) end

--- Dessin debug 3D : appelle recce:drawDebugRecce avec l'option d'étiquettes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/recceTab.lua:161
---@param mouseInfo table Informations souris transmises au recce.
function editor_rallyEditor_recceTab:drawDebugEntrypoint(mouseInfo) end

--- Dessine l'interface : rafraîchir, étiquettes, infos driveline/cuts, bouton Import, bouton Downsample et curseur de seuil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/recceTab.lua:59
function editor_rallyEditor_recceTab:drawSectionV3() end

--- Formate une distance en « 123.456m », ou en km au-delà de 950 m.
---Source : lua/ge/extensions/editor/rallyEditor/recceTab.lua:43
---@param dist number Distance en mètres.
---@return string  Texte avec 3 décimales et unité.
function editor_rallyEditor_recceTab:formatDistance(dist) end

--- Crée les données de pacenotes depuis les cuts, les ajoute au notebook (appendPacenotes) et affiche l'onglet Pacenotes.
---Source : lua/ge/extensions/editor/rallyEditor/recceTab.lua:147
function editor_rallyEditor_recceTab:import() end

--- Constructeur : mémorise rallyEditor ; recce = nil, drawLabels = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/recceTab.lua:14
---@param rallyEditor table Éditeur de rallye parent.
function editor_rallyEditor_recceTab:init(rallyEditor) end

--- Recrée l'objet Recce pour le dossier de la mission et charge driveline et cuts ; mémorise la taille d'origine. Log d'erreur en cas d'échec.
---Source : lua/ge/extensions/editor/rallyEditor/recceTab.lua:138
function editor_rallyEditor_recceTab:refresh() end

--- Appelé quand l'onglet est sélectionné : recharge le recce (refresh) et émet onEditorEditModeChanged(nil, nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/recceTab.lua:29
function editor_rallyEditor_recceTab:selected() end

--- Définit le notebook courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/recceTab.lua:24
---@param path table|nil Notebook.
function editor_rallyEditor_recceTab:setPath(path) end

--- Appelé quand l'onglet est quitté : émet onEditorEditModeChanged(nil, nil).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rallyEditor/recceTab.lua:37
function editor_rallyEditor_recceTab:unselect() end

