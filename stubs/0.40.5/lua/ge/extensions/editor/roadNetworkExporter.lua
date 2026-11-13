---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadNetworkExporter.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fenêtre d'éditeur « Road Network Import/Exporter » (menu Window > Tech), visible uniquement avec une licence tech (ResearchVerifier.isTechLicenseVerified()). Elle permet d'importer et d'exporter le réseau routier du Road Architect aux formats OpenDRIVE (.xodr), OpenStreetMap (.osm) et SUMO (.nod.xml / .edg.xml), avec des options d'import (placement, décalage vertical, terraformage, domaine d'influence et marge) reprises du Road Architect.
--- Accès : extension `editor_roadNetworkExporter` : `extensions.load("editor_roadNetworkExporter")`, puis la globale `editor_roadNetworkExporter`
---@class editor_roadNetworkExporter
editor_roadNetworkExporter = {}

--- Hook appelé quand l'éditeur est activé. Mémorise le TerrainBlock courant (extensions.editor_terrainEditor.getTerrainBlock()). Sans effet sans licence tech.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadNetworkExporter.lua:43
function editor_roadNetworkExporter.onEditorActivated() end

--- Hook appelé à chaque frame d'interface de l'éditeur. Dessine la fenêtre : options d'import, tableau Import/Export pour OpenDRIVE, OpenStreetMap et SUMO, puis le résultat de l'import (routes importées/ignorées, avertissements).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadNetworkExporter.lua:241
function editor_roadNetworkExporter.onEditorGui() end

--- Hook de l'éditeur, appelé à l'initialisation. Vérifie la licence tech et, si elle est valide, enregistre la fenêtre (600x600) et l'entrée de menu « Road Network Import/Exporter » dans le groupe Tech.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/roadNetworkExporter.lua:36
function editor_roadNetworkExporter.onEditorInitialized() end

