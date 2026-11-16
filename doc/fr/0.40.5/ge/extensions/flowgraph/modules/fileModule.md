# `flowgraph_modules_fileModule`

*Fichier : `lua/ge/extensions/flowgraph/modules/fileModule.lua` · VM : Game Engine (GE) · 68 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/flowgraph/modules/fileModule")` (fichier sous extensions/ mais pas une extension classique)

Module flowgraph (moduleOrder 0) qui lit et écrit de petits fichiers de sauvegarde JSON propres aux projets flowgraph. Les fichiers sont stockés sous 'settings/cloud/flowgraphSaveData' + nom + '.save.json' avec la structure {lastModified, data}. Les fichiers sont chargés à la demande, mis en cache, et réécrits sur disque à la fin du tick (afterTrigger) s'ils ont été modifiés.

## Remarques

- Le chemin est construit par simple concaténation savePath .. file .. ext : le nom 'file' doit donc commencer par '/' pour obtenir un chemin correct.
- Si le JSON lu n'a pas de champ data, son contenu entier est enveloppé dans {lastModified = 0, data = <contenu>}.
- Le cache est vidé au démarrage et à l'arrêt du projet.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `flowgraph_modules_fileModule.afterTrigger()` | Appelé après le tick du graphe : écrit sur disque (jsonWriteFile) chaque fichier modifié et vide la liste des modifications. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_fileModule.clear()` | Vide le cache de fichiers et la liste des fichiers modifiés. (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_fileModule.executionStarted()` | Appelé au démarrage du projet : appelle clear(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_fileModule.executionStopped()` | Appelé à l'arrêt du projet : appelle clear(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_fileModule.forceReload(file)` | Oublie le fichier mis en cache ; il sera relu au prochain accès. (assignée dynamiquement) | dyn |
| `flowgraph_modules_fileModule.getFile(file)` | Renvoie la table {lastModified, data} du fichier, en le chargeant depuis le disque (ou en créant une table vide) à la première demande. (assignée dynamiquement) | dyn |
| `flowgraph_modules_fileModule.init()` | Appelé à la création du module : appelle clear(). (assignée dynamiquement) *(interne)* | dyn |
| `flowgraph_modules_fileModule.read(file, field)` | Lit data[field] du fichier. (assignée dynamiquement) | dyn |
| `flowgraph_modules_fileModule.write(file, field, value)` | Écrit une valeur dans data[field], met à jour lastModified (os.time()) et marque le fichier à sauvegarder. (assignée dynamiquement) | dyn |

### Détail des paramètres

#### `flowgraph_modules_fileModule.forceReload(file)`

Oublie le fichier mis en cache ; il sera relu au prochain accès. (assignée dynamiquement)

- `file` (*string*) : nom du fichier (sans préfixe de dossier ni extension)

#### `flowgraph_modules_fileModule.getFile(file)`

Renvoie la table {lastModified, data} du fichier, en le chargeant depuis le disque (ou en créant une table vide) à la première demande. (assignée dynamiquement)

- `file` (*string*) : nom du fichier
- **renvoie** : table {lastModified = number, data = table}

#### `flowgraph_modules_fileModule.read(file, field)`

Lit data[field] du fichier. (assignée dynamiquement)

- `file` (*string*) : nom du fichier
- `field` (*string*) : clé
- **renvoie** : any valeur ou nil

#### `flowgraph_modules_fileModule.write(file, field, value)`

Écrit une valeur dans data[field], met à jour lastModified (os.time()) et marque le fichier à sauvegarder. (assignée dynamiquement)

- `file` (*string*) : nom du fichier
- `field` (*string*) : clé
- `value` (*any*) : valeur sérialisable en JSON

## Classe `C`

| Méthode | Description | Ligne |
|---|---|---|
| `C:afterTrigger()` |  | 51 |
| `C:clear()` |  | 14 |
| `C:executionStarted()` |  | 64 |
| `C:executionStopped()` |  | 60 |
| `C:forceReload(file)` |  | 19 |
| `C:getFile(file)` |  | 23 |
| `C:init()` |  | 10 |
| `C:read(file, field)` |  | 47 |
| `C:write(file, field, value)` |  | 40 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/flowgraph/modules/fileModule.lua`.*
