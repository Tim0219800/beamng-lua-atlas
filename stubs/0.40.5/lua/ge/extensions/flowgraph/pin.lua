---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/pin.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/pin.lua (instanciée par la fonction renvoyée par le module)
---@class flowgraph_pin
local flowgraph_pin = {}

---Source : lua/ge/extensions/flowgraph/pin.lua:99
---@param builder any
---@param style any
---@param alpha any
---@param simpleDraw any
---@param constValue any
---@param outWidth any
function flowgraph_pin:_draw_in(builder, style, alpha, simpleDraw, constValue, outWidth) end

---Source : lua/ge/extensions/flowgraph/pin.lua:132
---@param builder any
---@param style any
---@param alpha any
---@param simpleDraw any
---@param const any
---@param outWidth any
function flowgraph_pin:_draw_out(builder, style, alpha, simpleDraw, const, outWidth) end

---Source : lua/ge/extensions/flowgraph/pin.lua:164
---@param simpleDraw any
function flowgraph_pin:_getCalculatedWidth(simpleDraw) end

---Source : lua/ge/extensions/flowgraph/pin.lua:347
---@param link any
function flowgraph_pin:_onLink(link) end

---Source : lua/ge/extensions/flowgraph/pin.lua:356
---@param link any
function flowgraph_pin:_onUnlink(link) end

---Source : lua/ge/extensions/flowgraph/pin.lua:262
---@param builder any
---@param style any
---@param isHeader any
---@param constValue any
---@param outWidth any
function flowgraph_pin:draw(builder, style, isHeader, constValue, outWidth) end

---Source : lua/ge/extensions/flowgraph/pin.lua:188
---@param mgr any
function flowgraph_pin:drawTooltip(mgr) end

---Source : lua/ge/extensions/flowgraph/pin.lua:79
function flowgraph_pin:getFirstConnectedLink() end

---Source : lua/ge/extensions/flowgraph/pin.lua:156
function flowgraph_pin:getTableType() end

--- getter for type with inclusion of impulse (mostly for drawing icons)
---Source : lua/ge/extensions/flowgraph/pin.lua:152
function flowgraph_pin:getTypeWithImpulseAndChain() end

---Source : lua/ge/extensions/flowgraph/pin.lua:256
function flowgraph_pin:highlightLinks() end

---Source : lua/ge/extensions/flowgraph/pin.lua:299
---@param mgr any
function flowgraph_pin:hoverDraw(mgr) end

---Source : lua/ge/extensions/flowgraph/pin.lua:13
---@param graph any
---@param node any
---@param direction any
---@param type any
---@param name any
---@param default any
---@param description any
function flowgraph_pin:init(graph, node, direction, type, name, default, description) end

--- checks if the pin is usable when creating new links. Active = pin usable, drawn / inactive = in background and unusable
---Source : lua/ge/extensions/flowgraph/pin.lua:180
function flowgraph_pin:isActive() end

---Source : lua/ge/extensions/flowgraph/pin.lua:369
function flowgraph_pin:isUsed() end

---Source : lua/ge/extensions/flowgraph/pin.lua:306
---@param menuPos any
---@param main any
function flowgraph_pin:showContextMenu(menuPos, main) end

---Source : lua/ge/extensions/flowgraph/pin.lua:383
---@param v any
function flowgraph_pin:valueSetQuat(v) end

---Source : lua/ge/extensions/flowgraph/pin.lua:373
---@param v any
function flowgraph_pin:valueSetVec3(v) end

