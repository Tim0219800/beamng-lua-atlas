---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/styles/english/numbering/easy_medium_hard.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Numérotation anglaise partagée des virages en trois niveaux : hard, medium, easy. Chaque niveau donne le texte parlé, la plage de diamètre physique mesuré (m) et le visuel (icône de virage, couleurs). Utilisé par le style english/casual.
--- Accès : extension `gameplay_rally_compositors_styles_english_numbering_easy_medium_hard` : `extensions.load("gameplay_rally_compositors_styles_english_numbering_easy_medium_hard")`, puis la globale `gameplay_rally_compositors_styles_english_numbering_easy_medium_hard`
---@class gameplay_rally_compositors_styles_english_numbering_easy_medium_hard
---@field id string Identifiant du système : 'easy_medium_hard' (copié dans corner.numberingSystem).
---@field intensity table[] Trois entrées {id, text, diameter={min,max}, visual={icon, text, colorBg, colorStroke, ...}}, de la plus serrée (hard, rouge) à la plus ouverte (easy, vert).
gameplay_rally_compositors_styles_english_numbering_easy_medium_hard = {}

