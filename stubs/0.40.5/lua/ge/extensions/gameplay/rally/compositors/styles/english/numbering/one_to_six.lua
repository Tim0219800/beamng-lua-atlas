---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/styles/english/numbering/one_to_six.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Numérotation anglaise partagée des virages de 1 (très serré) à 6 (quasi plat), avec pour chaque niveau le texte parlé, la plage de diamètre physique (m), le visuel (icône turn1 à turn6, couleurs néon) et les tranches de longueur d'arc (short, standard, half long, long, extra long). Utilisé par english/enthusiast ; les fichiers de style gardent la responsabilité de la compatibilité des chaînes et de l'audio, ce module sert aux nouveaux styles composés et aux outils de calibrage.
--- Accès : extension `gameplay_rally_compositors_styles_english_numbering_one_to_six` : `extensions.load("gameplay_rally_compositors_styles_english_numbering_one_to_six")`, puis la globale `gameplay_rally_compositors_styles_english_numbering_one_to_six`
---@class gameplay_rally_compositors_styles_english_numbering_one_to_six
---@field id string 'one_to_six'.
---@field intensity table[] Six entrées {id, text, diameter, visual} ordonnées de one à six.
---@field lengthsByIntensity table<string, table[]> Pour chaque id d'intensité (one..six), cinq tranches {id, text, arcMeters={min,max}} ; la dernière (extraLong) n'a pas de max.
gameplay_rally_compositors_styles_english_numbering_one_to_six = {}

