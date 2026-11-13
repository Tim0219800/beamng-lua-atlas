---@meta
-- tim19Atlas stub generated from lua/ge/extensions/flowgraph/builder.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/flowgraph/builder.lua (instanciée par la fonction renvoyée par le module)
---@class flowgraph_builder
local flowgraph_builder = {}

---Source : lua/ge/extensions/flowgraph/builder.lua:55
---@param nodeID any
function flowgraph_builder:Begin(nodeID) end

---Source : lua/ge/extensions/flowgraph/builder.lua:156
---@param pin any
function flowgraph_builder:BeginPinDynamic(pin) end

---Source : lua/ge/extensions/flowgraph/builder.lua:68
---@param node any
function flowgraph_builder:End(node) end

---Source : lua/ge/extensions/flowgraph/builder.lua:133
function flowgraph_builder:EndHeader() end

---Source : lua/ge/extensions/flowgraph/builder.lua:151
function flowgraph_builder:EndInput() end

---Source : lua/ge/extensions/flowgraph/builder.lua:193
function flowgraph_builder:EndOutput() end

---Source : lua/ge/extensions/flowgraph/builder.lua:406
function flowgraph_builder:EndPin() end

---Source : lua/ge/extensions/flowgraph/builder.lua:164
---@param pin any
function flowgraph_builder:EndPinDynamic(pin) end

---Source : lua/ge/extensions/flowgraph/builder.lua:128
---@param color any
function flowgraph_builder:Header(color) end

---Source : lua/ge/extensions/flowgraph/builder.lua:137
---@param pin any
function flowgraph_builder:Input(pin) end

---Source : lua/ge/extensions/flowgraph/builder.lua:172
function flowgraph_builder:Middle() end

---Source : lua/ge/extensions/flowgraph/builder.lua:179
---@param pin any
function flowgraph_builder:Output(pin) end

---Source : lua/ge/extensions/flowgraph/builder.lua:386
---@param pin any
---@param kind any
function flowgraph_builder:Pin(pin, kind) end

---Source : lua/ge/extensions/flowgraph/builder.lua:206
---@param stage any
function flowgraph_builder:SetStage(stage) end

---Source : lua/ge/extensions/flowgraph/builder.lua:198
---@param width any
function flowgraph_builder:expectOutPinWidth(width) end

---Source : lua/ge/extensions/flowgraph/builder.lua:36
function flowgraph_builder:init() end

---Source : lua/ge/extensions/flowgraph/builder.lua:417
---@param pin any
function flowgraph_builder:makeAlignmentPin(pin) end

---Source : lua/ge/extensions/flowgraph/builder.lua:202
---@param width any
function flowgraph_builder:setExpectedHeaderSize(width) end

