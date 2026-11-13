# `util_sortLines`

*Fichier : `lua/ge/extensions/util/sortLines.lua` · VM : Game Engine (GE) · 44 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_sortLines` : `extensions.load("util_sortLines")`, puis la globale `util_sortLines`

Outil de développement qui trie, par champ « name », les fichiers JSON de sons d'un niveau. Ces fichiers contiennent un objet JSON par ligne (format « JSON lines ») dans /levels/<niveau>/main/MissionGroup/Audio/. handleLevel parcourt les *.json de ce dossier et handleFile réécrit chaque fichier avec ses lignes triées par nom. Il modifie les fichiers sur place.

## Exemple

```lua
util_sortLines.handleLevel('west_coast_usa')
```

## Remarques

- Écrase le fichier d'origine (io.open(path, 'w')) sans sauvegarde ; à utiliser sur une copie de travail.
- Les lignes vides sont supprimées à la réécriture. Chaque ligne est décodée avec jsonDecode ; les lignes sans champ name sont triées avec le nom vide (en premier).
- Probable bug : le motif gmatch('([^\n]*)\n?') produit une dernière chaîne vide quand le fichier se termine par un saut de ligne ; jsonDecode('') ne renvoie pas une table, et obj.name provoquerait alors une erreur Lua (indexation de nil).
- table.sort n'est pas stable : l'ordre relatif des lignes de même name n'est pas garanti.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_sortLines.handleFile(path)` | Lit un fichier JSON lines, trie les lignes selon leur champ name (ordre croissant) et réécrit le fichier. | 11 |
| `util_sortLines.handleLevel(level)` | Trie tous les fichiers *.json (non récursif) du dossier /levels/<level>/main/MissionGroup/Audio/. | 35 |

### Détail des paramètres

#### `util_sortLines.handleFile(path)`

Lit un fichier JSON lines, trie les lignes selon leur champ name (ordre croissant) et réécrit le fichier.

- `path` (*string*) : Chemin du fichier à trier.

#### `util_sortLines.handleLevel(level)`

Trie tous les fichiers *.json (non récursif) du dossier /levels/<level>/main/MissionGroup/Audio/.

- `level` (*string*) : Nom du dossier du niveau.

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/sortLines.lua`.*
