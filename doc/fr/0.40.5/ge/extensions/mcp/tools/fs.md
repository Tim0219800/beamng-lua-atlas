# `mcp_tools_fs`

*Fichier : `lua/ge/extensions/mcp/tools/fs.lua` · VM : Game Engine (GE) · 114 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `mcp_tools_fs` : `extensions.load("mcp_tools_fs")`, puis la globale `mcp_tools_fs`

Outils MCP système de fichiers : lire/écrire des fichiers texte, lister, chercher, supprimer, copier, renommer, créer des dossiers. Lecture/écriture passent par io.open (relatif au dossier courant du jeu : fichiers « loose » sur disque seulement) ; le listage et la recherche passent par le VFS de BeamNG (voient aussi le contenu des zip).

## Remarques

- Attention sécurité : ces outils permettent de lire, écrire et supprimer des fichiers sans restriction de chemin côté Lua (la seule limite est le bac à sable d'io.open ; delete/copy/rename/make_dir passent par FS:).
- read_file/write_file retirent les '/' initiaux du chemin (chemin VFS -> chemin disque relatif) ; read_file tronque à maxBytes (défaut 100000).
- find_files renvoie au plus 1000 entrées (count donne le total) ; depth -1 = récursif complet.
- delete_file, copy_file, rename_file, make_dir considèrent le code de retour 0 comme succès et renvoient « failed » dans le texte sans mettre isError à true.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `mcp_tools_fs.copy_file(args)` | Copie un fichier (FS:copyFile). | 62 |
| `mcp_tools_fs.delete_file(args)` | Supprime un fichier (FS:removeFile). | 56 |
| `mcp_tools_fs.find_files(args)` | Cherche des fichiers par motif glob (FS:findFiles). | 46 |
| `mcp_tools_fs.list_dir(args)` | Liste un dossier (VFS) en JSON via FS:directoryList. | 39 |
| `mcp_tools_fs.make_dir(args)` | Crée un dossier de façon récursive (FS:directoryCreate). | 72 |
| `mcp_tools_fs.read_file(args)` | Lit un fichier texte (jbeam, json, lua…) et le renvoie, tronqué à maxBytes. | 14 |
| `mcp_tools_fs.rename_file(args)` | Renomme ou déplace un fichier (FS:renameFile). | 67 |
| `mcp_tools_fs.write_file(args)` | Écrit (écrase) un fichier texte, en créant les dossiers parents (FS:directoryCreate). | 26 |

### Détail des paramètres

#### `mcp_tools_fs.copy_file(args)`

Copie un fichier (FS:copyFile).

- `args` (*table*) : {from: string, to: string}
- **renvoie** : string Résultat.
- **renvoie** : boolean true si from/to manquants.

#### `mcp_tools_fs.delete_file(args)`

Supprime un fichier (FS:removeFile).

- `args` (*table*) : {path: string}
- **renvoie** : string « deleted … » ou « delete failed: … ».
- **renvoie** : boolean true seulement si path manquant.

#### `mcp_tools_fs.find_files(args)`

Cherche des fichiers par motif glob (FS:findFiles).

- `args` (*table|nil*) : {path?: string (défaut '/'), pattern?: string (défaut '*'), depth?: integer (défaut 1, -1 = tout)}
- **renvoie** : string JSON {count, files}.
- **renvoie** : boolean false.

#### `mcp_tools_fs.list_dir(args)`

Liste un dossier (VFS) en JSON via FS:directoryList.

- `args` (*table|nil*) : {path?: string (défaut '/'), files?: boolean, dirs?: boolean} ; si ni files ni dirs, les deux sont inclus.
- **renvoie** : string JSON.
- **renvoie** : boolean toujours false.

#### `mcp_tools_fs.make_dir(args)`

Crée un dossier de façon récursive (FS:directoryCreate).

- `args` (*table*) : {path: string}
- **renvoie** : string Résultat.
- **renvoie** : boolean true si path manquant.

#### `mcp_tools_fs.read_file(args)`

Lit un fichier texte (jbeam, json, lua…) et le renvoie, tronqué à maxBytes.

- `args` (*table*) : {path: string, maxBytes?: integer}
- **renvoie** : string Contenu ou message d'erreur.
- **renvoie** : boolean true en cas d'erreur.

#### `mcp_tools_fs.rename_file(args)`

Renomme ou déplace un fichier (FS:renameFile).

- `args` (*table*) : {from: string, to: string}
- **renvoie** : string Résultat.
- **renvoie** : boolean true si from/to manquants.

#### `mcp_tools_fs.write_file(args)`

Écrit (écrase) un fichier texte, en créant les dossiers parents (FS:directoryCreate).

- `args` (*table*) : {path: string, content: string}
- **renvoie** : string « wrote N bytes to … » ou erreur.
- **renvoie** : boolean true en cas d'erreur.

## Champs

| Champ | Type | Description |
|---|---|---|
| `schemas` | table<string, table> | Schémas des outils de fichiers. |

## Appels vers le moteur (C++)

- `FS:` `copyFile`, `directoryCreate`, `directoryExists`, `directoryList`, `findFiles`, `removeFile`, `renameFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/mcp/tools/fs.lua`.*
