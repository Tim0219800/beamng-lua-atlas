---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/onScreenKeyboard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_onScreenKeyboard` : façade vers les claviers virtuels de la plateforme (Steam Deck, console...). Elle ouvre le clavier avec un titre, un texte initial, une longueur maximale et un type d'entrée, et relaie à l'interface le résultat via guihooks 'onScreenKeyboardClosed'.
--- Accès : extension `core_onScreenKeyboard` : `extensions.load("core_onScreenKeyboard")`, puis la globale `core_onScreenKeyboard`
---@class core_onScreenKeyboard
core_onScreenKeyboard = {}

--- Indique si la plateforme propose un clavier virtuel (appelle la fonction globale du moteur de même nom).
---Source : lua/ge/extensions/core/onScreenKeyboard.lua:24
---@return boolean  true si disponible.
function core_onScreenKeyboard.isOnScreenKeyboardAvailable() end

--- Hook appelé par le moteur quand le clavier virtuel se ferme : transmet à l'interface (guihooks 'onScreenKeyboardClosed', applied, text).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/onScreenKeyboard.lua:20
---@param applied boolean true si l'utilisateur a validé.
---@param text string Texte saisi.
function core_onScreenKeyboard.onScreenKeyboardClosed(applied, text) end

--- Ouvre le clavier virtuel de la plateforme (si la fonction globale du moteur existe). Une maxLength non numérique ou <= 0 devient 1000 ; placeholder et initialText valent '' par défaut, inputType 'string'.
---Source : lua/ge/extensions/core/onScreenKeyboard.lua:11
---@param title string Titre du clavier.
---@param placeholder string|nil Texte d'indication.
---@param initialText string|nil Texte initial.
---@param maxLength integer|nil Longueur maximale (1000 par défaut).
---@param inputType string|nil Type d'entrée ('string' par défaut).
---@param textBoxLeft number|nil Position gauche de la zone de texte à l'écran, pour que le clavier ne la masque pas (déduit du code).
---@param textBoxTop number|nil Position haute de la zone de texte.
---@param textBoxWidth number|nil Largeur de la zone de texte.
---@param textBoxHeight number|nil Hauteur de la zone de texte.
function core_onScreenKeyboard.openOnScreenKeyboard(title, placeholder, initialText, maxLength, inputType, textBoxLeft, textBoxTop, textBoxWidth, textBoxHeight) end

