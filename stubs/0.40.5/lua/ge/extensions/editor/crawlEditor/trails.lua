---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/trails.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de l'outil. Champs : currentTab ("paths" par défaut), trail (trail édité), snapToTerrain (true), buffers ImGui (name, fileName, description, rules, thumbnail, preview, missionName, pathReversed, isFromMission).
---@class editor_crawlEditor_trails
local editor_crawlEditor_trails = {}

--- Ne fait rien (aucune sélection à effacer pour les trails).
---Source : lua/ge/extensions/editor/crawlEditor/trails.lua:563
function editor_crawlEditor_trails:clearSelection() end

--- Dessine la sphère de zone (vert translucide) et l'icône (rouge) de la position de départ référencée par le trail, avec étiquettes.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/trails.lua:577
---@param mouseInfo table infos souris
function editor_crawlEditor_trails:draw(mouseInfo) end

--- Dessine le panneau de détail du trail : boutons Goto (caméra vers la position de départ ou le premier nœud du chemin) et Test From Start, champs, sélecteurs de miniature/aperçu, références chemin/frontière/positions, prefabs, règles.
---Source : lua/ge/extensions/editor/crawlEditor/trails.lua:150
---@param trail table trail affiché
function editor_crawlEditor_trails:drawTrailDetail(trail) end

--- Dessine le bouton « Add Trail » et la liste sélectionnable ; le clic droit propose Delete (efface aussi le fichier du trail).
---Source : lua/ge/extensions/editor/crawlEditor/trails.lua:95
---@param allTrails table[] tous les trails (modifiée en place)
---@param selection table {index, clicked}
function editor_crawlEditor_trails:drawTrailsList(allTrails, selection) end

--- Crée un trail par défaut (nom « New Trail », références vides, pathReversed false, prefabs vide, règles par défaut, métadonnées version "1.0").
---Source : lua/ge/extensions/editor/crawlEditor/trails.lua:534
---@return table  nouveau trail
function editor_crawlEditor_trails:getNewTrail() end

--- Liste les fichiers *.prefab.json du dossier /levels/<niveau>/crawls/ du niveau courant.
---Source : lua/ge/extensions/editor/crawlEditor/trails.lua:77
---@return string[]  chemins de fichiers (vide si aucun niveau)
function editor_crawlEditor_trails:getPrefabFiles() end

--- Initialise l'onglet courant à "paths", aucun trail sélectionné, snapToTerrain = true.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/trails.lua:71
function editor_crawlEditor_trails:init() end

--- Gestion de la souris : vide pour les trails.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/trails.lua:571
---@param mouseInfo table infos souris (inutilisé)
function editor_crawlEditor_trails:input(mouseInfo) end

--- Mémorise l'onglet courant de l'éditeur.
---Source : lua/ge/extensions/editor/crawlEditor/trails.lua:567
---@param tab string nom d'onglet
function editor_crawlEditor_trails:setCurrentTab(tab) end

--- Remplit les buffers ImGui à partir du trail.
---Source : lua/ge/extensions/editor/crawlEditor/trails.lua:138
---@param trail table trail
function editor_crawlEditor_trails:setFields(trail) end

--- Définit le trail en cours d'édition.
---Source : lua/ge/extensions/editor/crawlEditor/trails.lua:559
---@param trailParam table|nil trail
function editor_crawlEditor_trails:setTrail(trailParam) end

