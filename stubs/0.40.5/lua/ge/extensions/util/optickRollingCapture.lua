---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/optickRollingCapture.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Capture « glissante » pour le profileur Optick. Un premier appel à toggle() démarre un enregistrement qui ne garde que les 20 dernières secondes ; un second appel arrête l'enregistrement, sauvegarde la capture dans <dossier utilisateur>/optick/optick_rolling_<date>.opt et ouvre Optick si la fonction globale launchOptick existe. Un message UI de 10 s confirme chaque étape.
--- Accès : extension `util_optickRollingCapture` : `extensions.load("util_optickRollingCapture")`, puis la globale `util_optickRollingCapture`
---@class util_optickRollingCapture
util_optickRollingCapture = {}

--- Démarre une capture glissante de 20 s si aucune capture n'est en cours ; sinon arrête la capture, la sauvegarde dans le dossier optick/ de l'utilisateur et lance Optick dessus.
---Source : lua/ge/extensions/util/optickRollingCapture.lua:18
function util_optickRollingCapture.toggle() end

