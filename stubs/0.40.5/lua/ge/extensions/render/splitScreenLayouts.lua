---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/splitScreenLayouts.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Catalogue des dispositions d'écran partagé, utilisé par render_splitScreen. Il fournit des dispositions prédéfinies pour 2, 3 et 4 joueurs, une disposition automatique en grille pour n'importe quel nombre de joueurs, et charge au chargement les dispositions personnalisées des moddeurs depuis /settings/**/*.splitscreenLayout.json. Les rectangles sont normalisés de 0 à 1 : {x, y, largeur, hauteur}.
--- Accès : extension `render_splitScreenLayouts` : `extensions.load("render_splitScreenLayouts")`, puis la globale `render_splitScreenLayouts`
---@class render_splitScreenLayouts
render_splitScreenLayouts = {}

--- Renvoie les rectangles de la disposition demandée pour ce nombre de joueurs. 'shared' donne un seul rectangle plein écran ; un identifiant inconnu ou 'automatic' donne la disposition automatique. Les écarts entre vues sont appliqués.
---Source : lua/ge/extensions/render/splitScreenLayouts.lua:224
---@param playerCount integer Nombre de joueurs.
---@param layoutId string 'automatic', 'shared' ou identifiant d'une disposition prédéfinie ou personnalisée.
---@param screenWidth number|nil Largeur en pixels (si invalide, un nombre inférieur à 2 est lu comme un rapport d'aspect).
---@param screenHeight number|nil Hauteur en pixels.
---@return number[][]  Liste de rectangles {x, y, w, h} normalisés.
function render_splitScreenLayouts.getLayout(playerCount, layoutId, screenWidth, screenHeight) end

--- Liste des choix de disposition offerts à l'utilisateur pour ce nombre de joueurs (sans 'shared'), avec libellé et rectangles.
---Source : lua/ge/extensions/render/splitScreenLayouts.lua:240
---@param playerCount integer Nombre de joueurs.
---@param screenWidth number|nil Largeur écran en pixels.
---@param screenHeight number|nil Hauteur écran en pixels.
---@return table[]  Éléments {value, label, layout}.
function render_splitScreenLayouts.getOptions(playerCount, screenWidth, screenHeight) end

--- Convertit un nombre de joueurs en numéro de réglage multiseatLayout<N> : valeur entière entre 0 et 8, ou 9 au-delà de 8.
---Source : lua/ge/extensions/render/splitScreenLayouts.lua:235
---@param playerCount number Nombre de joueurs.
---@return integer  Indice de réglage.
function render_splitScreenLayouts.getSettingsPlayerCount(playerCount) end

--- Vrai si l'identifiant est 'shared' (vue unique partagée).
---Source : lua/ge/extensions/render/splitScreenLayouts.lua:262
---@param layoutId string Identifiant.
---@return boolean  Résultat.
function render_splitScreenLayouts.isShared(layoutId) end

--- Indique si un identifiant de disposition existe pour ce nombre de joueurs ('automatic' et 'shared' sont toujours valides).
---Source : lua/ge/extensions/render/splitScreenLayouts.lua:256
---@param playerCount integer Nombre de joueurs.
---@param layoutId string Identifiant.
---@return boolean  Validité.
function render_splitScreenLayouts.isValid(playerCount, layoutId) end

