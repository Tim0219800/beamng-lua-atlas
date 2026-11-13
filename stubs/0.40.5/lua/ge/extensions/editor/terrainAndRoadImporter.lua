---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/terrainAndRoadImporter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de l'éditeur « Terrain And Road Importer » : importe un terrain depuis un PNG 16 bits en niveaux de gris (hauteur = valeur/65535 x zMax), ou déforme le terrain vers des sommets (IDW) lus dans un JSON, et importe des routes depuis un JSON (liste de routes, chacune liste de nœuds {x,y,width}). Les routes deviennent des DecalRoad (matériau road_asphalt_2lane, dans un SimGroup « Terrain And Road Importer ») et le terrain est terraformé autour d'elles (domaine d'influence DOI + marge) pour épouser la route. Nécessite un TerrainBlock dans la scène (sinon les fonctions retournent sans rien faire) et le module editor_terrainEditor.
--- Accès : extension `editor_terrainAndRoadImporter` : `extensions.load("editor_terrainAndRoadImporter")`, puis la globale `editor_terrainAndRoadImporter`
---@class editor_terrainAndRoadImporter
editor_terrainAndRoadImporter = {}

--- Déforme le terrain local vers des sommets donnés : lit un JSON [{x,y,z}], convertit en coordonnées de grille, interpole par IDW sur une grille 2000x2000 et écrit les hauteurs (0 à 250 m) dans le TerrainBlock, puis le marque modifié.
---Source : lua/ge/extensions/editor/terrainAndRoadImporter.lua:75
---@param filepath string Chemin du fichier .json contenant la liste de sommets {x,y,z}.
function editor_terrainAndRoadImporter.conformTerrainToPeaks(filepath) end

--- Importe des routes depuis un JSON (liste de routes, chacune liste de {x,y,width}) : pose chaque nœud sur la hauteur du terrain, triangule les routes, conforme le terrain autour (DOI/marge), crée les DecalRoad dans un dossier de la scène et réinitialise le navgraph.
---Source : lua/ge/extensions/editor/terrainAndRoadImporter.lua:584
---@param roadPath string Chemin du fichier .json des routes
---@param DOI number Domaine d'influence du terraformage (m)
---@param margin number Marge de terraformage autour de la chaussée (m)
function editor_terrainAndRoadImporter.importRoads(roadPath, DOI, margin) end

--- Importe un terrain depuis un PNG 16 bits : applique chaque texel (x valeur/65535 x zMax) à la heightmap, met à jour la grille puis recharge la collision (be:reloadCollision).
---Source : lua/ge/extensions/editor/terrainAndRoadImporter.lua:537
---@param terrPath string Chemin du fichier .png
---@param zMax number Hauteur (m) correspondant à la valeur maximale du PNG : le terrain est mappé sur [0, zMax].
function editor_terrainAndRoadImporter.importTerrain(terrPath, zMax) end

--- Hook de rendu de l'éditeur : si l'outil est actif, dessine la fenêtre avec les boutons Conform To Peaks, Import Terrain, Import Roads, Reset (ouvrent un sélecteur de fichier) et les trois curseurs zMax / Domain Of Influence / Margin.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/terrainAndRoadImporter.lua:673
function editor_terrainAndRoadImporter.onEditorGui() end

--- Hook d'initialisation de l'éditeur : si la licence est valide, enregistre le mode d'édition terrainAndRoadImporterEditMode et la fenêtre de l'outil.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/terrainAndRoadImporter.lua:767
function editor_terrainAndRoadImporter.onEditorInitialized() end

--- Supprime le dossier de routes importées (« Terrain And Road Importer ») et remet la heightmap à z=0 partout.
---Source : lua/ge/extensions/editor/terrainAndRoadImporter.lua:633
function editor_terrainAndRoadImporter.reset() end

--- Ouvre ou ferme l'éditeur de monde (editor.setEditorActive).
---Source : lua/ge/extensions/editor/terrainAndRoadImporter.lua:670
---@param isOpen boolean true pour ouvrir, false pour fermer.
function editor_terrainAndRoadImporter.toggleWorldEditor(isOpen) end

