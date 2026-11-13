# `editor_sitesEditor_tags`

*Fichier : `lua/ge/extensions/editor/sitesEditor/tags.lua` · VM : Game Engine (GE) · 140 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/sitesEditor/tags")` (fichier sous extensions/ mais pas une extension classique)

Onglet 'Tags' de l'éditeur de sites (Location Tags, Zone Tags, Parking Spot Tags selon la clé). Le module renvoie un constructeur de classe C. Il liste tous les tags présents dans sites[key] et, pour le tag choisi, affiche deux colonnes (éléments qui l'ont / qui ne l'ont pas) avec des boutons pour déplacer un ou tous les éléments d'un côté à l'autre, ce qui appelle customFields:addTag / removeTag. Les éléments sont surlignés dans le monde au survol.

## Remarques

- Le bouton '>' retire le tag de tous les éléments qui l'ont ; '<' l'ajoute à tous les autres.

## Classe `C`

Objet renvoyé par le constructeur. Champs : sitesEditor, key, sites, tag, tags, sortedTags, hasTag, noTag.

Le module renvoie un constructeur : `local obj = require("editor_sitesEditor_tags")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:draw()` | Dessine l'onglet (appelle drawGeneralInfo). Appelée avec mouseInfo par sitesEditor mais la méthode l'ignore. | 35 |
| `C:drawGeneralInfo()` | Dessine la liste des tags et les deux colonnes de gestion du tag choisi. | 52 |
| `C:init(sitesEditor, key)` | Constructeur (appelé par le module). | 9 |
| `C:selectTag(tag)` | Choisit un tag et répartit les éléments en hasTag et noTag. | 39 |
| `C:selected()` | Appelé quand l'onglet devient actif : relit et trie tous les tags des éléments. | 18 |
| `C:setSites(sites)` | Définit les sites édités. | 14 |
| `C:unselect()` | Appelé quand l'onglet est quitté ; ne fait rien. | 33 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/sitesEditor/tags.lua`.*
