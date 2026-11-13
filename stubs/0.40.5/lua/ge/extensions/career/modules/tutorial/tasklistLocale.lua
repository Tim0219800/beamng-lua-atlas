---@meta
-- tim19Atlas stub generated from lua/ge/extensions/career/modules/tutorial/tasklistLocale.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aide utilisée par les étapes du tutoriel de carrière pour envoyer la liste de tâches à l'UI : elle traduit les champs texte (label, subtext, labelController, subtextController) qui sont des clés commençant par « ui. » ou des tables {txt=...}, remplit les libellés des actionItems (fillActionLabels), puis déclenche les guihooks SetTasklistHeader / SetTasklistTask. Chargé par require, pas comme extension.
--- Accès : extension `career_modules_tutorial_tasklistLocale` : `extensions.load("career_modules_tutorial_tasklistLocale")`, puis la globale `career_modules_tutorial_tasklistLocale`
---@class career_modules_tutorial_tasklistLocale
career_modules_tutorial_tasklistLocale = {}

--- Retourne une copie d'un en-tête de liste de tâches avec ses textes traduits.
---Source : lua/ge/extensions/career/modules/tutorial/tasklistLocale.lua:39
---@param header table En-tête (ex. {label = "ui.…"}).
---@return table  Copie traduite.
function career_modules_tutorial_tasklistLocale.resolveHeader(header) end

--- Retourne une copie d'une tâche (goal ou message) avec textes traduits et libellés d'actions résolus.
---Source : lua/ge/extensions/career/modules/tutorial/tasklistLocale.lua:43
---@param task table Tâche (id, type, label, subtext, actionItems, attention…).
---@return table  Copie traduite.
function career_modules_tutorial_tasklistLocale.resolveTask(task) end

--- Envoie l'en-tête traduit à l'UI via guihooks.trigger("SetTasklistHeader").
---Source : lua/ge/extensions/career/modules/tutorial/tasklistLocale.lua:47
---@param header table En-tête à afficher.
function career_modules_tutorial_tasklistLocale.setTasklistHeader(header) end

--- Envoie ou met à jour une tâche traduite dans l'UI via guihooks.trigger("SetTasklistTask").
---Source : lua/ge/extensions/career/modules/tutorial/tasklistLocale.lua:51
---@param task table Tâche à afficher ou mettre à jour.
function career_modules_tutorial_tasklistLocale.setTasklistTask(task) end

