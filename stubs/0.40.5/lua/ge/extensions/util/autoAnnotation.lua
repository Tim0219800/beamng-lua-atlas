---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/autoAnnotation.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil d'éditeur de niveau : parcourt récursivement l'arbre de scène (MissionGroup) et le jeu de données des objets de forêt (ForestItemDataSet) pour poser automatiquement un champ d'annotation (catégorie sémantique, mode 'Override') sur les objets qui n'en ont pas. Les catégories sont devinées d'après le nom du fichier de forme (TSStatic, ForestItemData) ou le nom du GroundCover.
--- Accès : extension `util_autoAnnotation` : `extensions.load("util_autoAnnotation")`, puis la globale `util_autoAnnotation`
---@class util_autoAnnotation
util_autoAnnotation = {}

--- Annote les données d'objets de forêt (ForestItemDataSet).
---Source : lua/ge/extensions/util/autoAnnotation.lua:132
function util_autoAnnotation.autoAnnotateGroups() end

--- Annote le niveau entier : arbre de scène puis jeu de données de forêt.
---Source : lua/ge/extensions/util/autoAnnotation.lua:137
function util_autoAnnotation.autoAnnotateLevel() end

--- Annote tout l'arbre de scène à partir de MissionGroup. Logue une erreur et s'arrête si MissionGroup est introuvable.
---Source : lua/ge/extensions/util/autoAnnotation.lua:121
function util_autoAnnotation.autoAnnotateScenetree() end

--- Hook d'initialisation sans effet (corps vide).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/autoAnnotation.lua:118
function util_autoAnnotation.onInit() end

--- Table interne de visiteurs 'visit<Classe>' appelés selon la classe de chaque nœud. Les visiteurs de TSStatic et ForestItemData posent l'annotation d'après shapeName ; ceux de SFXSpace, SFXEmitter, PointLight, SpotLight ne font rien.
---@class util_autoAnnotation_visitors
local util_autoAnnotation_visitors = {}

--- Visite chaque élément d'une forêt (Forest) et annote les données de ses items.
---Source : lua/ge/extensions/util/autoAnnotation.lua:94
---@param parent userdata Nœud parent.
---@param node userdata Objet Forest.
function util_autoAnnotation_visitors.visitForest(parent, node) end

--- Annote un GroundCover sans annotation d'après son nom (NATURE par défaut).
---Source : lua/ge/extensions/util/autoAnnotation.lua:102
---@param parent userdata Nœud parent.
---@param node userdata Objet GroundCover.
function util_autoAnnotation_visitors.visitGroundCover(parent, node) end

