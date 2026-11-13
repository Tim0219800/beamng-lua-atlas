---@meta
-- tim19Atlas stub generated from lua/common/libs/lustach/src/lustache/renderer.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Accès : globale `renderer`
---@class renderer
renderer = {}

---Source : lua/common/libs/lustach/src/lustache/renderer.lua:238
---@param self any
---@param name any
---@param context any
---@param callback any
function renderer._inverted(self, name, context, callback) end

---Source : lua/common/libs/lustach/src/lustache/renderer.lua:270
---@param self any
---@param name any
---@param context any
---@param escape any
function renderer._name(self, name, context, escape) end

---Source : lua/common/libs/lustach/src/lustache/renderer.lua:252
---@param self any
---@param name any
---@param context any
---@param originalTemplate any
function renderer._partial(self, name, context, originalTemplate) end

---Source : lua/common/libs/lustach/src/lustache/renderer.lua:206
---@param self any
---@param token any
---@param context any
---@param callback any
---@param originalTemplate any
function renderer._section(self, token, context, callback, originalTemplate) end

---Source : lua/common/libs/lustach/src/lustache/renderer.lua:163
---@param self any
function renderer.clear_cache(self) end

---Source : lua/common/libs/lustach/src/lustache/renderer.lua:168
---@param self any
---@param tokens any
---@param tags any
---@param originalTemplate any
function renderer.compile(self, tokens, tags, originalTemplate) end

---Source : lua/common/libs/lustach/src/lustache/renderer.lua:379
---@param self any
function renderer.new(self) end

--- Breaks up the given `template` string into a tree of token objects. If
---  `tags` is given here it must be an array with two string values: the
---  opening and closing tags used in the template (e.g. ["<%", "%>"]). Of
---  course, the default is to use mustaches (i.e. Mustache.tags).
---Source : lua/common/libs/lustach/src/lustache/renderer.lua:291
---@param self any
---@param template any
---@param tags any
function renderer.parse(self, template, tags) end

---Source : lua/common/libs/lustach/src/lustache/renderer.lua:181
---@param self any
---@param template any
---@param view any
---@param partials any
function renderer.render(self, template, view, partials) end

