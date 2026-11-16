# `core_solarTimeOfDay`

*Fichier : `lua/ge/extensions/core/solarTimeOfDay.lua` · VM : Game Engine (GE) · 303 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_solarTimeOfDay` : `extensions.load("core_solarTimeOfDay")`, puis la globale `core_solarTimeOfDay`

Calculs solaires purs (sans appel moteur) : à partir d'une latitude, longitude, date et décalage UTC, calcule lever, midi solaire, coucher et minuit solaire, puis les convertit dans la convention de temps du jeu (tod.time : 0 = midi, 0.25 = 18h, 0.5 = minuit, 0.75 = 6h). Sert aux choix d'heure du jour (matin, après-midi, soir…) dans les menus de course rapide, et gère les cas polaires (jour ou nuit continu).

## Exemple

```lua
local state = {latitude = 45, longitude = 5, year = 2026, month = 6, day = 21}
local events = core_solarTimeOfDay.getSolarTimeOfDayEvents(state) -- minutes locales
local values = core_solarTimeOfDay.getSolarTimeOfDayValues(state) -- valeurs tod.time
```

## Remarques

- Le paramètre state est une table {latitude, longitude (degrés, longitude positive à l'est), year, month, day, utcOffset (h, facultatif), dstRule (facultatif)}. Si utcOffset manque, il vaut round(longitude/15) plus 1 si l'heure d'été est active.
- dstRule : 'eu', 'us', 'au', 'none' ou 'auto' (défaut) ; 'auto' choisit au (lat <= -30), eu ou us (lat >= 30 ; us si -170 < lon < -30), sinon none.
- Les événements sont en minutes locales entières depuis minuit (0 à 1439). Les valeurs 'values' sont dans la convention tod.time (0 à 1).
- Les fonctions renvoient nil si des champs de state sont manquants ou non numériques.
- Cas polaire : sunrise et sunset valent nil et events.polar vaut 'day' ou 'night'.
- Le calcul du lever/coucher utilise l'angle zénithal 90.833 degrés (refraction incluse) et la déclinaison/équation du temps de type NOAA.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_solarTimeOfDay.buildSolarTimeOfDayOptions(state, options)` | Construit la liste d'options d'heure du jeu. Dans un cas polaire, renvoie seulement solarMidnight et solarNoon (clés de traduction ui.quickrace.tod.*). Sinon copie chaque option fournie en y ajoutant value = valeur solaire pour sa clé (nil si inconnue). | 265 |
| `core_solarTimeOfDay.getCivilOffsetHours(state)` | Décalage horaire civil (heures) : state.utcOffset s'il est donné, sinon déduit de la longitude et de la règle d'heure d'été. | 169 |
| `core_solarTimeOfDay.getSolarNightWindow(state)` | Fenêtre de nuit : début (coucher) et fin (lever) en valeurs tod.time. | 256 |
| `core_solarTimeOfDay.getSolarTimeOfDayEvents(state)` | Calcule les événements solaires en minutes locales : sunrise, noon, sunset, night (minuit solaire) et polar. | 200 |
| `core_solarTimeOfDay.getSolarTimeOfDayValues(state)` | Valeurs tod.time nommées : sunrise, noon, sunset, night, plus morning (1/3 du lever vers midi), earlyNoon (5/9), lateNoon (40 % de midi vers coucher), afternoon (70 %) et evening (94 %) quand lever et coucher existent. | 252 |
| `core_solarTimeOfDay.getTimeValueForKey(key, state, options)` | Renvoie la valeur tod.time de l'option dont la clé est donnée parmi celles de buildSolarTimeOfDayOptions. | 291 |
| `core_solarTimeOfDay.timeFromMinutes(minutes)` | Convertit des minutes locales depuis minuit en valeur tod.time ((minutes/1440 - 0.5) modulo 1). Les minutes sont arrondies puis ramenées dans 0..1439. | 165 |
| `core_solarTimeOfDay.timeFromNormalizedTime(normalizedTime, state)` | Convertit un temps normalisé en heure du jeu en suivant le soleil réel : 0 à 0.25 = midi vers coucher, 0.25 à 0.5 = coucher vers minuit, 0.5 à 0.75 = minuit vers lever, 0.75 à 1 = lever vers midi. En cas polaire, utilise seulement le midi solaire. Sans événements solaires valides, renvoie le temps normalisé inchangé. | 173 |

### Détail des paramètres

#### `core_solarTimeOfDay.buildSolarTimeOfDayOptions(state, options)`

Construit la liste d'options d'heure du jeu. Dans un cas polaire, renvoie seulement solarMidnight et solarNoon (clés de traduction ui.quickrace.tod.*). Sinon copie chaque option fournie en y ajoutant value = valeur solaire pour sa clé (nil si inconnue).

- `state` (*table*) : Voir notes.
- `options` (*table[]|nil*) : Options existantes avec un champ key (morning, earlyNoon, noon, lateNoon, afternoon, evening, sunset, night, sunrise…).
- **renvoie** : table[] Options avec champ value.

#### `core_solarTimeOfDay.getCivilOffsetHours(state)`

Décalage horaire civil (heures) : state.utcOffset s'il est donné, sinon déduit de la longitude et de la règle d'heure d'été.

- `state` (*table*) : Voir notes.
- **renvoie** : number|nil Décalage en heures, nil si state est incomplet.

#### `core_solarTimeOfDay.getSolarNightWindow(state)`

Fenêtre de nuit : début (coucher) et fin (lever) en valeurs tod.time.

- `state` (*table*) : Voir notes.
- **renvoie** : number|nil Début de la nuit (coucher).
- **renvoie** : number|nil Fin de la nuit (lever). nil si polaire ou state incomplet.

#### `core_solarTimeOfDay.getSolarTimeOfDayEvents(state)`

Calcule les événements solaires en minutes locales : sunrise, noon, sunset, night (minuit solaire) et polar.

- `state` (*table*) : Voir notes.
- **renvoie** : {sunrise: integer|nil, noon: integer, sunset: integer|nil, night: integer, polar: string|nil}|nil Événements, nil si state est incomplet.

#### `core_solarTimeOfDay.getSolarTimeOfDayValues(state)`

Valeurs tod.time nommées : sunrise, noon, sunset, night, plus morning (1/3 du lever vers midi), earlyNoon (5/9), lateNoon (40 % de midi vers coucher), afternoon (70 %) et evening (94 %) quand lever et coucher existent.

- `state` (*table*) : Voir notes.
- **renvoie** : table<string, number>|nil Valeurs par clé, nil si state est incomplet.

#### `core_solarTimeOfDay.getTimeValueForKey(key, state, options)`

Renvoie la valeur tod.time de l'option dont la clé est donnée parmi celles de buildSolarTimeOfDayOptions.

- `key` (*string*) : Clé d'option.
- `state` (*table*) : Voir notes.
- `options` (*table[]|nil*) : Options candidates.
- **renvoie** : number|nil Valeur, nil si clé non texte ou introuvable.

#### `core_solarTimeOfDay.timeFromMinutes(minutes)`

Convertit des minutes locales depuis minuit en valeur tod.time ((minutes/1440 - 0.5) modulo 1). Les minutes sont arrondies puis ramenées dans 0..1439.

- `minutes` (*number*) : Minutes depuis minuit.
- **renvoie** : number|nil Valeur tod.time (0 = midi), nil si minutes n'est pas un nombre fini.

#### `core_solarTimeOfDay.timeFromNormalizedTime(normalizedTime, state)`

Convertit un temps normalisé en heure du jeu en suivant le soleil réel : 0 à 0.25 = midi vers coucher, 0.25 à 0.5 = coucher vers minuit, 0.5 à 0.75 = minuit vers lever, 0.75 à 1 = lever vers midi. En cas polaire, utilise seulement le midi solaire. Sans événements solaires valides, renvoie le temps normalisé inchangé.

- `normalizedTime` (*number*) : Temps normalisé ; ramené dans 0..1 par modulo.
- `state` (*table*) : Voir notes.
- **renvoie** : number|nil Valeur tod.time ; -1 si normalizedTime est négatif ; nil si non numérique.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/solarTimeOfDay.lua`.*
