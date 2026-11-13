---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/weather.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Applique des préréglages météo (presets) en modifiant directement les champs d'objets de la scène (LevelInfo, CloudLayer, ScatterSky, etc.) : soit immédiatement (activate), soit par transition progressive (switchWeather). Les presets sont lus dans les fichiers JSON de art/weather/ puis dans le dossier weather/ du niveau courant (qui écrasent les globaux). Un moddeur s'en sert pour changer le ciel, la pluie ou le brouillard par script, ou pour ajouter ses propres presets par fichier JSON.
--- Accès : extension `core_weather` : `extensions.load("core_weather")`, puis la globale `core_weather`
---@class core_weather
core_weather = {}

--- Applique immédiatement le preset : pour chaque classe et chaque objet de cette classe dans la scène, écrit les attributs du preset. Mémorise le nom comme preset courant. Journalise une erreur si le preset est inconnu.
---Source : lua/ge/extensions/core/weather.lua:209
---@param presetName string Nom d'un preset chargé (voir getPresets).
function core_weather.activate(presetName) end

--- Affiche (dump) dans le journal tous les presets chargés ; outil de debug.
---Source : lua/ge/extensions/core/weather.lua:344
function core_weather.dumpWeather() end

--- Nom du dernier preset demandé par activate ou switchWeather.
---Source : lua/ge/extensions/core/weather.lua:22
---@return string|nil  Nom du preset courant, nil si aucun n'a été appliqué depuis le chargement de l'extension.
function core_weather.getCurrentWeatherPreset() end

--- Liste des noms des presets chargés (ordre non garanti).
---Source : lua/ge/extensions/core/weather.lua:315
---@return string[]  Noms des presets.
function core_weather.getPresets() end

--- Hook appelé après le démarrage d'un niveau : recharge les presets globaux puis ceux du niveau.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/weather.lua:337
---@param levelPath string Chemin du niveau (non utilisé : le code appelle getMissionFilename()).
function core_weather.onClientPostStartMission(levelPath) end

--- Hook appelé au chargement de l'extension : remet à zéro la transition et charge les presets.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/weather.lua:323
function core_weather.onExtensionLoaded() end

--- Hook appelé à chaque image avant le rendu : si une transition est en cours, avance le chronomètre, interpole les valeurs et termine la transition quand la durée est dépassée.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/weather.lua:273
---@param dt number Temps écoulé depuis l'image précédente, en secondes.
function core_weather.onPreRender(dt) end

--- Passe progressivement de la météo actuelle à celle du preset : lit les valeurs actuelles, calcule les différences, puis onPreRender interpole sur la durée donnée. Journalise (niveau info) et ne fait rien si le preset n'existe pas.
---Source : lua/ge/extensions/core/weather.lua:185
---@param presetName string Nom du preset cible.
---@param t number|nil Durée de la transition en secondes (15 par défaut).
function core_weather.switchWeather(presetName, t) end

