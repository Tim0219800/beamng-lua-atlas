---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/audioTiming.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Bornes et fonctions de limitation (clamp) des réglages d'espacement audio du copilote de rallye, en millisecondes : écart entre virages, entre phrases, entre mots de liaison et entre notes. Chaque fonction arrondit la valeur à l'entier et la ramène dans la plage autorisée. Utilisé par l'éditeur/les réglages et par gameplay_rally_audioManager.
--- Accès : extension `gameplay_rally_audioTiming` : `extensions.load("gameplay_rally_audioTiming")`, puis la globale `gameplay_rally_audioTiming`
---@class gameplay_rally_audioTiming
---@field cornerGapMs table Bornes {min=-200, max=200} de l'écart entre virages (ms). Table partagée avec phraseGapMs et linkWordGapMs.
---@field linkWordGapMs table Bornes {min=-200, max=200} de l'écart avec les mots de liaison (ms).
---@field pacenoteGapMs table Bornes {min=-100, max=400} de l'écart entre deux notes (ms).
---@field phraseGapMs table Bornes {min=-200, max=200} de l'écart entre phrases (ms).
gameplay_rally_audioTiming = {}

--- Arrondit et limite un écart entre virages à cornerGapMs.
---Source : lua/ge/extensions/gameplay/rally/audioTiming.lua:27
---@param value number|string Valeur en ms ; convertie par tonumber, 0 si invalide.
---@return integer  Valeur bornée en ms.
function gameplay_rally_audioTiming.clampCornerGapMs(value) end

--- Arrondit et limite un écart de mot de liaison à linkWordGapMs.
---Source : lua/ge/extensions/gameplay/rally/audioTiming.lua:35
---@param value number|string Valeur en ms.
---@return integer  Valeur bornée en ms.
function gameplay_rally_audioTiming.clampLinkWordGapMs(value) end

--- Arrondit et limite un écart entre notes à pacenoteGapMs.
---Source : lua/ge/extensions/gameplay/rally/audioTiming.lua:39
---@param value number|string Valeur en ms.
---@return integer  Valeur bornée en ms.
function gameplay_rally_audioTiming.clampPacenoteGapMs(value) end

--- Arrondit et limite un écart entre phrases à phraseGapMs.
---Source : lua/ge/extensions/gameplay/rally/audioTiming.lua:31
---@param value number|string Valeur en ms.
---@return integer  Valeur bornée en ms.
function gameplay_rally_audioTiming.clampPhraseGapMs(value) end

