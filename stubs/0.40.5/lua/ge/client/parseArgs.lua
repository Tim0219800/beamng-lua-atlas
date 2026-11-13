---@meta
-- tim19Atlas stub generated from lua/ge/client/parseArgs.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Analyse les arguments de la ligne de commande du jeu ($Game::argc / $Game::argv0…) et applique ou mémorise les options reconnues. Utile pour lancer BeamNG avec -level, -vehicle, -lua, -luafile, etc.
--- Accès : globale `parseArgs`
---@class parseArgs
---@field args table Résultat de l'analyse : clés vehicleConfig (string), useDefaultPc, translationScrambleDebug, enableAiRecordingForMissions (booléens). Remise à {} à chaque appel de defaultParseArgs.
parseArgs = {}

--- Réinitialise M.args puis parcourt tous les arguments de la ligne de commande et applique chaque option reconnue.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/client/parseArgs.lua:29
function parseArgs.defaultParseArgs() end

