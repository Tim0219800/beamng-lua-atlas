---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/enums.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Énumérations partagées du système de rallye (notes de copilote) : mode audio des pacenotes, type de déclenchement (trigger), type de relâchement pour les virages lents, avec leurs noms lisibles. Ce sont des tables de constantes consultées par l'éditeur de notes et par le moteur de rallye ; le fichier ne contient aucune fonction.
--- Accès : extension `gameplay_rally_enums` : `extensions.load("gameplay_rally_enums")`, puis la globale `gameplay_rally_enums`
---@class gameplay_rally_enums
---@field pacenoteAudioMode table<string, integer> Modes audio : auto=1, freeform=2, structuredOnline=3, structuredOffline=4, custom=5.
---@field pacenoteAudioModeDisplayNames table<integer, string> Noms affichés à l'utilisateur (éditeur, debug) ; structuredOffline s'affiche 'structured'.
---@field pacenoteAudioModeHidden table<string, boolean> Modes masqués dans les listes de choix (freeform, structuredOnline) mais toujours fonctionnels pour les carnets existants.
---@field pacenoteAudioModeNames table<integer, string> Nom technique de chaque mode audio, indexé par valeur.
---@field slowCornerReleaseType table<string, integer> Moment de relâche d'une note de virage lent : csStaticMinus40=10, csStatic=20, csHalf=30, ceMinus5=40, ceStatic=50.
---@field slowCornerReleaseTypeName table<integer, string> Libellés correspondants (ex. '40m before corner start', 'at corner end').
---@field triggerType table<string, integer> Types de déclenchement d'une note : dynamic=1, csImmediate=15.
---@field triggerTypeName table<integer, string> Libellés des types de déclenchement ('dynamic (default)', 'immediate (only use for first pacenote)').
gameplay_rally_enums = {}

