# `util_inputSystemUtils`

*Fichier : `lua/ge/extensions/util/inputSystemUtils.lua` · VM : Game Engine (GE) · 132 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_inputSystemUtils` : `extensions.load("util_inputSystemUtils")`, puis la globale `util_inputSystemUtils`

Outils de maintenance pour les fichiers inputmaps (profils de contrôleurs dans /settings/inputmaps/, format JSON). printStats compte les liaisons et affiche les 20 actions les plus utilisées ; resave relit tous les inputmaps, complète vidpid et vendorName (d'après vendorNames.json), trie les liaisons par contrôle puis action et les réécrit avec un formatage JSON personnalisé. Destiné aux développeurs du jeu et aux créateurs de profils de contrôleurs.

## Exemple

```lua
extensions.util_inputSystemUtils.printStats()
extensions.util_inputSystemUtils.resave()
```

## Remarques

- resave écrit directement dans les fichiers trouvés sous un dossier inputmaps/ ; à utiliser avec précaution.
- Le vidpid est déduit du nom de fichier si le champ est absent ; il est supprimé s'il n'est pas composé de 8 caractères hexadécimaux. L'identifiant fabricant est constitué des caractères 5 à 8.
- Si une liaison n'a pas de champ control, le tri retombe sur la comparaison de tostring(table), ce qui n'est pas stable.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_inputSystemUtils.printStats()` | Parcourt tous les fichiers JSON dont le chemin contient inputmaps/, affiche le nombre total de liaisons et les 20 actions les plus fréquentes. | 20 |
| `util_inputSystemUtils.resave()` | Réécrit tous les inputmaps avec un formatage normalisé (clé control en tête, bindings en dernier, petites tables repliées sur une ligne) ; n'écrit le fichier que si le contenu change, et affiche le résultat par fichier. | 77 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/inputSystemUtils.lua`.*
