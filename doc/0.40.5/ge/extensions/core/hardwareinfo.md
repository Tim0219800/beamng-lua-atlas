# `core_hardwareinfo`

*Fichier : `lua/ge/extensions/core/hardwareinfo.lua` · VM : Game Engine (GE) · 253 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_hardwareinfo` : `extensions.load("core_hardwareinfo")`, puis la globale `core_hardwareinfo`

Extension GE `core_hardwareinfo` : collecte les informations matérielles et système (OS, mémoire, CPU, GPU, batterie, disque, mods) via Engine.Platform, calcule des avertissements de performance (mémoire insuffisante, GPU Intel intégré, trop de mods, disque presque plein, fichiers du jeu modifiés, dossier OneDrive, version piratée) et les envoie à l'UI. Gère aussi le benchmark physique « bananabench » et l'analyse d'espace disque. Utile à un moddeur pour lire les caractéristiques de la machine.

## Exemple

```lua
local info = core_hardwareinfo.getInfo()
print(info.gpu.name, info.mem.osPhysAvailable, info.globalState)   -- 'ok' | 'warn' | 'error'
```

## Remarques

- Structure du résultat de getInfo : os, pwr, mem, cpu, gpu, disk, mods (ou {state='load'} tant que core_modmanager n'est pas prêt), hs (version piratée), plus globalState ('ok'/'warn'/'error') et sailingTheHighSeas. Chaque sous-table a warnings = [{type 'warn'|'error', msg, context?, ack?}] et state (le pire niveau).
- Mémoire en octets. Pour une version x64 : processPhysUsedPercent, osPhysUsedPercent, processVirtUsedPercent, osVirtUsedPercent sont des fractions 0..1 (division par osPhysAvailable / osVirtAvailable, qui semblent être les totaux malgré leur nom, déduit du code).
- Seuils d'avertissement : mémoire physique < 60 % de 16 Go (9,6 Go) -> 'minmem' ; sinon moins de 1 Go libre -> 'freememlow' ; GPU dont le nom contient 'intel' (hors 'arc(tm)' et 'bmg') -> erreur 'intelgpu' ; mods : >10 dossiers décompressés ou >100 zip = avertissement, >20 ou >150 = erreur ('toomanymods') ; espace libre racine ou utilisateur < 1 Go -> 'lowfreespace' ; taille de la racine hors de [taille intégrité - 10 Mo ; + 256 Mo] -> 'rootmodified' ; chemin utilisateur contenant OneDrive -> 'onedrive'.
- Un avertissement déjà validé (réglage PerformanceWarnings.<msg> à true) reçoit ack = true. Pour chaque avertissement, le hook extensions onPerformanceHardwareWarning(clé de section, avertissement) est émis à chaque appel de getInfo.
- Le test d'intégrité calcule originalSize à partir de integrity.json en partant de -1 (et non 0) : décalage d'un octet sans conséquence pratique.
- Incohérences : le nom exporté M.latestBananbench (faute de frappe, 'Bananbench') pointe sur readBananabenchFile ; disableHwWarnings et sailingTheHighSeas sont des globales non définies ici ; getInfo appelle M.runDiskUsage() à l'intérieur du calcul, ce qui renvoie à l'UI les données de disque déjà connues.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_hardwareinfo.acknowledgeWarning(warning)` | Enregistre dans les réglages que l'utilisateur a pris connaissance d'un avertissement (PerformanceWarnings.<warning> = true) et renvoie l'état à l'UI. | 202 |
| `core_hardwareinfo.diskInfoCallback(data)` | Callback appelé par le moteur pendant/après l'analyse disque : relaie vers l'UI ; à la fin (data.running faux) mémorise le résultat et rafraîchit le rapport. *(interne)* | 211 |
| `core_hardwareinfo.getInfo()` | Construit et renvoie le rapport matériel complet avec avertissements et états (voir notes). | 10 |
| `core_hardwareinfo.latestBananbench()` | Lit 'bananabench.json' (dernier benchmark). Nom exporté avec faute de frappe. | 194 |
| `core_hardwareinfo.latestBenchmarkExists()` | Indique si 'bananabench.json' existe. | 198 |
| `core_hardwareinfo.logInfo(filename)` | Écrit dans un fichier JSON les informations brutes mémoire, CPU, GPU, OS et alimentation (sans avertissements). | 164 |
| `core_hardwareinfo.onBananaBenchReady(outFilename)` | Hook appelé par le moteur quand le benchmark est terminé : lit le fichier de résultat et l'envoie à l'UI (guihooks BananaBenchReady, nil si le fichier est absent). *(interne)* *(hook)* | 183 |
| `core_hardwareinfo.onModManagerReady()` | Hook appelé quand le gestionnaire de mods est prêt : envoie le rapport à jour à l'UI. *(interne)* *(hook)* | 207 |
| `core_hardwareinfo.requestInfo()` | Calcule le rapport (getInfo) et l'envoie à l'UI par guihooks 'HardwareInfo'. | 157 |
| `core_hardwareinfo.runDiskUsage()` | Lance l'analyse d'espace disque C++ si elle n'a pas déjà été faite ; sinon renvoie à l'UI les résultats connus (guihooks diskInfoCallback). | 225 |
| `core_hardwareinfo.runPhysicsBenchmark()` | Supprime l'ancien 'bananabench.json' et lance le benchmark physique C++ (Engine.Platform.runBananaBench). Le résultat arrive via onBananaBenchReady. | 175 |

### Détail des paramètres

#### `core_hardwareinfo.acknowledgeWarning(warning)`

Enregistre dans les réglages que l'utilisateur a pris connaissance d'un avertissement (PerformanceWarnings.<warning> = true) et renvoie l'état à l'UI.

- `warning` (*string*) : Code msg de l'avertissement (ex. 'toomanymods').

#### `core_hardwareinfo.diskInfoCallback(data)`

Callback appelé par le moteur pendant/après l'analyse disque : relaie vers l'UI ; à la fin (data.running faux) mémorise le résultat et rafraîchit le rapport.

- `data` (*table*) : Données d'analyse : running, name, size…

#### `core_hardwareinfo.getInfo()`

Construit et renvoie le rapport matériel complet avec avertissements et états (voir notes).

- **renvoie** : table Rapport {os, pwr, mem, cpu, gpu, disk, mods, hs?, globalState, sailingTheHighSeas}.

#### `core_hardwareinfo.latestBananbench()`

Lit 'bananabench.json' (dernier benchmark). Nom exporté avec faute de frappe.

- **renvoie** : table|nil Résultat du benchmark ou nil.

#### `core_hardwareinfo.latestBenchmarkExists()`

Indique si 'bananabench.json' existe.

- **renvoie** : boolean true si le fichier existe.

#### `core_hardwareinfo.logInfo(filename)`

Écrit dans un fichier JSON les informations brutes mémoire, CPU, GPU, OS et alimentation (sans avertissements).

- `filename` (*string*) : Chemin du fichier JSON de sortie.

#### `core_hardwareinfo.onBananaBenchReady(outFilename)`

Hook appelé par le moteur quand le benchmark est terminé : lit le fichier de résultat et l'envoie à l'UI (guihooks BananaBenchReady, nil si le fichier est absent).

- `outFilename` (*string*) : Chemin du fichier de résultat.
- **renvoie** : nil nil si le fichier n'existe pas, sinon rien.

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onPerformanceHardwareWarning` — écouté par 1 module(s)

**Évènements UI (guihooks.trigger) :** `BananaBenchReady`, `HardwareInfo`, `diskInfoCallback`

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `getUserPath`, `isGamePathCaseSensitive`, `isUserPathCaseSensitive`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/hardwareinfo.lua`.*
