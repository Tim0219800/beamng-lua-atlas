# `test`

*Fichier : `lua/console/test.lua` · VM : Console · 57 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("test")`

Fichier de test principal de la console : il charge lua/console/benchphysics et définit deux fonctions globales de test, loadOneVehicle (spawn du pickup) et benchJSON (chargement et fusion des fichiers .jbeam du pickup). Aucun appel automatique, ils sont à lancer à la main.

## Remarques

- benchJSON utilise des globales (directory, dir) faute de local.
- benchJSON retourne nil dès qu'un fichier jbeam n'est pas décodable ; sinon ne retourne rien.

## Fonctions globales définies ici

| Fonction | Description | Ligne |
|---|---|---|
| `benchJSON()` | Liste les fichiers .jbeam (hors .jbeamc) de vehicles/pickup, les lit, les décode avec json.decode et fusionne les parties avec tableMerge. Journalise le nombre de parties de chaque fichier. | 18 |
| `loadOneVehicle()` | Supprime tous les objets puis fait apparaître vehicles/pickup à l'origine. | 13 |

## Appels vers le moteur (C++)

- `BeamEngine:` `deleteAllObjects`, `spawnObject`
- `FS:` `closeDirectory`, `fileExists`, `openDirectory`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/console/test.lua`.*
