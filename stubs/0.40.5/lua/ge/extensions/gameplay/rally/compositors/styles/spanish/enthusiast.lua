---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/styles/spanish/enthusiast.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Style de notes de rallye en espagnol ('Spanish enthusiast') : numérotation 1 à 6 (uno à seis), directions 'izquierda'/'derecha', formes (se abre, se cierra...), descripteurs (ka pour square, horquilla, a fondo), cautions (cuidado, ojo, peligro), un jeu réduit de modificateurs (frenando, freno, se estrecha, agua, salto, rasante, zona bacheada, con bache, no cortar, cruzar meta) et notes système traduites. Définit sa propre configuration de distance (liens 'en' et 'para', 'punto' pour la virgule, max 5000 m) et ses couleurs.
--- Accès : extension `gameplay_rally_compositors_styles_spanish_enthusiast` : `extensions.load("gameplay_rally_compositors_styles_spanish_enthusiast")`, puis la globale `gameplay_rally_compositors_styles_spanish_enthusiast`
---@class gameplay_rally_compositors_styles_spanish_enthusiast
---@field componentTypes table corner (numérotation spanish/numbering/one_to_six, direction, shapes, descriptors), caution et modifiers.
---@field composite function compositorUtil.compositeFromPhrases.
---@field distance table Configuration de distance espagnole {links, units, rounding, max=5000}.
---@field enumerate function compositorUtil.enumerateConcise.
---@field system table Notes système en espagnol (précompte 'Buena suerte!', compte à rebours cinco..ya, avertissements de secondes, etc.).
---@field visualGeneral table {intoColor, distanceColor} (couleurs des notes visuelles).
gameplay_rally_compositors_styles_spanish_enthusiast = {}

