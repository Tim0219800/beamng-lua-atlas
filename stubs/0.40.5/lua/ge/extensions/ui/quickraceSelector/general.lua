---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/quickraceSelector/general.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Backend du sélecteur en grille de l'assistant Vue « Quickrace » : expose la liste des niveaux et, pour chaque niveau, sa liste de pistes. Le module ne contient aucune logique propre : il crée un backend avec ui/oneshotRaceSelector/core à partir du descripteur partagé quickRaceTrackDescriptor (identifiant "quickraceSelector") puis recopie toutes ses fonctions dans M.
--- Accès : extension `ui_quickraceSelector_general` : `extensions.load("ui_quickraceSelector_general")`, puis la globale `ui_quickraceSelector_general`
---@class ui_quickraceSelector_general
---@field dependencies table<integer, string> Extensions à charger avant : {"scenario_quickRaceLoader"}.
ui_quickraceSelector_general = {}

