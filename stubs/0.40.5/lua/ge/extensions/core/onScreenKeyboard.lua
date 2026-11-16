---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/onScreenKeyboard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- GE extension `core_onScreenKeyboard`: facade to the platform's virtual keyboards (Steam Deck, console...). It opens the keyboard with a title, an initial text, a maximum length and an input type, and relays the result to the UI via the guihooks 'onScreenKeyboardClosed'.
--- Access: extension `core_onScreenKeyboard`: `extensions.load("core_onScreenKeyboard")`, then the global `core_onScreenKeyboard`
---@class core_onScreenKeyboard
core_onScreenKeyboard = {}

--- Indicates whether the platform offers a virtual keyboard (calls the engine global function of the same name).
---Source: lua/ge/extensions/core/onScreenKeyboard.lua:24
---@return boolean  true if available.
function core_onScreenKeyboard.isOnScreenKeyboardAvailable() end

--- Hook called by the engine when the virtual keyboard closes: forwards to the UI (guihooks 'onScreenKeyboardClosed', applied, text).
---*(internal: called by the engine or the main loop)*
---Source: lua/ge/extensions/core/onScreenKeyboard.lua:20
---@param applied boolean true if the user confirmed.
---@param text string Entered text.
function core_onScreenKeyboard.onScreenKeyboardClosed(applied, text) end

--- Opens the platform's virtual keyboard (if the engine global function exists). A non-numeric or <= 0 maxLength becomes 1000; placeholder and initialText default to '', inputType to 'string'.
---Source: lua/ge/extensions/core/onScreenKeyboard.lua:11
---@param title string Keyboard title.
---@param placeholder string|nil Hint text.
---@param initialText string|nil Initial text.
---@param maxLength integer|nil Maximum length (1000 by default).
---@param inputType string|nil Input type ('string' by default).
---@param textBoxLeft number|nil Left position of the text area on screen, so that the keyboard does not hide it (inferred from code).
---@param textBoxTop number|nil Top position of the text area.
---@param textBoxWidth number|nil Width of the text area.
---@param textBoxHeight number|nil Height of the text area.
function core_onScreenKeyboard.openOnScreenKeyboard(title, placeholder, initialText, maxLength, inputType, textBoxLeft, textBoxTop, textBoxWidth, textBoxHeight) end

