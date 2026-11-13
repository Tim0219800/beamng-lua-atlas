---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/noSelectionPreview.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aperçu de l'éditeur de notes de rallye (pacenotes) quand aucune note n'est sélectionnée. Loin de la route (au-delà de overviewDistance), dessine toute la route en dégradé arc-en-ciel avec un marqueur par note ; près de la route, dessine seulement la fenêtre autour du point visé par la caméra, avec les étiquettes des notes voisines. Un modèle (points, distances, entrées de notes triées) est mis en cache dans pacenoteToolsState.
--- Accès : extension `gameplay_rally_notebook_noSelectionPreview` : `extensions.load("gameplay_rally_notebook_noSelectionPreview")`, puis la globale `gameplay_rally_notebook_noSelectionPreview`
---@class gameplay_rally_notebook_noSelectionPreview
gameplay_rally_notebook_noSelectionPreview = {}

--- Dessine l'aperçu sans sélection (route et notes via pacenote:drawDebugPacenoteNoSelectionRainbow).
---Source : lua/ge/extensions/gameplay/rally/notebook/noSelectionPreview.lua:460
---@param path table Notebook (path.pacenotes.sorted).
---@param snaproad table Snaproad.
---@param pacenoteToolsState table État de l'outil (sert de cache).
---@param globalOpacity number|nil Opacité globale (défaut 1).
---@param prismWidth number|nil Largeur des prismes en mètres (défaut 1.945).
---@param drawOnTop boolean|nil true pour dessiner sans test de profondeur.
---@param opts table|nil {overviewDistance = 650, labelMode = 'all'|autre, nearCameraCount = 3}.
---@return boolean  true si quelque chose a été dessiné, false si les données sont insuffisantes.
function gameplay_rally_notebook_noSelectionPreview.draw(path, snaproad, pacenoteToolsState, globalOpacity, prismWidth, drawOnTop, opts) end

--- Supprime le modèle et le cache de rayon de l'aperçu ; à appeler quand le notebook ou le snaproad change.
---Source : lua/ge/extensions/gameplay/rally/notebook/noSelectionPreview.lua:200
---@param pacenoteToolsState table|nil État de l'outil.
function gameplay_rally_notebook_noSelectionPreview.invalidate(pacenoteToolsState) end

--- Renvoie la fenêtre de route proche de la caméra utilisée par la vue proche, sans dessiner.
---Source : lua/ge/extensions/gameplay/rally/notebook/noSelectionPreview.lua:490
---@param path table Notebook.
---@param snaproad table Snaproad.
---@param pacenoteToolsState table État de l'outil.
---@param opts table|nil {overviewDistance = 650}.
---@return table|nil  {startDistance, endDistance, pivotDistance, pivotPos} ou nil (aucune note, caméra trop loin ou données manquantes).
function gameplay_rally_notebook_noSelectionPreview.nearWindow(path, snaproad, pacenoteToolsState, opts) end

