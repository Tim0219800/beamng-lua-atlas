# `core_onScreenKeyboard`

*File: `lua/ge/extensions/core/onScreenKeyboard.lua` · VM: Game Engine (GE) · 32 lines · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Access:** extension `core_onScreenKeyboard`: `extensions.load("core_onScreenKeyboard")`, then the global `core_onScreenKeyboard`

GE extension `core_onScreenKeyboard`: facade to the platform's virtual keyboards (Steam Deck, console...). It opens the keyboard with a title, an initial text, a maximum length and an input type, and relays the result to the UI via the guihooks 'onScreenKeyboardClosed'.

## Example

```lua
if core_onScreenKeyboard.isOnScreenKeyboardAvailable() then
  core_onScreenKeyboard.openOnScreenKeyboard('Name', 'Your name', '', 32)
end
```

## Notes

- Two types of keyboards depending on the platform (code comment): (1) 'fire and forget', which sends the keys directly to the game (Steam Deck); (2) which does not send them but returns the full text once via onScreenKeyboardClosed when the user confirms (PS5).
- openOnScreenKeyboard and isOnScreenKeyboardAvailable are global functions provided by the engine; without them, opening is ignored and isOnScreenKeyboardAvailable (the Lua version) will raise an error because it calls it without checking.

## Functions

| Function | Description | Line |
|---|---|---|
| `core_onScreenKeyboard.isOnScreenKeyboardAvailable()` | Indicates whether the platform offers a virtual keyboard (calls the engine global function of the same name). | 24 |
| `core_onScreenKeyboard.onScreenKeyboardClosed(applied, text)` | Hook called by the engine when the virtual keyboard closes: forwards to the UI (guihooks 'onScreenKeyboardClosed', applied, text). *(internal)* *(hook)* | 20 |
| `core_onScreenKeyboard.openOnScreenKeyboard(title, placeholder, initialText, maxLength, inputType, textBoxLeft, textBoxTop, textBoxWidth, textBoxHeight)` | Opens the platform's virtual keyboard (if the engine global function exists). A non-numeric or <= 0 maxLength becomes 1000; placeholder and initialText default to '', inputType to 'string'. | 11 |

### Parameter details

#### `core_onScreenKeyboard.isOnScreenKeyboardAvailable()`

Indicates whether the platform offers a virtual keyboard (calls the engine global function of the same name).

- **returns**: boolean true if available.

#### `core_onScreenKeyboard.onScreenKeyboardClosed(applied, text)`

Hook called by the engine when the virtual keyboard closes: forwards to the UI (guihooks 'onScreenKeyboardClosed', applied, text).

- `applied` (*boolean*) : true if the user confirmed.
- `text` (*string*) : Entered text.

#### `core_onScreenKeyboard.openOnScreenKeyboard(title, placeholder, initialText, maxLength, inputType, textBoxLeft, textBoxTop, textBoxWidth, textBoxHeight)`

Opens the platform's virtual keyboard (if the engine global function exists). A non-numeric or <= 0 maxLength becomes 1000; placeholder and initialText default to '', inputType to 'string'.

- `title` (*string*) : Keyboard title.
- `placeholder` (*string|nil*) : Hint text.
- `initialText` (*string|nil*) : Initial text.
- `maxLength` (*integer|nil*) : Maximum length (1000 by default).
- `inputType` (*string|nil*) : Input type ('string' by default).
- `textBoxLeft` (*number|nil*) : Left position of the text area on screen, so that the keyboard does not hide it (inferred from code).
- `textBoxTop` (*number|nil*) : Top position of the text area.
- `textBoxWidth` (*number|nil*) : Width of the text area.
- `textBoxHeight` (*number|nil*) : Height of the text area.

**UI events (guihooks.trigger):** `onScreenKeyboardClosed`

---
*tim19Atlas (Tim0219800) — derived from BeamNG GmbH Lua code (bCDDL 1.1, see LICENSE). Source: `lua/ge/extensions/core/onScreenKeyboard.lua`.*
