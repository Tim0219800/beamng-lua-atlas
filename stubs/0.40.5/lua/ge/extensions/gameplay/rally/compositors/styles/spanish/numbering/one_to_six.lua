---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/compositors/styles/spanish/numbering/one_to_six.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Numérotation espagnole partagée des virages de 1 à 6 : textes parlés (uno, dos, tres, cuatro, cinco, seis), plages de diamètre physique (m), visuels avec palette CSS BeamNG (red550, orange, yellow400, peach300, blue500, green500) et tranches de longueur d'arc (corta, standard sans texte, media larga, larga, extra larga). Utilisé par spanish/enthusiast.
--- Accès : extension `gameplay_rally_compositors_styles_spanish_numbering_one_to_six` : `extensions.load("gameplay_rally_compositors_styles_spanish_numbering_one_to_six")`, puis la globale `gameplay_rally_compositors_styles_spanish_numbering_one_to_six`
---@class gameplay_rally_compositors_styles_spanish_numbering_one_to_six
---@field id string 'one_to_six'.
---@field intensity table[] Six entrées {id, text, diameter, visual} ordonnées de one à six.
---@field lengthsByIntensity table<string, table[]> Pour chaque intensité, cinq tranches {id, text, arcMeters={min,max}} (short, standard, halfLong, long, extraLong).
gameplay_rally_compositors_styles_spanish_numbering_one_to_six = {}

