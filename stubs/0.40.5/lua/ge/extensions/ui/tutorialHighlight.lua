---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/tutorialHighlight.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gère la liste des éléments d'interface à mettre en surbrillance pendant un tutoriel. Chaque élément est identifié par un id (chaîne) ; l'état (ids dans l'ordre d'apparition, options, révision) est diffusé à l'UI via le flux `tutorialHighlight` (guihooks.triggerStream). Un moddeur ou un script de tutoriel appelle show/hide pour allumer ou éteindre un repère.
--- Accès : extension `ui_tutorialHighlight` : `extensions.load("ui_tutorialHighlight")`, puis la globale `ui_tutorialHighlight`
---@class ui_tutorialHighlight
ui_tutorialHighlight = {}

--- Renvoie la charge utile courante du flux.
---Source : lua/ge/extensions/ui/tutorialHighlight.lua:17
---@return table  { ids = string[], options = table<string, table>, revision = integer }
function ui_tutorialHighlight.getState() end

--- Retire l'id de la surbrillance et diffuse l'état.
---Source : lua/ge/extensions/ui/tutorialHighlight.lua:65
---@param id string Identifiant de l'élément.
---@return boolean  true si l'id était actif.
function ui_tutorialHighlight.hide(id) end

--- Retire toutes les surbrillances et diffuse l'état.
---Source : lua/ge/extensions/ui/tutorialHighlight.lua:85
---@return boolean  false si rien n'était actif.
function ui_tutorialHighlight.hideAll() end

--- Hook d'initialisation à la création de l'extension : passe le mode de déchargement en « manual ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/tutorialHighlight.lua:100
function ui_tutorialHighlight.onInit() end

--- Hook appelé quand l'UI est prête : rediffuse l'état courant.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/tutorialHighlight.lua:96
function ui_tutorialHighlight.onUiReady() end

--- Active la surbrillance de l'id (ajouté en fin d'ordre s'il est nouveau), enregistre ses options et diffuse l'état.
---Source : lua/ge/extensions/ui/tutorialHighlight.lua:44
---@param id string Identifiant non vide de l'élément.
---@param options table|nil {focus = boolean, scroll = boolean}.
---@return boolean  true si l'id vient d'être ajouté ; false s'il était déjà actif ou si l'id est invalide.
function ui_tutorialHighlight.show(id, options) end

