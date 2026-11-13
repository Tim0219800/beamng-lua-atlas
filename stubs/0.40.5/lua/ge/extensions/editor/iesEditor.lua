---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/iesEditor.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre d'éditeur « IES Cookie Importer (WIP) » (menu Window > Experimental). Elle lit un fichier photométrique IES, affiche ses métadonnées (en-tête, type photométrique, unités, direction de pic), un aperçu, et génère une image « cookie » de lumière (PNG nommé par défaut <fichier>.color.png, avec métadonnées) via editor/api/iesImporter. Utile à un moddeur qui veut créer des textures de projection de phares à partir de données IES.
--- Accès : extension `editor_iesEditor` : `extensions.load("editor_iesEditor")`, puis la globale `editor_iesEditor`
---@class editor_iesEditor
editor_iesEditor = {}

--- Appelé à chaque frame par l'éditeur : initialise les valeurs par défaut une fois, traite la fin éventuelle du job de génération, puis dessine la fenêtre (tableau fichiers/infos et aperçu, puis réglages).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/iesEditor.lua:983
function editor_iesEditor.onEditorGui() end

--- Appelé à l'initialisation de l'éditeur : ajoute l'entrée de menu dans le groupe 'Experimental', enregistre la fenêtre (980x700), initialise les valeurs par défaut et logue 'Initialized'.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/iesEditor.lua:1022
function editor_iesEditor.onEditorInitialized() end

--- Affiche la fenêtre 'iesEditor' (editor.showWindow) ; appelé par l'entrée de menu.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/iesEditor.lua:1018
function editor_iesEditor.onWindowMenuItem() end

