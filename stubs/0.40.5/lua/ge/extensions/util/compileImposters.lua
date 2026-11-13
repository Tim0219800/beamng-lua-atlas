---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/compileImposters.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de build hors-ligne : pour une liste de niveaux, démarre chaque niveau en freeroam, attend qu'il soit chargé puis déclenche la compilation des imposters (Engine.Render.updateImposters(true)). Un compteur lié aux logs de la console sert à attendre que le moteur ait fini de travailler. Si la durée dépasse 6000 frames sans fin de job, le jeu s'arrête (shutdown(0)).
--- Accès : extension `util_compileImposters` : `extensions.load("util_compileImposters")`, puis la globale `util_compileImposters`
---@class util_compileImposters
util_compileImposters = {}

--- Lance le traitement d'une file de niveaux dans un job (un job à la fois).
---Source : lua/ge/extensions/util/compileImposters.lua:92
---@param queue string[] Noms de niveaux à traiter (passés à freeroam_freeroam.startFreeroamByName).
---@return boolean|nil  false si un traitement est déjà en cours, sinon nil.
function util_compileImposters.compileImposters(queue) end

--- Hook appelé à chaque ligne de log ; remet logCooldown à 6000 (le moteur est considéré actif).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/compileImposters.lua:121
---@param timer any Horodatage (non utilisé).
---@param lvl string Niveau de log.
---@param origin string Origine du log.
---@param line string Texte du log.
function util_compileImposters.onConsoleLog(timer, lvl, origin, line) end

--- Hook d'initialisation : passe l'extension en déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/compileImposters.lua:12
function util_compileImposters.onInit() end

--- Hook appelé quand le gestionnaire de mods est prêt : autorise la suite du job.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/compileImposters.lua:117
---@param mod any Non utilisé.
function util_compileImposters.onModManagerReady(mod) end

--- Hook appelé avant chaque rendu : décompte logCooldown et surveille le délai maximal (6000 frames) pendant un traitement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/compileImposters.lua:101
---@param dt number Durée de la frame (s).
function util_compileImposters.onPreRender(dt) end

