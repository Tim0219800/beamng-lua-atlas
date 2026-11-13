---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/import.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Import de DecalRoads existants dans un nouveau groupe Hero Road. À partir d'une sélection de DecalRoad (ou d'un polygone de sélection), le module estime une ligne centrale de référence (milieu des bords gauche/droit trouvés par recherche exponentielle puis dichotomie à partir de la plus longue route), crée un groupe 'Import N' avec ces nœuds simplifiés (RDP) et transforme chaque DecalRoad en calque (matériau, priorité de rendu, largeur, position latérale normalisée, inversion, fondus). Les DecalRoad utilisés sont supprimés, avec commit d'annulation/rétablissement.
--- Accès : extension `editor_heroRoadEditor_import` : `extensions.load("editor_heroRoadEditor_import")`, puis la globale `editor_heroRoadEditor_import`
---@class editor_heroRoadEditor_import
editor_heroRoadEditor_import = {}

--- Cherche tous les DecalRoad dont au moins un nœud est dans le polygone, puis appelle importSelectedIntoNewGroup avec eux.
---Source : lua/ge/extensions/editor/heroRoadEditor/import.lua:426
---@param polygon table Polygone de sélection (liste de points) accepté par vec3:inPolygon.
function editor_heroRoadEditor_import.importFromPolygon(polygon) end

--- Importe les DecalRoad donnés dans un nouveau groupe Hero Road : calcule la spline de référence, crée le groupe, génère les calques, supprime les DecalRoad (et leurs groupes parents devenus vides) et enregistre l'action 'Import DecalRoads into Hero Road' dans l'historique. Ne fait rien si la liste est vide.
---Source : lua/ge/extensions/editor/heroRoadEditor/import.lua:351
---@param decalRoads table Tableau d'objets DecalRoad de la scène.
function editor_heroRoadEditor_import.importSelectedIntoNewGroup(decalRoads) end

