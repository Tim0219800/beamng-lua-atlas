---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/environment.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_environment` : point d'entrée unique pour lire et modifier l'environnement du niveau (heure du jour, nuages, vent, brouillard, précipitations, gravité, température) et pour charger les ground models (art/groundmodels.json + groundModels/*.json du niveau). Il agit sur les objets de la scène (TimeOfDay, CloudLayer, LevelInfo, Precipitation) trouvés par classe, allume/éteint les lumières nocturnes selon l'heure, et envoie l'état à l'UI. Un moddeur l'utilise pour changer l'heure, le vent ou la gravité par script, ou pour réagir à `onEnvironmentChanged`.
--- Accès : extension `core_environment` : `extensions.load("core_environment")`, puis la globale `core_environment`
---@class core_environment
---@field dayCyclePresets table[] {speed, seconds} : secondes réelles par cycle jour/nuit : fast 900, normal 1800, slow 7200, realtime 86400.
---@field defaultSolarTimeOfDayOptions table[] Copie profonde de defaultTimeOfDayOptions, base pour les options calculées astronomiquement.
---@field defaultTimeOfDayOptions table[] Liste {key, value, label} des moments clés : sunrise 0.775, morning 0.825, earlyNoon 0.9, noon 0, lateNoon 0.1, afternoon 0.175, evening 0.23, sunset 0.245, night 0.5. label = clé de traduction.
---@field dependencies string[] {'core_solarTimeOfDay'} : extension chargée avant celle-ci (calcul solaire : fenêtre de nuit, événements lever/coucher).
---@field gravityPresets table[] Presets {key, title, value} en m/s² (terre -9.81, lune -1.62, mars -3.71, soleil -274, jupiter -24.92, neptune -11.15, saturne -10.44, uranus -8.87, vénus -8.87, mercure -3.7, pluton -0.58, zéro 0, terre inversée 9.81).
---@field groundModels table<string, {cdata: any, isAlias: boolean, parent: string}> Ground models connus, clés en MAJUSCULES. cdata = structure C++ ground_model ; isAlias/parent indiquent si l'entrée est un alias d'un autre modèle. Reconstruit par reloadGroundModels.
---@field loadedGroundModelFiles string[] Chemins des fichiers JSON de ground models chargés (commun + niveau). Sert à onFilesChanged pour détecter une modification à chaud.
---@field simSpeedPresets table[] {key, label, value} : facteurs de ralenti de la simulation (value = diviseur : 1 temps réel, 2 = 1/2x, 4, 10, 25, 50, 100, 1000).
---@field timeOfDayKeyToTime table<string, number> Table clé -> valeur de time pour les moments clés par défaut (noon -> 0, night -> 0.5, …).
core_environment = {}

--- Indique si les modifications d'environnement sont autorisées.
---Source : lua/ge/extensions/core/environment.lua:1769
---@return boolean  État du drapeau défini par enableChanges (true par défaut).
function core_environment.canChange() end

--- Fait passer l'heure à la valeur suivante parmi trois : si time < 0.2 -> 0.23 (soir), si time >= 0.5 -> 0.05 (jour), sinon -> 0.5 (nuit).
---Source : lua/ge/extensions/core/environment.lua:776
function core_environment.cycleTimeOfDay() end

--- Écrit groundmodels_dump.json avec les propriétés physiques de chaque ground model enregistré (frottements, résistance, densité du fluide…). Outil de debug.
---Source : lua/ge/extensions/core/environment.lua:1579
function core_environment.dumpGroundModels() end

--- Autorise ou interdit les modifications de l'environnement et prévient l'UI.
---Source : lua/ge/extensions/core/environment.lua:1764
---@param enabled boolean false = les setters n'écrivent plus sur la scène.
function core_environment.enableChanges(enabled) end

--- Déprécié : renvoie nil.
---Source : lua/ge/extensions/core/environment.lua:833
---@return nil  nil
function core_environment.getAmbientScaleGradientFile() end

--- Cherche dans les *.level.json du dossier du niveau (hors /scenarios/) une valeur dayLength écrite explicitement dans l'objet TimeOfDay (le moteur remplit dayLength même si absent du fichier).
---Source : lua/ge/extensions/core/environment.lua:2005
---@param levelDir string Dossier du niveau.
---@return number|nil  Secondes (> 0) ou nil.
function core_environment.getAuthoredDayLength(levelDir) end

--- Altitude des nuages en km.
---Source : lua/ge/extensions/core/environment.lua:947
---@return number|nil  km.
function core_environment.getCloudAltitudeKm() end

--- Altitude (km) d'un CloudLayer précis.
---Source : lua/ge/extensions/core/environment.lua:1107
---@param objectID integer Id de l'objet.
---@return number|nil  km.
function core_environment.getCloudAltitudeKmByID(objectID) end

--- Altitude des cirrus.
---Source : lua/ge/extensions/core/environment.lua:1015
---@return number|nil  km.
function core_environment.getCloudCirrusAltitudeKm() end

--- Altitude des cirrus (km) d'un CloudLayer précis.
---Source : lua/ge/extensions/core/environment.lua:1120
---@param objectID integer Id de l'objet.
---@return number|nil  km.
function core_environment.getCloudCirrusAltitudeKmByID(objectID) end

--- Couverture des cirrus.
---Source : lua/ge/extensions/core/environment.lua:1023
---@return number|nil  Valeur du champ cirrusCoverage.
function core_environment.getCloudCirrusCoverage() end

--- Couverture des cirrus d'un CloudLayer précis.
---Source : lua/ge/extensions/core/environment.lua:1133
---@param objectID integer Id de l'objet.
---@return number|nil  cirrusCoverage.
function core_environment.getCloudCirrusCoverageByID(objectID) end

--- Densité des cirrus.
---Source : lua/ge/extensions/core/environment.lua:1031
---@return number|nil  Valeur du champ cirrusDensity.
function core_environment.getCloudCirrusDensity() end

--- Densité des cirrus d'un CloudLayer précis.
---Source : lua/ge/extensions/core/environment.lua:1146
---@param objectID integer Id de l'objet.
---@return number|nil  cirrusDensity.
function core_environment.getCloudCirrusDensityByID(objectID) end

--- Lit CloudLayer.coverage du premier CloudLayer.
---Source : lua/ge/extensions/core/environment.lua:912
---@return number|nil  Couverture, nil sans CloudLayer.
function core_environment.getCloudCover() end

--- Couverture d'un CloudLayer précis.
---Source : lua/ge/extensions/core/environment.lua:1041
---@param objectID integer Id de l'objet scène.
---@return number|nil  coverage.
function core_environment.getCloudCoverByID(objectID) end

--- Déprécié : log un avertissement.
---Source : lua/ge/extensions/core/environment.lua:1054
---@param objectID integer Ignoré.
---@return nil  Toujours nil.
function core_environment.getCloudExposureByID(objectID) end

--- Champ height d'un CloudLayer précis.
---Source : lua/ge/extensions/core/environment.lua:1076
---@param objectID integer Id de l'objet.
---@return number|nil  height.
function core_environment.getCloudHeightByID(objectID) end

--- Décalage de la carte météo des nuages (CloudLayer.getWeatherOffsetKm).
---Source : lua/ge/extensions/core/environment.lua:952
---@return vec3|nil  Décalage en km ; nil si l'API C++ n'est pas disponible.
function core_environment.getCloudWeatherOffsetKm() end

--- windSpeed d'un CloudLayer précis.
---Source : lua/ge/extensions/core/environment.lua:1063
---@param objectID integer Id de l'objet.
---@return number|nil  windSpeed.
function core_environment.getCloudWindByID(objectID) end

--- Direction du vent des nuages.
---Source : lua/ge/extensions/core/environment.lua:929
---@return vec3|nil  vec3(x, y, 0) ; nil sans CloudLayer.
function core_environment.getCloudWindDirection() end

--- Direction du vent d'un CloudLayer précis.
---Source : lua/ge/extensions/core/environment.lua:1089
---@param objectID integer Id de l'objet.
---@return vec3|nil  vec3(x, y, 0).
function core_environment.getCloudWindDirectionByID(objectID) end

--- Déprécié : renvoie nil.
---Source : lua/ge/extensions/core/environment.lua:815
---@return nil  nil
function core_environment.getColorizeGradientFile() end

--- Renvoie M.dayCyclePresets.
---Source : lua/ge/extensions/core/environment.lua:1982
---@return table[]  {speed, seconds}.
function core_environment.getDayCyclePresets() end

--- Durée en secondes réelles du cycle jour/nuit pour un preset.
---Source : lua/ge/extensions/core/environment.lua:1986
---@param speed string 'fast', 'normal', 'slow' ou 'realtime'.
---@return number|nil  900, 1800, 7200 ou 86400 ; nil si inconnu.
function core_environment.getDayCycleSeconds(speed) end

--- Renvoie M.defaultTimeOfDayOptions.
---Source : lua/ge/extensions/core/environment.lua:718
---@return table[]  Moments clés par défaut.
function core_environment.getDefaultTimeOfDayOptions() end

--- Hauteur d'atmosphère du brouillard.
---Source : lua/ge/extensions/core/environment.lua:1201
---@return number  0.0 sans LevelInfo.
function core_environment.getFogAtmosphereHeight() end

--- Densité brute du brouillard de LevelInfo.
---Source : lua/ge/extensions/core/environment.lua:1174
---@return number  fogDensity, 0.0 sans LevelInfo.
---@return userdata|nil  Objet LevelInfo.
function core_environment.getFogDensity() end

--- Déprécié : log un avertissement.
---Source : lua/ge/extensions/core/environment.lua:1187
---@return nil  Toujours nil.
function core_environment.getFogDensityOffset() end

--- Déprécié : renvoie nil.
---Source : lua/ge/extensions/core/environment.lua:842
---@return nil  nil
function core_environment.getFogScaleGradientFile() end

--- Gravité du niveau (LevelInfo.gravity).
---Source : lua/ge/extensions/core/environment.lua:1223
---@return number  m/s² (négatif vers le bas) ; -9.81 si LevelInfo absent.
function core_environment.getGravity() end

--- Renvoie M.gravityPresets.
---Source : lua/ge/extensions/core/environment.lua:1974
---@return table[]  Presets de gravité.
function core_environment.getGravityPresets() end

--- Renvoie le vec3 interne du vent au sol (référence directe, ne pas modifier).
---Source : lua/ge/extensions/core/environment.lua:878
---@return vec3  Vent en m/s.
function core_environment.getGroundWind() end

--- Copie de l'état capturé au chargement du niveau (onClientPostStartMission), avec temperatureProfile calculé sur la courbe d'origine du niveau et éventuellement authoredDayLength.
---Source : lua/ge/extensions/core/environment.lua:1757
---@return table  État initial.
function core_environment.getInitState() end

--- État d'éclairage du monde : jour ou nuit. Retourne {time, phase = 'day'|'night', isNight, nightLightsActive, nightStart, nightEnd}. nightLightsActive reflète ce que le moteur a réellement appliqué.
---Source : lua/ge/extensions/core/environment.lua:541
---@return table|nil  nil s'il n'y a pas de TimeOfDay.
function core_environment.getLightState() end

--- Déprécié : renvoie nil.
---Source : lua/ge/extensions/core/environment.lua:860
---@return nil  nil
function core_environment.getNightFogGradientFile() end

--- Déprécié : renvoie nil.
---Source : lua/ge/extensions/core/environment.lua:851
---@return nil  nil
function core_environment.getNightGradientFile() end

--- Nombre de gouttes de l'objet Precipitation.
---Source : lua/ge/extensions/core/environment.lua:1241
---@return number|nil  nil sans objet Precipitation.
function core_environment.getPrecipitation() end

--- Déprécié : renvoie nil.
---Source : lua/ge/extensions/core/environment.lua:797
---@return nil  nil
function core_environment.getShadowDistance() end

--- Renvoie M.simSpeedPresets.
---Source : lua/ge/extensions/core/environment.lua:1978
---@return table[]  Presets de ralenti.
function core_environment.getSimSpeedPresets() end

--- Déprécié : renvoie nil.
---Source : lua/ge/extensions/core/environment.lua:806
---@return nil  nil
function core_environment.getSkyBrightness() end

--- Options de moments calculées pour la position et la date solaires de l'état, à partir des options par défaut.
---Source : lua/ge/extensions/core/environment.lua:722
---@param state table|nil État TimeOfDay ; défaut getTimeOfDay().
---@return table  Options.
function core_environment.getSolarTimeOfDayOptions(state) end

--- Valeur de time pour une clé de moment (ex. 'sunrise') avec la date/position de l'état.
---Source : lua/ge/extensions/core/environment.lua:726
---@param key string Clé : sunrise, morning, earlyNoon, noon, lateNoon, afternoon, evening, sunset, night.
---@param state table|nil État TimeOfDay ; défaut getTimeOfDay().
---@return number|nil  time normalisé 0..1 (selon core_solarTimeOfDay).
function core_environment.getSolarTimeOfDayValue(key, state) end

--- Construit l'état complet de l'environnement. Clés : champs TimeOfDay (time, play, dayLength, startTime, latitude, longitude, year, month, day, utcOffset, dstRule, celestialProfile), windSpeed, groundWind, cloudCover, cloudWindDirection, cloudAltitudeKm, cloudWeatherOffsetKm, cloudCirrus*, fogDensity (x1000), fogAtmosphereHeight, numOfDrops, gravity, temperatureC (°C), temperatureProfile, temperatureCurveOverrideC.
---Source : lua/ge/extensions/core/environment.lua:1364
---@return table|nil  Table d'état (jamais nil en pratique car temperatureCurveOverrideC est toujours présent).
function core_environment.getState() end

--- Déprécié : renvoie nil.
---Source : lua/ge/extensions/core/environment.lua:824
---@return nil  nil
function core_environment.getSunScaleGradientFile() end

--- Température de l'air au niveau de la mer actuellement envoyée au moteur.
---Source : lua/ge/extensions/core/environment.lua:1250
---@return number  Kelvins (0.0 tant que la courbe n'a pas été évaluée).
function core_environment.getTemperatureK() end

--- Lit l'objet scène TimeOfDay et renvoie un état partagé (la même table est réutilisée à chaque appel : copier avant de conserver).
---Source : lua/ge/extensions/core/environment.lua:514
---@return table|nil  {time, play, dayLength, startTime, latitude, longitude, year, month, day, utcOffset, dstRule, celestialProfile} ; nil s'il n'y a pas d'objet TimeOfDay (menu principal).
function core_environment.getTimeOfDay() end

--- Options de moments de la journée adaptées au niveau, calculées astronomiquement (core_solarTimeOfDay) à partir des options du niveau (core_levels).
---Source : lua/ge/extensions/core/environment.lua:713
---@param levelIdentifier string|nil Identifiant du niveau ; défaut getCurrentLevelIdentifier().
---@return table  Liste d'options {key, value, label…}.
function core_environment.getTimeOfDayOptions(levelIdentifier) end

--- Convertit un temps normalisé via core_solarTimeOfDay.timeFromNormalizedTime pour l'état donné (sens exact défini dans core_solarTimeOfDay).
---Source : lua/ge/extensions/core/environment.lua:730
---@param normalizedTime number Temps normalisé.
---@param state table|nil État TimeOfDay ; défaut getTimeOfDay().
---@return number|nil  Valeur de time.
function core_environment.getTimeOfDayValueForNormalizedTime(normalizedTime, state) end

--- Lit CloudLayer.windSpeed du premier CloudLayer.
---Source : lua/ge/extensions/core/environment.lua:896
---@return number|nil  nil sans CloudLayer.
function core_environment.getWindSpeed() end

--- Charge des traces de pneus depuis un fichier.
---Source : lua/ge/extensions/core/environment.lua:1968
---@param filename string|nil Défaut 'tiremarks.dat'.
function core_environment.loadTireMarks(filename) end

--- Hook à la fin du niveau : arrête l'horloge TimeOfDay, remet le vent à 0, vide les lumières nocturnes et appelle reset.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/environment.lua:1870
function core_environment.onClientEndMission() end

--- Hook après démarrage du niveau : mémorise l'état initial (init_env), y ajoute authoredDayLength puis le réapplique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/environment.lua:1782
---@param levelPath string Chemin du niveau.
function core_environment.onClientPostStartMission(levelPath) end

--- Hook avant le démarrage d'un niveau : relit la courbe de température, supprime l'override, recharge les ground models.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/environment.lua:1773
---@param levelPath string Chemin du niveau.
function core_environment.onClientPreStartMission(levelPath) end

--- Hook au démarrage du niveau : vide le cache d'objets, recense les lumières nocturnes, applique le vent et régénère la carte météo avec une graine aléatoire.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/environment.lua:1835
---@param levelPath string Chemin du niveau.
function core_environment.onClientStartMission(levelPath) end

--- Hook de restauration : réapplique le vent au sol sauvegardé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/environment.lua:1890
---@param data table Table renvoyée par onSerialize.
function core_environment.onDeserialized(data) end

--- Hook après sauvegarde : restaure l'état des lumières nocturnes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/environment.lua:1863
function core_environment.onEditorAfterSaveLevel() end

--- Hook avant sauvegarde du niveau dans l'éditeur : éteint les lumières nocturnes pour ne pas les sauvegarder allumées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/environment.lua:1854
function core_environment.onEditorBeforeSaveLevel() end

--- Hook à la sortie de l'éditeur : vide le cache et recense à nouveau les lumières nocturnes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/environment.lua:1849
function core_environment.onEditorDeactivated() end

--- Hook appelé quand des fichiers changent : si un fichier de ground models chargé est modifié, appelle reset() et be:reloadCollision().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/environment.lua:1793
---@param files table[] Liste d'entrées avec champ filename.
function core_environment.onFilesChanged(files) end

--- Alias de reset : appelé au chargement de l'extension.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/environment.lua:1742
function core_environment.onInit() end

--- Hook de sauvegarde avant rechargement des extensions : renvoie {groundWind}.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/environment.lua:1887
---@return table  {groundWind = vec3}.
function core_environment.onSerialize() end

--- Hook par image : avance la transition d'état, applique les lumières nocturnes et met à jour la température effective selon l'heure.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/environment.lua:1818
---@param dtReal number Delta temps réel en secondes.
function core_environment.onUpdate(dtReal) end

--- Hook : ré-applique le vent au sol (alias de applyGroundWind).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/environment.lua:49
function core_environment.onVehicleResetted() end

--- Hook : ré-applique le vent au sol aux véhicules (alias de applyGroundWind, reçoit l'id du véhicule mais l'ignore).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/environment.lua:49
function core_environment.onVehicleSpawned() end

--- Recense dans la scène les lumières à allumer la nuit (champ nightLight), les lumières à intensité jour/nuit (dayIntensity/nightIntensity), et les TSStatic émissifs (nightEmissive ou liés par le champ `child` à une lumière), puis applique l'état courant. À appeler après avoir ajouté de tels objets en cours de partie.
---Source : lua/ge/extensions/core/environment.lua:559
function core_environment.refreshnightLightsObjects() end

--- Régénère la carte météo (forme des nuages) avec une graine. Appelée avec une graine aléatoire à chaque chargement de niveau.
---Source : lua/ge/extensions/core/environment.lua:986
---@param seed integer|nil Graine, arrondie et bornée à 0..2147483647 ; aléatoire si nil.
---@return boolean  true si exécuté.
---@return integer|nil  Graine normalisée utilisée (absente si l'API C++ manque).
function core_environment.regenerateWeatherMap(seed) end

--- Réinitialise puis recharge tous les ground models : art/groundmodels.json, puis les *.json de <niveau>/groundModels/. ASPHALT est soumis en premier (indice 0), puis les autres par ordre alphabétique. Les noms sont mis en majuscules et tronqués à 30 caractères si > 31.
---Source : lua/ge/extensions/core/environment.lua:1712
---@param levelPath string|nil Chemin du niveau ; défaut getMissionFilename().
function core_environment.reloadGroundModels(levelPath) end

--- Alias de sendState : envoie l'état courant à l'UI (guihooks EnvironmentStateUpdate) et l'état du drapeau canChange.
---Source : lua/ge/extensions/core/environment.lua:1812
function core_environment.requestState() end

--- Relit la courbe de température du niveau, supprime l'override de température, notifie l'UI et recharge les ground models. Sert aussi de onInit.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/environment.lua:1742
function core_environment.reset() end

--- Remet le décalage météo à (0,0,0).
---Source : lua/ge/extensions/core/environment.lua:977
---@return boolean  Résultat de setCloudWeatherOffsetKm.
function core_environment.resetCloudWeatherOffsetKm() end

--- Supprime l'override et revient à la courbe de température du niveau.
---Source : lua/ge/extensions/core/environment.lua:1433
function core_environment.resetTemperatureProfile() end

--- Efface toutes les traces de pneus (be:resetTireMarks).
---Source : lua/ge/extensions/core/environment.lua:1956
function core_environment.resetTireMarks() end

--- Ré-applique l'état initial du niveau (setState(init_env)).
---Source : lua/ge/extensions/core/environment.lua:1753
function core_environment.reset_init() end

--- Sauvegarde les traces de pneus dans un fichier.
---Source : lua/ge/extensions/core/environment.lua:1962
---@param filename string|nil Défaut 'tiremarks.dat'.
function core_environment.saveTireMarks(filename) end

--- Déprécié : avertissement seul.
---Source : lua/ge/extensions/core/environment.lua:838
---@param ambientScaleGradientFile any Ignoré.
function core_environment.setAmbientScaleGradientFile(ambientScaleGradientFile) end

--- Altitude de la couche de nuages.
---Source : lua/ge/extensions/core/environment.lua:937
---@param altitudeKm number Altitude en kilomètres.
function core_environment.setCloudAltitudeKm(altitudeKm) end

--- Fixe l'altitude (km) d'un CloudLayer précis.
---Source : lua/ge/extensions/core/environment.lua:1112
---@param objectID integer Id de l'objet.
---@param altitudeKm number km.
function core_environment.setCloudAltitudeKmByID(objectID, altitudeKm) end

--- Fixe l'altitude des cirrus.
---Source : lua/ge/extensions/core/environment.lua:1019
---@param altitudeKm number km.
function core_environment.setCloudCirrusAltitudeKm(altitudeKm) end

--- Fixe l'altitude des cirrus d'un CloudLayer précis.
---Source : lua/ge/extensions/core/environment.lua:1125
---@param objectID integer Id de l'objet.
---@param altitudeKm number km.
function core_environment.setCloudCirrusAltitudeKmByID(objectID, altitudeKm) end

--- Fixe la couverture des cirrus.
---Source : lua/ge/extensions/core/environment.lua:1027
---@param coverage number Valeur de cirrusCoverage.
function core_environment.setCloudCirrusCoverage(coverage) end

--- Fixe la couverture des cirrus d'un CloudLayer précis.
---Source : lua/ge/extensions/core/environment.lua:1138
---@param objectID integer Id de l'objet.
---@param coverage number Couverture.
function core_environment.setCloudCirrusCoverageByID(objectID, coverage) end

--- Fixe la densité des cirrus.
---Source : lua/ge/extensions/core/environment.lua:1035
---@param density number Valeur de cirrusDensity.
function core_environment.setCloudCirrusDensity(density) end

--- Fixe la densité des cirrus d'un CloudLayer précis.
---Source : lua/ge/extensions/core/environment.lua:1151
---@param objectID integer Id de l'objet.
---@param density number Densité.
function core_environment.setCloudCirrusDensityByID(objectID, density) end

--- Fixe CloudLayer.coverage du premier CloudLayer et annule une transition d'état en cours.
---Source : lua/ge/extensions/core/environment.lua:901
---@param cloud number Couverture nuageuse (plage de lerp 0..3 dans setState).
function core_environment.setCloudCover(cloud) end

--- Fixe la couverture d'un CloudLayer précis (sans hook, sans test enableChanges).
---Source : lua/ge/extensions/core/environment.lua:1046
---@param objectID integer Id de l'objet.
---@param coverage number Couverture.
function core_environment.setCloudCoverByID(objectID, coverage) end

--- Déprécié : log un avertissement, ne fait rien.
---Source : lua/ge/extensions/core/environment.lua:1059
---@param objectID integer Ignoré.
---@param exposure any Ignoré.
function core_environment.setCloudExposureByID(objectID, exposure) end

--- Fixe le champ height d'un CloudLayer précis.
---Source : lua/ge/extensions/core/environment.lua:1081
---@param objectID integer Id de l'objet.
---@param height number Hauteur.
function core_environment.setCloudHeightByID(objectID, height) end

--- Décale la carte météo des nuages. Émet onEnvironmentChanged.
---Source : lua/ge/extensions/core/environment.lua:962
---@param ... vec3|number Un vec3 ou 3 nombres x, y, z en km.
---@return boolean  true si appliqué, false si l'API est absente ou si les changements sont désactivés (nil si l'argument est nil).
function core_environment.setCloudWeatherOffsetKm(...) end

--- Fixe windSpeed d'un CloudLayer précis.
---Source : lua/ge/extensions/core/environment.lua:1068
---@param objectID integer Id de l'objet.
---@param windSpeed number Vitesse.
function core_environment.setCloudWindByID(objectID, windSpeed) end

--- Fixe CloudLayer.windDirection (Point2F) du premier CloudLayer ; seuls x et y sont utilisés.
---Source : lua/ge/extensions/core/environment.lua:918
---@param ... vec3|number Un vec3 ou deux nombres x, y.
function core_environment.setCloudWindDirection(...) end

--- Fixe la direction du vent d'un CloudLayer précis.
---Source : lua/ge/extensions/core/environment.lua:1098
---@param objectID integer Id de l'objet.
---@param ... vec3|number Un vec3 ou deux nombres x, y.
function core_environment.setCloudWindDirectionByID(objectID, ...) end

--- Déprécié : avertissement seul.
---Source : lua/ge/extensions/core/environment.lua:820
---@param colorizeGradientFile any Ignoré.
function core_environment.setColorizeGradientFile(colorizeGradientFile) end

--- Fixe LevelInfo.FogAtmosphereHeight. N'émet pas onEnvironmentChanged et ignore enableChanges.
---Source : lua/ge/extensions/core/environment.lua:1192
---@param fogHeight number Hauteur d'atmosphère du brouillard (plage UI jusqu'à ~2000, déduit de lerpRanges).
function core_environment.setFogAtmosphereHeight(fogHeight) end

--- Fixe LevelInfo.fogDensity (valeur brute, très petite : l'UI utilise 1000x cette valeur) et annule une transition en cours. Émet onEnvironmentChanged({fogDensity}) avec la valeur brute.
---Source : lua/ge/extensions/core/environment.lua:1163
---@param fog number Densité brute du brouillard (ex. 0.002).
function core_environment.setFogDensity(fog) end

--- Déprécié : log un avertissement, ne fait rien.
---Source : lua/ge/extensions/core/environment.lua:1183
---@param fogOffset any Ignoré.
function core_environment.setFogDensityOffset(fogOffset) end

--- Déprécié : avertissement seul.
---Source : lua/ge/extensions/core/environment.lua:847
---@param fogScaleGradientFile any Ignoré.
function core_environment.setFogScaleGradientFile(fogScaleGradientFile) end

--- Définit la gravité : écrit LevelInfo.gravity (pour les futurs spawns) et envoie obj:setGravity à tous les véhicules. Émet onEnvironmentChanged({gravity}).
---Source : lua/ge/extensions/core/environment.lua:1210
---@param grav number Accélération en m/s², négative vers le bas (-9.81 = Terre). nil/false : ignoré ; 0 est accepté.
function core_environment.setGravity(grav) end

--- Définit le vent au sol appliqué au monde et à tous les véhicules (obj:setWind + be:setGroundWind).
---Source : lua/ge/extensions/core/environment.lua:870
---@param ... vec3|number Un vec3, ou 3 nombres x, y, z (m/s, repère monde, déduit du code).
function core_environment.setGroundWind(...) end

--- Déprécié : avertissement seul.
---Source : lua/ge/extensions/core/environment.lua:865
---@param nightFogGradientFile any Ignoré.
function core_environment.setNightFogGradientFile(nightFogGradientFile) end

--- Déprécié : avertissement seul.
---Source : lua/ge/extensions/core/environment.lua:856
---@param nightGradientFile any Ignoré.
function core_environment.setNightGradientFile(nightGradientFile) end

--- Fixe Precipitation.numDrops (nombre de gouttes/particules de pluie). Sans hook, sans test enableChanges.
---Source : lua/ge/extensions/core/environment.lua:1234
---@param rainDrops number Nombre de gouttes.
function core_environment.setPrecipitation(rainDrops) end

--- Déprécié : avertissement seul.
---Source : lua/ge/extensions/core/environment.lua:802
---@param shadowDistance any Ignoré.
function core_environment.setShadowDistance(shadowDistance) end

--- Déprécié : avertissement seul.
---Source : lua/ge/extensions/core/environment.lua:811
---@param skyBrightness any Ignoré.
function core_environment.setSkyBrightness(skyBrightness) end

--- Applique un état (même format que getState). Émet onEnvironmentChanged. Avec lerpSeconds > 0, cloudCover, fogDensity, fogAtmosphereHeight et time sont interpolés (courbe smootherstep, durée réduite si l'écart est faible, minimum 0.12 s) ; les autres champs sont appliqués tout de suite.
---Source : lua/ge/extensions/core/environment.lua:1511
---@param state table État partiel ou complet ; fogDensity attendu x1000 ; time optionnel (sans time l'horloge n'est pas déplacée).
---@param lerpSeconds number|nil Durée maximale de transition en secondes réelles ; nil ou <= 0 = immédiat.
function core_environment.setState(state, lerpSeconds) end

--- Déprécié : avertissement seul.
---Source : lua/ge/extensions/core/environment.lua:829
---@param sunScaleGradientFile any Ignoré.
function core_environment.setSunScaleGradientFile(sunScaleGradientFile) end

--- Crée un override de la courbe de température du jour : décale la courbe pour viser la moyenne, puis étire les creux/pics pour viser min et max. Valeurs bornées à -50..60 °C. Ignoré si enableChanges(false) ou table invalide.
---Source : lua/ge/extensions/core/environment.lua:1408
---@param profile table {averageC?, minC?, maxC?} en °C ; au moins un champ numérique fini requis.
function core_environment.setTemperatureProfile(profile) end

--- Applique des champs de l'heure du jour sur l'objet TimeOfDay. Ne fait rien si la table ne contient aucun champ connu. Émet onEnvironmentChanged et met à jour les lumières nocturnes si time est fourni. Changer year/month/day/latitude force le recalcul de la position du soleil.
---Source : lua/ge/extensions/core/environment.lua:734
---@param timeOfDay table Champs facultatifs : time (0..1, 0 = midi, 0.5 = minuit), play (boolean), dayLength (s réelles), startTime, latitude, longitude (degrés, déduit du code), year, month, day, utcOffset (heures), dstRule, celestialProfile (nom, recharge core_celestial).
function core_environment.setTimeOfDay(timeOfDay) end

--- Fixe CloudLayer.windSpeed du premier CloudLayer de la scène.
---Source : lua/ge/extensions/core/environment.lua:886
---@param windSpeed number Vitesse du vent des nuages (unité du champ moteur, non précisée dans le code).
function core_environment.setWindSpeed(windSpeed) end

--- Règle l'heure du jeu sur l'heure locale réelle de l'ordinateur (os.date('*t')), en conservant l'état play.
---Source : lua/ge/extensions/core/environment.lua:1913
---@param lerpSeconds number|nil Durée de transition en secondes.
function core_environment.syncTimeToRealClock(lerpSeconds) end

--- Règle heure ET date du jeu sur l'instant UTC réel converti au fuseau (utcOffset/dstRule) du niveau.
---Source : lua/ge/extensions/core/environment.lua:1940
---@param lerpSeconds number|nil Durée de transition en secondes.
function core_environment.syncTimeToRealClockUtc(lerpSeconds) end

