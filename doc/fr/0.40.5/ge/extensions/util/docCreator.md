# `util_docCreator`

*Fichier : `lua/ge/extensions/util/docCreator.lua` · VM : Game Engine (GE) · 303 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_docCreator` : `extensions.load("util_docCreator")`, puis la globale `util_docCreator`

Outil interne de BeamNG pour générer les données JSON et les ressources (images copiées avec un nom basé sur le hash SHA1) qui alimentent la documentation en ligne (système Hugo). Pour chaque langue disponible, il exporte la liste des niveaux et des véhicules (modèles et configurations) ; il exporte aussi la version du jeu, les matériaux physiques, les valeurs par défaut JBeam, les statistiques JBeam et les contrôleurs de jeu testés (d'après /settings/inputmaps/). Tout est écrit dans le dossier doc-out/ (data/ et resources/). Peu utile à un moddeur, sauf comme exemple d'accès aux listes de niveaux/véhicules.

## Exemple

```lua
extensions.util_docCreator.run()
```

## Remarques

- Les deux fonctions lancent un job (core_jobsystem) : le traitement est asynchrone et affiche DONE dans la console à la fin.
- Le script change la langue du jeu (Lua.userLanguage, reloadLanguages, hook onSettingsChanged) pour chaque langue ; la langue d'origine n'est pas restaurée à la fin.
- Bug : dans getTestedControllers, le message d'erreur de discordance vidpid contient `dumps(out.vidpid)".. vs filename "` (opérateur .. manquant avant la chaîne), ce qui est un appel de fonction sur une chaîne et provoquerait une erreur Lua si les deux identifiants diffèrent.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_docCreator.run()` | Crée un job asynchrone qui génère toutes les données de documentation (niveaux, véhicules par langue, puis données communes) dans doc-out/data/ et doc-out/resources/. | 290 |
| `util_docCreator.runAndQuit()` | Comme run(), mais quitte le jeu (shutdown(0)) une fois la génération terminée. Prévu pour une génération en ligne de commande. | 294 |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onSettingsChanged` — écouté par 25 module(s)

## Appels vers le moteur (C++)

- `FS:` `copyFile`, `directoryCreate`, `fileExists`, `findFiles`, `hashFileSHA1`
- `Lua:` `getSelectedLanguage`, `reloadLanguages`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/docCreator.lua`.*
