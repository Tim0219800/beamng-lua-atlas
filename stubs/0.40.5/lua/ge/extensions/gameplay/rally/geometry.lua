---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/geometry.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Prototype de génération automatique de notes de rallye à partir de la géométrie de la route. Quand un marqueur de route (ground marker) est actif, il calcule une trajectoire optimisée entre départ et arrivée (map.optimizePath), la sauvegarde dans temp/, puis estime pour chaque nœud le rayon de courbure, la vitesse de passage (pneus slick, frottement 1,7) et une sévérité (Hairpin, Medium, Fast, Easy, Flat, Straight), regroupe les nœuds en notes (ex. 'Medium left long tightens') et les dessine avec debugDrawer. Pendant la conduite, il affiche les notes à venir et envoie le texte à l'UI via guihooks 'ScenarioRealtimeDisplay'. Sans marqueur, il recharge la dernière route sauvegardée.
--- Accès : extension `gameplay_rally_geometry` : `extensions.load("gameplay_rally_geometry")`, puis la globale `gameplay_rally_geometry`
---@class gameplay_rally_geometry
gameplay_rally_geometry = {}

--- Hook appelé à chaque frame. (Re)génère les notes si la source change (marqueur de route actif ou cache fichier), puis lit la position et la vitesse du véhicule joueur et dessine les notes : toutes si le véhicule est à l'arrêt, sinon les notes des 4 prochaines secondes (au moins 2), et envoie la 2e note (si ce n'est pas une ligne droite) au message d'UI ScenarioRealtimeDisplay.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/geometry.lua:502
---@param dt number Delta de temps réel (s).
---@param dtSim number Delta de temps de simulation (s) ; inférieur à 0,001 = jeu en pause (affiche alors le détail des nœuds).
function gameplay_rally_geometry.onUpdate(dt, dtSim) end

