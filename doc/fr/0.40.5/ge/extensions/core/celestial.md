# `core_celestial`

*Fichier : `lua/ge/extensions/core/celestial.lua` · VM : Game Engine (GE) · 1183 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_celestial` : `extensions.load("core_celestial")`, puis la globale `core_celestial`

Ciel astronomique réel piloté par le TimeOfDay du niveau. L'horloge (time, play, dayLength) et le lieu/date de l'observateur (latitude, longitude, year, month, day) viennent du TimeOfDay ; l'extension positionne le soleil, la lune (taille et phase) et l'orientation du champ d'étoiles sur ce même instant (objet ScatterSky). Elle gère aussi les étoiles filantes, les éclipses solaires, un profil céleste par niveau (atmosphère, corps) et une carte de détail au survol des étoiles/constellations. Un moddeur s'en sert pour changer le lieu, la date, la taille de la lune, afficher des grilles ou remplacer le calcul du ciel (setDriver).

## Exemple

```lua
core_celestial.setLocation(47.0, 8.0)   -- latitude, longitude en degrés
core_celestial.setDate(2026, 8, 12)    -- pic des Perséides
core_celestial.setMoonScale(0.08)
core_celestial.setDisplayOption('constellationLines', true)
local ecl = core_celestial.findNextSolarEclipse() -- {year, month, day, time} ou nil
```

## Remarques

- Reste chargée entre les niveaux (setExtensionUnloadMode manual). À chaque niveau, les caches sont vidés et le profil céleste est relu (onClientPostStartMission) depuis tod.celestialProfile (nom nu -> /art/skies/profiles/<nom>.json, ou chemin commençant par /) sinon depuis celestial.json du dossier du niveau ; à la fin du niveau le profil est oublié.
- Le positionnement se fait dans onPreRender (et non onUpdate) car le TimeOfDay C++ avance son temps entre les deux : pas de décalage d'une image.
- Valeurs par défaut si le TimeOfDay n'a pas de lieu/date : latitude 47, longitude 8, 2026-06-20. Taille de lune par défaut 0.05 ; décalage du nord 0 ; azimuthSign 1 (mettre -1 si le ciel est en miroir est-ouest).
- Les modèles astronomiques (Soleil et Lune de Schlyter, réfraction, parallaxe lunaire, fuseau civil + heure d'été) tiennent dans ce fichier ; setTimezone(nil) déduit le fuseau de la longitude.
- Presets d'étoiles filantes : default (calendrier réel), low = 10, moderate = 30, high = 120 météores/min.
- Clés de setDisplayOption -> champs ScatterSky : constellationLines -> constellationsEnabled, constellationLabels -> constellationNamesEnabled, horizonGrid -> gridEnabled, equatorialGrid -> equatorialGridEnabled, meridianGrid -> meridianEnabled, moonGrid -> moonPathEnabled.
- Le survol envoie le guihook « CelestialHover » quand la cible change ; la sélection est limitée à environ 16 Hz et seulement si le ciel est visible.
- Le champ extrait `hover` est décrit ici ; les autres fonctions locales du fichier (calculs, cartes d'étoiles, ~1000 lignes) ne sont pas exportées.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_celestial.findNextSolarEclipse()` | Cherche la prochaine éclipse solaire visible depuis le lieu de l'observateur du niveau, à partir de l'instant courant du TimeOfDay. | 708 |
| `core_celestial.getActiveProfile()` | Profil céleste actif. | 813 |
| `core_celestial.getDisplayState()` | État des couches d'affichage. | 782 |
| `core_celestial.getDriver()` | Renvoie le pilote de ciel personnalisé courant. | 717 |
| `core_celestial.getHover()` | Dernier résultat de survol (constellation + étoile). | 724 |
| `core_celestial.getNorthOffset()` | Décalage du nord courant. | 726 |
| `core_celestial.getState()` | Instantané de configuration pour outils de debug/scripts. | 817 |
| `core_celestial.isEnabled()` | Indique si le ciel astronomique réel est activé. | 712 |
| `core_celestial.loadProfile(profile)` | Charge ou remplace le profil céleste (atmosphère, corps). Le bloc atmosphère est repoussé vers ScatterSky à l'image suivante. | 806 |
| `core_celestial.onClientEndMission()` | Hook : fin du niveau ; vide les caches et oublie le profil. *(interne)* *(hook)* | 1103 |
| `core_celestial.onClientPostStartMission()` | Hook : un niveau vient d'être chargé ; vide les caches et recharge le profil céleste. *(interne)* *(hook)* | 1102 |
| `core_celestial.onExtensionLoaded()` | Hook : met l'extension en déchargement manuel. *(interne)* *(hook)* | 1088 |
| `core_celestial.onLanguageChanged()` | Hook : changement de langue ; reconstruit l'atlas de noms et les cartes de survol (gratuit si rien ne change). *(interne)* *(hook)* | 1107 |
| `core_celestial.onPreRender(dtReal, dtSim)` | Hook par image : applique l'atmosphère du profil, puis calcule la position du soleil, de la lune et des étoiles depuis le TimeOfDay et met à jour le survol ; ou restaure le ciel d'origine si désactivé. *(interne)* *(hook)* | 1071 |
| `core_celestial.onReloadLocales()` | Hook : rechargement à chaud des fichiers de langue ; même effet que onLanguageChanged. *(interne)* *(hook)* | 1107 |
| `core_celestial.refreshHoverCards()` | Détruit les cartes de survol pour qu'elles soient reconstruites depuis M.hover au prochain survol (à appeler après avoir remplacé un *Template). | 970 |
| `core_celestial.selftest()` | Auto-test de la partie mathématique (JD, soleil, lune, réfraction, parallaxe, fuseau, météores, éclipses). Lève une erreur d'assertion en cas d'écart. | 1112 |
| `core_celestial.setAzimuthSign(s)` | Inverse le sens est-ouest du ciel si le soleil/les étoiles apparaissent en miroir. | 727 |
| `core_celestial.setDate(y, mo, d)` | Écrit année/mois/jour dans le TimeOfDay du niveau ; les arguments nil sont ignorés. | 792 |
| `core_celestial.setDisplayOption(key, value)` | Active/désactive une couche d'affichage du ciel (voir notes pour les clés valides). Sans effet si pas de ScatterSky ou clé inconnue. | 776 |
| `core_celestial.setDriver(fn)` | Remplace le calcul du ciel à chaque image. fn(ctx) reçoit les valeurs du ciel réel préremplies (ctx.sunAz/sunEl, ctx.bodies, ctx.star*, ctx.meteor*, ctx.time/jd/lst/lat/lon) et un utilitaire ctx.altAz(raDeg, decDeg) ; il les modifie pour déplacer le ciel. nil rétablit le calcul intégré. | 716 |
| `core_celestial.setEnabled(on)` | Active ou désactive le ciel astronomique réel (activé par défaut) ; la transition est appliquée à la prochaine image. | 704 |
| `core_celestial.setHoverEnabled(on)` | Active la carte de détail au survol des étoiles (l'overlay UI l'active pendant son affichage). Désactiver efface le dernier résultat. | 720 |
| `core_celestial.setLocation(latDeg, lonDeg)` | Écrit latitude/longitude dans le TimeOfDay du niveau (source de vérité). Ne fait rien sans TimeOfDay. | 786 |
| `core_celestial.setMeteorRatePreset(preset)` | Choisit un préréglage de taux d'étoiles filantes. | 739 |
| `core_celestial.setMeteorTest(on)` | Debug : force une forte pluie d'étoiles filantes même hors saison. | 736 |
| `core_celestial.setMeteorTestRate(r)` | Debug : fixe le taux d'étoiles filantes et active le mode test. | 737 |
| `core_celestial.setMoonScale(s)` | Change la taille de la lune (appliquée tout de suite si le ciel réel est actif). | 729 |
| `core_celestial.setNorthOffset(deg)` | Décale le nord vrai par rapport à l'axe +Y du monde. | 725 |
| `core_celestial.setTimezone(stdOffsetHours, rule)` | Fuseau civil de l'observateur. Un niveau peut aussi fixer tod.utcOffset / tod.dstRule directement. | 799 |

### Détail des paramètres

#### `core_celestial.findNextSolarEclipse()`

Cherche la prochaine éclipse solaire visible depuis le lieu de l'observateur du niveau, à partir de l'instant courant du TimeOfDay.

- **renvoie** : table|nil {year, month, day, time} au maximum de l'éclipse, nil si aucune dans la plage de recherche ou pas de TimeOfDay

#### `core_celestial.getActiveProfile()`

Profil céleste actif.

- **renvoie** : table|nil profil

#### `core_celestial.getDisplayState()`

État des couches d'affichage.

- **renvoie** : table {hasSky=boolean, constellationLines=..., ...} ; seul hasSky s'il n'y a pas de ciel

#### `core_celestial.getDriver()`

Renvoie le pilote de ciel personnalisé courant.

- **renvoie** : function|nil pilote ou nil si le calcul intégré est utilisé

#### `core_celestial.getHover()`

Dernier résultat de survol (constellation + étoile).

- **renvoie** : table|nil fiche du dernier survol ou nil

#### `core_celestial.getNorthOffset()`

Décalage du nord courant.

- **renvoie** : number degrés

#### `core_celestial.getState()`

Instantané de configuration pour outils de debug/scripts.

- **renvoie** : table enabled, hoverEnabled, northOffsetDeg, azimuthSign, moonScale, latitude, longitude, year, month, day, time, meteor{name,test,ratePreset,rate,showerFraction}, display

#### `core_celestial.isEnabled()`

Indique si le ciel astronomique réel est activé.

- **renvoie** : boolean état

#### `core_celestial.loadProfile(profile)`

Charge ou remplace le profil céleste (atmosphère, corps). Le bloc atmosphère est repoussé vers ScatterSky à l'image suivante.

- `profile` (*string|table*) : chemin d'un JSON ou table déjà décodée
- **renvoie** : boolean false si le profil n'est ni une table ni un JSON lisible

#### `core_celestial.onPreRender(dtReal, dtSim)`

Hook par image : applique l'atmosphère du profil, puis calcule la position du soleil, de la lune et des étoiles depuis le TimeOfDay et met à jour le survol ; ou restaure le ciel d'origine si désactivé.

- `dtReal` (*number*) : secondes réelles
- `dtSim` (*number*) : secondes de simulation (non utilisé)

#### `core_celestial.selftest()`

Auto-test de la partie mathématique (JD, soleil, lune, réfraction, parallaxe, fuseau, météores, éclipses). Lève une erreur d'assertion en cas d'écart.

- **renvoie** : boolean true si tout passe

#### `core_celestial.setAzimuthSign(s)`

Inverse le sens est-ouest du ciel si le soleil/les étoiles apparaissent en miroir.

- `s` (*number*) : négatif = -1, sinon 1

#### `core_celestial.setDate(y, mo, d)`

Écrit année/mois/jour dans le TimeOfDay du niveau ; les arguments nil sont ignorés.

- `y` (*integer|nil*) : année
- `mo` (*integer|nil*) : mois 1-12
- `d` (*integer|nil*) : jour

#### `core_celestial.setDisplayOption(key, value)`

Active/désactive une couche d'affichage du ciel (voir notes pour les clés valides). Sans effet si pas de ScatterSky ou clé inconnue.

- `key` (*string*) : constellationLines, constellationLabels, horizonGrid, equatorialGrid, meridianGrid, moonGrid
- `value` (*boolean*) : afficher ou non

#### `core_celestial.setDriver(fn)`

Remplace le calcul du ciel à chaque image. fn(ctx) reçoit les valeurs du ciel réel préremplies (ctx.sunAz/sunEl, ctx.bodies, ctx.star*, ctx.meteor*, ctx.time/jd/lst/lat/lon) et un utilitaire ctx.altAz(raDeg, decDeg) ; il les modifie pour déplacer le ciel. nil rétablit le calcul intégré.

- `fn` (*function|nil*) : fonction fn(ctx) ; toute valeur non fonction est traitée comme nil

#### `core_celestial.setEnabled(on)`

Active ou désactive le ciel astronomique réel (activé par défaut) ; la transition est appliquée à la prochaine image.

- `on` (*boolean*) : true = ciel réel ; false = restaure l'ambiance nocturne d'origine du niveau

#### `core_celestial.setHoverEnabled(on)`

Active la carte de détail au survol des étoiles (l'overlay UI l'active pendant son affichage). Désactiver efface le dernier résultat.

- `on` (*boolean*) : activer le survol

#### `core_celestial.setLocation(latDeg, lonDeg)`

Écrit latitude/longitude dans le TimeOfDay du niveau (source de vérité). Ne fait rien sans TimeOfDay.

- `latDeg` (*number*) : latitude en degrés (nord positif)
- `lonDeg` (*number*) : longitude en degrés (est positif)

#### `core_celestial.setMeteorRatePreset(preset)`

Choisit un préréglage de taux d'étoiles filantes.

- `preset` (*string|nil*) : default (calendrier réel), low (10), moderate (30), high (120) ; nil = default ; valeur inconnue = sans effet

#### `core_celestial.setMeteorTest(on)`

Debug : force une forte pluie d'étoiles filantes même hors saison.

- `on` (*boolean*) : activer

#### `core_celestial.setMeteorTestRate(r)`

Debug : fixe le taux d'étoiles filantes et active le mode test.

- `r` (*number*) : météores par minute (30 par défaut)

#### `core_celestial.setMoonScale(s)`

Change la taille de la lune (appliquée tout de suite si le ciel réel est actif).

- `s` (*number*) : échelle ; 0.05 par défaut, le défaut des niveaux (~0.2) est énorme

#### `core_celestial.setNorthOffset(deg)`

Décale le nord vrai par rapport à l'axe +Y du monde.

- `deg` (*number*) : degrés (0 si non numérique)

#### `core_celestial.setTimezone(stdOffsetHours, rule)`

Fuseau civil de l'observateur. Un niveau peut aussi fixer tod.utcOffset / tod.dstRule directement.

- `stdOffsetHours` (*number|nil*) : décalage UTC standard en heures ; nil = déduit de la longitude
- `rule` (*string|nil*) : règle d'heure d'été : auto, eu, us, au, none ; nil = inchangée

## Champs

| Champ | Type | Description |
|---|---|---|
| `hover` | table | Réglages publics de la carte de détail au survol, modifiables sans forker le fichier : dist (16 m devant la caméra), starHeight 4.6, constHeight 2.5, rightFrac 0.82, downFrac 0.10, tilt -0.22, res 2 (supersampling de texture), starPickDeg 1.5 (distance angulaire pour choisir une étoile), constPickDeg 6 (pour choisir une constellation), shimmerDist 40, shimmerRadiusFrac 0.025, shimmerColor {r,g,b}, leaderColor {r,g,b,a}, et les fonctions de remplacement starTemplate(), constTemplate(), starVars(meta), constVars(id). Après avoir remplacé un *Template, appeler refreshHoverCards(). |

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `debugDrawer:` `drawLine`
- `obj:` `getID`
- `scenetree.` `findClassObjects`, `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/celestial.lua`.*
