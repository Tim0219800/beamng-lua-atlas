---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/styles/spanish/enthusiast.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Spanish rally note style ('Spanish enthusiast'): 1 to 6 numbering (uno to seis), 'izquierda'/'derecha' directions, shapes (se abre, se cierra...), descriptors (ka for square, horquilla, a fondo), cautions (cuidado, ojo, peligro), a reduced set of modifiers (frenando, freno, se estrecha, agua, salto, rasante, zona bacheada, con bache, no cortar, cruzar meta) and translated system notes. Defines its own distance configuration (links 'en' and 'para', 'punto' for the decimal point, max 5000 m) and its colors.
--- Access: extension `gameplay_rally_compositors_styles_spanish_enthusiast`: `extensions.load("gameplay_rally_compositors_styles_spanish_enthusiast")`, then the global `gameplay_rally_compositors_styles_spanish_enthusiast`
---@class gameplay_rally_compositors_styles_spanish_enthusiast
---@field componentTypes table corner (spanish/numbering/one_to_six numbering, direction, shapes, descriptors), caution and modifiers.
---@field composite function compositorUtil.compositeFromPhrases.
---@field distance table Spanish distance configuration {links, units, rounding, max=5000}.
---@field enumerate function compositorUtil.enumerateConcise.
---@field system table System notes in Spanish (precountdown 'Buena suerte!', countdown cinco..ya, seconds warnings, etc.).
---@field visualGeneral table {intoColor, distanceColor} (visual note colors).
gameplay_rally_compositors_styles_spanish_enthusiast = {}

