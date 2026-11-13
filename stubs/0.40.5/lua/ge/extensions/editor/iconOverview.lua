---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/iconOverview.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre d'éditeur « Available Icons » (menu Window > Debug) qui liste toutes les icônes de editor.icons dans une grille filtrable, avec infobulle du nom. Un clic sur une icône copie son nom dans le presse-papiers. Le menu de la fenêtre permet de recréer l'atlas d'icônes (editor.createIconAtlas). drawContent est réutilisable par d'autres outils pour proposer un sélecteur d'icône.
--- Accès : extension `editor_iconOverview` : `extensions.load("editor_iconOverview")`, puis la globale `editor_iconOverview`
---@class editor_iconOverview
editor_iconOverview = {}

--- Dessine le champ de recherche et la grille d'icônes filtrée dans la fenêtre ImGui courante. Appelle selectedFun(nomIcone) quand l'utilisateur clique sur une icône.
---Source : lua/ge/extensions/editor/iconOverview.lua:40
---@param selectedFun function|nil Callback recevant le nom de l'icône cliquée (string). Par défaut nop.
function editor_iconOverview.drawContent(selectedFun) end

--- Hook appelé à l'activation de l'éditeur ; vide dans ce fichier.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/iconOverview.lua:116
function editor_iconOverview.onEditorActivated() end

--- Appelé à chaque frame par l'éditeur ; affiche la fenêtre « Available Icons » (menu + drawContent avec copie dans le presse-papiers).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/iconOverview.lua:32
function editor_iconOverview.onEditorGui() end

--- Appelé à l'initialisation de l'éditeur ; construit la liste triée des icônes, enregistre la fenêtre (600x600) et ajoute le menu « Available Icons » dans le groupe Debug.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/iconOverview.lua:123
function editor_iconOverview.onEditorInitialized() end

--- Hook appelé au chargement de l'extension ; vide dans ce fichier.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/iconOverview.lua:131
function editor_iconOverview.onExtensionLoaded() end

--- Affiche la fenêtre « iconOverview » (editor.showWindow). Même fonction que l'entrée de menu.
---Source : lua/ge/extensions/editor/iconOverview.lua:119
function editor_iconOverview.open() end

