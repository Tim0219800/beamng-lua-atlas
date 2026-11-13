---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadSpline/import.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Import de DecalRoads existants dans l'outil Road Spline. Estime une ligne centrale de référence (nœuds, largeurs, normales) à partir des routes choisies en cherchant leurs bords (recherche exponentielle puis dichotomie, jusqu'à 50 m latéralement), simplifie par RDP, crée un nouveau groupe Road Spline « Import N » et recrée les routes d'origine sous forme de couches relatives à cette ligne. Les DecalRoads source sont ensuite supprimés (undo possible).
--- Accès : extension `editor_roadSpline_import` : `extensions.load("editor_roadSpline_import")`, puis la globale `editor_roadSpline_import`
---@class editor_roadSpline_import
editor_roadSpline_import = {}

--- Importe tous les DecalRoads dont au moins un nœud se trouve dans le polygone, puis appelle importSelectedIntoNewGroup avec eux.
---Source : lua/ge/extensions/editor/roadSpline/import.lua:425
---@param polygon table Polygone de sélection (liste de points) tracé par l'utilisateur.
function editor_roadSpline_import.importFromPolygon(polygon) end

--- Convertit les DecalRoads donnés en un nouveau groupe Road Spline : calcule la spline de référence, crée le groupe, génère les couches, supprime les DecalRoads (et leurs groupes de scène devenus vides) et enregistre une action d'annulation. Retourne sans rien faire si la liste est vide.
---Source : lua/ge/extensions/editor/roadSpline/import.lua:351
---@param decalRoads table Liste d'objets DecalRoad (scenetree), par ex. la sélection de l'éditeur.
function editor_roadSpline_import.importSelectedIntoNewGroup(decalRoads) end

