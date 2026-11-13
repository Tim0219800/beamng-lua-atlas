---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/heroRoadEditor/profile.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Profil en travers d'un groupe du Hero Road Editor. Transforme les paramètres de voie, de bombé (crown) et d'accotement en une coupe 2D par station (décalage latéral o, écart vertical dz par rapport au plan de la ligne centrale) et en un angle de dévers (bank) piloté par la courbure. mesh.lua balaie ces coupes le long de la route pour fabriquer la surface. Gère aussi l'élargissement en courbe, les élargissements posés (laybys, voies, carrefours), les extrémités plates et un plafond anti-repli du bord intérieur.
--- Accès : extension `editor_heroRoadEditor_profile` : `extensions.load("editor_heroRoadEditor_profile")`, puis la globale `editor_heroRoadEditor_profile`
---@class editor_heroRoadEditor_profile
---@field MAT_ROAD string Clé de matériau de bande 'road' (résolue en vrai matériau dans mesh.lua).
---@field MAT_SHOULDER string Clé de matériau de bande 'shoulder'.
editor_heroRoadEditor_profile = {}

--- Construit les coupes par station et le dévers pour le groupe. Chaque coupe est une liste de points {o, dz} de gauche à droite.
---Source : lua/ge/extensions/editor/heroRoadEditor/profile.lua:283
---@param group table Groupe Hero Road (divPoints, tangents, divCurv, discMap, corners, widenings, junctions, paramètres de profil).
---@return table|nil  Tableau sur divPoints de { pts = {{o, dz}, ...}, bank = angle en radians }, ou nil si la géométrie n'est pas prête.
---@return string[]|nil  Clé de matériau par bande (MAT_ROAD ou MAT_SHOULDER), une entrée par segment de coupe.
function editor_heroRoadEditor_profile.build(group) end

--- Plus petit rayon (m) de ligne centrale que le groupe peut arrondir avant que le plafond de repli du bord intérieur ne morde : demi-largeur intérieure (largeur max + accotement + chanfrein + moitié de l'élargissement max) divisée par 0.8, plus 1.5 m de marge.
---Source : lua/ge/extensions/editor/heroRoadEditor/profile.lua:349
---@param group table Groupe Hero Road.
---@return number  Rayon minimal sûr en mètres.
function editor_heroRoadEditor_profile.minSafeRadius(group) end

--- Coupe d'une section droite (bombé complet, sans dévers ni plafond de repli) pour l'aperçu en lecture seule de l'interface.
---Source : lua/ge/extensions/editor/heroRoadEditor/profile.lua:360
---@param group table Groupe Hero Road.
---@return table  Liste de points {o, dz}.
---@return string[]  Matériau par bande.
function editor_heroRoadEditor_profile.previewCrossSection(group) end

