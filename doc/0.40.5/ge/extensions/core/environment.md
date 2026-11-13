# `core_environment`

*Fichier : `lua/ge/extensions/core/environment.lua` · VM : Game Engine (GE) · 2135 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_environment` : `extensions.load("core_environment")`, puis la globale `core_environment`

Extension GE `core_environment` : point d'entrée unique pour lire et modifier l'environnement du niveau (heure du jour, nuages, vent, brouillard, précipitations, gravité, température) et pour charger les ground models (art/groundmodels.json + groundModels/*.json du niveau). Il agit sur les objets de la scène (TimeOfDay, CloudLayer, LevelInfo, Precipitation) trouvés par classe, allume/éteint les lumières nocturnes selon l'heure, et envoie l'état à l'UI. Un moddeur l'utilise pour changer l'heure, le vent ou la gravité par script, ou pour réagir à `onEnvironmentChanged`.

## Exemple

```lua
extensions.load('core_environment')
-- midi (time = 0), jour de 30 min réelles, horloge en marche
core_environment.setTimeOfDay({time = 0, play = true, dayLength = 1800})
core_environment.setGravity(-1.62)            -- m/s², négatif = vers le bas
core_environment.setGroundWind(5, 0, 0)       -- m/s dans le repère monde
core_environment.setFogDensity(0.002)         -- valeur brute LevelInfo
print(core_environment.getTemperatureK() - 273.15)
```

## Remarques

- Heure : `time` est normalisé 0..1 et boucle (modulo 1). 0 = midi (clé `noon`), 0.25 = coucher de soleil environ (`sunset` 0.245), 0.5 = minuit (`night`), 0.775 = lever (`sunrise`). Pour convertir une heure d'horloge : time = (secondes_depuis_minuit / 86400 - 0.5) % 1 (formule utilisée par syncTimeToRealClock).
- `dayLength` = secondes réelles pour un cycle jour/nuit complet (presets : 900, 1800, 7200, 86400). `play` active l'écoulement du temps (écrit aussi l'ancien champ `animate`).
- Gravité : m/s², valeur NÉGATIVE pour aller vers le bas (-9.81 par défaut, repli de getGravity). 0 = apesanteur, +9.81 = gravité inversée. setGravity met à jour LevelInfo.gravity ET envoie obj:setGravity à tous les véhicules (queueAllObjectLua).
- Vent : setGroundWind(x,y,z) est un vec3 monde en m/s (déduit du code : transmis tel quel à be:setGroundWind et obj:setWind). setWindSpeed/getWindSpeed agissent sur CloudLayer.windSpeed (vitesse de déplacement des nuages), pas sur le vent physique des véhicules.
- Brouillard : LevelInfo.fogDensity est une valeur brute très petite ; l'UI manipule fogDensity*1000 (getState renvoie fogDensity*1000, applyStateNow divise par 1000). Les fonctions setFogDensity/getFogDensity utilisent la valeur brute. fogAtmosphereHeight : hauteur d'atmosphère de brouillard (plage de lerp UI ~0..2000, déduit de lerpRanges).
- Nuages : altitudes en kilomètres (`...Km`), coverage de CloudLayer (plage de lerp 0..3 dans setState), cirrus coverage/density sont les champs cirrusCoverage/cirrusDensity de CloudLayer. Les variantes `...ByID` visent un CloudLayer précis par id d'objet scène ; elles n'émettent pas onEnvironmentChanged et ignorent enableChanges.
- Température : getTemperatureK() renvoie des kelvins (température au niveau de la mer envoyée au moteur via be:setSeaLevelTemperatureK). La courbe du niveau (LevelInfo:getTemperatureCurveC, en °C, points {t 0..1, °C}) est évaluée selon l'heure à chaque onUpdate. setTemperatureProfile travaille en °C, borné à -50..60 (UI) ; la courbe d'override est bornée -273.15..200 °C à la normalisation.
- enableChanges(false) bloque toutes les écritures sur la scène (mais les hooks onEnvironmentChanged sont quand même émis pour la plupart des setters). Utilisé par les scénarios pour figer le ciel.
- Hook émis : `onEnvironmentChanged(changedTable)` à chaque setter (sauf pendant une mise à jour d'état globale). Évènements UI : `EnvironmentStateUpdate` (état complet) et `EnvironmentCanUpdateChanged` (booléen).
- Fonctions dépréciées qui ne font que logger un avertissement et renvoient nil : get/setShadowDistance, get/setSkyBrightness, tous les get/set...GradientFile, get/setFogDensityOffset, get/setCloudExposureByID.
- Incohérences : setFogDensityOffset est exporté (M.setFogDensityOffset) mais absent de la liste automatique ; setFogAtmosphereHeight n'émet pas onEnvironmentChanged contrairement à setFogDensity ; setPrecipitation n'émet pas de hook et ignore enableChanges ; setTemperatureK interne n'est pas exporté (pas de réglage direct de la température, seulement via setTemperatureProfile). onVehicleResetted et onVehicleSpawned sont tous deux liés à applyGroundWind (ré-applique le vent aux véhicules).

**Dépendances (chargées avant) :** `core_solarTimeOfDay`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_environment.canChange()` | Indique si les modifications d'environnement sont autorisées. | 1769 |
| `core_environment.cycleTimeOfDay()` | Fait passer l'heure à la valeur suivante parmi trois : si time < 0.2 -> 0.23 (soir), si time >= 0.5 -> 0.05 (jour), sinon -> 0.5 (nuit). | 776 |
| `core_environment.dumpGroundModels()` | Écrit groundmodels_dump.json avec les propriétés physiques de chaque ground model enregistré (frottements, résistance, densité du fluide…). Outil de debug. | 1579 |
| `core_environment.enableChanges(enabled)` | Autorise ou interdit les modifications de l'environnement et prévient l'UI. | 1764 |
| `core_environment.getAmbientScaleGradientFile()` | Déprécié : renvoie nil. | 833 |
| `core_environment.getAuthoredDayLength(levelDir)` | Cherche dans les *.level.json du dossier du niveau (hors /scenarios/) une valeur dayLength écrite explicitement dans l'objet TimeOfDay (le moteur remplit dayLength même si absent du fichier). | 2005 |
| `core_environment.getCloudAltitudeKm()` | Altitude des nuages en km. | 947 |
| `core_environment.getCloudAltitudeKmByID(objectID)` | Altitude (km) d'un CloudLayer précis. | 1107 |
| `core_environment.getCloudCirrusAltitudeKm()` | Altitude des cirrus. | 1015 |
| `core_environment.getCloudCirrusAltitudeKmByID(objectID)` | Altitude des cirrus (km) d'un CloudLayer précis. | 1120 |
| `core_environment.getCloudCirrusCoverage()` | Couverture des cirrus. | 1023 |
| `core_environment.getCloudCirrusCoverageByID(objectID)` | Couverture des cirrus d'un CloudLayer précis. | 1133 |
| `core_environment.getCloudCirrusDensity()` | Densité des cirrus. | 1031 |
| `core_environment.getCloudCirrusDensityByID(objectID)` | Densité des cirrus d'un CloudLayer précis. | 1146 |
| `core_environment.getCloudCover()` | Lit CloudLayer.coverage du premier CloudLayer. | 912 |
| `core_environment.getCloudCoverByID(objectID)` | Couverture d'un CloudLayer précis. | 1041 |
| `core_environment.getCloudExposureByID(objectID)` | Déprécié : log un avertissement. | 1054 |
| `core_environment.getCloudHeightByID(objectID)` | Champ height d'un CloudLayer précis. | 1076 |
| `core_environment.getCloudWeatherOffsetKm()` | Décalage de la carte météo des nuages (CloudLayer.getWeatherOffsetKm). | 952 |
| `core_environment.getCloudWindByID(objectID)` | windSpeed d'un CloudLayer précis. | 1063 |
| `core_environment.getCloudWindDirection()` | Direction du vent des nuages. | 929 |
| `core_environment.getCloudWindDirectionByID(objectID)` | Direction du vent d'un CloudLayer précis. | 1089 |
| `core_environment.getColorizeGradientFile()` | Déprécié : renvoie nil. | 815 |
| `core_environment.getDayCyclePresets()` | Renvoie M.dayCyclePresets. | 1982 |
| `core_environment.getDayCycleSeconds(speed)` | Durée en secondes réelles du cycle jour/nuit pour un preset. | 1986 |
| `core_environment.getDefaultTimeOfDayOptions()` | Renvoie M.defaultTimeOfDayOptions. | 718 |
| `core_environment.getFogAtmosphereHeight()` | Hauteur d'atmosphère du brouillard. | 1201 |
| `core_environment.getFogDensity()` | Densité brute du brouillard de LevelInfo. | 1174 |
| `core_environment.getFogDensityOffset()` | Déprécié : log un avertissement. | 1187 |
| `core_environment.getFogScaleGradientFile()` | Déprécié : renvoie nil. | 842 |
| `core_environment.getGravity()` | Gravité du niveau (LevelInfo.gravity). | 1223 |
| `core_environment.getGravityPresets()` | Renvoie M.gravityPresets. | 1974 |
| `core_environment.getGroundWind()` | Renvoie le vec3 interne du vent au sol (référence directe, ne pas modifier). | 878 |
| `core_environment.getInitState()` | Copie de l'état capturé au chargement du niveau (onClientPostStartMission), avec temperatureProfile calculé sur la courbe d'origine du niveau et éventuellement authoredDayLength. | 1757 |
| `core_environment.getLightState()` | État d'éclairage du monde : jour ou nuit. Retourne {time, phase = 'day'\|'night', isNight, nightLightsActive, nightStart, nightEnd}. nightLightsActive reflète ce que le moteur a réellement appliqué. | 541 |
| `core_environment.getNightFogGradientFile()` | Déprécié : renvoie nil. | 860 |
| `core_environment.getNightGradientFile()` | Déprécié : renvoie nil. | 851 |
| `core_environment.getPrecipitation()` | Nombre de gouttes de l'objet Precipitation. | 1241 |
| `core_environment.getShadowDistance()` | Déprécié : renvoie nil. | 797 |
| `core_environment.getSimSpeedPresets()` | Renvoie M.simSpeedPresets. | 1978 |
| `core_environment.getSkyBrightness()` | Déprécié : renvoie nil. | 806 |
| `core_environment.getSolarTimeOfDayOptions(state)` | Options de moments calculées pour la position et la date solaires de l'état, à partir des options par défaut. | 722 |
| `core_environment.getSolarTimeOfDayValue(key, state)` | Valeur de time pour une clé de moment (ex. 'sunrise') avec la date/position de l'état. | 726 |
| `core_environment.getState()` | Construit l'état complet de l'environnement. Clés : champs TimeOfDay (time, play, dayLength, startTime, latitude, longitude, year, month, day, utcOffset, dstRule, celestialProfile), windSpeed, groundWind, cloudCover, cloudWindDirection, cloudAltitudeKm, cloudWeatherOffsetKm, cloudCirrus*, fogDensity (x1000), fogAtmosphereHeight, numOfDrops, gravity, temperatureC (°C), temperatureProfile, temperatureCurveOverrideC. | 1364 |
| `core_environment.getSunScaleGradientFile()` | Déprécié : renvoie nil. | 824 |
| `core_environment.getTemperatureK()` | Température de l'air au niveau de la mer actuellement envoyée au moteur. | 1250 |
| `core_environment.getTimeOfDay()` | Lit l'objet scène TimeOfDay et renvoie un état partagé (la même table est réutilisée à chaque appel : copier avant de conserver). | 514 |
| `core_environment.getTimeOfDayOptions(levelIdentifier)` | Options de moments de la journée adaptées au niveau, calculées astronomiquement (core_solarTimeOfDay) à partir des options du niveau (core_levels). | 713 |
| `core_environment.getTimeOfDayValueForNormalizedTime(normalizedTime, state)` | Convertit un temps normalisé via core_solarTimeOfDay.timeFromNormalizedTime pour l'état donné (sens exact défini dans core_solarTimeOfDay). | 730 |
| `core_environment.getWindSpeed()` | Lit CloudLayer.windSpeed du premier CloudLayer. | 896 |
| `core_environment.loadTireMarks(filename)` | Charge des traces de pneus depuis un fichier. | 1968 |
| `core_environment.onClientEndMission()` | Hook à la fin du niveau : arrête l'horloge TimeOfDay, remet le vent à 0, vide les lumières nocturnes et appelle reset. *(interne)* *(hook)* | 1870 |
| `core_environment.onClientPostStartMission(levelPath)` | Hook après démarrage du niveau : mémorise l'état initial (init_env), y ajoute authoredDayLength puis le réapplique. *(interne)* *(hook)* | 1782 |
| `core_environment.onClientPreStartMission(levelPath)` | Hook avant le démarrage d'un niveau : relit la courbe de température, supprime l'override, recharge les ground models. *(interne)* *(hook)* | 1773 |
| `core_environment.onClientStartMission(levelPath)` | Hook au démarrage du niveau : vide le cache d'objets, recense les lumières nocturnes, applique le vent et régénère la carte météo avec une graine aléatoire. *(interne)* *(hook)* | 1835 |
| `core_environment.onDeserialized(data)` | Hook de restauration : réapplique le vent au sol sauvegardé. *(interne)* *(hook)* | 1890 |
| `core_environment.onEditorAfterSaveLevel()` | Hook après sauvegarde : restaure l'état des lumières nocturnes. *(interne)* *(hook)* | 1863 |
| `core_environment.onEditorBeforeSaveLevel()` | Hook avant sauvegarde du niveau dans l'éditeur : éteint les lumières nocturnes pour ne pas les sauvegarder allumées. *(interne)* *(hook)* | 1854 |
| `core_environment.onEditorDeactivated()` | Hook à la sortie de l'éditeur : vide le cache et recense à nouveau les lumières nocturnes. *(interne)* *(hook)* | 1849 |
| `core_environment.onFilesChanged(files)` | Hook appelé quand des fichiers changent : si un fichier de ground models chargé est modifié, appelle reset() et be:reloadCollision(). *(interne)* *(hook)* | 1793 |
| `core_environment.onInit()` | Alias de reset : appelé au chargement de l'extension. *(interne)* *(hook)* | 1742 |
| `core_environment.onSerialize()` | Hook de sauvegarde avant rechargement des extensions : renvoie {groundWind}. *(interne)* *(hook)* | 1887 |
| `core_environment.onUpdate(dtReal)` | Hook par image : avance la transition d'état, applique les lumières nocturnes et met à jour la température effective selon l'heure. *(interne)* *(hook)* | 1818 |
| `core_environment.onVehicleResetted()` | Hook : ré-applique le vent au sol (alias de applyGroundWind). *(interne)* *(hook)* | 49 |
| `core_environment.onVehicleSpawned()` | Hook : ré-applique le vent au sol aux véhicules (alias de applyGroundWind, reçoit l'id du véhicule mais l'ignore). *(interne)* *(hook)* | 49 |
| `core_environment.refreshnightLightsObjects()` | Recense dans la scène les lumières à allumer la nuit (champ nightLight), les lumières à intensité jour/nuit (dayIntensity/nightIntensity), et les TSStatic émissifs (nightEmissive ou liés par le champ `child` à une lumière), puis applique l'état courant. À appeler après avoir ajouté de tels objets en cours de partie. | 559 |
| `core_environment.regenerateWeatherMap(seed)` | Régénère la carte météo (forme des nuages) avec une graine. Appelée avec une graine aléatoire à chaque chargement de niveau. | 986 |
| `core_environment.reloadGroundModels(levelPath)` | Réinitialise puis recharge tous les ground models : art/groundmodels.json, puis les *.json de <niveau>/groundModels/. ASPHALT est soumis en premier (indice 0), puis les autres par ordre alphabétique. Les noms sont mis en majuscules et tronqués à 30 caractères si > 31. | 1712 |
| `core_environment.requestState()` | Alias de sendState : envoie l'état courant à l'UI (guihooks EnvironmentStateUpdate) et l'état du drapeau canChange. | 1812 |
| `core_environment.reset()` | Relit la courbe de température du niveau, supprime l'override de température, notifie l'UI et recharge les ground models. Sert aussi de onInit. *(interne)* | 1742 |
| `core_environment.resetCloudWeatherOffsetKm()` | Remet le décalage météo à (0,0,0). | 977 |
| `core_environment.resetTemperatureProfile()` | Supprime l'override et revient à la courbe de température du niveau. | 1433 |
| `core_environment.resetTireMarks()` | Efface toutes les traces de pneus (be:resetTireMarks). | 1956 |
| `core_environment.reset_init()` | Ré-applique l'état initial du niveau (setState(init_env)). | 1753 |
| `core_environment.saveTireMarks(filename)` | Sauvegarde les traces de pneus dans un fichier. | 1962 |
| `core_environment.setAmbientScaleGradientFile(ambientScaleGradientFile)` | Déprécié : avertissement seul. | 838 |
| `core_environment.setCloudAltitudeKm(altitudeKm)` | Altitude de la couche de nuages. | 937 |
| `core_environment.setCloudAltitudeKmByID(objectID, altitudeKm)` | Fixe l'altitude (km) d'un CloudLayer précis. | 1112 |
| `core_environment.setCloudCirrusAltitudeKm(altitudeKm)` | Fixe l'altitude des cirrus. | 1019 |
| `core_environment.setCloudCirrusAltitudeKmByID(objectID, altitudeKm)` | Fixe l'altitude des cirrus d'un CloudLayer précis. | 1125 |
| `core_environment.setCloudCirrusCoverage(coverage)` | Fixe la couverture des cirrus. | 1027 |
| `core_environment.setCloudCirrusCoverageByID(objectID, coverage)` | Fixe la couverture des cirrus d'un CloudLayer précis. | 1138 |
| `core_environment.setCloudCirrusDensity(density)` | Fixe la densité des cirrus. | 1035 |
| `core_environment.setCloudCirrusDensityByID(objectID, density)` | Fixe la densité des cirrus d'un CloudLayer précis. | 1151 |
| `core_environment.setCloudCover(cloud)` | Fixe CloudLayer.coverage du premier CloudLayer et annule une transition d'état en cours. | 901 |
| `core_environment.setCloudCoverByID(objectID, coverage)` | Fixe la couverture d'un CloudLayer précis (sans hook, sans test enableChanges). | 1046 |
| `core_environment.setCloudExposureByID(objectID, exposure)` | Déprécié : log un avertissement, ne fait rien. | 1059 |
| `core_environment.setCloudHeightByID(objectID, height)` | Fixe le champ height d'un CloudLayer précis. | 1081 |
| `core_environment.setCloudWeatherOffsetKm(...)` | Décale la carte météo des nuages. Émet onEnvironmentChanged. | 962 |
| `core_environment.setCloudWindByID(objectID, windSpeed)` | Fixe windSpeed d'un CloudLayer précis. | 1068 |
| `core_environment.setCloudWindDirection(...)` | Fixe CloudLayer.windDirection (Point2F) du premier CloudLayer ; seuls x et y sont utilisés. | 918 |
| `core_environment.setCloudWindDirectionByID(objectID, ...)` | Fixe la direction du vent d'un CloudLayer précis. | 1098 |
| `core_environment.setColorizeGradientFile(colorizeGradientFile)` | Déprécié : avertissement seul. | 820 |
| `core_environment.setFogAtmosphereHeight(fogHeight)` | Fixe LevelInfo.FogAtmosphereHeight. N'émet pas onEnvironmentChanged et ignore enableChanges. | 1192 |
| `core_environment.setFogDensity(fog)` | Fixe LevelInfo.fogDensity (valeur brute, très petite : l'UI utilise 1000x cette valeur) et annule une transition en cours. Émet onEnvironmentChanged({fogDensity}) avec la valeur brute. | 1163 |
| `core_environment.setFogDensityOffset(fogOffset)` | Déprécié : log un avertissement, ne fait rien. | 1183 |
| `core_environment.setFogScaleGradientFile(fogScaleGradientFile)` | Déprécié : avertissement seul. | 847 |
| `core_environment.setGravity(grav)` | Définit la gravité : écrit LevelInfo.gravity (pour les futurs spawns) et envoie obj:setGravity à tous les véhicules. Émet onEnvironmentChanged({gravity}). | 1210 |
| `core_environment.setGroundWind(...)` | Définit le vent au sol appliqué au monde et à tous les véhicules (obj:setWind + be:setGroundWind). | 870 |
| `core_environment.setNightFogGradientFile(nightFogGradientFile)` | Déprécié : avertissement seul. | 865 |
| `core_environment.setNightGradientFile(nightGradientFile)` | Déprécié : avertissement seul. | 856 |
| `core_environment.setPrecipitation(rainDrops)` | Fixe Precipitation.numDrops (nombre de gouttes/particules de pluie). Sans hook, sans test enableChanges. | 1234 |
| `core_environment.setShadowDistance(shadowDistance)` | Déprécié : avertissement seul. | 802 |
| `core_environment.setSkyBrightness(skyBrightness)` | Déprécié : avertissement seul. | 811 |
| `core_environment.setState(state, lerpSeconds)` | Applique un état (même format que getState). Émet onEnvironmentChanged. Avec lerpSeconds > 0, cloudCover, fogDensity, fogAtmosphereHeight et time sont interpolés (courbe smootherstep, durée réduite si l'écart est faible, minimum 0.12 s) ; les autres champs sont appliqués tout de suite. | 1511 |
| `core_environment.setSunScaleGradientFile(sunScaleGradientFile)` | Déprécié : avertissement seul. | 829 |
| `core_environment.setTemperatureProfile(profile)` | Crée un override de la courbe de température du jour : décale la courbe pour viser la moyenne, puis étire les creux/pics pour viser min et max. Valeurs bornées à -50..60 °C. Ignoré si enableChanges(false) ou table invalide. | 1408 |
| `core_environment.setTimeOfDay(timeOfDay)` | Applique des champs de l'heure du jour sur l'objet TimeOfDay. Ne fait rien si la table ne contient aucun champ connu. Émet onEnvironmentChanged et met à jour les lumières nocturnes si time est fourni. Changer year/month/day/latitude force le recalcul de la position du soleil. | 734 |
| `core_environment.setWindSpeed(windSpeed)` | Fixe CloudLayer.windSpeed du premier CloudLayer de la scène. | 886 |
| `core_environment.syncTimeToRealClock(lerpSeconds)` | Règle l'heure du jeu sur l'heure locale réelle de l'ordinateur (os.date('*t')), en conservant l'état play. | 1913 |
| `core_environment.syncTimeToRealClockUtc(lerpSeconds)` | Règle heure ET date du jeu sur l'instant UTC réel converti au fuseau (utcOffset/dstRule) du niveau. | 1940 |

### Détail des paramètres

#### `core_environment.canChange()`

Indique si les modifications d'environnement sont autorisées.

- **renvoie** : boolean État du drapeau défini par enableChanges (true par défaut).

#### `core_environment.enableChanges(enabled)`

Autorise ou interdit les modifications de l'environnement et prévient l'UI.

- `enabled` (*boolean*) : false = les setters n'écrivent plus sur la scène.

#### `core_environment.getAmbientScaleGradientFile()`

Déprécié : renvoie nil.

- **renvoie** : nil nil

#### `core_environment.getAuthoredDayLength(levelDir)`

Cherche dans les *.level.json du dossier du niveau (hors /scenarios/) une valeur dayLength écrite explicitement dans l'objet TimeOfDay (le moteur remplit dayLength même si absent du fichier).

- `levelDir` (*string*) : Dossier du niveau.
- **renvoie** : number|nil Secondes (> 0) ou nil.

#### `core_environment.getCloudAltitudeKm()`

Altitude des nuages en km.

- **renvoie** : number|nil km.

#### `core_environment.getCloudAltitudeKmByID(objectID)`

Altitude (km) d'un CloudLayer précis.

- `objectID` (*integer*) : Id de l'objet.
- **renvoie** : number|nil km.

#### `core_environment.getCloudCirrusAltitudeKm()`

Altitude des cirrus.

- **renvoie** : number|nil km.

#### `core_environment.getCloudCirrusAltitudeKmByID(objectID)`

Altitude des cirrus (km) d'un CloudLayer précis.

- `objectID` (*integer*) : Id de l'objet.
- **renvoie** : number|nil km.

#### `core_environment.getCloudCirrusCoverage()`

Couverture des cirrus.

- **renvoie** : number|nil Valeur du champ cirrusCoverage.

#### `core_environment.getCloudCirrusCoverageByID(objectID)`

Couverture des cirrus d'un CloudLayer précis.

- `objectID` (*integer*) : Id de l'objet.
- **renvoie** : number|nil cirrusCoverage.

#### `core_environment.getCloudCirrusDensity()`

Densité des cirrus.

- **renvoie** : number|nil Valeur du champ cirrusDensity.

#### `core_environment.getCloudCirrusDensityByID(objectID)`

Densité des cirrus d'un CloudLayer précis.

- `objectID` (*integer*) : Id de l'objet.
- **renvoie** : number|nil cirrusDensity.

#### `core_environment.getCloudCover()`

Lit CloudLayer.coverage du premier CloudLayer.

- **renvoie** : number|nil Couverture, nil sans CloudLayer.

#### `core_environment.getCloudCoverByID(objectID)`

Couverture d'un CloudLayer précis.

- `objectID` (*integer*) : Id de l'objet scène.
- **renvoie** : number|nil coverage.

#### `core_environment.getCloudExposureByID(objectID)`

Déprécié : log un avertissement.

- `objectID` (*integer*) : Ignoré.
- **renvoie** : nil Toujours nil.

#### `core_environment.getCloudHeightByID(objectID)`

Champ height d'un CloudLayer précis.

- `objectID` (*integer*) : Id de l'objet.
- **renvoie** : number|nil height.

#### `core_environment.getCloudWeatherOffsetKm()`

Décalage de la carte météo des nuages (CloudLayer.getWeatherOffsetKm).

- **renvoie** : vec3|nil Décalage en km ; nil si l'API C++ n'est pas disponible.

#### `core_environment.getCloudWindByID(objectID)`

windSpeed d'un CloudLayer précis.

- `objectID` (*integer*) : Id de l'objet.
- **renvoie** : number|nil windSpeed.

#### `core_environment.getCloudWindDirection()`

Direction du vent des nuages.

- **renvoie** : vec3|nil vec3(x, y, 0) ; nil sans CloudLayer.

#### `core_environment.getCloudWindDirectionByID(objectID)`

Direction du vent d'un CloudLayer précis.

- `objectID` (*integer*) : Id de l'objet.
- **renvoie** : vec3|nil vec3(x, y, 0).

#### `core_environment.getColorizeGradientFile()`

Déprécié : renvoie nil.

- **renvoie** : nil nil

#### `core_environment.getDayCyclePresets()`

Renvoie M.dayCyclePresets.

- **renvoie** : table[] {speed, seconds}.

#### `core_environment.getDayCycleSeconds(speed)`

Durée en secondes réelles du cycle jour/nuit pour un preset.

- `speed` (*string*) : 'fast', 'normal', 'slow' ou 'realtime'.
- **renvoie** : number|nil 900, 1800, 7200 ou 86400 ; nil si inconnu.

#### `core_environment.getDefaultTimeOfDayOptions()`

Renvoie M.defaultTimeOfDayOptions.

- **renvoie** : table[] Moments clés par défaut.

#### `core_environment.getFogAtmosphereHeight()`

Hauteur d'atmosphère du brouillard.

- **renvoie** : number 0.0 sans LevelInfo.

#### `core_environment.getFogDensity()`

Densité brute du brouillard de LevelInfo.

- **renvoie** : number fogDensity, 0.0 sans LevelInfo.
- **renvoie** : userdata|nil Objet LevelInfo.

#### `core_environment.getFogDensityOffset()`

Déprécié : log un avertissement.

- **renvoie** : nil Toujours nil.

#### `core_environment.getFogScaleGradientFile()`

Déprécié : renvoie nil.

- **renvoie** : nil nil

#### `core_environment.getGravity()`

Gravité du niveau (LevelInfo.gravity).

- **renvoie** : number m/s² (négatif vers le bas) ; -9.81 si LevelInfo absent.

#### `core_environment.getGravityPresets()`

Renvoie M.gravityPresets.

- **renvoie** : table[] Presets de gravité.

#### `core_environment.getGroundWind()`

Renvoie le vec3 interne du vent au sol (référence directe, ne pas modifier).

- **renvoie** : vec3 Vent en m/s.

#### `core_environment.getInitState()`

Copie de l'état capturé au chargement du niveau (onClientPostStartMission), avec temperatureProfile calculé sur la courbe d'origine du niveau et éventuellement authoredDayLength.

- **renvoie** : table État initial.

#### `core_environment.getLightState()`

État d'éclairage du monde : jour ou nuit. Retourne {time, phase = 'day'|'night', isNight, nightLightsActive, nightStart, nightEnd}. nightLightsActive reflète ce que le moteur a réellement appliqué.

- **renvoie** : table|nil nil s'il n'y a pas de TimeOfDay.

#### `core_environment.getNightFogGradientFile()`

Déprécié : renvoie nil.

- **renvoie** : nil nil

#### `core_environment.getNightGradientFile()`

Déprécié : renvoie nil.

- **renvoie** : nil nil

#### `core_environment.getPrecipitation()`

Nombre de gouttes de l'objet Precipitation.

- **renvoie** : number|nil nil sans objet Precipitation.

#### `core_environment.getShadowDistance()`

Déprécié : renvoie nil.

- **renvoie** : nil nil

#### `core_environment.getSimSpeedPresets()`

Renvoie M.simSpeedPresets.

- **renvoie** : table[] Presets de ralenti.

#### `core_environment.getSkyBrightness()`

Déprécié : renvoie nil.

- **renvoie** : nil nil

#### `core_environment.getSolarTimeOfDayOptions(state)`

Options de moments calculées pour la position et la date solaires de l'état, à partir des options par défaut.

- `state` (*table|nil*) : État TimeOfDay ; défaut getTimeOfDay().
- **renvoie** : table Options.

#### `core_environment.getSolarTimeOfDayValue(key, state)`

Valeur de time pour une clé de moment (ex. 'sunrise') avec la date/position de l'état.

- `key` (*string*) : Clé : sunrise, morning, earlyNoon, noon, lateNoon, afternoon, evening, sunset, night.
- `state` (*table|nil*) : État TimeOfDay ; défaut getTimeOfDay().
- **renvoie** : number|nil time normalisé 0..1 (selon core_solarTimeOfDay).

#### `core_environment.getState()`

Construit l'état complet de l'environnement. Clés : champs TimeOfDay (time, play, dayLength, startTime, latitude, longitude, year, month, day, utcOffset, dstRule, celestialProfile), windSpeed, groundWind, cloudCover, cloudWindDirection, cloudAltitudeKm, cloudWeatherOffsetKm, cloudCirrus*, fogDensity (x1000), fogAtmosphereHeight, numOfDrops, gravity, temperatureC (°C), temperatureProfile, temperatureCurveOverrideC.

- **renvoie** : table|nil Table d'état (jamais nil en pratique car temperatureCurveOverrideC est toujours présent).

#### `core_environment.getSunScaleGradientFile()`

Déprécié : renvoie nil.

- **renvoie** : nil nil

#### `core_environment.getTemperatureK()`

Température de l'air au niveau de la mer actuellement envoyée au moteur.

- **renvoie** : number Kelvins (0.0 tant que la courbe n'a pas été évaluée).

#### `core_environment.getTimeOfDay()`

Lit l'objet scène TimeOfDay et renvoie un état partagé (la même table est réutilisée à chaque appel : copier avant de conserver).

- **renvoie** : table|nil {time, play, dayLength, startTime, latitude, longitude, year, month, day, utcOffset, dstRule, celestialProfile} ; nil s'il n'y a pas d'objet TimeOfDay (menu principal).

#### `core_environment.getTimeOfDayOptions(levelIdentifier)`

Options de moments de la journée adaptées au niveau, calculées astronomiquement (core_solarTimeOfDay) à partir des options du niveau (core_levels).

- `levelIdentifier` (*string|nil*) : Identifiant du niveau ; défaut getCurrentLevelIdentifier().
- **renvoie** : table Liste d'options {key, value, label…}.

#### `core_environment.getTimeOfDayValueForNormalizedTime(normalizedTime, state)`

Convertit un temps normalisé via core_solarTimeOfDay.timeFromNormalizedTime pour l'état donné (sens exact défini dans core_solarTimeOfDay).

- `normalizedTime` (*number*) : Temps normalisé.
- `state` (*table|nil*) : État TimeOfDay ; défaut getTimeOfDay().
- **renvoie** : number|nil Valeur de time.

#### `core_environment.getWindSpeed()`

Lit CloudLayer.windSpeed du premier CloudLayer.

- **renvoie** : number|nil nil sans CloudLayer.

#### `core_environment.loadTireMarks(filename)`

Charge des traces de pneus depuis un fichier.

- `filename` (*string|nil*) : Défaut 'tiremarks.dat'.

#### `core_environment.onClientPostStartMission(levelPath)`

Hook après démarrage du niveau : mémorise l'état initial (init_env), y ajoute authoredDayLength puis le réapplique.

- `levelPath` (*string*) : Chemin du niveau.

#### `core_environment.onClientPreStartMission(levelPath)`

Hook avant le démarrage d'un niveau : relit la courbe de température, supprime l'override, recharge les ground models.

- `levelPath` (*string*) : Chemin du niveau.

#### `core_environment.onClientStartMission(levelPath)`

Hook au démarrage du niveau : vide le cache d'objets, recense les lumières nocturnes, applique le vent et régénère la carte météo avec une graine aléatoire.

- `levelPath` (*string*) : Chemin du niveau.

#### `core_environment.onDeserialized(data)`

Hook de restauration : réapplique le vent au sol sauvegardé.

- `data` (*table*) : Table renvoyée par onSerialize.

#### `core_environment.onFilesChanged(files)`

Hook appelé quand des fichiers changent : si un fichier de ground models chargé est modifié, appelle reset() et be:reloadCollision().

- `files` (*table[]*) : Liste d'entrées avec champ filename.

#### `core_environment.onSerialize()`

Hook de sauvegarde avant rechargement des extensions : renvoie {groundWind}.

- **renvoie** : table {groundWind = vec3}.

#### `core_environment.onUpdate(dtReal)`

Hook par image : avance la transition d'état, applique les lumières nocturnes et met à jour la température effective selon l'heure.

- `dtReal` (*number*) : Delta temps réel en secondes.

#### `core_environment.regenerateWeatherMap(seed)`

Régénère la carte météo (forme des nuages) avec une graine. Appelée avec une graine aléatoire à chaque chargement de niveau.

- `seed` (*integer|nil*) : Graine, arrondie et bornée à 0..2147483647 ; aléatoire si nil.
- **renvoie** : boolean true si exécuté.
- **renvoie** : integer|nil Graine normalisée utilisée (absente si l'API C++ manque).

#### `core_environment.reloadGroundModels(levelPath)`

Réinitialise puis recharge tous les ground models : art/groundmodels.json, puis les *.json de <niveau>/groundModels/. ASPHALT est soumis en premier (indice 0), puis les autres par ordre alphabétique. Les noms sont mis en majuscules et tronqués à 30 caractères si > 31.

- `levelPath` (*string|nil*) : Chemin du niveau ; défaut getMissionFilename().

#### `core_environment.resetCloudWeatherOffsetKm()`

Remet le décalage météo à (0,0,0).

- **renvoie** : boolean Résultat de setCloudWeatherOffsetKm.

#### `core_environment.saveTireMarks(filename)`

Sauvegarde les traces de pneus dans un fichier.

- `filename` (*string|nil*) : Défaut 'tiremarks.dat'.

#### `core_environment.setAmbientScaleGradientFile(ambientScaleGradientFile)`

Déprécié : avertissement seul.

- `ambientScaleGradientFile` (*any*) : Ignoré.

#### `core_environment.setCloudAltitudeKm(altitudeKm)`

Altitude de la couche de nuages.

- `altitudeKm` (*number*) : Altitude en kilomètres.

#### `core_environment.setCloudAltitudeKmByID(objectID, altitudeKm)`

Fixe l'altitude (km) d'un CloudLayer précis.

- `objectID` (*integer*) : Id de l'objet.
- `altitudeKm` (*number*) : km.

#### `core_environment.setCloudCirrusAltitudeKm(altitudeKm)`

Fixe l'altitude des cirrus.

- `altitudeKm` (*number*) : km.

#### `core_environment.setCloudCirrusAltitudeKmByID(objectID, altitudeKm)`

Fixe l'altitude des cirrus d'un CloudLayer précis.

- `objectID` (*integer*) : Id de l'objet.
- `altitudeKm` (*number*) : km.

#### `core_environment.setCloudCirrusCoverage(coverage)`

Fixe la couverture des cirrus.

- `coverage` (*number*) : Valeur de cirrusCoverage.

#### `core_environment.setCloudCirrusCoverageByID(objectID, coverage)`

Fixe la couverture des cirrus d'un CloudLayer précis.

- `objectID` (*integer*) : Id de l'objet.
- `coverage` (*number*) : Couverture.

#### `core_environment.setCloudCirrusDensity(density)`

Fixe la densité des cirrus.

- `density` (*number*) : Valeur de cirrusDensity.

#### `core_environment.setCloudCirrusDensityByID(objectID, density)`

Fixe la densité des cirrus d'un CloudLayer précis.

- `objectID` (*integer*) : Id de l'objet.
- `density` (*number*) : Densité.

#### `core_environment.setCloudCover(cloud)`

Fixe CloudLayer.coverage du premier CloudLayer et annule une transition d'état en cours.

- `cloud` (*number*) : Couverture nuageuse (plage de lerp 0..3 dans setState).

#### `core_environment.setCloudCoverByID(objectID, coverage)`

Fixe la couverture d'un CloudLayer précis (sans hook, sans test enableChanges).

- `objectID` (*integer*) : Id de l'objet.
- `coverage` (*number*) : Couverture.

#### `core_environment.setCloudExposureByID(objectID, exposure)`

Déprécié : log un avertissement, ne fait rien.

- `objectID` (*integer*) : Ignoré.
- `exposure` (*any*) : Ignoré.

#### `core_environment.setCloudHeightByID(objectID, height)`

Fixe le champ height d'un CloudLayer précis.

- `objectID` (*integer*) : Id de l'objet.
- `height` (*number*) : Hauteur.

#### `core_environment.setCloudWeatherOffsetKm(...)`

Décale la carte météo des nuages. Émet onEnvironmentChanged.

- `...` (*vec3|number*) : Un vec3 ou 3 nombres x, y, z en km.
- **renvoie** : boolean true si appliqué, false si l'API est absente ou si les changements sont désactivés (nil si l'argument est nil).

#### `core_environment.setCloudWindByID(objectID, windSpeed)`

Fixe windSpeed d'un CloudLayer précis.

- `objectID` (*integer*) : Id de l'objet.
- `windSpeed` (*number*) : Vitesse.

#### `core_environment.setCloudWindDirection(...)`

Fixe CloudLayer.windDirection (Point2F) du premier CloudLayer ; seuls x et y sont utilisés.

- `...` (*vec3|number*) : Un vec3 ou deux nombres x, y.

#### `core_environment.setCloudWindDirectionByID(objectID, ...)`

Fixe la direction du vent d'un CloudLayer précis.

- `objectID` (*integer*) : Id de l'objet.
- `...` (*vec3|number*) : Un vec3 ou deux nombres x, y.

#### `core_environment.setColorizeGradientFile(colorizeGradientFile)`

Déprécié : avertissement seul.

- `colorizeGradientFile` (*any*) : Ignoré.

#### `core_environment.setFogAtmosphereHeight(fogHeight)`

Fixe LevelInfo.FogAtmosphereHeight. N'émet pas onEnvironmentChanged et ignore enableChanges.

- `fogHeight` (*number*) : Hauteur d'atmosphère du brouillard (plage UI jusqu'à ~2000, déduit de lerpRanges).

#### `core_environment.setFogDensity(fog)`

Fixe LevelInfo.fogDensity (valeur brute, très petite : l'UI utilise 1000x cette valeur) et annule une transition en cours. Émet onEnvironmentChanged({fogDensity}) avec la valeur brute.

- `fog` (*number*) : Densité brute du brouillard (ex. 0.002).

#### `core_environment.setFogDensityOffset(fogOffset)`

Déprécié : log un avertissement, ne fait rien.

- `fogOffset` (*any*) : Ignoré.

#### `core_environment.setFogScaleGradientFile(fogScaleGradientFile)`

Déprécié : avertissement seul.

- `fogScaleGradientFile` (*any*) : Ignoré.

#### `core_environment.setGravity(grav)`

Définit la gravité : écrit LevelInfo.gravity (pour les futurs spawns) et envoie obj:setGravity à tous les véhicules. Émet onEnvironmentChanged({gravity}).

- `grav` (*number*) : Accélération en m/s², négative vers le bas (-9.81 = Terre). nil/false : ignoré ; 0 est accepté.

#### `core_environment.setGroundWind(...)`

Définit le vent au sol appliqué au monde et à tous les véhicules (obj:setWind + be:setGroundWind).

- `...` (*vec3|number*) : Un vec3, ou 3 nombres x, y, z (m/s, repère monde, déduit du code).

#### `core_environment.setNightFogGradientFile(nightFogGradientFile)`

Déprécié : avertissement seul.

- `nightFogGradientFile` (*any*) : Ignoré.

#### `core_environment.setNightGradientFile(nightGradientFile)`

Déprécié : avertissement seul.

- `nightGradientFile` (*any*) : Ignoré.

#### `core_environment.setPrecipitation(rainDrops)`

Fixe Precipitation.numDrops (nombre de gouttes/particules de pluie). Sans hook, sans test enableChanges.

- `rainDrops` (*number*) : Nombre de gouttes.

#### `core_environment.setShadowDistance(shadowDistance)`

Déprécié : avertissement seul.

- `shadowDistance` (*any*) : Ignoré.

#### `core_environment.setSkyBrightness(skyBrightness)`

Déprécié : avertissement seul.

- `skyBrightness` (*any*) : Ignoré.

#### `core_environment.setState(state, lerpSeconds)`

Applique un état (même format que getState). Émet onEnvironmentChanged. Avec lerpSeconds > 0, cloudCover, fogDensity, fogAtmosphereHeight et time sont interpolés (courbe smootherstep, durée réduite si l'écart est faible, minimum 0.12 s) ; les autres champs sont appliqués tout de suite.

- `state` (*table*) : État partiel ou complet ; fogDensity attendu x1000 ; time optionnel (sans time l'horloge n'est pas déplacée).
- `lerpSeconds` (*number|nil*) : Durée maximale de transition en secondes réelles ; nil ou <= 0 = immédiat.

#### `core_environment.setSunScaleGradientFile(sunScaleGradientFile)`

Déprécié : avertissement seul.

- `sunScaleGradientFile` (*any*) : Ignoré.

#### `core_environment.setTemperatureProfile(profile)`

Crée un override de la courbe de température du jour : décale la courbe pour viser la moyenne, puis étire les creux/pics pour viser min et max. Valeurs bornées à -50..60 °C. Ignoré si enableChanges(false) ou table invalide.

- `profile` (*table*) : {averageC?, minC?, maxC?} en °C ; au moins un champ numérique fini requis.

#### `core_environment.setTimeOfDay(timeOfDay)`

Applique des champs de l'heure du jour sur l'objet TimeOfDay. Ne fait rien si la table ne contient aucun champ connu. Émet onEnvironmentChanged et met à jour les lumières nocturnes si time est fourni. Changer year/month/day/latitude force le recalcul de la position du soleil.

- `timeOfDay` (*table*) : Champs facultatifs : time (0..1, 0 = midi, 0.5 = minuit), play (boolean), dayLength (s réelles), startTime, latitude, longitude (degrés, déduit du code), year, month, day, utcOffset (heures), dstRule, celestialProfile (nom, recharge core_celestial).

#### `core_environment.setWindSpeed(windSpeed)`

Fixe CloudLayer.windSpeed du premier CloudLayer de la scène.

- `windSpeed` (*number*) : Vitesse du vent des nuages (unité du champ moteur, non précisée dans le code).

#### `core_environment.syncTimeToRealClock(lerpSeconds)`

Règle l'heure du jeu sur l'heure locale réelle de l'ordinateur (os.date('*t')), en conservant l'état play.

- `lerpSeconds` (*number|nil*) : Durée de transition en secondes.

#### `core_environment.syncTimeToRealClockUtc(lerpSeconds)`

Règle heure ET date du jeu sur l'instant UTC réel converti au fuseau (utcOffset/dstRule) du niveau.

- `lerpSeconds` (*number|nil*) : Durée de transition en secondes.

## Champs

| Champ | Type | Description |
|---|---|---|
| `dayCyclePresets` | table[] | {speed, seconds} : secondes réelles par cycle jour/nuit : fast 900, normal 1800, slow 7200, realtime 86400. |
| `defaultSolarTimeOfDayOptions` | table[] | Copie profonde de defaultTimeOfDayOptions, base pour les options calculées astronomiquement. |
| `defaultTimeOfDayOptions` | table[] | Liste {key, value, label} des moments clés : sunrise 0.775, morning 0.825, earlyNoon 0.9, noon 0, lateNoon 0.1, afternoon 0.175, evening 0.23, sunset 0.245, night 0.5. label = clé de traduction. |
| `dependencies` | string[] | {'core_solarTimeOfDay'} : extension chargée avant celle-ci (calcul solaire : fenêtre de nuit, événements lever/coucher). |
| `gravityPresets` | table[] | Presets {key, title, value} en m/s² (terre -9.81, lune -1.62, mars -3.71, soleil -274, jupiter -24.92, neptune -11.15, saturne -10.44, uranus -8.87, vénus -8.87, mercure -3.7, pluton -0.58, zéro 0, terre inversée 9.81). |
| `groundModels` | table<string, {cdata: any, isAlias: boolean, parent: string}> | Ground models connus, clés en MAJUSCULES. cdata = structure C++ ground_model ; isAlias/parent indiquent si l'entrée est un alias d'un autre modèle. Reconstruit par reloadGroundModels. |
| `loadedGroundModelFiles` | string[] | Chemins des fichiers JSON de ground models chargés (commun + niveau). Sert à onFilesChanged pour détecter une modification à chaud. |
| `simSpeedPresets` | table[] | {key, label, value} : facteurs de ralenti de la simulation (value = diviseur : 1 temps réel, 2 = 1/2x, 4, 10, 25, 50, 100, 1000). |
| `timeOfDayKeyToTime` | table<string, number> | Table clé -> valeur de time pour les moments clés par défaut (noon -> 0, night -> 0.5, …). |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onEnvironmentChanged`

**Évènements UI (guihooks.trigger) :** `EnvironmentCanUpdateChanged`, `EnvironmentStateUpdate`

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `getGroundModelByID`, `getGroundModelCount`, `loadTireMarks`, `queueAllObjectLua`, `reloadCollision`, `resetGroundModels`, `resetTireMarks`, `saveTireMarks`, `setGroundModel`, `setGroundWind`, `setSeaLevelTemperatureK`
- `obj:` `getClassName`, `getDynDataFieldbyName`, `getField`, `getID`, `getId`, `isSubClassOf`, `setField`, `updateInstanceRenderData`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`, `findSubClassObjects`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/environment.lua`.*
