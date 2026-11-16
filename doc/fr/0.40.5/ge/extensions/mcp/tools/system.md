# `mcp_tools_system`

*Fichier : `lua/ge/extensions/mcp/tools/system.lua` · VM : Game Engine (GE) · 211 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_tools_system` : `extensions.load("mcp_tools_system")`, puis la globale `mcp_tools_system`

Outils MCP système : exécuter du Lua dans la VM GE, lire les logs, recharger l'UI ou le Lua, infos de rendu, captures d'écran, infos fichier, chargement de fichiers Lua et d'extensions, lecture/écriture de variables du VariableRegistry.

## Remarques

- Attention sécurité : run_lua et load_file exécutent du code arbitraire dans le jeu ; set_var modifie des variables moteur.
- get_logs : le premier appel renvoie les N dernières lignes de beamng.log (défaut 200, max 5000), les suivants seulement les nouvelles lignes depuis l'appel précédent (offset mémorisé).
- screenshot enregistre sous <dossier utilisateur>/screenshots/mcp/ (PNG ou JPG) de façon asynchrone ; le chemin est renvoyé immédiatement, le fichier peut apparaître quelques frames plus tard.
- screenshot_image : asynchrone en deux appels ; le résultat est une table {data=<base64 JPEG>, mimeType='image/jpeg'} que mcp_server convertit en contenu image.
- unload_extension refuse de décharger mcp_server et mcp_tools.
- reload_lua : le rechargement est différé à la frame suivante ; le serveur MCP redémarre (onSerialize/onDeserialize) mais la connexion peut sauter.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_tools_system.file_info(args)` | Informations sur un chemin : exists, isDir, realPath (VFS vers disque), virtualPath, expanded et stat. | 99 |
| `mcp_tools_system.get_logs(args)` | Lit beamng.log (voir notes pour la logique premier appel / appels suivants). | 24 |
| `mcp_tools_system.get_render_info()` | Infos de rendu en JSON : adapterType, available, vulkanEnabled, gpu (Engine.Render / Engine.Platform). | 56 |
| `mcp_tools_system.get_var(args)` | Lit une variable moteur/préférence (VariableRegistry.get), ex. $pref::Video::gpu. | 144 |
| `mcp_tools_system.load_extension(args)` | Charge une extension GE par son nom (forme avec underscore). | 128 |
| `mcp_tools_system.load_file(args)` | Charge et exécute un fichier Lua dans la VM GE (le chemin VFS est résolu vers le chemin réel). | 116 |
| `mcp_tools_system.reload_lua()` | Demande le rechargement du VM Lua GE (comme Ctrl+L) via Lua:requestReload ; différé à la frame suivante. | 50 |
| `mcp_tools_system.reload_ui()` | Recharge complètement l'UI (CEF) en ignorant le cache, via reloadUI(). | 43 |
| `mcp_tools_system.run_lua(args)` | Compile (loadstring) et exécute du code Lua dans la VM GE, renvoie tostring du résultat du chunk. | 14 |
| `mcp_tools_system.screenshot(args)` | Prend une capture (module `screenshot`, createScreenshotTracked) et renvoie son chemin absolu. | 66 |
| `mcp_tools_system.screenshot_image(args)` | Capture un JPG réduit et le renvoie en base64 (asynchrone en deux appels). | 80 |
| `mcp_tools_system.set_var(args)` | Écrit une variable moteur (VariableRegistry.set) et renvoie la valeur relue. | 150 |
| `mcp_tools_system.unload_extension(args)` | Décharge une extension GE (mcp_server et mcp_tools protégées). | 135 |

### Détail des paramètres

#### `mcp_tools_system.file_info(args)`

Informations sur un chemin : exists, isDir, realPath (VFS vers disque), virtualPath, expanded et stat.

- `args` (*table*) : {path: string} chemin VFS ou réel.
- **renvoie** : string JSON.
- **renvoie** : boolean true si path manquant.

#### `mcp_tools_system.get_logs(args)`

Lit beamng.log (voir notes pour la logique premier appel / appels suivants).

- `args` (*table|nil*) : {lines?: integer}
- **renvoie** : string Lignes de log.
- **renvoie** : boolean true si le fichier est illisible.

#### `mcp_tools_system.get_render_info()`

Infos de rendu en JSON : adapterType, available, vulkanEnabled, gpu (Engine.Render / Engine.Platform).

- **renvoie** : string JSON.
- **renvoie** : boolean false.

#### `mcp_tools_system.get_var(args)`

Lit une variable moteur/préférence (VariableRegistry.get), ex. $pref::Video::gpu.

- `args` (*table*) : {name: string, default?: any}
- **renvoie** : string Valeur.
- **renvoie** : boolean true si name manquant.

#### `mcp_tools_system.load_extension(args)`

Charge une extension GE par son nom (forme avec underscore).

- `args` (*table*) : {name: string}
- **renvoie** : string « loaded » ou « load failed for ».
- **renvoie** : boolean true si name manquant.

#### `mcp_tools_system.load_file(args)`

Charge et exécute un fichier Lua dans la VM GE (le chemin VFS est résolu vers le chemin réel).

- `args` (*table*) : {path: string}
- **renvoie** : string « loaded … » ou erreur.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_system.reload_lua()`

Demande le rechargement du VM Lua GE (comme Ctrl+L) via Lua:requestReload ; différé à la frame suivante.

- **renvoie** : string Message.
- **renvoie** : boolean true si indisponible.

#### `mcp_tools_system.reload_ui()`

Recharge complètement l'UI (CEF) en ignorant le cache, via reloadUI().

- **renvoie** : string Message.
- **renvoie** : boolean true si reloadUI absent.

#### `mcp_tools_system.run_lua(args)`

Compile (loadstring) et exécute du code Lua dans la VM GE, renvoie tostring du résultat du chunk.

- `args` (*table*) : {code: string}. Le code doit faire `return …` pour renvoyer une valeur.
- **renvoie** : string Résultat ou « compile error / error: … ».
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_system.screenshot(args)`

Prend une capture (module `screenshot`, createScreenshotTracked) et renvoie son chemin absolu.

- `args` (*table|nil*) : {jpg?: boolean} (défaut PNG).
- **renvoie** : string Chemin du fichier.
- **renvoie** : boolean true si la capture échoue.

#### `mcp_tools_system.screenshot_image(args)`

Capture un JPG réduit et le renvoie en base64 (asynchrone en deux appels).

- `args` (*table|nil*) : {scale?: number 0..1 (défaut 0.4)}
- **renvoie** : table|string {data, mimeType} une fois prêt, sinon message « capturing… ».
- **renvoie** : boolean true si la capture échoue.

#### `mcp_tools_system.set_var(args)`

Écrit une variable moteur (VariableRegistry.set) et renvoie la valeur relue.

- `args` (*table*) : {name: string, value: any}
- **renvoie** : string « nom = valeur ».
- **renvoie** : boolean true si paramètre manquant.

#### `mcp_tools_system.unload_extension(args)`

Décharge une extension GE (mcp_server et mcp_tools protégées).

- `args` (*table*) : {name: string}
- **renvoie** : string Message.
- **renvoie** : boolean true en cas de refus ou d'erreur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schémas des outils système. |

## Appels vers le moteur (C++)

- `Engine.` `getVulkanEnabled`
- `FS:` `directoryCreate`, `directoryExists`, `expandFilename`, `fileExists`, `getFileRealPath`, `getUserPath`, `native2Virtual`, `stat`
- `Lua:` `requestReload`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/tools/system.lua`.*
