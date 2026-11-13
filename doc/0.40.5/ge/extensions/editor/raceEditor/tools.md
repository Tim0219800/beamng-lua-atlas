# `editor_raceEditor_tools`

*Fichier : `lua/ge/extensions/editor/raceEditor/tools.lua` · VM : Game Engine (GE) · 346 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/raceEditor/tools")` (fichier sous extensions/ mais pas une extension classique)

Sous-fenêtre « Tools » de l'éditeur de course (raceEditor). Section « Side Decorators » : génère des décorations (TSStatic .dae ou prefab) de part et d'autre des pathnodes, avec décalages de position/rotation/échelle et mode d'alignement (terrain, pathnode, absolute), aperçu en lignes colorées et boutons Create / Replace / Remove (groupe SimGroup « <nom>_decoration » dans MissionGroup). Section « Pathnode Tools » : poser tous les nœuds au sol, aligner les normales sur le terrain, fixer tous les rayons, supprimer les BeamNGWaypoint redondants, aligner sur la grille, supprimer tous les segments. Section « Debug Tools » : ouvrir la fenêtre de test et dumps de chemin/autoConfig. Le module renvoie un constructeur : require('/lua/ge/extensions/editor/raceEditor/tools')(raceEditor).

## Remarques

- Valeurs initiales : décalage de position (0, 0, 0.2), rotation (0, 15, 0) en degrés (convertis en radians), échelle (1, 1, 1), mode d'alignement « terrain ».
- Forme par défaut gauche et droite : art/shapes/race/sign_checkpoint.dae.
- Bug probable : « Drop All Pathnodes to Terrain Height » écrit via changeFieldMulti('pos', ...) un nombre (hauteur du terrain) dans le champ pos des nœuds, qui est un vec3 ; seul z devrait changer.
- Bug : setFieldsUndo parcourt oldDataMap avec ipairs alors que les clés sont des IDs de nœuds (table creuse) ; l'annulation ne restaure alors que les IDs consécutifs à partir de 1.
- Bug : C:selector utilise la variable « value » (non définie) et appelle self:changeField qui n'existe pas dans ce fichier ; la méthode n'est pas appelée par le module.
- « Align All Pathnodes to Grid », « Remove Redundant BeamNGWaypoints » et « Remove All Segments » modifient directement sans passer par l'historique (non annulables).
- Le mode de la forme gauche vaut « unknown » et celui de droite « none » si l'extension n'est ni dae ni prefab ; dans ce cas aucune décoration n'est créée pour ce côté (createDecoration ne gère que 'dae' et 'prefab').

## Classe `C`

Fenêtre Tools (windowDescription = 'Tools'). Instanciée avec init(raceEditor).

Le module renvoie un constructeur : `local obj = require("editor_raceEditor_tools")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:changeFieldMulti(field, newDataMap)` | Modifie le même champ de plusieurs pathnodes en une seule action d'historique (valeurs anciennes mémorisées pour l'annulation). | 113 |
| `C:createDecoration(transforms)` | Crée un SimGroup « <nom du chemin>_decoration » (suffixe numérique si le nom existe déjà) dans MissionGroup et y place un objet par transformée : TSStatic pour un .dae, prefab (spawnPrefab) pour un .prefab / .prefab.json, selon le côté (l/r). Mémorise le groupe comme dernier groupe créé. | 42 |
| `C:displayClassification(classification, name, field, tt)` | Affiche une ligne « nom » avec icône coche ou croix selon classification[field]. | 298 |
| `C:draw()` | Appelé à chaque frame : dessine l'interface des outils. | 38 |
| `C:drawGeneralInfo()` | Dessine tout le contenu : décorations latérales, outils sur les pathnodes et outils de debug. | 129 |
| `C:existsIcon(f)` | Affiche une icône coche si le fichier existe (FS:fileExists), sinon une icône d'erreur, avec infobulle du chemin. | 92 |
| `C:getSideTransformParameters()` | Renvoie les paramètres de décoration latérale saisis dans la fenêtre, à passer à pathnode:getSideTransforms. | 123 |
| `C:init(raceEditor)` | Mémorise raceEditor et initialise les décalages de position, rotation et échelle des décorations. | 19 |
| `C:selected()` | Appelé quand l'onglet devient actif ; ne fait rien. | 35 |
| `C:selector(name, objects, fieldName, clrI, tt)` | Liste déroulante de sélection d'un objet du chemin pour un champ (voir notes : non fonctionnelle et inutilisée ici). | 311 |
| `C:setPath(path)` | Définit le chemin de course édité. | 32 |
| `C:unselect()` | Appelé quand l'onglet est quitté ; ne fait rien. | 36 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`
- `debugDrawer:` `drawLine`, `drawTextAdvanced`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/raceEditor/tools.lua`.*
