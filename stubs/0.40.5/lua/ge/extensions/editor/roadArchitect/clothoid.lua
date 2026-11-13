---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/roadArchitect/clothoid.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Évaluation de clothoïdes (spirales d'Euler, courbure variant linéairement avec l'abscisse) pour Road Architect. Le code est largement basé sur la bibliothèque Clothoids d'Enrico Bertolazzi et Marco Frego (licence BSD, copyright 2024 Bertolazzi, Frego et BeamNG) : les intégrales de Fresnel généralisées sont calculées en interne (fresnelCS, evalXYaSmall, evalXYaLarge, generalizedFresnelCS). Un moddeur s'en sert pour obtenir des points sur une courbe de raccordement progressive (routes, jonctions).
--- Accès : extension `editor_roadArchitect_clothoid` : `extensions.load("editor_roadArchitect_clothoid")`, puis la globale `editor_roadArchitect_clothoid`
---@class editor_roadArchitect_clothoid
editor_roadArchitect_clothoid = {}

--- Évalue une clothoïde au paramètre p (longueur d'arc, de 0 à la longueur géodésique totale) : calcule l'intégrale de Fresnel généralisée avec a = dKappa·p², b = kappa·p et c = theta0, puis renvoie start + p·(C, S).
---Source : lua/ge/extensions/editor/roadArchitect/clothoid.lua:296
---@param start vec3 Point de départ de la spirale (seuls x et y sont utilisés).
---@param theta0 number Cap initial en radians.
---@param kappa number Courbure initiale (1/m).
---@param dKappa number Taux de variation de la courbure par unité de longueur (1/m²).
---@param p number Abscisse curviligne à évaluer, entre 0 et la longueur de la spirale.
---@return vec3  Position (x, y) du point sur la clothoïde, z à 0.
function editor_roadArchitect_clothoid.evaluate(start, theta0, kappa, dKappa, p) end

