---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/vehicleEditor/liveEditor/veView.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Vues de scène multiples de l'éditeur de véhicule en mode Live. Chaque « Scene View N » est une fenêtre ImGui qui affiche une caméra de rendu séparée (ImguiRenderViewControl) centrée sur le véhicule du joueur, avec les modes 3d, left, right, front, back, top, bottom (les vues orthographiques dessinent une grille au debugDrawer). Les réglages (mode, near/far clip, fov, ortho, décalage) sont sauvegardés dans la préférence de l'éditeur vehicleEditor.veView.sceneViews. Un clic droit ouvre un menu de contrôle (mode, Ortho, Render Main, Attach to Object, Show Icons, clips, FOV, ajout/suppression de vue).
--- Accès : extension `editor_vehicleEditor_liveEditor_veView` : `extensions.load("editor_vehicleEditor_liveEditor_veView")`, puis la globale `editor_vehicleEditor_liveEditor_veView`
---@class editor_vehicleEditor_liveEditor_veView
editor_vehicleEditor_liveEditor_veView = {}

--- Ajoute une vue de scène : réutilise la première vue supprimée ou masquée, sinon prend l'identifiant suivant, puis crée/enregistre la fenêtre « Scene View N » (400x600, outil vehicleEditor) et l'affiche. Appelée par le menu View > Add View de veToolbar en mode Live.
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veView.lua:106
function editor_vehicleEditor_liveEditor_veView.addSceneView() end

--- Hook de l'éditeur appelé à chaque frame : pour chaque vue enregistrée, ouvre la fenêtre, crée le contrôle de rendu et dessine son contenu (caméra, grille, menu clic droit) ; détruit le contrôle quand la fenêtre est fermée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veView.lua:462
function editor_vehicleEditor_liveEditor_veView.onEditorGui() end

--- Hook de l'éditeur appelé quand un outil passe en mode headless ou en sort. Pour l'outil 'vehicleEditor' : recharge les vues sauvegardées (enabled = true) ou les décharge et détruit les contrôles de rendu (enabled = false).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veView.lua:497
---@param enabled boolean true à l'activation de l'outil
---@param toolName string nom de l'outil, seul 'vehicleEditor' est traité
function editor_vehicleEditor_liveEditor_veView.onEditorHeadlessChange(enabled, toolName) end

--- Hook de l'éditeur appelé à l'initialisation : charge les vues sauvegardées dans les préférences (une seule fois).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/vehicleEditor/liveEditor/veView.lua:507
function editor_vehicleEditor_liveEditor_veView.onEditorInitialized() end

