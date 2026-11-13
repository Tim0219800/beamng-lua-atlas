---@meta
-- tim19Atlas stub generated from lua/common/libs/lunajson/lunajson/decoder.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bibliothèque tierce lunajson : décodeur JSON. Le module renvoie une fabrique `newdecoder()` ; chaque appel crée un contexte de décodage indépendant et renvoie la fonction `decode(json, pos?, nullv?, arraylen?)`. Le décodeur gère les nombres (entiers et flottants), les chaînes avec échappements et paires de substitution Unicode, et limite la profondeur d'imbrication à 1000.
--- Accès : `require("libs/lunajson/lunajson/decoder")`
---@class libs_lunajson_lunajson_decoder
local libs_lunajson_lunajson_decoder = {}

