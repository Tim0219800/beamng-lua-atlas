---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/rendererComponents.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre « Renderer Components » de l'éditeur (menu Debug) pour régler en direct les effets de rendu : profondeur de champ (DOF), HDR, SSAO, anti-aliasing, flou de mouvement, bloom, ombres en espace écran, CloudLayer, et en build non-shipping Coconut, Cluster Shading et Shadows. Chaque onglet n'apparaît que si l'objet post-effet correspondant existe dans la scène. Un menu « Reset All » et des boutons de réinitialisation par onglet remettent les valeurs par défaut. S'appuie sur core/settings/graphic et client/postFx/ssao.
--- Accès : extension `editor_rendererComponents` : `extensions.load("editor_rendererComponents")`, puis la globale `editor_rendererComponents`
---@class editor_rendererComponents
editor_rendererComponents = {}

--- Hook : à l'activation de l'éditeur, initialise les réglages si besoin et réapplique l'état du DOFPostEffect (mode debug, enable/disable).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rendererComponents.lua:955
function editor_rendererComponents.onEditorActivated() end

--- Hook : dessine la fenêtre avec barre de menu et barre d'onglets ; un onglet n'est affiché que si le post-effet/objet existe.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rendererComponents.lua:866
function editor_rendererComponents.onEditorGui() end

--- Hook : ajoute les entrées de menu Debug (Renderer Components, et Cluster Shading hors shipping), enregistre la fenêtre (300x500), initialise les réglages et capture les valeurs par défaut des ombres en espace écran.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/rendererComponents.lua:944
function editor_rendererComponents.onEditorInitialized() end

