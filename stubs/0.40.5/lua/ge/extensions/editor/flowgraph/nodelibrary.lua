---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/flowgraph/nodelibrary.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe locale `C` de lua/ge/extensions/editor/flowgraph/nodelibrary.lua
---@class editor_flowgraph_nodelibrary_C
local editor_flowgraph_nodelibrary_C = {}

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:796
---@param a any
---@param b any
function editor_flowgraph_nodelibrary_C._sortFunc(a, b) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1271
---@param cursor any
---@param itemSize any
---@param doHover any
---@param hoverFun any
function editor_flowgraph_nodelibrary_C:arrowHelper(cursor, itemSize, doHover, hoverFun) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:837
---@param dir any
---@param mode any
function editor_flowgraph_nodelibrary_C:checkEmpty(dir, mode) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:34
function editor_flowgraph_nodelibrary_C:clear() end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:127
function editor_flowgraph_nodelibrary_C:createNode() end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1214
---@param menuPos any
---@param node any
function editor_flowgraph_nodelibrary_C:createNodeFromButon(menuPos, node) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1177
---@param menuPos any
---@param state any
function editor_flowgraph_nodelibrary_C:createStateButton(menuPos, state) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:981
---@param var any
---@param menuPos any
---@param read any
---@param fromMgr any
function editor_flowgraph_nodelibrary_C:createVariableButton(var, menuPos, read, fromMgr) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1054
---@param dir any
---@param menuPos any
---@param elementFieldName any
---@param elementFunction any
function editor_flowgraph_nodelibrary_C:displayDir(dir, menuPos, elementFieldName, elementFunction) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1008
---@param macroName any
---@param macro any
---@param menuPos any
function editor_flowgraph_nodelibrary_C:displayMacro(macroName, macro, menuPos) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1194
---@param dir any
---@param menuPos any
---@param nodeName any
---@param node any
function editor_flowgraph_nodelibrary_C:displayNode(dir, menuPos, nodeName, node) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:637
---@param menuPos any
function editor_flowgraph_nodelibrary_C:displayResults(menuPos) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1086
---@param menuPos any
---@param text any
---@param clickFun any
---@param ... any
function editor_flowgraph_nodelibrary_C:displaySimpleElement(menuPos, text, clickFun, ...) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1114
---@param menuPos any
---@param label any
function editor_flowgraph_nodelibrary_C:displayStateExitButton(menuPos, label) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1157
---@param dir any
---@param menuPos any
---@param stateName any
---@param state any
function editor_flowgraph_nodelibrary_C:displayStateTemplate(dir, menuPos, stateName, state) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:934
---@param var any
---@param menuPos any
---@param read any
---@param fromMgr any
function editor_flowgraph_nodelibrary_C:displayVariable(var, menuPos, read, fromMgr) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:704
function editor_flowgraph_nodelibrary_C:draw() end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:563
---@param menuPos any
---@param usedForContextMenu any
function editor_flowgraph_nodelibrary_C:drawContent(menuPos, usedForContextMenu) end

--- window which shows all available nodes incl drag'n' drop functionality
---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:185
---@param menuPos any
function editor_flowgraph_nodelibrary_C:drawContentAsTreeNodes(menuPos) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:66
---@param usedForContextMenu any
function editor_flowgraph_nodelibrary_C:drawTextFilter(usedForContextMenu) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:901
---@param filterPins any
function editor_flowgraph_nodelibrary_C:filterMacroTemplates(filterPins) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:869
---@param dir any
---@param filterPins any
function editor_flowgraph_nodelibrary_C:filterMacros(dir, filterPins) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:798
---@param dir any
---@param filterPins any
---@param mode any
function editor_flowgraph_nodelibrary_C:filterNodes(dir, filterPins, mode) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:907
---@param filterPins any
---@param mode any
function editor_flowgraph_nodelibrary_C:filterTemplates(filterPins, mode) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:435
function editor_flowgraph_nodelibrary_C:findFlowNodes() end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:495
function editor_flowgraph_nodelibrary_C:findStateNodes() end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:456
---@param source any
---@param sourceName any
---@param sourceNameTag any
function editor_flowgraph_nodelibrary_C:findVar(source, sourceName, sourceNameTag) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:404
function editor_flowgraph_nodelibrary_C:getFilterType() end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:46
---@param dir any
function editor_flowgraph_nodelibrary_C:hasFoldersOnly(dir) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:610
---@param label any
---@param highlightText any
function editor_flowgraph_nodelibrary_C:highlightText(label, highlightText) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:16
function editor_flowgraph_nodelibrary_C:init() end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1139
---@param node any
function editor_flowgraph_nodelibrary_C:linkState(node) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:135
---@param up any
function editor_flowgraph_nodelibrary_C:navigateList(up) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:720
---@param node any
function editor_flowgraph_nodelibrary_C:pinsFilter(node) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1337
---@param dir any
---@param name any
---@param tagIndex any
---@param libtxt any
function editor_flowgraph_nodelibrary_C:printDir(dir, name, tagIndex, libtxt) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1308
function editor_flowgraph_nodelibrary_C:printNodesWithTags() end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1035
---@param a any
---@param b any
function editor_flowgraph_nodelibrary_C:ratePinSimilarity(a, b) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:1386
---@param dir any
---@param list any
---@param pins any
function editor_flowgraph_nodelibrary_C:recursiveGetTags(dir, list, pins) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:882
function editor_flowgraph_nodelibrary_C:refreshMacro() end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:889
function editor_flowgraph_nodelibrary_C:refreshStateTemplates() end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:62
---@param newNodeLinkPin any
function editor_flowgraph_nodelibrary_C:setNewNodeLinkPin(newNodeLinkPin) end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:57
function editor_flowgraph_nodelibrary_C:setStatic() end

---Source : lua/ge/extensions/editor/flowgraph/nodelibrary.lua:386
---@param var any
---@param dir any
function editor_flowgraph_nodelibrary_C:variablePinFilter(var, dir) end

