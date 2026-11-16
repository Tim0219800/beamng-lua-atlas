# `freeroam_configuratorOptions_freeroamOptions`

*Fichier : `lua/ge/extensions/freeroam/configuratorOptions/freeroamOptions.lua` · VM : Game Engine (GE) · 172 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `freeroam_configuratorOptions_freeroamOptions` : `extensions.load("freeroam_configuratorOptions_freeroamOptions")`, puis la globale `freeroam_configuratorOptions_freeroamOptions`

Ajoute au configurateur de partie libre (écran de choix du niveau en freeroam) les options propres au freeroam : mode de trafic (désactivé, voitures garées, normal, police), heure du jour, date et défilement du jour (cycle jour/nuit). Il réagit aux hooks onFreeroamConfiguratorGetOptions (construction du menu) et onFreeroamConfiguratorApplyOptions (valeurs choisies) et écrit les choix dans freeroam_freeroam.spawningOptionsHelper. Un moddeur peut copier ce schéma pour ajouter ses propres options.

## Remarques

- Le groupe trafic a order = 100, le groupe heure/date a order = 200 ; chaque option est une table {label, icon, value, key, type, options...} où type vaut 'select' ou 'date'.
- Sans support du trafic ou sans options d'heure (core_levels.getTimeOfDayOptions), une option désactivée avec un texte « non supporté » est ajoutée à la place.
- Modes de trafic -> spawningOptionsHelper : disabled = rien ; parkedOnly = trafficParked seul ; enabled = trafficMode + trafficParked ; police = les trois activés.
- La date par défaut est celle de level.defaultDate (year, month, day) ou, à défaut, le 20 juin 2026, à 12 h (os.time).
- Les valeurs 'value' des options sont des défauts ; elles sont remplacées par la configuration courante côté interface.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `freeroam_configuratorOptions_freeroamOptions.getDefaultEnvironmentDate(levelName)` | Date par défaut d'un niveau pour l'environnement. | 167 |
| `freeroam_configuratorOptions_freeroamOptions.onFreeroamConfiguratorApplyOptions(options)` | Hook appelé quand le joueur valide le configurateur : transmet les options traffic_trafficMode, environment_timeOfDay, environment_date et environment_timePlay à freeroam_freeroam.spawningOptionsHelper (le mode de trafic est converti en trafficMode, trafficPolice et trafficParked). *(interne)* *(hook)* | 149 |
| `freeroam_configuratorOptions_freeroamOptions.onFreeroamConfiguratorGetOptions(level, options)` | Hook appelé quand le configurateur construit ses options pour un niveau : insère dans options les groupes trafic et heure/date/défilement du jour. *(interne)* *(hook)* | 14 |

### Détail des paramètres

#### `freeroam_configuratorOptions_freeroamOptions.getDefaultEnvironmentDate(levelName)`

Date par défaut d'un niveau pour l'environnement.

- `levelName` (*string*) : Nom du niveau (résolu via core_levels.getLevelByName).
- **renvoie** : integer Horodatage os.time() de la date (heure fixée à 12 h).

#### `freeroam_configuratorOptions_freeroamOptions.onFreeroamConfiguratorApplyOptions(options)`

Hook appelé quand le joueur valide le configurateur : transmet les options traffic_trafficMode, environment_timeOfDay, environment_date et environment_timePlay à freeroam_freeroam.spawningOptionsHelper (le mode de trafic est converti en trafficMode, trafficPolice et trafficParked).

- `options` (*table<string, any>*) : Valeurs choisies, indexées par la clé (key) de l'option.

#### `freeroam_configuratorOptions_freeroamOptions.onFreeroamConfiguratorGetOptions(level, options)`

Hook appelé quand le configurateur construit ses options pour un niveau : insère dans options les groupes trafic et heure/date/défilement du jour.

- `level` (*table*) : Données du niveau (supportsTraffic, levelName, dir, defaultDate).
- `options` (*table[]*) : Liste de groupes d'options à compléter (modifiée sur place).

## Appels vers le moteur (C++)

- `core_environment.` `getAuthoredDayLength`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/freeroam/configuratorOptions/freeroamOptions.lua`.*
