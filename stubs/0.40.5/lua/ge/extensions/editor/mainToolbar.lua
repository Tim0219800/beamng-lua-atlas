---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/mainToolbar.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Barre d'outils principale (fenêtre « Main Toolbar ») du World Editor. Elle contient les boutons généraux (nouveau/ouvrir/sauvegarder niveau…), les boutons de gizmo d'axe (grille, snap de rotation et d'échelle), la caméra, l'heure du jour et l'exposition, ainsi que la liste des modes d'édition regroupables en « sets » enregistrés dans un fichier. Les autres extensions peuvent y ajouter des boutons via les hooks émis.
--- Accès : extension `editor_mainToolbar` : `extensions.load("editor_mainToolbar")`, puis la globale `editor_mainToolbar`
---@class editor_mainToolbar
---@field dependencies table<integer, string> {'core_environment'}.
editor_mainToolbar = {}

--- Appelé à la désactivation de l'éditeur : restaure l'exposition initiale si elle avait été modifiée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mainToolbar.lua:1553
function editor_mainToolbar.onEditorDeactivated() end

--- Dessine la fenêtre de la barre d'outils à chaque frame et émet les hooks de barre d'outils.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mainToolbar.lua:895
function editor_mainToolbar.onEditorGuiToolBar() end

--- Enregistre et affiche la fenêtre « mainToolbar » et charge les sets de modes d'édition depuis le fichier.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mainToolbar.lua:1529
function editor_mainToolbar.onEditorInitialized() end

--- Appelé au chargement de l'état de l'éditeur. Corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mainToolbar.lua:1550
---@param state table État de l'éditeur.
function editor_mainToolbar.onEditorLoadState(state) end

--- Si ui.general.enableVehicleControls change, active/désactive les action maps véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mainToolbar.lua:1536
---@param path string Chemin de la préférence.
---@param value any Nouvelle valeur.
function editor_mainToolbar.onEditorPreferenceValueChanged(path, value) end

--- Appelé à la sauvegarde de l'état de l'éditeur. Corps vide.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/mainToolbar.lua:1547
---@param state table État de l'éditeur.
function editor_mainToolbar.onEditorSaveState(state) end

