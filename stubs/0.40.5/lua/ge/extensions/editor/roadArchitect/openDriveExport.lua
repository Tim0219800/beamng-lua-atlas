---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/openDriveExport.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Export du réseau Road Architect au format OpenDRIVE 1.8 (.xodr). Chaque route (hors superpositions) est convertie en géométrie OpenDRIVE : ligne de référence approchée par des cubiques paramétriques 2D (paramPoly3, tangentes de type Chordal Catmull-Rom), profil d'élévation en cubiques explicites, largeurs et hauteurs de voies par section. Le fichier est écrit via le sélecteur de fichier de l'éditeur (editor_fileDialog.saveFile). Si aucune route Road Architect n'existe, l'export se rabat sur tech_openDriveExporter pour exporter le réseau routier de la carte chargée.
--- Accès : extension `editor_roadArchitect_openDriveExport` : `extensions.load("editor_roadArchitect_openDriveExport")`, puis la globale `editor_roadArchitect_openDriveExport`
---@class editor_roadArchitect_openDriveExport
editor_roadArchitect_openDriveExport = {}

--- Exporte le réseau Road Architect courant en .xodr. Filtre les routes vides, convertit les routes non superposées en géométrie OpenDRIVE, puis ouvre une boîte de dialogue d'enregistrement (extension .xodr, confirmation d'écrasement) et écrit le fichier. Sans route, exporte à la place le réseau routier de la carte via tech_openDriveExporter.
---Source : lua/ge/extensions/editor/roadArchitect/openDriveExport.lua:336
function editor_roadArchitect_openDriveExport.export() end

