---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/terraform/fetchSources.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Récupère les 'sources' que l'outil Terraform sait suivre : routes MeshRoad de la scène, routes RAT (Road Architect), splines mesh, splines d'assemblage et Master Splines. Chaque source est une liste de points {pos = vec3, width = largeur, binormal = vec3 unitaire latéral}. Quand une route entre et sort du polygone, elle est découpée et seules les parties intérieures sont renvoyées comme sources séparées. Les splines sont lissées par Catmull-Rom (centripète pour les splines mesh/assemblage) avec 10 points par segment. Consommé par editor_terraformTool et editor/terraform/terraform.
--- Accès : extension `editor_terraform_fetchSources` : `extensions.load("editor_terraform_fetchSources")`, puis la globale `editor_terraform_fetchSources`
---@class editor_terraform_fetchSources
editor_terraform_fetchSources = {}

--- Renvoie toutes les sources supportées dans le polygone (MeshRoad, routes RAT, splines mesh, splines d'assemblage, Master Splines). Une route qui traverse le bord est découpée ; seules ses parties intérieures sont gardées, comme sources séparées.
---Source : lua/ge/extensions/editor/terraform/fetchSources.lua:245
---@param polygon table Liste de points 2D/3D du polygone (déduit du code : passée à geom.getAABB et geom.getNodeSpansInsidePolygon).
---@return table  Liste de sources ; chaque source est une liste de {pos, width, binormal}.
function editor_terraform_fetchSources.getAllSourcesInPolygon(polygon) end

--- Renvoie les sources construites à partir des objets MeshRoad actuellement sélectionnés dans l'éditeur (editor.selection.object).
---Source : lua/ge/extensions/editor/terraform/fetchSources.lua:287
---@return table  Liste de sources (une par MeshRoad sélectionnée).
function editor_terraform_fetchSources.getAllSourcesInSelection() end

