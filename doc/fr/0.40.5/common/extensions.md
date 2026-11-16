# `extensions`

*Fichier : `lua/common/extensions.lua` · VM : Commun (GE + véhicule) · 1247 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** globale `extensions`

Gestionnaire d'extensions (global `extensions`, présent dans la VM GE et dans la VM véhicule). Il charge/décharge des modules Lua comme extensions, résout leurs dépendances (champ M.dependencies), les expose comme globales et sous extensions.<nom>, et diffuse les hooks (extensions.hook('onXxx', ...)) à tous les modules qui définissent cette fonction. Il gère aussi la sérialisation/désérialisation lors d'un rechargement de la VM Lua (Ctrl+L). Un moddeur s'en sert pour charger son extension, déclencher des hooks ou accéder à une extension par son nom.

## Exemple

```lua
extensions.load('myMod_main')        -- charge lua/ge/extensions/myMod/main.lua (nom avec _ = chemin avec /)
extensions.myMod_main.doSomething() -- accès (charge automatiquement si absent)
extensions.hook('onMyEvent', 42)    -- appelle onMyEvent(42) dans tous les modules qui la définissent
extensions.unload('myMod_main')
```

## Remarques

- Nommage : le nom d'extension est le chemin avec '/' remplacé par '_' et '_' doublé en '__' (luaPathToExtName) ; extNameToLuaPath fait l'inverse. Exemple : 'ui_missionInfo' <-> 'ui/missionInfo'.
- Accéder à extensions.<nom> pour un module non chargé le charge automatiquement (via __index de la métatable), la recherche étant insensible à la casse pour les modules déjà résolus.
- Un module doit retourner sa table M, sinon il est refusé (message d'erreur). Cycle de vie : onPreLoad avant chargement des dépendances ; onExtensionLoaded(donnéesDésérialisées) après chargement (retourner false décharge le module) ; onInit(données) ensuite, uniquement dans la VM GE (vmType == 'game') ; onExtensionUnloaded au déchargement.
- Fonctions obsolètes détectées sur un module : onLoad et init (remplacer par onExtensionLoaded), onRaceWaypoint (-> onRaceWaypointReached), onScenarioRaceCountingDone (-> onCountdownEnded), activated (-> onPlayersChanged), onUnload (-> onExtensionUnloaded). Elles sont renommées automatiquement avec un avertissement dans le journal.
- Champs posés sur chaque module chargé : __extensionName__, __extensionPath__, __manuallyLoaded__ (true si chargé via load/loadAtRoot), __originalExtPath__ (loadAtRoot), __virtual__ (proxy).
- Les hooks sont appelés dans l'ordre de résolution des dépendances (modules triés par nom puis dépendances d'abord). Les listes de fonctions sont mises en cache par nom de hook ; le cache est vidé au chargement/déchargement.
- extensions.hook est hookProfiled hors version shipping_build (avec évènements profiler), sinon hookFast. setProfiler le remplace temporairement.
- Bug probable : hookExcept compare m.__extensionsModulePath__, champ jamais défini (le champ posé est __extensionPath__) ; la liste d'exceptions n'exclut donc rien.
- Les champs M.onSerialize, M.onDeserialize et M.onDeserialized valent nop (fonction vide) ; l'extraction automatique les signale à tort comme nil, de même pour M.hook.
- Un avertissement est journalisé si le chargement, onExtensionLoaded, onInit ou la désérialisation d'une extension dépasse 50 ms.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `extensions.addModulePath(directory)` | Ajoute directory/?.lua en tête de package.path. | 701 |
| `extensions.deserialize(data, filter)` | Recharge les extensions listées dans data puis restitue leurs données via onDeserialize(data) ou fusion de M.state/M (puis onDeserialized). Les données sont aussi passées à onExtensionLoaded/onInit. *(interne)* | 1015 |
| `extensions.disableSerialization(...)` | Exclut des extensions de la sérialisation lors du rechargement de la VM Lua. | 947 |
| `extensions.extNameToLuaPath(extName)` | Convertit un nom d'extension en chemin ('a_b__c' -> 'a/b_c'). | 64 |
| `extensions.getLoadedExtensionsNames(excludeVirtual)` | Renvoie la liste triée des noms d'extensions chargées. | 1201 |
| `extensions.getSerializationData(reason)` | Construit la table de données à conserver lors d'un rechargement : liste des extensions chargées (chemins) et, pour chaque module ayant onSerialize/onDeserialize(d), le retour de onSerialize(reason), sinon M.state, sinon le module entier. Si reason == 'reload', décharge ensuite toutes les extensions. *(interne)* | 965 |
| `extensions.hookExcept(exceptionList, func, ...)` | Appelle la fonction func de tous les modules résolus sauf ceux listés. Voir notes : la comparaison utilise un champ jamais défini. | 884 |
| `extensions.hookNotify(func, ...)` | Appelle M.hook(func, ...) puis exécute et supprime les callbacks enregistrés avec setCompletedCallback pour ce hook. | 899 |
| `extensions.hookUpdate(funcName)` | Invalide le cache des fonctions d'un hook pour qu'il soit reconstruit au prochain appel (à utiliser quand un module ajoute ou retire dynamiquement une fonction de hook). | 94 |
| `extensions.isExtensionLoaded(extName)` | Indique si une extension est chargée (test : _G[extName] ~= nil). | 280 |
| `extensions.load(...)` | Charge une ou plusieurs extensions (noms au format ext_nom ou chemins contenant '/'), les marque comme chargées manuellement, résout les dépendances puis appelle onExtensionLoaded (et onInit côté GE) des modules fraîchement chargés. | 648 |
| `extensions.loadAtRoot(extPath, rootName)` | Charge un fichier Lua comme extension en choisissant une racine de nommage : le nom devient rootName..'_'..nomDuFichier (ou le seul nom de fichier si rootName vaut ''). | 658 |
| `extensions.loadModule(extName)` | Obsolète : appelle load avec un avertissement. | 1189 |
| `extensions.loadModulesInDirectory(directory, excludeSubdirectories)` | Charge à la racine globale tous les .lua trouvés (récursivement) dans un dossier, avec le nom du fichier comme nom d'extension (compatibilité avec les anciens mods). | 708 |
| `extensions.luaPathToExtName(filepath)` | Convertit un chemin ('a/b_c') en nom d'extension ('a_b__c'). | 55 |
| `extensions.printExtensions()` | Journalise la liste des extensions chargées avec leurs dépendances. | 860 |
| `extensions.printHooks(funcName)` | Affiche (print) les extensions qui définissent la fonction funcName. | 867 |
| `extensions.refresh(extName)` | Réapplique le traitement de chargement à une extension déjà chargée, sans relire le disque (dépendances, hooks obsolètes, etc.). | 928 |
| `extensions.reload(extPath)` | Décharge puis recharge une extension depuis le disque (vide le cache package.loaded). | 922 |
| `extensions.reloadModule(modulePath)` | Obsolète : appelle reload avec un avertissement. | 942 |
| `extensions.restoreModulePath()` | Restaure le package.path mémorisé par saveModulePath. | 917 |
| `extensions.saveModulePath()` | Mémorise package.path courant. | 913 |
| `extensions.setCompletedCallback(funcName, callback)` | Enregistre un callback exécuté (une seule fois) à la fin du prochain hookNotify pour ce hook. | 757 |
| `extensions.setProfiler(p)` | Active un profiler (M.hook devient hookSingleFrameProfiled) ou, avec nil, revient au hook normal. | 851 |
| `extensions.unload(extName)` | Décharge une extension et toutes celles qui en dépendent (et plus rien d'autre ne nécessite), en appelant onExtensionUnloaded. Ne fait rien si elle n'est pas chargée. Les extensions virtuelles ne sont pas déchargées sauf si enfants d'un module déchargé. | 284 |
| `extensions.unloadExcept(...)` | Décharge toutes les extensions sauf celles listées et leurs dépendances. Accepte soit une liste en argument unique, soit plusieurs listes. | 337 |
| `extensions.unloadModule(extName)` | Obsolète : appelle unload avec un avertissement. | 332 |
| `extensions.use(key)` | Charge l'extension puis la renvoie (ancienne syntaxe ; l'accès direct extensions.nom charge déjà automatiquement). | 1194 |
| `extensions.wrapAllExtensionsForProfiler()` | Enveloppe toutes les fonctions de toutes les extensions avec profilerPushEvent/PopEvent. Les extensions chargées ensuite sont aussi enveloppées. | 479 |

### Détail des paramètres

#### `extensions.addModulePath(directory)`

Ajoute directory/?.lua en tête de package.path.

- `directory` (*string*) : Dossier de modules Lua.

#### `extensions.deserialize(data, filter)`

Recharge les extensions listées dans data puis restitue leurs données via onDeserialize(data) ou fusion de M.state/M (puis onDeserialized). Les données sont aussi passées à onExtensionLoaded/onInit.

- `data` (*table|nil*) : Données produites par getSerializationData.
- `filter` (*string|nil*) : Nom d'extension : ne restituer que celle-ci.

#### `extensions.disableSerialization(...)`

Exclut des extensions de la sérialisation lors du rechargement de la VM Lua.

- `...` (*string|string[]*) : Noms d'extensions.

#### `extensions.extNameToLuaPath(extName)`

Convertit un nom d'extension en chemin ('a_b__c' -> 'a/b_c').

- `extName` (*string|nil*) : Nom d'extension.
- **renvoie** : string|nil Chemin.

#### `extensions.getLoadedExtensionsNames(excludeVirtual)`

Renvoie la liste triée des noms d'extensions chargées.

- `excludeVirtual` (*boolean|nil*) : true pour omettre les extensions virtuelles (proxies).
- **renvoie** : string[] Noms triés.

#### `extensions.getSerializationData(reason)`

Construit la table de données à conserver lors d'un rechargement : liste des extensions chargées (chemins) et, pour chaque module ayant onSerialize/onDeserialize(d), le retour de onSerialize(reason), sinon M.state, sinon le module entier. Si reason == 'reload', décharge ensuite toutes les extensions.

- `reason` (*string|nil*) : Raison (défaut 'reload').
- **renvoie** : table Données de sérialisation.

#### `extensions.hookExcept(exceptionList, func, ...)`

Appelle la fonction func de tous les modules résolus sauf ceux listés. Voir notes : la comparaison utilise un champ jamais défini.

- `exceptionList` (*string[]*) : Chemins de modules à exclure.
- `func` (*string*) : Nom de la fonction de hook.
- `...` (*any*) : Arguments passés à chaque module.

#### `extensions.hookNotify(func, ...)`

Appelle M.hook(func, ...) puis exécute et supprime les callbacks enregistrés avec setCompletedCallback pour ce hook.

- `func` (*string*) : Nom du hook.
- `...` (*any*) : Arguments.

#### `extensions.hookUpdate(funcName)`

Invalide le cache des fonctions d'un hook pour qu'il soit reconstruit au prochain appel (à utiliser quand un module ajoute ou retire dynamiquement une fonction de hook).

- `funcName` (*string*) : Nom du hook.

#### `extensions.isExtensionLoaded(extName)`

Indique si une extension est chargée (test : _G[extName] ~= nil).

- `extName` (*string*) : Nom d'extension.
- **renvoie** : boolean true si présente comme global.

#### `extensions.load(...)`

Charge une ou plusieurs extensions (noms au format ext_nom ou chemins contenant '/'), les marque comme chargées manuellement, résout les dépendances puis appelle onExtensionLoaded (et onInit côté GE) des modules fraîchement chargés.

- `...` (*string|string[]*) : Noms ou chemins d'extensions, ou tableaux de ces chaînes.

#### `extensions.loadAtRoot(extPath, rootName)`

Charge un fichier Lua comme extension en choisissant une racine de nommage : le nom devient rootName..'_'..nomDuFichier (ou le seul nom de fichier si rootName vaut '').

- `extPath` (*string*) : Chemin du fichier sans .lua, contenant au moins un '/'.
- `rootName` (*string*) : Préfixe de nom ; ne doit pas contenir '_' ('' pour l'espace global).
- **renvoie** : string|nil Nom de l'extension, nil en cas d'erreur.
- **renvoie** : table|nil Module chargé.

#### `extensions.loadModule(extName)`

Obsolète : appelle load avec un avertissement.

- `extName` (*string*) : Nom d'extension.

#### `extensions.loadModulesInDirectory(directory, excludeSubdirectories)`

Charge à la racine globale tous les .lua trouvés (récursivement) dans un dossier, avec le nom du fichier comme nom d'extension (compatibilité avec les anciens mods).

- `directory` (*string*) : Dossier à parcourir (FS:findFiles).
- `excludeSubdirectories` (*string[]|nil*) : Motifs de sous-chemins à exclure.

#### `extensions.luaPathToExtName(filepath)`

Convertit un chemin ('a/b_c') en nom d'extension ('a_b__c').

- `filepath` (*string|nil*) : Chemin sans .lua.
- **renvoie** : string|nil Nom d'extension.

#### `extensions.printHooks(funcName)`

Affiche (print) les extensions qui définissent la fonction funcName.

- `funcName` (*string*) : Nom du hook.

#### `extensions.refresh(extName)`

Réapplique le traitement de chargement à une extension déjà chargée, sans relire le disque (dépendances, hooks obsolètes, etc.).

- `extName` (*string*) : Nom d'extension déjà chargée.
- **renvoie** : table|false|nil Module, ou false si l'extension n'est pas chargée.

#### `extensions.reload(extPath)`

Décharge puis recharge une extension depuis le disque (vide le cache package.loaded).

- `extPath` (*string*) : Nom ou chemin d'extension.

#### `extensions.reloadModule(modulePath)`

Obsolète : appelle reload avec un avertissement.

- `modulePath` (*string*) : Nom ou chemin.

#### `extensions.setCompletedCallback(funcName, callback)`

Enregistre un callback exécuté (une seule fois) à la fin du prochain hookNotify pour ce hook.

- `funcName` (*string*) : Nom du hook.
- `callback` (*function*) : Fonction appelée avec les arguments du hook.

#### `extensions.setProfiler(p)`

Active un profiler (M.hook devient hookSingleFrameProfiled) ou, avec nil, revient au hook normal.

- `p` (*table|nil*) : Objet profiler avec méthodes start et add.

#### `extensions.unload(extName)`

Décharge une extension et toutes celles qui en dépendent (et plus rien d'autre ne nécessite), en appelant onExtensionUnloaded. Ne fait rien si elle n'est pas chargée. Les extensions virtuelles ne sont pas déchargées sauf si enfants d'un module déchargé.

- `extName` (*string*) : Nom d'extension.

#### `extensions.unloadExcept(...)`

Décharge toutes les extensions sauf celles listées et leurs dépendances. Accepte soit une liste en argument unique, soit plusieurs listes.

- `...` (*string[]*) : Liste(s) de noms d'extensions à conserver.

#### `extensions.unloadModule(extName)`

Obsolète : appelle unload avec un avertissement.

- `extName` (*string*) : Nom d'extension.

#### `extensions.use(key)`

Charge l'extension puis la renvoie (ancienne syntaxe ; l'accès direct extensions.nom charge déjà automatiquement).

- `key` (*string*) : Nom d'extension.
- **renvoie** : table|nil Module chargé.

## Champs

| Champ | Type | Description |
|---|---|---|
| `hook` | function | Fonction de diffusion de hook : hook(funcName, ...). Variante profilée (hookProfiled) hors build shipping, rapide (hookFast) sinon, ou hookSingleFrameProfiled si un profiler est fourni à setProfiler. |
| `onDeserialize` | function | nop. |
| `onDeserialized` | function | nop. |
| `onSerialize` | function | nop : l'extension `extensions` elle-même ne sérialise rien. |

## Classe `ExtensionProxy`

Objet renvoyé par newExtensionProxy. Champs : extName, extPath, __virtual__, __manuallyLoaded__, hookProxies.

| Méthode | Description | Ligne |
|---|---|---|
| `ExtensionProxy:_updateHooks()` | Réenregistre le proxy comme extension virtuelle (refreshInternal) et vide le cache de hooks. | 1153 |
| `ExtensionProxy:destroy()` | Supprime les hooks du proxy et le décharge. | 1162 |
| `ExtensionProxy:submitEventSinks(hookableTablesInstances, dependencies)` | Enregistre des instances (avec leurs métatables) comme destinataires : toute fonction dont le nom commence par 'on' est exposée comme hook qui appelle m[k](m, ...) sur chaque instance. Met à jour les hooks et les dépendances du proxy. | 1114 |

## Classe `MT`

Métatable du module `extensions`.

| Méthode | Description | Ligne |
|---|---|---|
| `MT.__index(tbl, key)` | Résout extensions.<nom> : renvoie le module résolu (recherche insensible à la casse) ou le charge avec load puis renvoie _G[nom]. | 1169 |

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `newExtensionProxy(parentExtension, identifierPrefix)` | Fonction GLOBALE. Crée une extension virtuelle (ExtensionProxy) qui redirige les hooks vers des instances d'objets (OOP) ; nom 'prefixe_virtual_N'. Si parentExtension est donné, le proxy est déchargé avec lui. | 1089 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/extensions.lua`.*
