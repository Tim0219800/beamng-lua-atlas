# `util_jbeamStats`

*Fichier : `lua/ge/extensions/util/jbeamStats.lua` · VM : Game Engine (GE) · 84 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_jbeamStats` : `extensions.load("util_jbeamStats")`, puis la globale `util_jbeamStats`

Calcule des statistiques sur l'ensemble des fichiers .jbeam accessibles au jeu (y compris mods montés) : nombre de fichiers, de parts, de lignes, de parts racines (slotType « main »), nombre d'occurrences de chaque section et de lignes de données par section. Sert aux développeurs pour la documentation (voir docCreator) et à un moddeur curieux de l'ampleur des données JBeam.

## Exemple

```lua
dump(extensions.util_jbeamStats.getStats())
jsonWriteFile('jbeam_stats.json', extensions.util_jbeamStats.getStats(), true)
```

## Remarques

- L'analyse relit et décode tous les fichiers .jbeam : l'appel est lent et bloque le thread GE.
- Bug mineur : le comptage de lignes (content:gsub) est fait avant le test content ~= nil ; un fichier illisible provoquerait une erreur.
- Un fichier dont le décodage JSON échoue (pcall) est ignoré pour les statistiques de parts, mais ses lignes sont déjà comptées.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_jbeamStats.getStats()` | Parcourt tous les .jbeam et renvoie une table de statistiques. | 13 |

### Détail des paramètres

#### `util_jbeamStats.getStats()`

Parcourt tous les .jbeam et renvoie une table de statistiques.

- **renvoie** : table Champs : totalJbeamFiles, partCount, sectionCount (nom -> nombre), sectionCountOrdered (liste de paires {section, nombre} triée décroissante), sectionRowCount (nom -> lignes hors en-tête), totalLineCount, totalRootParts, totalModifiersCount

## Appels vers le moteur (C++)

- `FS:` `findFiles`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/jbeamStats.lua`.*
