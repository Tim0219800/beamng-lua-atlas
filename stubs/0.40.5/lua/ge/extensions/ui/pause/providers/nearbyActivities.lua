---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/pause/providers/nearbyActivities.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Fournisseur du menu pause pour la section « activités à proximité ». Il lit les points d'intérêt de la grande carte (freeroam_vueBigMap.getPoiData) et les POI bruts du niveau (gameplay_rawPois), calcule la distance au joueur (position caméra, rayon du marqueur déduit), puis retient jusqu'à 6 éléments : 2 plus proches, 2 de distance moyenne et le reste au hasard, triés par distance. Chaque élément porte deux boutons : voir sur la carte et définir un itinéraire.
--- Accès : extension `ui_pause_providers_nearbyActivities` : `extensions.load("ui_pause_providers_nearbyActivities")`, puis la globale `ui_pause_providers_nearbyActivities`
---@class ui_pause_providers_nearbyActivities
ui_pause_providers_nearbyActivities = {}

--- Exécute le bouton (voir/itinéraire) identifié par buttonId. Renvoie false si buttonId est nil.
---Source : lua/ge/extensions/ui/pause/providers/nearbyActivities.lua:88
---@param buttonId any buttonId présent dans items[].actions.view / .route.
---@param payload any Données transmises au callback du bouton.
---@return any  Résultat du bouton (true/false).
function ui_pause_providers_nearbyActivities.executeNearbyActivityAction(buttonId, payload) end

--- Construit les données de la section : {mode, sections = {{id = "nearbyActivities", title, items}}}. Chaque item contient id, title, icon, description (type de POI traduit), actionLabel, poiType, distanceM (m, arrondi) et actions {view, route}.
---Source : lua/ge/extensions/ui/pause/providers/nearbyActivities.lua:250
---@param context table|nil Champs lus : mode (défaut "freeroam") et isBigMapAllowed.
---@return table  Données de section pour l'UI pause.
function ui_pause_providers_nearbyActivities.getData(context) end

