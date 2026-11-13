# `util_docCreator`

*Fichier : `lua/ge/extensions/util/docCreator.lua` · VM : Game Engine (GE) · 303 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_docCreator` : `extensions.load("util_docCreator")`, puis la globale `util_docCreator`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_docCreator.run()` |  | 290 |
| `util_docCreator.runAndQuit()` |  | 294 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onSettingsChanged` — écouté par 25 module(s)

## Appels vers le moteur (C++)

- `FS:` `copyFile`, `directoryCreate`, `fileExists`, `findFiles`, `hashFileSHA1`
- `Lua:` `getSelectedLanguage`, `reloadLanguages`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/docCreator.lua`.*
