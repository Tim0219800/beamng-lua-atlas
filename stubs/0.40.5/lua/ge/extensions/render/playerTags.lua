---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/playerTags.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Étiquettes de nom flottantes au-dessus des véhicules des joueurs (multi-sièges et écran partagé). Utilise le système de billboards Skia (objet WorldBillboardRenderer enregistré « playerNameTags » dans MissionGroup) : chaque étiquette est une texture statique issue d'un modèle `.sktemplate.json`, teintée à la couleur du joueur, tournée vers la caméra, qui suit la voiture, grossit avec la distance (jusqu'à un plafond) et disparaît au-delà de 40 m. Piloté par core_multiseat (rebuild, updatePositions, reset…). Global : render_playerTags.
--- Accès : extension `render_playerTags` : `extensions.load("render_playerTags")`, puis la globale `render_playerTags`
---@class render_playerTags
render_playerTags = {}

--- Réaffiche tous les joueurs masqués.
---Source : lua/ge/extensions/render/playerTags.lua:286
function render_playerTags.clearHiddenPlayers() end

--- Supprime les couleurs imposées et reconstruit.
---Source : lua/ge/extensions/render/playerTags.lua:298
function render_playerTags.clearPlayerColorOverrides() end

--- Détruit toutes les étiquettes (billboards) en cours et vide l'état local, en laissant le renderer en place.
---Source : lua/ge/extensions/render/playerTags.lua:186
function render_playerTags.destroy() end

--- Indique s'il existe au moins une étiquette.
---Source : lua/ge/extensions/render/playerTags.lua:208
---@return boolean  true si des étiquettes sont actives.
function render_playerTags.hasTags() end

--- Indique si le renderer de billboards existe dans la scène.
---Source : lua/ge/extensions/render/playerTags.lua:204
---@return boolean  true si l'objet playerNameTags existe.
function render_playerTags.isLive() end

--- Alias de reset appelé au déchargement de l'extension. (assignée dynamiquement)
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/playerTags.lua:dyn
function render_playerTags.onExtensionUnloaded() end

--- Hook de changement de véhicule : met à jour le véhicule suivi des étiquettes du joueur ; l'étiquette du joueur qui regarde est affichée 3 s.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/playerTags.lua:304
---@param oldId integer Ancien véhicule.
---@param newId integer Nouveau véhicule.
---@param player integer Joueur.
function render_playerTags.onVehicleSwitched(oldId, newId, player) end

--- Reconstruit toutes les étiquettes : mémorise la demande (pour reload et surcharges de couleur), détruit les anciennes, crée le renderer au besoin puis un billboard par entrée en conservant l'état de lissage précédent.
---Source : lua/ge/extensions/render/playerTags.lua:212
---@param tags table[] Liste d'entrées {player, label, color, icon?, key?, perspectivePlayer?, hideInViews?}.
---@param templateName string|nil 'default' ou 'multiseat'.
---@return boolean  false si tags n'est pas une table ou si le renderer n'a pas pu être créé.
function render_playerTags.rebuild(tags, templateName) end

--- Vide les caches de modèles et de chemins d'icônes SVG puis reconstruit les dernières étiquettes demandées (utile pour mettre au point un .sktemplate.json).
---Source : lua/ge/extensions/render/playerTags.lua:273
---@return boolean  false s'il n'y a rien à reconstruire.
function render_playerTags.reload() end

--- Détruit les étiquettes, oublie la référence au renderer et efface joueurs masqués et surcharges de couleur. À appeler avant un rechargement Lua/GE qui détruit l'objet C++ ; aussi onExtensionUnloaded.
---Source : lua/ge/extensions/render/playerTags.lua:196
function render_playerTags.reset() end

--- Impose une couleur à un joueur et reconstruit les étiquettes.
---Source : lua/ge/extensions/render/playerTags.lua:291
---@param player integer Joueur.
---@param color table {r,g,b} entre 0 et 1.
function render_playerTags.setPlayerColorOverride(player, color) end

--- Masque ou affiche l'étiquette d'un joueur.
---Source : lua/ge/extensions/render/playerTags.lua:280
---@param player integer Joueur.
---@param hidden boolean true pour masquer.
function render_playerTags.setPlayerHidden(player, hidden) end

--- À appeler chaque frame : calcule position, échelle (lissée) et visibilité de chaque étiquette (regroupement par véhicule, empilement, distance à la caméra du joueur) et appelle WorldBillboardRenderer:update.
---Source : lua/ge/extensions/render/playerTags.lua:473
---@param dt number Durée de la frame (s).
function render_playerTags.updatePositions(dt) end

