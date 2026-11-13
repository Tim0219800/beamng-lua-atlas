---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/screenshotCreator/currentConfigThumbnail.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Sous-module de screenshotCreator qui génère la vignette de la configuration courante d'un véhicule. start() prépare une capture asynchrone : à chaque frame (onPreRender), une coroutine résout le cadrage selon le mode sélectionné (framingManager), capture la vignette hors écran (délai de 5 s maximum) puis appelle le callback avec le résultat. Une seule capture peut être active à la fois.
--- Accès : extension `util_screenshotCreator_currentConfigThumbnail` : `extensions.load("util_screenshotCreator_currentConfigThumbnail")`, puis la globale `util_screenshotCreator_currentConfigThumbnail`
---@class util_screenshotCreator_currentConfigThumbnail
---@field dependencies table
util_screenshotCreator_currentConfigThumbnail = {}

--- Hook appelé au déchargement : abandonne la capture en cours sans appeler son callback.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/currentConfigThumbnail.lua:70
function util_screenshotCreator_currentConfigThumbnail.onExtensionUnloaded() end

--- Hook appelé chaque frame avant le rendu : fait avancer la coroutine de capture. En cas d'erreur Lua, logue l'erreur, libère la capture et appelle le callback avec success = false.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/screenshotCreator/currentConfigThumbnail.lua:57
function util_screenshotCreator_currentConfigThumbnail.onPreRender() end

--- Démarre la capture de la vignette d'un véhicule. Refuse (false, "busy") si une capture est déjà en cours.
---Source : lua/ge/extensions/util/screenshotCreator/currentConfigThumbnail.lua:43
---@param vehicle userdata Véhicule à photographier
---@param configName string Nom de la configuration
---@param outputPath string Chemin du fichier image à produire
---@param callback function callback(success, outputPath, token, errorMessage?) appelé à la fin
---@param token any Valeur renvoyée telle quelle au callback
---@return boolean  true si la capture est lancée, false si occupé
---@return string|nil  "busy" en cas de refus
function util_screenshotCreator_currentConfigThumbnail.start(vehicle, configName, outputPath, callback, token) end

