---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/audio.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE (core_audio) qui charge les banques FMOD du jeu. Au premier update, elle scanne /art/sound/fmod/<plateforme> (et le sous-dossier mods, plus le dossier _headphones si le mode casque est activé), regroupe les fichiers .bank en jeux de banques (assets/strings/streams/meta), les trie (strings d'abord, puis 'preload', puis par taille) et crée un SFXFMODProject par jeu. Elle gère aussi le rechargement à chaud des banques et le paramètre FMOD g_GamePause. Un moddeur l'utilise pour enregistrer une banque ou forcer un rechargement.
--- Accès : extension `core_audio` : `extensions.load("core_audio")`, puis la globale `core_audio`
---@class core_audio
core_audio = {}

--- Hook appelé à la fin d'un niveau. Ne fait rien (corps vide, avec un commentaire).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audio.lua:173
function core_audio.onClientEndMission() end

--- Hook appelé avant le démarrage d'un niveau. N'ajoute que des événements profileur (le chargement de banques de niveau est commenté).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audio.lua:165
---@param levelPath string Chemin du niveau
function core_audio.onClientPreStartMission(levelPath) end

--- Hook de restauration après rechargement Lua.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audio.lua:249
---@param data table Table renvoyée par onSerialize
function core_audio.onDeserialized(data) end

--- Hook appelé quand des fichiers surveillés changent : gère le rechargement à chaud des .bank (voir notes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audio.lua:210
---@param files table<integer, table> Liste d'entrées avec le champ filename (sans '/' initial)
function core_audio.onFilesChanged(files) end

--- Hook appelé au premier update du GE : scanne et charge les banques (populateBankSets puis loadBankSets), sauf si keepLoadedBanks est vrai (rechargement Lua : on ne fait rien).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audio.lua:150
function core_audio.onFirstUpdate() end

--- Hook appelé quand la physique est mise en pause : SFXSystem.setGlobalParameter('g_GamePause', 1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audio.lua:255
function core_audio.onPhysicsPaused() end

--- Hook appelé à la reprise de la physique : g_GamePause = 0.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audio.lua:259
function core_audio.onPhysicsUnpaused() end

--- Hook appelé quand l'état du replay change : met g_GamePause selon simTimeAuthority.getPause(), seulement si state ou paused a changé depuis la dernière fois.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audio.lua:263
---@param newState table Table avec les champs state et paused
function core_audio.onReplayStateChanged(newState) end

--- Hook de sérialisation avant rechargement Lua : renvoie keepLoadedBanks=true, levelProjectsCache et loadedBankCache.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/audio.lua:241
---@return table  {keepLoadedBanks, levelProjectsCache, loadedBankCache}
function core_audio.onSerialize() end

--- Enregistre une banque FMOD de base (voir notes pour le comportement avant/après l'initialisation).
---Source : lua/ge/extensions/core/audio.lua:15
---@param path string Chemin du fichier .bank, avec ou sans '/' initial (mis en minuscules)
function core_audio.registerBaseBank(path) end

--- Supprime les projets FMOD créés, vide les caches, prévient SFXFMODProject (hotloadingTriggered), re-scanne et recharge toutes les banques puis signale la fin (hotloadingCompleted).
---Source : lua/ge/extensions/core/audio.lua:188
function core_audio.triggerBankHotloading() end

