# `editor_terrainAndRoadImporter`

*Fichier : `lua/ge/extensions/editor/terrainAndRoadImporter.lua` · VM : Game Engine (GE) · 795 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_terrainAndRoadImporter` : `extensions.load("editor_terrainAndRoadImporter")`, puis la globale `editor_terrainAndRoadImporter`

Outil de l'éditeur « Terrain And Road Importer » : importe un terrain depuis un PNG 16 bits en niveaux de gris (hauteur = valeur/65535 x zMax), ou déforme le terrain vers des sommets (IDW) lus dans un JSON, et importe des routes depuis un JSON (liste de routes, chacune liste de nœuds {x,y,width}). Les routes deviennent des DecalRoad (matériau road_asphalt_2lane, dans un SimGroup « Terrain And Road Importer ») et le terrain est terraformé autour d'elles (domaine d'influence DOI + marge) pour épouser la route. Nécessite un TerrainBlock dans la scène (sinon les fonctions retournent sans rien faire) et le module editor_terrainEditor.

## Remarques

- Le mode d'édition (icône terrainToLine) n'est enregistré que si license.isValid() est vrai.
- Le terrain importé est limité à 2001x2001 échantillons (xBmp/yBmp <= 2000) ; conformTerrainToPeaks travaille sur une grille fixe 2000x2000 en IDW de puissance 2 (coûteux) et plafonne les hauteurs à 250 m.
- Les hauteurs sont bornées à >= 0 (max(0, …)).
- importRoads : les DecalRoad sont posés à +10 m de z puis conformTerrainToRoad aplanit le terrain sous la route ; map.reset() est appelé pour recalculer le navgraph.
- reset() supprime le dossier « Terrain And Road Importer » mais remet TOUT le terrain à z=0 (pas seulement la zone importée).
- importTerrain : en cas d'échec de chargement du PNG, une erreur est loguée mais le traitement continue quand même (aucun return).
- Valeurs des curseurs : zMax 0-500 m (défaut 400), DOI 1-500 m (défaut 150), marge 0-20 m (défaut 7).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_terrainAndRoadImporter.conformTerrainToPeaks(filepath)` | Déforme le terrain local vers des sommets donnés : lit un JSON [{x,y,z}], convertit en coordonnées de grille, interpole par IDW sur une grille 2000x2000 et écrit les hauteurs (0 à 250 m) dans le TerrainBlock, puis le marque modifié. | 75 |
| `editor_terrainAndRoadImporter.importRoads(roadPath, DOI, margin)` | Importe des routes depuis un JSON (liste de routes, chacune liste de {x,y,width}) : pose chaque nœud sur la hauteur du terrain, triangule les routes, conforme le terrain autour (DOI/marge), crée les DecalRoad dans un dossier de la scène et réinitialise le navgraph. | 584 |
| `editor_terrainAndRoadImporter.importTerrain(terrPath, zMax)` | Importe un terrain depuis un PNG 16 bits : applique chaque texel (x valeur/65535 x zMax) à la heightmap, met à jour la grille puis recharge la collision (be:reloadCollision). | 537 |
| `editor_terrainAndRoadImporter.onEditorGui()` | Hook de rendu de l'éditeur : si l'outil est actif, dessine la fenêtre avec les boutons Conform To Peaks, Import Terrain, Import Roads, Reset (ouvrent un sélecteur de fichier) et les trois curseurs zMax / Domain Of Influence / Margin. *(interne)* *(hook)* | 673 |
| `editor_terrainAndRoadImporter.onEditorInitialized()` | Hook d'initialisation de l'éditeur : si la licence est valide, enregistre le mode d'édition terrainAndRoadImporterEditMode et la fenêtre de l'outil. *(interne)* *(hook)* | 767 |
| `editor_terrainAndRoadImporter.reset()` | Supprime le dossier de routes importées (« Terrain And Road Importer ») et remet la heightmap à z=0 partout. | 633 |
| `editor_terrainAndRoadImporter.toggleWorldEditor(isOpen)` | Ouvre ou ferme l'éditeur de monde (editor.setEditorActive). | 670 |

### Détail des paramètres

#### `editor_terrainAndRoadImporter.conformTerrainToPeaks(filepath)`

Déforme le terrain local vers des sommets donnés : lit un JSON [{x,y,z}], convertit en coordonnées de grille, interpole par IDW sur une grille 2000x2000 et écrit les hauteurs (0 à 250 m) dans le TerrainBlock, puis le marque modifié.

- `filepath` (*string*) : Chemin du fichier .json contenant la liste de sommets {x,y,z}.

#### `editor_terrainAndRoadImporter.importRoads(roadPath, DOI, margin)`

Importe des routes depuis un JSON (liste de routes, chacune liste de {x,y,width}) : pose chaque nœud sur la hauteur du terrain, triangule les routes, conforme le terrain autour (DOI/marge), crée les DecalRoad dans un dossier de la scène et réinitialise le navgraph.

- `roadPath` (*string*) : Chemin du fichier .json des routes
- `DOI` (*number*) : Domaine d'influence du terraformage (m)
- `margin` (*number*) : Marge de terraformage autour de la chaussée (m)

#### `editor_terrainAndRoadImporter.importTerrain(terrPath, zMax)`

Importe un terrain depuis un PNG 16 bits : applique chaque texel (x valeur/65535 x zMax) à la heightmap, met à jour la grille puis recharge la collision (be:reloadCollision).

- `terrPath` (*string*) : Chemin du fichier .png
- `zMax` (*number*) : Hauteur (m) correspondant à la valeur maximale du PNG : le terrain est mappé sur [0, zMax].

#### `editor_terrainAndRoadImporter.toggleWorldEditor(isOpen)`

Ouvre ou ferme l'éditeur de monde (editor.setEditorActive).

- `isOpen` (*boolean*) : true pour ouvrir, false pour fermer.

## Appels vers le moteur (C++)

- `be:` `reloadCollision`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/terrainAndRoadImporter.lua`.*
