---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/instancedLineRenderDemo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Démo technique du dessin de lignes « instanciées » du debugDrawer (drawLineInstance, drawDot), qui permettent des lignes épaisses avec contour et extrémités arrondies. Une fois chargée, l'extension lance une simulation de 6 masses en attraction (inspirée d'un n-body JavaScript) et dessine chaque frame leurs trajectoires à 3 m de haut au-dessus de l'origine, deux fois : sans test de profondeur et avec (décalé de 5 m en X). Les autres démos (grille, sinusoïdes, bords, feu tricolore) sont du code mort commenté dans onPreRender.
--- Accès : extension `util_instancedLineRenderDemo` : `extensions.load("util_instancedLineRenderDemo")`, puis la globale `util_instancedLineRenderDemo`
---@class util_instancedLineRenderDemo
util_instancedLineRenderDemo = {}

--- Appelé au chargement de l'extension : initialise les masses de la simulation (startSim).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/instancedLineRenderDemo.lua:240
function util_instancedLineRenderDemo.onExtensionLoaded() end

--- Hook appelé chaque frame avant le rendu. Avance le temps de la démo, fait un pas de simulation et dessine les trajectoires (sans puis avec profondeur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/instancedLineRenderDemo.lua:222
---@param dtReal number Delta de temps réel en secondes
---@param dtSim number Delta de temps de simulation en secondes (utilisé par la démo)
---@param dtRaw number Delta de temps brut (non utilisé)
function util_instancedLineRenderDemo.onPreRender(dtReal, dtSim, dtRaw) end

