---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/tasklistLocale.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Helper used by the career tutorial steps to send the task list to the UI: it translates the text fields (label, subtext, labelController, subtextController) that are keys starting with "ui." or tables {txt=...}, fills the actionItems labels (fillActionLabels), then triggers the guihooks SetTasklistHeader / SetTasklistTask. Loaded by require, not as an extension.
--- Access: extension `career_modules_tutorial_tasklistLocale`: `extensions.load("career_modules_tutorial_tasklistLocale")`, then the global `career_modules_tutorial_tasklistLocale`
---@class career_modules_tutorial_tasklistLocale
career_modules_tutorial_tasklistLocale = {}

--- Returns a copy of a task list header with its texts translated.
---Source: lua/ge/extensions/career/modules/tutorial/tasklistLocale.lua:39
---@param header table Header (e.g. {label = "ui.…"}).
---@return table  Translated copy.
function career_modules_tutorial_tasklistLocale.resolveHeader(header) end

--- Returns a copy of a task (goal or message) with translated texts and resolved action labels.
---Source: lua/ge/extensions/career/modules/tutorial/tasklistLocale.lua:43
---@param task table Task (id, type, label, subtext, actionItems, attention...).
---@return table  Translated copy.
function career_modules_tutorial_tasklistLocale.resolveTask(task) end

--- Sends the translated header to the UI via guihooks.trigger("SetTasklistHeader").
---Source: lua/ge/extensions/career/modules/tutorial/tasklistLocale.lua:47
---@param header table Header to display.
function career_modules_tutorial_tasklistLocale.setTasklistHeader(header) end

--- Sends or updates a translated task in the UI via guihooks.trigger("SetTasklistTask").
---Source: lua/ge/extensions/career/modules/tutorial/tasklistLocale.lua:51
---@param task table Task to display or update.
function career_modules_tutorial_tasklistLocale.setTasklistTask(task) end

