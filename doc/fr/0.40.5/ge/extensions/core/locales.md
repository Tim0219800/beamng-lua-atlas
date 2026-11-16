# `core_locales`

*Fichier : `lua/ge/extensions/core/locales.lua` · VM : Game Engine (GE) · 478 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_locales` : `extensions.load("core_locales")`, puis la globale `core_locales`

Extension GE `core_locales` : traduction des textes côté Lua. Elle charge les fichiers *.translation(s).json du dossier /locales/translations/<langue>/ (anglais en-US toujours chargé comme langue de repli), traduit des clés comme 'ui.radialmenu2.Save', gère les sous-traductions imbriquées ({{ 'clé' | translate }}), les variables de contexte, et le séparateur entre nombre et unité (selon /locales/unit_spacing_policies.json). Un moddeur s'en sert pour afficher des textes traduits ; l'alias global `_tr` pointe sur translate.

## Exemple

```lua
local txt = core_locales.translate('ui.common.default', 'Default')
local t2 = core_locales.contextTranslate('ui.some.key', { name = 'Bob' })
local s = core_locales.withUnit('120', 'km/h')
```

## Remarques

- Au chargement (onExtensionLoaded), le module charge l'anglais (en-US), définit le global `_tr = translate` et appelle dump(parseArgs) : ce dump est un reste de débogage qui écrit les arguments de démarrage dans le log.
- Ordre de recherche d'une clé : langue courante (tous ses fichiers, dans l'ordre alphabétique), puis en-US, puis le paramètre fallback, puis la clé elle-même. translate met le résultat en cache (clearTranslateCache le vide, ce que font aussi un changement de langue et le rechargement des fichiers).
- Pour un même id de langue, getLocale fusionne les fichiers du dernier au premier : les fichiers dont le nom est alphabétiquement plus tôt l'emportent. Si aucun fichier *.translation.json / *.translations.json n'est trouvé, le fichier ancien <id>/<id>.json est utilisé.
- Le mode 'scramble debug' (argument de démarrage translationScrambleDebug ou setScrambleTranslationDebugEnabled) remplace les premières lettres de chaque mot par des lettres aléatoires et ajoute '✓', pour repérer les textes non traduits. Il est mémorisé à travers un rechargement Lua. Les textes déjà mis en cache côté Lua demandent un rechargement Lua pour être mis à jour.
- Les anciens noms de variables {{ nom }} dans contextTranslate : les filtres ' | translate' et ' | contextTranslate' sont retirés, un nom entre apostrophes est traduit comme une clé s'il n'est pas dans varsTable ; une variable absente donne une chaîne vide.
- translateWithOrWithoutContext accepte une chaîne (clé) ou une table { txt, prefix, ctx|context } et renvoie '' si data est nil/faux. Avec prefix, la clé prefix..txt est essayée d'abord.
- Les langues disponibles sont les sous-dossiers de /locales/translations/. La langue courante vient de Lua:getSelectedLanguage() (réglage utilisateur), sinon en-US.
- Incohérence mineure : onUpdate et reloadChangedFiles utilisent un délai de 0.1 s (temps réel) pour regrouper les changements de fichiers de traduction (rechargement à chaud).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_locales.clearTranslateCache()` | Vide le cache des traductions. | 330 |
| `core_locales.contextTranslate(key, varsTable)` | Traduit une clé contenant des variables {{nom}} et les remplace par les valeurs de varsTable (traduites elles-mêmes). Une valeur table { txt, prefix, ctx\|context } est traduite récursivement. | 151 |
| `core_locales.getAvailableLanguages()` | Liste les langues disponibles (sous-dossiers de /locales/translations/), triées par clé. | 274 |
| `core_locales.getLanguage()` | Renvoie la langue courante : celle mémorisée, sinon celle du réglage utilisateur, sinon en-US. | 292 |
| `core_locales.getLocale(id)` | Renvoie toutes les traductions d'une langue fusionnées en une seule table clé -> texte (charge la langue si besoin). | 260 |
| `core_locales.getScrambleTranslationDebugEnabled()` | Indique si le mode de débogage 'scramble' des traductions est actif. | 334 |
| `core_locales.getUnitSeparator(unit, locale)` | Renvoie le séparateur à mettre entre un nombre et son unité selon la politique de la langue : espace, espace insécable (U+00A0) ou rien. | 319 |
| `core_locales.onDeserialized(data)` | Après un rechargement Lua : restaure le mode scramble. *(interne)* *(hook)* | 472 |
| `core_locales.onExtensionLoaded()` | Hook de chargement : lit l'argument de démarrage translationScrambleDebug, charge en-US et définit le global _tr. *(interne)* *(hook)* | 351 |
| `core_locales.onFilesChanged(files)` | Hook de changement de fichiers : invalide les politiques d'unités si leur fichier change, et planifie (délai 0.1 s) le rechargement des fichiers .json de /locales/translations/ modifiés. *(interne)* *(hook)* | 399 |
| `core_locales.onSerialize()` | Avant un rechargement Lua : mémorise l'état du mode scramble. *(interne)* *(hook)* | 467 |
| `core_locales.onSettingsChanged()` | Hook appelé quand les réglages changent : charge la nouvelle langue ; si elle a changé, vide le cache et émet le hook onLanguageChanged. *(interne)* *(hook)* | 423 |
| `core_locales.onUpdate(_, _, dtRaw)` | Hook par frame : décompte le délai de rechargement à chaud des fichiers de traduction puis les recharge (émet onReloadLocales et onTranslationsReloaded). *(interne)* *(hook)* | 412 |
| `core_locales.selfTest(lang)` | Outil de test interne : lance extensions.test_locales_run.run(lang) si le fichier de test existe, puis le décharge. | 433 |
| `core_locales.setScrambleTranslationDebugEnabled(enabled)` | Active ou désactive le mode scramble, vide le cache et prévient l'interface (onTranslationsReloaded). | 338 |
| `core_locales.translate(key, fallback)` | Traduit une clé dans la langue courante (avec repli en-US), résout les traductions imbriquées et met le résultat en cache. | 120 |
| `core_locales.translateWithOrWithoutContext(data)` | Traduit une chaîne ou une table { txt, prefix, ctx\|context } en choisissant la bonne fonction. | 182 |
| `core_locales.translateWithPrefixFallback(name, prefix)` | Essaie la clé prefix..name ; si elle n'existe pas (résultat vide), traduit name seul. | 143 |
| `core_locales.withUnit(formattedValue, unit, locale)` | Colle une valeur déjà formatée et son unité avec le bon séparateur. | 326 |

### Détail des paramètres

#### `core_locales.contextTranslate(key, varsTable)`

Traduit une clé contenant des variables {{nom}} et les remplace par les valeurs de varsTable (traduites elles-mêmes). Une valeur table { txt, prefix, ctx|context } est traduite récursivement.

- `key` (*string*) : Clé de traduction.
- `varsTable` (*table|nil*) : Variables nom -> valeur.
- **renvoie** : string Texte traduit avec variables.

#### `core_locales.getAvailableLanguages()`

Liste les langues disponibles (sous-dossiers de /locales/translations/), triées par clé.

- **renvoie** : table[] Éléments { key, path }.

#### `core_locales.getLanguage()`

Renvoie la langue courante : celle mémorisée, sinon celle du réglage utilisateur, sinon en-US.

- **renvoie** : string Identifiant de langue.

#### `core_locales.getLocale(id)`

Renvoie toutes les traductions d'une langue fusionnées en une seule table clé -> texte (charge la langue si besoin).

- `id` (*string*) : Identifiant de langue, ex. 'fr-FR'.
- **renvoie** : table<string, string> Table fusionnée ; {} si id n'est pas une chaîne.

#### `core_locales.getScrambleTranslationDebugEnabled()`

Indique si le mode de débogage 'scramble' des traductions est actif.

- **renvoie** : boolean true si actif.

#### `core_locales.getUnitSeparator(unit, locale)`

Renvoie le séparateur à mettre entre un nombre et son unité selon la politique de la langue : espace, espace insécable (U+00A0) ou rien.

- `unit` (*string*) : Unité, ex. 'km/h'.
- `locale` (*string|nil*) : Langue ; défaut la langue courante.
- **renvoie** : string ' ', espace insécable ou ''.

#### `core_locales.onDeserialized(data)`

Après un rechargement Lua : restaure le mode scramble.

- `data` (*table|nil*) : Table renvoyée par onSerialize.

#### `core_locales.onFilesChanged(files)`

Hook de changement de fichiers : invalide les politiques d'unités si leur fichier change, et planifie (délai 0.1 s) le rechargement des fichiers .json de /locales/translations/ modifiés.

- `files` (*table[]*) : Éléments avec un champ filename.

#### `core_locales.onSerialize()`

Avant un rechargement Lua : mémorise l'état du mode scramble.

- **renvoie** : table { scrambleTranslationDebugEnabled }

#### `core_locales.onUpdate(_, _, dtRaw)`

Hook par frame : décompte le délai de rechargement à chaud des fichiers de traduction puis les recharge (émet onReloadLocales et onTranslationsReloaded).

- `_` (*number*) : dtReal, non utilisé.
- `_` (*number*) : dtReal, non utilisé.
- `dtRaw` (*number*) : Temps brut écoulé en secondes.

#### `core_locales.selfTest(lang)`

Outil de test interne : lance extensions.test_locales_run.run(lang) si le fichier de test existe, puis le décharge.

- `lang` (*string|boolean|nil*) : Langue à tester, ou true pour toutes ; nil ne fait rien.
- **renvoie** : any Résultat du test, nil en cas d'échec ou si le test est absent.

#### `core_locales.setScrambleTranslationDebugEnabled(enabled)`

Active ou désactive le mode scramble, vide le cache et prévient l'interface (onTranslationsReloaded).

- `enabled` (*boolean*) : true pour activer (toute autre valeur désactive).
- **renvoie** : boolean Nouvel état.

#### `core_locales.translate(key, fallback)`

Traduit une clé dans la langue courante (avec repli en-US), résout les traductions imbriquées et met le résultat en cache.

- `key` (*string*) : Clé de traduction. Une valeur non chaîne est renvoyée telle quelle (ou 'Missing Translation Key!' si nil).
- `fallback` (*string|nil*) : Texte renvoyé si la clé est introuvable (sinon la clé).
- **renvoie** : string Texte traduit.

#### `core_locales.translateWithOrWithoutContext(data)`

Traduit une chaîne ou une table { txt, prefix, ctx|context } en choisissant la bonne fonction.

- `data` (*string|table|nil*) : Clé ou table de description.
- **renvoie** : string Texte traduit, '' si data est vide.

#### `core_locales.translateWithPrefixFallback(name, prefix)`

Essaie la clé prefix..name ; si elle n'existe pas (résultat vide), traduit name seul.

- `name` (*string*) : Clé de base.
- `prefix` (*string|nil*) : Préfixe à essayer en premier.
- **renvoie** : string Texte traduit.

#### `core_locales.withUnit(formattedValue, unit, locale)`

Colle une valeur déjà formatée et son unité avec le bon séparateur.

- `formattedValue` (*string*) : Nombre formaté.
- `unit` (*string*) : Unité.
- `locale` (*string|nil*) : Langue ; défaut la langue courante.
- **renvoie** : string Valeur + séparateur + unité.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onLanguageChanged` — écouté par 9 module(s)
- `onReloadLocales` — écouté par 2 module(s)

**Évènements UI (guihooks.trigger) :** `onTranslationsReloaded`

## Appels vers le moteur (C++)

- `FS:` `directoryExists`, `directoryList`, `fileExists`, `findFiles`
- `Lua:` `getSelectedLanguage`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/locales.lua`.*
