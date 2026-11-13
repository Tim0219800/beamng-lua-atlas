---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/triLive.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Compteur de triangles réellement dessinés par un « kit » (pièces instanciées), vu depuis la caméra : chaque instance est comptée au LOD qu'elle dessine vraiment, moins celles hors écran. Sert au pied de page statsFooter. Garde une seule réponse à la fois (l'éditeur n'a qu'un mode d'édition). Les échelles de LOD mesurées, coûteuses, sont partagées et mises en cache sur disque dans /temp/massingEditor/shapeLods.json (avec la date de modification du fichier de forme).
--- Accès : extension `editor_toolUtilities_triLive` : `extensions.load("editor_toolUtilities_triLive")`, puis la globale `editor_toolUtilities_triLive`
---@class editor_toolUtilities_triLive
editor_toolUtilities_triLive = {}

--- Dernier résultat : triangles instanciés dessinés, distance au centroïde des instances (m), instances dessinées, instances placées, formes restant à scanner.
---Source : lua/ge/extensions/editor/toolUtilities/triLive.lua:254
---@return number  Triangles dessinés.
---@return number  Distance au centroïde (m).
---@return integer  Instances dessinées.
---@return integer  Instances placées.
---@return integer  Formes encore à scanner.
function editor_toolUtilities_triLive.get() end

--- Met en file les formes de `instances` jamais mesurées (ou dont le fichier a changé). Assez peu coûteux pour être appelé à chaque reconstruction.
---Source : lua/ge/extensions/editor/toolUtilities/triLive.lua:130
---@param instances table Liste d'entrées avec champ shape.
function editor_toolUtilities_triLive.note(instances) end

--- Vide le cache de mesures, les rayons, la file et les échecs : « tout réessayer ». Le cache sera réécrit.
---Source : lua/ge/extensions/editor/toolUtilities/triLive.lua:258
function editor_toolUtilities_triLive.rescan() end

--- Mesure UNE forme par appel (échelle de LOD), appelé depuis la frame de l'éditeur pour que le scan à froid apparaisse comme une progression et non comme un gel. Sauvegarde le cache quand la file est vide.
---Source : lua/ge/extensions/editor/toolUtilities/triLive.lua:148
---@return boolean  Vrai si une forme a été traitée.
function editor_toolUtilities_triLive.scanStep() end

--- Calcule le total de triangles instanciés à l'écran et la distance caméra - centroïde des instances. Limité en fréquence et découpé en tranches de 10000 instances par frame.
---Source : lua/ge/extensions/editor/toolUtilities/triLive.lua:197
---@param instances table Liste d'entrées { shape, px, py, pz }.
function editor_toolUtilities_triLive.update(instances) end

