---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/saveDynamicData.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil automatisé interne : charge le niveau de test « autotest », puis fait apparaître chaque configuration de véhicule (filtrable par modèle ou par fichier .pc) et lance dans le véhicule l'extension dynamicVehicleData pour mesurer ses données dynamiques (dynamicVehicleData.performTests). Les résultats sont déposés dans vehicles/<modèle>/info_<config>.touched ; les configs déjà traitées sont sautées. Un chien de garde (20 s sans heartbeat) et une durée maximale (600 s) font passer au véhicule suivant. À la fin, le jeu est quitté (shutdown(0)).
--- Accès : extension `util_saveDynamicData` : `extensions.load("util_saveDynamicData")`, puis la globale `util_saveDynamicData`
---@class util_saveDynamicData
util_saveDynamicData = {}

--- Appelée par le côté véhicule pendant les tests pour signaler qu'il est toujours actif (réarme le chien de garde de 20 s).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/saveDynamicData.lua:197
function util_saveDynamicData.heartbeat() end

--- Hook appelé au démarrage d'un niveau ; marque le niveau comme prêt si c'est le niveau de test autotest.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/saveDynamicData.lua:135
---@param levelPath string Chemin du niveau démarré
function util_saveDynamicData.onClientStartMission(levelPath) end

--- Appelé au chargement : décharge/recharge les extensions de base si core_camera est absent, puis charge la liste noire de véhicules (blacklist.json, sinon blacklistDefault.json).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/saveDynamicData.lua:160
function util_saveDynamicData.onExtensionLoaded() end

--- Appelé au déchargement ; ne fait que logger.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/saveDynamicData.lua:201
function util_saveDynamicData.onExtensionUnloaded() end

--- Appelé à l'initialisation du module ; ne fait que logger.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/saveDynamicData.lua:26
function util_saveDynamicData.onInit() end

--- Appelée par le côté véhicule (dynamicVehicleData) quand les tests de la configuration courante sont terminés ; passe à la suivante.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/saveDynamicData.lua:193
function util_saveDynamicData.vehicleDone() end

--- Point d'entrée : mémorise les filtres, démarre le job de test et lance le niveau autotest s'il n'est pas déjà chargé.
---Source : lua/ge/extensions/util/saveDynamicData.lua:142
---@param pcFile string|nil Clé de configuration à tester (vide ou nil = toutes)
---@param vehicle string|nil Clé de modèle à tester (nil = tous)
function util_saveDynamicData.work(pcFile, vehicle) end

