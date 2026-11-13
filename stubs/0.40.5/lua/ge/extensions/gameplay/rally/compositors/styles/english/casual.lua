---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/styles/english/casual.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Style de notes de rallye 'English casual' : un copilote anglais simplifié qui annonce les virages en 'easy / medium / hard' (numérotation easy_medium_hard) plus les descripteurs flat, square et hairpin. Il n'énonce ni appel de distance (distance.callsEnabled = false), ni longueur, ni forme de virage. Il n'utilise qu'un sous-ensemble de modificateurs (sauts, crêtes, éclaboussures, changements de surface, stop/finish, chicanes) et des alias qui ramènent les autres variantes vers ces modificateurs. Réutilise les modules distance, visual, caution, systemPacenotes et modifiers du dossier english.
--- Accès : extension `gameplay_rally_compositors_styles_english_casual` : `extensions.load("gameplay_rally_compositors_styles_english_casual")`, puis la globale `gameplay_rally_compositors_styles_english_casual`
---@class gameplay_rally_compositors_styles_english_casual
---@field componentTypes table Registre des composants : corner (numérotation easy_medium_hard, direction left/right, descripteurs flat/square/hairpin), caution (english/caution), modifiers (sous-ensemble) et modifierAliases.
---@field composite function compositorUtil.compositeFromPhrases : (config, structured, distBefore, distAfter, escapeVars) -> liste de textes.
---@field distance table Config de distance copiée du style english/distance mais avec callsEnabled = false (aucun appel de distance parlé).
---@field enumerate function compositorUtil.enumerateConcise : (textCompositor, config) -> liste de phrases uniques.
---@field system table Notes système localisées (english/systemPacenotes).
---@field visualGeneral table Couleurs générales des notes visuelles (intoColor, distanceColor), depuis english/visual.
gameplay_rally_compositors_styles_english_casual = {}

