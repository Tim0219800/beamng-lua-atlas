---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/styles/english/caution.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Composant 'caution' partagé par les styles anglais : textes des trois niveaux d'avertissement ('care', 'caution', 'double caution') et couleurs des notes visuelles correspondantes (fond, contour, icône, texte) tirées de compositors/helpers/colors.
--- Accès : extension `gameplay_rally_compositors_styles_english_caution` : `extensions.load("gameplay_rally_compositors_styles_english_caution")`, puis la globale `gameplay_rally_compositors_styles_english_caution`
---@class gameplay_rally_compositors_styles_english_caution
---@field levelVisuals table<integer, table> Couleurs par niveau : {colorBg, colorStroke, colorNoteIcon, colorNoteText}. Niveau 1 jaune sur noir, niveaux 2 et 3 rouge sur noir.
---@field levels table<integer, string> Texte parlé par niveau : [1]='care', [2]='caution', [3]='double caution'.
gameplay_rally_compositors_styles_english_caution = {}

