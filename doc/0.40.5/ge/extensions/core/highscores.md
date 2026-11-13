# `core_highscores`

*Fichier : `lua/ge/extensions/core/highscores.lua` · VM : Game Engine (GE) · 138 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_highscores` : `extensions.load("core_highscores")`, puis la globale `core_highscores`

Extension GE `core_highscores` : stockage des meilleurs temps des scénarios dans settings/highscores.json, organisés par niveau, scénario et clé de configuration. Garde les 50 meilleurs enregistrements de chaque combinaison. Un moddeur s'en sert pour enregistrer un temps (setScenarioHighscores) ou lire le classement (getScenarioHighscores).

## Exemple

```lua
local place = core_highscores.setScenarioHighscores(65432, 'Ibishu', 'Covet', 'Joueur', 'west_coast_usa', 'monScenario', 'default')
for _, s in ipairs(core_highscores.getScenarioHighscores('west_coast_usa', 'monScenario', 'default')) do
  print(s.place, s.formattedTime, s.playerName)
end
```

## Remarques

- Structure du fichier : {niveau = {scénario = {configKey = [enregistrements triés]}}}. Chaque enregistrement : playerName, vehicleBrand, vehicleName (ou champs libres via ...Custom), detailed = false, timeStamp (os.time), formattedTimestamp (os.date('!%c'), UTC), timeInMillis (entier arrondi), formattedTime ('MM:SS.mmm').
- Tri croissant par timeInMillis (plus petit = meilleur). getScenarioHighscores ajoute le champ `place` (1 = meilleur) à la lecture.
- Le retour de setScenarioHighscores(Custom) est la place obtenue (1 = meilleur) ou -1 si le temps n'entre pas dans les 50 premiers (rien n'est alors sauvegardé).
- Migration : si l'ancien fichier 'highscores' existe et que settings/highscores.json est vide ou absent, il est renommé (vérifié à chaque getHighscores) et 'highscores_beautfied' est supprimé.
- Incohérences : formatMillis est défini mais ni exporté ni utilisé (la branche addSign appelle M.formatMillis qui n'existe pas) ; setScenarioHighscoresCustom n'exige pas que levelName/scenarioName/configKey soient des chaînes (concaténation dans le log : erreur si nil) ; l'enregistrement fourni est modifié en place.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_highscores.getHighscores()` | Lit et décode tout le fichier settings/highscores.json (après migration éventuelle de l'ancien fichier). | 25 |
| `core_highscores.getScenarioHighscores(levelName, scenarioName, configKey)` | Enregistrements d'une combinaison niveau/scénario/config, triés du meilleur au moins bon, avec le champ `place` ajouté. | 38 |
| `core_highscores.setHighscores(scores)` | Écrit la table complète des highscores dans settings/highscores.json (JSON indenté). | 34 |
| `core_highscores.setScenarioHighscores(timeInMillis, vehicleBrand, vehicleName, playerName, levelName, scenarioName, configKey)` | Enregistre un temps avec joueur et véhicule (construit l'enregistrement puis appelle setScenarioHighscoresCustom). | 77 |
| `core_highscores.setScenarioHighscoresCustom(timeInMillis, record, levelName, scenarioName, configKey)` | Enregistre un temps avec un enregistrement libre : complète record (detailed, timeStamp, formattedTimestamp, timeInMillis, formattedTime), l'insère, trie, garde les 50 meilleurs et sauvegarde. | 86 |

### Détail des paramètres

#### `core_highscores.getHighscores()`

Lit et décode tout le fichier settings/highscores.json (après migration éventuelle de l'ancien fichier).

- **renvoie** : table Table complète, {} si le fichier est absent ou vide.

#### `core_highscores.getScenarioHighscores(levelName, scenarioName, configKey)`

Enregistrements d'une combinaison niveau/scénario/config, triés du meilleur au moins bon, avec le champ `place` ajouté.

- `levelName` (*string*) : Nom du niveau.
- `scenarioName` (*string*) : Nom du scénario.
- `configKey` (*string*) : Clé de configuration (véhicule, options…).
- **renvoie** : table[] Liste d'enregistrements, {} si aucun.

#### `core_highscores.setHighscores(scores)`

Écrit la table complète des highscores dans settings/highscores.json (JSON indenté).

- `scores` (*table*) : Table complète niveau -> scénario -> config -> enregistrements.

#### `core_highscores.setScenarioHighscores(timeInMillis, vehicleBrand, vehicleName, playerName, levelName, scenarioName, configKey)`

Enregistre un temps avec joueur et véhicule (construit l'enregistrement puis appelle setScenarioHighscoresCustom).

- `timeInMillis` (*number*) : Temps en millisecondes.
- `vehicleBrand` (*string*) : Marque du véhicule.
- `vehicleName` (*string*) : Nom du véhicule.
- `playerName` (*string*) : Nom du joueur.
- `levelName` (*string*) : Nom du niveau.
- `scenarioName` (*string*) : Nom du scénario.
- `configKey` (*string*) : Clé de configuration.
- **renvoie** : integer Place obtenue (1 = meilleur), -1 si hors du top 50.

#### `core_highscores.setScenarioHighscoresCustom(timeInMillis, record, levelName, scenarioName, configKey)`

Enregistre un temps avec un enregistrement libre : complète record (detailed, timeStamp, formattedTimestamp, timeInMillis, formattedTime), l'insère, trie, garde les 50 meilleurs et sauvegarde.

- `timeInMillis` (*number*) : Temps en millisecondes (arrondi à l'entier).
- `record` (*table*) : Données libres de l'enregistrement ; modifié en place.
- `levelName` (*string*) : Nom du niveau.
- `scenarioName` (*string*) : Nom du scénario.
- `configKey` (*string*) : Clé de configuration.
- **renvoie** : integer Place obtenue (1 = meilleur), -1 si hors du top 50.

## Appels vers le moteur (C++)

- `FS:` `removeFile`, `renameFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/highscores.lua`.*
