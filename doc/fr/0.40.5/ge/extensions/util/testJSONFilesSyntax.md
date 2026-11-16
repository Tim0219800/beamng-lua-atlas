# `util_testJSONFilesSyntax`

*Fichier : `lua/ge/extensions/util/testJSONFilesSyntax.lua` · VM : Game Engine (GE) · 33 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_testJSONFilesSyntax` : `extensions.load("util_testJSONFilesSyntax")`, puis la globale `util_testJSONFilesSyntax`

Outil de diagnostic : au chargement, il parcourt tout le système de fichiers virtuel du jeu (racine '/') à la recherche des fichiers *.jbeam, *.pc et *.json, puis les décode un par un avec la bibliothèque jsonDebug. Les erreurs de syntaxe et les avertissements sont écrits dans le journal. Utile à un moddeur pour trouver un JSON ou un jbeam invalide.

## Exemple

```lua
extensions.load('util/testJSONFilesSyntax')
-- puis lire les lignes E/W 'jsonDecode' dans le journal
```

## Remarques

- Tout se fait dans onExtensionLoaded, de façon synchrone : le jeu peut se figer un moment, car tous les fichiers du jeu et des mods sont lus.
- Le résultat du décodage n'est pas conservé ; seuls les logs servent.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_testJSONFilesSyntax.onExtensionLoaded()` | Appelé au chargement de l'extension. Liste récursivement les fichiers .jbeam, .pc et .json, les lit avec readFile et les décode avec jsonDebug.decode sous xpcall ; logue les erreurs (E) et avertissements (W) sous le tag 'jsonDecode'. *(interne)* *(hook)* | 22 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/testJSONFilesSyntax.lua`.*
