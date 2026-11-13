---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/calibrateESC.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil interne de mesure automatisée du contrôle de stabilité (ESC) des véhicules. Il charge le niveau /levels/smallgrid/info.json, puis pour chaque config de véhicule (hors liste noire et hors configs déjà traitées) remplace le véhicule joueur, charge l'extension véhicule escMeasurement, lance escMeasurement.performTests(modèle, config) et attend la fin (vehicleDone), un watchdog de 20 s sans heartbeat ou une durée maximale. À la fin, le jeu s'arrête (shutdown(0)). Prévu pour une exécution automatisée par un script de worker, pas pour un usage normal.
--- Accès : extension `util_calibrateESC` : `extensions.load("util_calibrateESC")`, puis la globale `util_calibrateESC`
---@class util_calibrateESC
util_calibrateESC = {}

--- À appeler (depuis le véhicule) régulièrement pour signaler que le test progresse et réinitialiser le watchdog.
---Source : lua/ge/extensions/util/calibrateESC.lua:203
function util_calibrateESC.heartbeat() end

--- Hook appelé au démarrage d'un niveau ; si c'est le niveau de test (/levels/smallgrid/info.json), autorise la suite du travail.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/calibrateESC.lua:141
---@param levelPath string Chemin du niveau démarré.
function util_calibrateESC.onClientStartMission(levelPath) end

--- Hook de chargement : règle la vitesse de physique à 2, charge la liste noire de véhicules et affiche les véhicules ignorés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/calibrateESC.lua:165
function util_calibrateESC.onExtensionLoaded() end

--- Hook de déchargement : ne fait que logguer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/calibrateESC.lua:207
function util_calibrateESC.onExtensionUnloaded() end

--- Hook appelé au chargement du module (tous les systèmes ne sont pas forcément prêts) ; ne fait que logguer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/calibrateESC.lua:24
function util_calibrateESC.onInit() end

--- À appeler (depuis le véhicule) quand les mesures d'un véhicule sont terminées : passe au suivant.
---Source : lua/ge/extensions/util/calibrateESC.lua:199
function util_calibrateESC.vehicleDone() end

--- Démarre le travail de calibrage dans un job, charge le niveau de test s'il n'est pas déjà chargé.
---Source : lua/ge/extensions/util/calibrateESC.lua:147
---@param pcFile string|nil Clé de la config à tester ; nil ou vide pour toutes.
---@param vehicle string|nil Clé du modèle à tester ; nil pour tous.
function util_calibrateESC.work(pcFile, vehicle) end

