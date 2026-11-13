# `core_weather`

*Fichier : `lua/ge/extensions/core/weather.lua` · VM : Game Engine (GE) · 360 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_weather` : `extensions.load("core_weather")`, puis la globale `core_weather`

Applique des préréglages météo (presets) en modifiant directement les champs d'objets de la scène (LevelInfo, CloudLayer, ScatterSky, etc.) : soit immédiatement (activate), soit par transition progressive (switchWeather). Les presets sont lus dans les fichiers JSON de art/weather/ puis dans le dossier weather/ du niveau courant (qui écrasent les globaux). Un moddeur s'en sert pour changer le ciel, la pluie ou le brouillard par script, ou pour ajouter ses propres presets par fichier JSON.

## Exemple

```lua
-- liste puis applique un preset, avec transition de 30 s
local noms = core_weather.getPresets()
core_weather.switchWeather(noms[1], 30)
-- ou immédiatement
core_weather.activate(noms[1])
```

## Remarques

- Format d'un preset (fichier JSON) : { "nomDuPreset": { "NomDeClasse": { "champ": valeur } } }. Les valeurs sont convertibles selon le type du champ : number (int/float), boolean (bool), string (filename/annotation), table de 4 nombres (ColorF/Point4F), table de 3 nombres (Point3F/vec3).
- Les presets sont chargés à l'extension chargée (onExtensionLoaded) et à chaque début de niveau (onClientPostStartMission) ; ils sont fusionnés (tableMerge) sans être vidés : un preset supprimé d'un niveau précédent reste en mémoire.
- switchWeather interpole linéairement (valeur de départ + différence * temps / durée) uniquement les champs numériques et vecteurs/couleurs ; les champs de type chaîne ne sont pas interpolés (valeur de départ conservée).
- activate applique tout en une fois ; pour la classe LevelInfo elle appelle ensuite postApply().
- Dans activate, un attribut invalide fait sauter (goto continue) le reste de la classe d'objets en cours, pas seulement cet attribut.
- Bug probable dans getFormerValues : la condition `type == 'int' or type == 'float' and type(attrValue) == 'number'` a une précédence ambiguë (le test du type de la valeur ne s'applique qu'aux float). Un champ absent de l'objet (fields[attrName] nil) provoque aussi une erreur Lua.
- Pendant une transition, onPreRender appelle core_environment.setFogDensity(core_environment.getFogDensity()) à chaque image, sans doute pour forcer la mise à jour du brouillard.
- Durée par défaut d'une transition : 15 s. loadPresets est commenté dans l'interface publique (M.loadPresets absent).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_weather.activate(presetName)` | Applique immédiatement le preset : pour chaque classe et chaque objet de cette classe dans la scène, écrit les attributs du preset. Mémorise le nom comme preset courant. Journalise une erreur si le preset est inconnu. | 209 |
| `core_weather.dumpWeather()` | Affiche (dump) dans le journal tous les presets chargés ; outil de debug. | 344 |
| `core_weather.getCurrentWeatherPreset()` | Nom du dernier preset demandé par activate ou switchWeather. | 22 |
| `core_weather.getPresets()` | Liste des noms des presets chargés (ordre non garanti). | 315 |
| `core_weather.onClientPostStartMission(levelPath)` | Hook appelé après le démarrage d'un niveau : recharge les presets globaux puis ceux du niveau. *(interne)* *(hook)* | 337 |
| `core_weather.onExtensionLoaded()` | Hook appelé au chargement de l'extension : remet à zéro la transition et charge les presets. *(interne)* *(hook)* | 323 |
| `core_weather.onPreRender(dt)` | Hook appelé à chaque image avant le rendu : si une transition est en cours, avance le chronomètre, interpole les valeurs et termine la transition quand la durée est dépassée. *(interne)* *(hook)* | 273 |
| `core_weather.switchWeather(presetName, t)` | Passe progressivement de la météo actuelle à celle du preset : lit les valeurs actuelles, calcule les différences, puis onPreRender interpole sur la durée donnée. Journalise (niveau info) et ne fait rien si le preset n'existe pas. | 185 |

### Détail des paramètres

#### `core_weather.activate(presetName)`

Applique immédiatement le preset : pour chaque classe et chaque objet de cette classe dans la scène, écrit les attributs du preset. Mémorise le nom comme preset courant. Journalise une erreur si le preset est inconnu.

- `presetName` (*string*) : Nom d'un preset chargé (voir getPresets).

#### `core_weather.getCurrentWeatherPreset()`

Nom du dernier preset demandé par activate ou switchWeather.

- **renvoie** : string|nil Nom du preset courant, nil si aucun n'a été appliqué depuis le chargement de l'extension.

#### `core_weather.getPresets()`

Liste des noms des presets chargés (ordre non garanti).

- **renvoie** : string[] Noms des presets.

#### `core_weather.onClientPostStartMission(levelPath)`

Hook appelé après le démarrage d'un niveau : recharge les presets globaux puis ceux du niveau.

- `levelPath` (*string*) : Chemin du niveau (non utilisé : le code appelle getMissionFilename()).

#### `core_weather.onPreRender(dt)`

Hook appelé à chaque image avant le rendu : si une transition est en cours, avance le chronomètre, interpole les valeurs et termine la transition quand la durée est dépassée.

- `dt` (*number*) : Temps écoulé depuis l'image précédente, en secondes.

#### `core_weather.switchWeather(presetName, t)`

Passe progressivement de la météo actuelle à celle du preset : lit les valeurs actuelles, calcule les différences, puis onPreRender interpole sur la durée donnée. Journalise (niveau info) et ne fait rien si le preset n'existe pas.

- `presetName` (*string*) : Nom du preset cible.
- `t` (*number|nil*) : Durée de la transition en secondes (15 par défaut).

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `core_environment.` `getFogDensity`, `setFogDensity`
- `obj:` `getField`, `getFields`, `getId`, `postApply`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/weather.lua`.*
