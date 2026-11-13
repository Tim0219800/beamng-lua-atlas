---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/editorRenderSettings.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Editor Render Settings » de l'éditeur : permet d'utiliser dans l'éditeur des réglages graphiques différents de ceux du jeu (anti-aliasing, résolution, qualité des meshes/terrain/clusters/nuages, herbe, ombres, réflexions dynamiques, SSAO, DOF, flou de mouvement, limite de FPS). Les valeurs sont stockées dans les préférences editor.renderSettings.* (followGameSettings, values). À l'activation de l'éditeur l'état graphique du jeu est capturé, puis restauré à la désactivation, à l'arrêt de l'éditeur ou au déchargement de l'extension.
--- Accès : extension `editor_editorRenderSettings` : `extensions.load("editor_editorRenderSettings")`, puis la globale `editor_editorRenderSettings`
---@class editor_editorRenderSettings
editor_editorRenderSettings = {}

--- Capture l'état graphique du jeu ; si followGameSettings est faux, sauvegarde et applique les valeurs de l'éditeur.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/editorRenderSettings.lua:504
function editor_editorRenderSettings.onEditorActivated() end

--- Restaure l'état graphique du jeu capturé à l'activation.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/editorRenderSettings.lua:520
function editor_editorRenderSettings.onEditorDeactivated() end

--- Dessine la fenêtre : case « suivre les réglages du jeu », bouton de synchronisation depuis le jeu, préréglages de qualité, puis sections Antialiasing, Qualité de scène, Ombres, Réflexions, Post-traitement et Limite de FPS.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/editorRenderSettings.lua:426
function editor_editorRenderSettings.onEditorGui() end

--- Enregistre la fenêtre « editorRenderSettings » (420x700).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/editorRenderSettings.lua:500
function editor_editorRenderSettings.onEditorInitialized() end

--- Enregistre la catégorie « editor » et la sous-catégorie renderSettings (followGameSettings = true par défaut, values = {}).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/editorRenderSettings.lua:492
---@param prefsRegistry table Registre de préférences de l'éditeur
function editor_editorRenderSettings.onEditorRegisterPreferences(prefsRegistry) end

--- Même fonction que la restauration de l'état du jeu (alias).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/editorRenderSettings.lua:513
function editor_editorRenderSettings.onEditorShutdown() end

--- Même fonction que la restauration de l'état du jeu (alias).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/editorRenderSettings.lua:513
function editor_editorRenderSettings.onExtensionUnloaded() end

