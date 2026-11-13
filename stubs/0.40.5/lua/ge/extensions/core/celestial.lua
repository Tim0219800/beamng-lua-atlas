---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/celestial.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Ciel astronomique réel piloté par le TimeOfDay du niveau. L'horloge (time, play, dayLength) et le lieu/date de l'observateur (latitude, longitude, year, month, day) viennent du TimeOfDay ; l'extension positionne le soleil, la lune (taille et phase) et l'orientation du champ d'étoiles sur ce même instant (objet ScatterSky). Elle gère aussi les étoiles filantes, les éclipses solaires, un profil céleste par niveau (atmosphère, corps) et une carte de détail au survol des étoiles/constellations. Un moddeur s'en sert pour changer le lieu, la date, la taille de la lune, afficher des grilles ou remplacer le calcul du ciel (setDriver).
--- Accès : extension `core_celestial` : `extensions.load("core_celestial")`, puis la globale `core_celestial`
---@class core_celestial
---@field hover table Réglages publics de la carte de détail au survol, modifiables sans forker le fichier : dist (16 m devant la caméra), starHeight 4.6, constHeight 2.5, rightFrac 0.82, downFrac 0.10, tilt -0.22, res 2 (supersampling de texture), starPickDeg 1.5 (distance angulaire pour choisir une étoile), constPickDeg 6 (pour choisir une constellation), shimmerDist 40, shimmerRadiusFrac 0.025, shimmerColor {r,g,b}, leaderColor {r,g,b,a}, et les fonctions de remplacement starTemplate(), constTemplate(), starVars(meta), constVars(id). Après avoir remplacé un *Template, appeler refreshHoverCards().
core_celestial = {}

--- Cherche la prochaine éclipse solaire visible depuis le lieu de l'observateur du niveau, à partir de l'instant courant du TimeOfDay.
---Source : lua/ge/extensions/core/celestial.lua:708
---@return table|nil  {year, month, day, time} au maximum de l'éclipse, nil si aucune dans la plage de recherche ou pas de TimeOfDay
function core_celestial.findNextSolarEclipse() end

--- Profil céleste actif.
---Source : lua/ge/extensions/core/celestial.lua:813
---@return table|nil  profil
function core_celestial.getActiveProfile() end

--- État des couches d'affichage.
---Source : lua/ge/extensions/core/celestial.lua:782
---@return table  {hasSky=boolean, constellationLines=..., ...} ; seul hasSky s'il n'y a pas de ciel
function core_celestial.getDisplayState() end

--- Renvoie le pilote de ciel personnalisé courant.
---Source : lua/ge/extensions/core/celestial.lua:717
---@return function|nil  pilote ou nil si le calcul intégré est utilisé
function core_celestial.getDriver() end

--- Dernier résultat de survol (constellation + étoile).
---Source : lua/ge/extensions/core/celestial.lua:724
---@return table|nil  fiche du dernier survol ou nil
function core_celestial.getHover() end

--- Décalage du nord courant.
---Source : lua/ge/extensions/core/celestial.lua:726
---@return number  degrés
function core_celestial.getNorthOffset() end

--- Instantané de configuration pour outils de debug/scripts.
---Source : lua/ge/extensions/core/celestial.lua:817
---@return table  enabled, hoverEnabled, northOffsetDeg, azimuthSign, moonScale, latitude, longitude, year, month, day, time, meteor{name,test,ratePreset,rate,showerFraction}, display
function core_celestial.getState() end

--- Indique si le ciel astronomique réel est activé.
---Source : lua/ge/extensions/core/celestial.lua:712
---@return boolean  état
function core_celestial.isEnabled() end

--- Charge ou remplace le profil céleste (atmosphère, corps). Le bloc atmosphère est repoussé vers ScatterSky à l'image suivante.
---Source : lua/ge/extensions/core/celestial.lua:806
---@param profile string|table chemin d'un JSON ou table déjà décodée
---@return boolean  false si le profil n'est ni une table ni un JSON lisible
function core_celestial.loadProfile(profile) end

--- Hook : fin du niveau ; vide les caches et oublie le profil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/celestial.lua:1103
function core_celestial.onClientEndMission() end

--- Hook : un niveau vient d'être chargé ; vide les caches et recharge le profil céleste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/celestial.lua:1102
function core_celestial.onClientPostStartMission() end

--- Hook : met l'extension en déchargement manuel.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/celestial.lua:1088
function core_celestial.onExtensionLoaded() end

--- Hook : changement de langue ; reconstruit l'atlas de noms et les cartes de survol (gratuit si rien ne change).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/celestial.lua:1107
function core_celestial.onLanguageChanged() end

--- Hook par image : applique l'atmosphère du profil, puis calcule la position du soleil, de la lune et des étoiles depuis le TimeOfDay et met à jour le survol ; ou restaure le ciel d'origine si désactivé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/celestial.lua:1071
---@param dtReal number secondes réelles
---@param dtSim number secondes de simulation (non utilisé)
function core_celestial.onPreRender(dtReal, dtSim) end

--- Hook : rechargement à chaud des fichiers de langue ; même effet que onLanguageChanged.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/celestial.lua:1107
function core_celestial.onReloadLocales() end

--- Détruit les cartes de survol pour qu'elles soient reconstruites depuis M.hover au prochain survol (à appeler après avoir remplacé un *Template).
---Source : lua/ge/extensions/core/celestial.lua:970
function core_celestial.refreshHoverCards() end

--- Auto-test de la partie mathématique (JD, soleil, lune, réfraction, parallaxe, fuseau, météores, éclipses). Lève une erreur d'assertion en cas d'écart.
---Source : lua/ge/extensions/core/celestial.lua:1112
---@return boolean  true si tout passe
function core_celestial.selftest() end

--- Inverse le sens est-ouest du ciel si le soleil/les étoiles apparaissent en miroir.
---Source : lua/ge/extensions/core/celestial.lua:727
---@param s number négatif = -1, sinon 1
function core_celestial.setAzimuthSign(s) end

--- Écrit année/mois/jour dans le TimeOfDay du niveau ; les arguments nil sont ignorés.
---Source : lua/ge/extensions/core/celestial.lua:792
---@param y integer|nil année
---@param mo integer|nil mois 1-12
---@param d integer|nil jour
function core_celestial.setDate(y, mo, d) end

--- Active/désactive une couche d'affichage du ciel (voir notes pour les clés valides). Sans effet si pas de ScatterSky ou clé inconnue.
---Source : lua/ge/extensions/core/celestial.lua:776
---@param key string constellationLines, constellationLabels, horizonGrid, equatorialGrid, meridianGrid, moonGrid
---@param value boolean afficher ou non
function core_celestial.setDisplayOption(key, value) end

--- Remplace le calcul du ciel à chaque image. fn(ctx) reçoit les valeurs du ciel réel préremplies (ctx.sunAz/sunEl, ctx.bodies, ctx.star*, ctx.meteor*, ctx.time/jd/lst/lat/lon) et un utilitaire ctx.altAz(raDeg, decDeg) ; il les modifie pour déplacer le ciel. nil rétablit le calcul intégré.
---Source : lua/ge/extensions/core/celestial.lua:716
---@param fn function|nil fonction fn(ctx) ; toute valeur non fonction est traitée comme nil
function core_celestial.setDriver(fn) end

--- Active ou désactive le ciel astronomique réel (activé par défaut) ; la transition est appliquée à la prochaine image.
---Source : lua/ge/extensions/core/celestial.lua:704
---@param on boolean true = ciel réel ; false = restaure l'ambiance nocturne d'origine du niveau
function core_celestial.setEnabled(on) end

--- Active la carte de détail au survol des étoiles (l'overlay UI l'active pendant son affichage). Désactiver efface le dernier résultat.
---Source : lua/ge/extensions/core/celestial.lua:720
---@param on boolean activer le survol
function core_celestial.setHoverEnabled(on) end

--- Écrit latitude/longitude dans le TimeOfDay du niveau (source de vérité). Ne fait rien sans TimeOfDay.
---Source : lua/ge/extensions/core/celestial.lua:786
---@param latDeg number latitude en degrés (nord positif)
---@param lonDeg number longitude en degrés (est positif)
function core_celestial.setLocation(latDeg, lonDeg) end

--- Choisit un préréglage de taux d'étoiles filantes.
---Source : lua/ge/extensions/core/celestial.lua:739
---@param preset string|nil default (calendrier réel), low (10), moderate (30), high (120) ; nil = default ; valeur inconnue = sans effet
function core_celestial.setMeteorRatePreset(preset) end

--- Debug : force une forte pluie d'étoiles filantes même hors saison.
---Source : lua/ge/extensions/core/celestial.lua:736
---@param on boolean activer
function core_celestial.setMeteorTest(on) end

--- Debug : fixe le taux d'étoiles filantes et active le mode test.
---Source : lua/ge/extensions/core/celestial.lua:737
---@param r number météores par minute (30 par défaut)
function core_celestial.setMeteorTestRate(r) end

--- Change la taille de la lune (appliquée tout de suite si le ciel réel est actif).
---Source : lua/ge/extensions/core/celestial.lua:729
---@param s number échelle ; 0.05 par défaut, le défaut des niveaux (~0.2) est énorme
function core_celestial.setMoonScale(s) end

--- Décale le nord vrai par rapport à l'axe +Y du monde.
---Source : lua/ge/extensions/core/celestial.lua:725
---@param deg number degrés (0 si non numérique)
function core_celestial.setNorthOffset(deg) end

--- Fuseau civil de l'observateur. Un niveau peut aussi fixer tod.utcOffset / tod.dstRule directement.
---Source : lua/ge/extensions/core/celestial.lua:799
---@param stdOffsetHours number|nil décalage UTC standard en heures ; nil = déduit de la longitude
---@param rule string|nil règle d'heure d'été : auto, eu, us, au, none ; nil = inchangée
function core_celestial.setTimezone(stdOffsetHours, rule) end

