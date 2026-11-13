---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/curveWiden.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Élargissement de chaussée dans les virages pour les routes « engineered » des outils de route de l'éditeur. Calcule, par station de la ligne centrale (group.divPoints), un élargissement automatique selon la courbure soutenue (plus le virage est serré par rapport au rayon de conception group.engRadiusM, plus la route s'élargit, jusqu'à curveWidenMaxM) auquel s'ajoutent les extraWidenM par virage. Tout est lissé sur une distance physique (longueur d'arc), pas sur un nombre de stations.
--- Accès : extension `editor_toolUtilities_curveWiden` : `extensions.load("editor_toolUtilities_curveWiden")`, puis la globale `editor_toolUtilities_curveWiden`
---@class editor_toolUtilities_curveWiden
---@field DEFAULT_MAX number Élargissement maximal par défaut (2.5 m au total, répartis sur les deux côtés).
---@field DEFAULT_RUNOFF number Longueur par défaut (20 m) sur laquelle l'élargissement entre/sort.
editor_toolUtilities_curveWiden = {}

--- Ajoute l'élargissement par station à group.divWidths en place (à appeler une fois par passe 'dirty', juste après l'échantillonnage des largeurs de base). Pour les outils dont le mesh est symétrique selon divWidths, cela élargit le bitume lui-même ; heroRoad élargit son mesh séparément et ne s'en sert que pour déplacer marquages/ruban. Sans effet si rien ne s'élargit.
---Source : lua/ge/extensions/editor/toolUtilities/curveWiden.lua:161
---@param group table Groupe avec divPoints et divWidths.
function editor_toolUtilities_curveWiden.applyDivWidthWiden(group) end

--- Longueur d'arc cumulée le long des divPoints (s[1] = 0), en 3D. Sert à exprimer le runoff en vraie distance.
---Source : lua/ge/extensions/editor/toolUtilities/curveWiden.lua:44
---@param div table Points {x,y,z}
---@param n integer Nombre de points
---@return number[]  Tableau s des longueurs cumulées (m).
function editor_toolUtilities_curveWiden.arcLengths(div, n) end

--- Élargissement réel par station sur chaque bord (gauche et droit par rapport au sens de marche) : chaque voie prend le « offtracking » du véhicule de conception sur le rayon soutenu, R - sqrt(R^2 - L^2) avec L = 6 m, supprimé sous 0.3 m, le tout plafonné à curveWidenMaxM. Va sur le bord intérieur du virage ; une route à chaussées séparées élargit chaque chaussée sur son bord extérieur (le terre-plein n'a pas de place).
---Source : lua/ge/extensions/editor/toolUtilities/curveWiden.lua:175
---@param group table Groupe/route.
---@param div table divPoints
---@param s number[] Longueurs d'arc
---@param n integer Nombre de stations
---@param lanesL number Nombre de voies à gauche
---@param lanesR number Nombre de voies à droite
---@param divided boolean true si chaussées séparées
---@return number[]  Élargissement du bord gauche par station (m)
---@return number[]  Élargissement du bord droit par station (m)
function editor_toolUtilities_curveWiden.edgeWiden(group, div, s, n, lanesL, lanesR, divided) end

--- Courbure horizontale signée à la station i (0 aux extrémités ou si dégénérée). Positif = virage à gauche, négatif = à droite.
---Source : lua/ge/extensions/editor/toolUtilities/curveWiden.lua:28
---@param div table Points de la ligne centrale {x,y,z}
---@param i integer Indice de station
---@param n integer Nombre de stations
---@return number  Courbure en 1/m.
function editor_toolUtilities_curveWiden.signedCurvatureAt(div, i, n) end

--- Lisse en place un tableau signé par moyenne en boîte sur une demi-fenêtre physique hw (m), chaque échantillon étant pondéré par la longueur d'arc qu'il représente. Évite que la zone dense d'un virage domine la moyenne et crée un décrochement latéral à la jonction droite/arc.
---Source : lua/ge/extensions/editor/toolUtilities/curveWiden.lua:62
---@param arr number[] Valeurs à lisser (modifié en place)
---@param s number[] Table de longueurs d'arc
---@param n integer Nombre d'échantillons
---@param hw number Demi-fenêtre en mètres ; sans effet si <= 0 ou n < 3
function editor_toolUtilities_curveWiden.smoothByDistance(arr, s, n, hw) end

--- Élargissement TOTAL par station (m, réparti sur les deux côtés) : élargissement automatique de courbure plus extraWidenM par virage, lissé en longueur d'arc. Zéro en ligne droite, si curveWidenMaxM = 0 sans surcharge de virage, et hors mode engineered.
---Source : lua/ge/extensions/editor/toolUtilities/curveWiden.lua:125
---@param group table Groupe/route (geometryMode, curveWidenMaxM, curveWidenRunoffM, engRadiusM, divCurv, discMap, corners).
---@param div table divPoints
---@param s number[] Résultat de arcLengths
---@param n integer Nombre de stations
---@return number[]  Élargissement par station (m).
function editor_toolUtilities_curveWiden.stationWiden(group, div, s, n) end

