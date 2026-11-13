# `editor_roadUtils`

*Fichier : `lua/ge/extensions/editor/roadUtils.lua` · VM : Game Engine (GE) · 304 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadUtils` : `extensions.load("editor_roadUtils")`, puis la globale `editor_roadUtils`

Utilitaires des modèles de routes (road templates) de l'éditeur. Lit les fichiers levels/<niveau>/roadtemplates/*.road.json, mémorise matériaux et noms de matériaux des modèles, puis applique le modèle de chaque DecalRoad qui en référence un : crée des routes enfants, des décorations et des decals le long de la route. Tout est inactif tant que la préférence roadTemplates.general.loadTemplates est à false.

## Remarques

- Les champs dynamiques lus sur la route sont template, useTemplate, isChildRoad, childRoads, decorationIDs, decalIDs (chaînes d'ids séparés par des espaces).
- Résolution des routes : un nœud tous les roadResolutionMetres = 2 m.
- Piège : `local roadDecorations = extensions.editor_roadDecorations` est lu au chargement du fichier ; si cette extension n'est pas encore chargée à ce moment, roadDecorations vaut nil et updateChildRoads plante.
- M.onEditorInitialized = nil est exporté explicitement : le champ n'existe pas, ce n'est pas un hook actif.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadUtils.getMaterialNames()` | Renvoie les noms de matériaux des modèles, dans le même ordre que getMaterials. | 287 |
| `editor_roadUtils.getMaterials()` | Renvoie la liste des textures (objets editor.texObj) des matériaux des modèles chargés par reloadTemplates. | 283 |
| `editor_roadUtils.getRoadTemplateFiles()` | Renvoie les chemins des fichiers *.road.json trouvés par le dernier reloadTemplates. | 291 |
| `editor_roadUtils.reloadDecals(road, template)` | Supprime les decals précédents de la route (champ decalIDs) puis recrée ceux définis par le modèle et stocke leurs ids dans le champ dynamique decalIDs. | 97 |
| `editor_roadUtils.reloadDecorations(road)` | Supprime les anciennes décorations de la route (champ decorationIDs) puis recrée celles du modèle. Ignore les routes enfants, les routes sans modèle ou avec useTemplate différent de "true". | 43 |
| `editor_roadUtils.reloadTemplates()` | Relit les fichiers .road.json du niveau courant, reconstruit les listes de matériaux (texture colorMap, ou warnMat.dds si le matériau est introuvable) puis ré-applique à chaque DecalRoad utilisant un modèle : routes enfants, décorations et decals. Recharge enfin les collisions (be:reloadCollision). Sort tout de suite si la préférence est off ou s'il n'y a pas de niveau. | 234 |
| `editor_roadUtils.updateChildRoads(road)` | Supprime les routes enfants d'une route puis recrée, d'après son modèle, une route enfant par entrée supplémentaire de template.roads (largeur relative ou absolue, décalage latéral horizPosRelative). La première entrée du modèle est collée sur la route elle-même. | 172 |

### Détail des paramètres

#### `editor_roadUtils.getMaterialNames()`

Renvoie les noms de matériaux des modèles, dans le même ordre que getMaterials.

- **renvoie** : string[] Noms de matériaux.

#### `editor_roadUtils.getMaterials()`

Renvoie la liste des textures (objets editor.texObj) des matériaux des modèles chargés par reloadTemplates.

- **renvoie** : table Tableau indexé de textures ImGui.

#### `editor_roadUtils.getRoadTemplateFiles()`

Renvoie les chemins des fichiers *.road.json trouvés par le dernier reloadTemplates.

- **renvoie** : string[] Chemins de fichiers.

#### `editor_roadUtils.reloadDecals(road, template)`

Supprime les decals précédents de la route (champ decalIDs) puis recrée ceux définis par le modèle et stocke leurs ids dans le champ dynamique decalIDs.

- `road` (*userdata*) : Objet DecalRoad.
- `template` (*table|nil*) : Données du modèle déjà lues ; si nil, relues depuis le champ template de la route.

#### `editor_roadUtils.reloadDecorations(road)`

Supprime les anciennes décorations de la route (champ decorationIDs) puis recrée celles du modèle. Ignore les routes enfants, les routes sans modèle ou avec useTemplate différent de "true".

- `road` (*userdata*) : Objet DecalRoad.

#### `editor_roadUtils.updateChildRoads(road)`

Supprime les routes enfants d'une route puis recrée, d'après son modèle, une route enfant par entrée supplémentaire de template.roads (largeur relative ou absolue, décalage latéral horizPosRelative). La première entrée du modèle est collée sur la route elle-même.

- `road` (*userdata*) : Objet DecalRoad portant les champs dynamiques template/useTemplate.

## Champs

| Champ | Type | Description |
|---|---|---|
| `onEditorInitialized` | nil | Toujours nil : affectation explicite sans effet. |

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `reloadCollision`
- `scenetree.` `findObject`, `findObjectById`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadUtils.lua`.*
