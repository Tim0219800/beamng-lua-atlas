---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance de waypoint. Champs : pacenote, id, name, waypointType, normal (vec3), pos (vec3), radius, intersectRadius, sortOrder (999999 par défaut), mode (nil ou "manual"), routePoint, originalDistToTarget, staticRoutePoint, staticOriginalDistToTarget.
---@class gameplay_rally_notebook_pacenoteWaypoint
local gameplay_rally_notebook_pacenoteWaypoint = {}

--- Couleur du waypoint selon son type et le mode de dessin : couleurs cs/ce normales, « adjacent » pour 'previous' et 'next', « adjacent_bg » pour 'background'.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:135
---@param pn_drawMode string|nil 'previous', 'next', 'background' ou nil.
---@return table|nil  Couleur {r,g,b} (valeurs 0-1) du module rally/util/colors, nil si type inconnu.
function gameplay_rally_notebook_pacenoteWaypoint:colorForWpType(pn_drawMode) end

--- Dessine le waypoint : sphère de rayon radius (ou radius*radius_factor), texte facultatif et prisme carré figurant le plan de franchissement. En survol, l'opacité est remplacée par les valeurs « hover ».
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:155
---@param hover boolean Waypoint survolé.
---@param text string|nil Texte à afficher.
---@param clr_shape table Couleur {r,g,b} 0-1.
---@param alpha_shape number Opacité de la forme.
---@param alpha_text number Opacité du texte.
---@param clr_text_fg table|nil Couleur du texte.
---@param clr_text_bg table|nil Couleur du fond du texte.
---@param radius_factor number|nil Facteur appliqué au rayon.
---@param globalOpacity number Multiplicateur d'opacité, utilisé en survol.
function gameplay_rally_notebook_pacenoteWaypoint:drawDebug(hover, text, clr_shape, alpha_shape, alpha_text, clr_text_fg, clr_text_bg, radius_factor, globalOpacity) end

--- Dessin du mode reconnaissance : texte de la note au-dessus, plan translucide et trois cylindres formant un portique de 6 m de haut. Le prochain waypoint (i == 1) est plus opaque.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:225
---@param i integer Rang parmi les notes à venir (1 = prochaine).
---@param noteText string Texte à afficher.
function gameplay_rally_notebook_pacenoteWaypoint:drawDebugRecce(i, noteText) end

--- Distance d'origine à la cible du point de route.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:349
---@return number|nil  Distance.
function gameplay_rally_notebook_pacenoteWaypoint:getOriginalDistToTarget() end

--- Renvoie le point de route mémorisé.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:336
---@return table|nil  Point de route.
function gameplay_rally_notebook_pacenoteWaypoint:getRoutePoint() end

--- Distance d'origine à la cible du point de route statique.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:353
---@return number|nil  Distance.
function gameplay_rally_notebook_pacenoteWaypoint:getStaticOriginalDistToTarget() end

--- Renvoie le point de route statique.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:345
---@return table|nil  Point de route.
function gameplay_rally_notebook_pacenoteWaypoint:getStaticRoutePoint() end

--- Constructeur. L'id vient de forceId ou de pacenote:getNextUniqueIdentifier(), le type de pacenote:getNextWaypointType(), le nom par défaut est « Waypoint <id> ».
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:17
---@param pacenote table Pacenote propriétaire.
---@param name string|nil Nom du waypoint.
---@param pos vec3|nil Position.
---@param forceId integer|nil Identifiant imposé (chargement).
function gameplay_rally_notebook_pacenoteWaypoint:init(pacenote, name, pos, forceId) end

--- true si le type est cornerEnd.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:324
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenoteWaypoint:isCe() end

--- true si le type est cornerStart.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:320
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenoteWaypoint:isCs() end

--- true si le type est cornerStart ou cornerEnd.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:307
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenoteWaypoint:isLockable() end

--- true si le waypoint est verrouillable et que la préférence editor_rallyEditor.getPrefLockWaypoints() est active.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:311
---@return boolean  Résultat.
function gameplay_rally_notebook_pacenoteWaypoint:isLocked() end

--- Texte « <nom pacenote>[Cs|Ce] ».
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:357
---@return string  Libellé.
function gameplay_rally_notebook_pacenoteWaypoint:nameWithPacenote() end

--- Restaure type, nom, position, rayon et normale depuis les données sauvegardées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:90
---@param data table Données issues de onSerialize.
---@param oldIdMap table Non utilisé ici.
function gameplay_rally_notebook_pacenoteWaypoint:onDeserialized(data, oldIdMap) end

--- Renvoie la table à écrire en JSON : oldId, name, waypointType, pos, radius, normal (tableaux de 3 nombres).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:79
---@return table  Données sérialisées.
function gameplay_rally_notebook_pacenoteWaypoint:onSerialize() end

--- Passe en mode "manual" et fixe position, rayon et normale.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:59
---@param pos vec3 Position.
---@param radius number Rayon en mètres.
---@param normal vec3 Normale (voir setNormal).
function gameplay_rally_notebook_pacenoteWaypoint:setManual(pos, radius, normal) end

--- Définit la normale, normalisée, si sa longueur dépasse 0.9 ; sinon inchangée.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:70
---@param normal vec3 Direction.
function gameplay_rally_notebook_pacenoteWaypoint:setNormal(normal) end

--- Définit la position (copie du vec3).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:66
---@param newpos vec3 Nouvelle position.
function gameplay_rally_notebook_pacenoteWaypoint:setPos(newpos) end

--- Mémorise le point de route et sa distToTarget d'origine (celle-ci change quand le point devient le premier de la route).
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:328
---@param rp table Point de route (champ distToTarget).
function gameplay_rally_notebook_pacenoteWaypoint:setRoutePoint(rp) end

--- Idem setRoutePoint pour la route statique.
---Source : lua/ge/extensions/gameplay/rally/notebook/pacenoteWaypoint.lua:340
---@param rp table Point de route statique.
function gameplay_rally_notebook_pacenoteWaypoint:setStaticRoutePoint(rp) end

