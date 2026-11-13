---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/performanceMetrics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petit module utilitaire (chargé par require) de la télémétrie de performance : lecture sûre de variables du VariableRegistry, état de focus du programme et cause d'un plafond de FPS choisi par le joueur.
--- Accès : extension `telemetry_performanceMetrics` : `extensions.load("telemetry_performanceMetrics")`, puis la globale `telemetry_performanceMetrics`
---@class telemetry_performanceMetrics
telemetry_performanceMetrics = {}

--- Dit quel plafond de FPS choisi par le joueur s'applique : 'background' (limite en arrière-plan sans focus), 'vr' (session OpenXR), 'limiter' (fpsLimitEnabled), 'vsync', sinon nil. Sert à ne pas confondre un FPS bloqué à 60 avec une machine incapable de faire mieux.
---Source : lua/ge/extensions/telemetry/performanceMetrics.lua:23
---@return string|nil  'background', 'vr', 'limiter', 'vsync' ou nil.
function telemetry_performanceMetrics.getLimitedBy() end

--- Indique si la fenêtre du jeu a le focus (true si Engine.isProgramFocused n'existe pas).
---Source : lua/ge/extensions/telemetry/performanceMetrics.lua:17
---@return boolean  true si le programme a le focus.
function telemetry_performanceMetrics.isFocused() end

--- Comme readNumber mais renvoie nil au lieu de -1 (valeur indisponible).
---Source : lua/ge/extensions/telemetry/performanceMetrics.lua:12
---@param name string Nom de la variable.
---@return number|nil  Valeur >= 0, ou nil.
function telemetry_performanceMetrics.readAvailable(name) end

--- Lit une variable du VariableRegistry en nombre ; renvoie -1 si elle est absente, non numérique, NaN ou infinie.
---Source : lua/ge/extensions/telemetry/performanceMetrics.lua:7
---@param name string Nom de la variable (ex. '$fps::avg').
---@return number  Valeur, ou -1.
function telemetry_performanceMetrics.readNumber(name) end

