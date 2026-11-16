# `impl`

*Fichier : `lua/common/settings.lua` · VM : Commun (GE + véhicule) · 274 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `impl`, `settings`

Accès en lecture aux réglages du jeu depuis Lua (les deux VM). Au chargement il lit /settings/defaults.json (définitions : chaque réglage est un tableau dont l'élément [2] est la valeur par défaut), le fichier deprecated.json (réglages renommés/obsolètes), applique des préréglages (unités selon la langue de l'OS, fichier de plateforme, valeurs internes hors build shipping), puis getValues() fusionne défauts + réglages cloud + réglages locaux. C'est ce qu'un mod interroge avec settings.getValue('clé', valeurParDéfaut).

## Exemple

```lua
local units = settings.getValue('uiUnitLength', 'metric')
local all = settings.getValues()
```

## Remarques

- Les valeurs sont mises en cache (valuesCache) ; il faut appeler invalidateCache() (alias refresh, settingsChanged) après un changement de réglage pour relire les fichiers. Ce module est en lecture seule : il n'écrit aucun fichier.
- Ordre de priorité des valeurs : défauts (modifiés par preset d'unités, plateforme, valeurs internes) < /settings/cloud/settings.json < /settings/settings.json (local). Les noms obsolètes/renommés sont convertis par upgradeSetting (deprecated.json), avec journalisation côté GE seulement.
- Si une table C++ CppSettings existe et que le type de la valeur Lua diffère du type C++, la valeur est ignorée avec une erreur dans le log.
- Les réglages 'persona' (personaScopedSettings : defaultGearboxBehavior, autoClutch, autoThrottle, spawnVehicleIgnitionLevel, playerCharacterFace) peuvent avoir une valeur par persona stockée dans /settings/persona-settings.tmp.json ; getValue/getPersonaValue y consultent persona (id ou table avec champ id).
- Préréglage d'unités selon getOSLanguage : région US ou langue 'en' sans région -> imperial ; GB/UK -> british ; sinon metric ; appliqué aux défauts uiUnits*, uiUnitLength, etc.
- Particularité : si l'UI est en menu simple (Engine.UI.isSimpleMenu), le défaut de uiContentScale vaut 1.05.
- Les chemins M.path* ne sont pas des fonctions mais des champs de configuration (p. ex. M.pathLocal = '/settings/settings.json') ; M.defaults, M.deprecated, M.defaultValues sont des tables de travail.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `impl.getPersonaValue(key, fallbackValue, persona)` | Valeur d'un réglage par persona. Si key n'est pas un réglage 'persona' ou s'il n'y a pas de persona, renvoie fallbackValue ; sinon la valeur stockée pour ce persona, ou à défaut la première fallbackValue mémorisée pour ce persona et cette clé. | 223 |
| `impl.getValue(key, defaultValue, persona)` | Renvoie la valeur du réglage `key` (fusion défauts/cloud/local), ou defaultValue si elle est nil ; puis applique la valeur de persona le cas échéant (si key est dans personaScopedSettings et qu'un persona est fourni). | 248 |
| `impl.getValues()` | Renvoie la table complète des réglages fusionnés (mise en cache). Ne pas modifier la table renvoyée (c'est le cache). | 188 |
| `impl.invalidateCache()` | Oublie le cache des réglages et des réglages persona : le prochain getValue/getValues relira les fichiers. Mêmes fonctions : refresh et settingsChanged (compatibilité). | 260 |
| `impl.invalidatePersonaCache()` | Oublie le cache des valeurs par persona (relu au prochain accès). | 256 |
| `impl.refresh()` | Alias d'invalidateCache (rétrocompatibilité). | 260 |
| `impl.settingsChanged()` | Alias d'invalidateCache, à appeler (par le moteur ou l'UI) quand des réglages viennent de changer. | 260 |

### Détail des paramètres

#### `impl.getPersonaValue(key, fallbackValue, persona)`

Valeur d'un réglage par persona. Si key n'est pas un réglage 'persona' ou s'il n'y a pas de persona, renvoie fallbackValue ; sinon la valeur stockée pour ce persona, ou à défaut la première fallbackValue mémorisée pour ce persona et cette clé.

- `key` (*string*) : nom du réglage
- `fallbackValue` (*any*) : valeur par défaut
- `persona` (*table|string|number|nil*) : persona ou id
- **renvoie** : any valeur

#### `impl.getValue(key, defaultValue, persona)`

Renvoie la valeur du réglage `key` (fusion défauts/cloud/local), ou defaultValue si elle est nil ; puis applique la valeur de persona le cas échéant (si key est dans personaScopedSettings et qu'un persona est fourni).

- `key` (*string*) : nom du réglage
- `defaultValue` (*any*) : valeur de repli si le réglage n'existe pas
- `persona` (*table|string|number|nil*) : persona (ou son id) pour les réglages par persona
- **renvoie** : any valeur du réglage

#### `impl.getValues()`

Renvoie la table complète des réglages fusionnés (mise en cache). Ne pas modifier la table renvoyée (c'est le cache).

- **renvoie** : table<string, any> tous les réglages

## Champs

| Champ | Type | Description |
|---|---|---|
| `defaultValues` | table<string, any> | valeurs par défaut précalculées (clé -> defaults[clé][2]) |
| `defaults` | table<string, table> | définitions des réglages lues dans defaults.json ; chaque entrée est un tableau dont [2] est la valeur par défaut |
| `deprecated` | table<string, table> | réglages obsolètes (champs replacement ou obsolete) |
| `deprecatedPathTorquescript` | string | '/settings/game-settings.cs' (ancien format TorqueScript) |
| `path` | string | '/settings/' |
| `pathCloud` | string | '/settings/cloud/settings.json' |
| `pathDefaults` | string | '/settings/defaults.json' |
| `pathDeprecated` | string | '/settings/deprecated.json' |
| `pathInternal` | string | '/settings/not-shipping.internal.json' (valeurs internes, lues hors build shipping) |
| `pathLocal` | string | '/settings/settings.json' (réglages de l'utilisateur) |
| `pathPersona` | string | '/settings/persona-settings.tmp.json' |
| `pathVariables` | string | '/settings/game-settings.json' |
| `personaScopedSettings` | table<string, boolean> | réglages pouvant avoir une valeur par persona |

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `Lua:` `getOSLanguage`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/settings.lua`.*
