---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/extensionsDebug.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre de debug de l'éditeur (menu Window > Debug > Extensions Debug) qui liste les extensions Lua chargées (extensions.getLoadedExtensionsNames()) sous forme d'arbre imgui. Chaque extension se déplie pour montrer récursivement le contenu de sa table (imguiUtils.addRecursiveTreeTable). Utile à un moddeur pour inspecter l'état d'une extension à chaud.
--- Accès : extension `editor_extensionsDebug` : `extensions.load("editor_extensionsDebug")`, puis la globale `editor_extensionsDebug`
---@class editor_extensionsDebug
editor_extensionsDebug = {}

--- Dessine la fenêtre « Extensions Debug Window » : case Filters puis un nœud d'arbre par extension chargée, avec le contenu récursif de extensions[nom] quand Filters est décochée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/extensionsDebug.lua:33
function editor_extensionsDebug.onEditorGui() end

--- Appelé quand l'éditeur est initialisé : enregistre la fenêtre « extensionsDebug » et l'entrée de menu « Extensions Debug » (groupe Debug).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/extensionsDebug.lua:59
function editor_extensionsDebug.onEditorInitialized() end

--- Hook appelé au chargement de l'extension ; ne fait rien ici.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/extensionsDebug.lua:56
function editor_extensionsDebug.onExtensionLoaded() end

