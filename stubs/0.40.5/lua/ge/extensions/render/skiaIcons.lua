---@meta
-- tim19Atlas stub generated from lua/ge/extensions/render/skiaIcons.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Icônes 3D (billboards Skia tournés vers la caméra) pour marquer des positions du monde : missions, stations, marqueurs de course. Chaque icône est dessinée avec la police bngIcons en quatre couches (contour de la forme, remplissage, liseré du motif, motif). Les icônes de même apparence partagent un pool de billboards : en libérer une la range pour la prochaine du même style au lieu de refaire une texture. Un moddeur appelle getIcon, puis update à chaque image, et release à la fin.
--- Accès : extension `render_skiaIcons` : `extensions.load("render_skiaIcons")`, puis la globale `render_skiaIcons`
---@class render_skiaIcons
render_skiaIcons = {}

--- Ouvre un de ces dossiers dans l'explorateur de fichiers du système (confort de développement).
---Source : lua/ge/extensions/render/skiaIcons.lua:568
---@param which string 'presets', 'font', ou un chemin.
---@return string|nil  Chemin ouvert, ou nil si la plateforme ne sait pas l'ouvrir.
function render_skiaIcons.exploreFolder(which) end

--- Renvoie la table des couleurs nommées de la config d'icônes.
---Source : lua/ge/extensions/render/skiaIcons.lua:604
---@return table<string, string>  Nom de couleur vers valeur (format de la config).
function render_skiaIcons.getColors() end

--- Dossiers lus par le système : presets (/art/skiaIcons) et font.
---Source : lua/ge/extensions/render/skiaIcons.lua:562
---@return table<string, string>  {presets = ..., font = ...}.
function render_skiaIcons.getFolders() end

--- Renvoie une icône pour un nom de preset, une table de spec, ou un preset avec surcharges (spec.preset plus champs). Si le style ne peut pas être construit, renvoie une icône déjà morte (isLive faux).
---Source : lua/ge/extensions/render/skiaIcons.lua:476
---@param spec string|table Nom de preset ou table de spec (voir notes).
---@param pos vec3|nil Position monde. Si fournie, l'icône est construite et placée tout de suite ; sinon au premier update.
---@return Icon  Objet icône avec update, setPos, setScale, setVisible, visibility, isLive, release.
function render_skiaIcons.getIcon(spec, pos) end

--- Liste triée de tous les noms de motifs (glyphes de bngIcons).
---Source : lua/ge/extensions/render/skiaIcons.lua:553
---@return string[]  Noms de motifs utilisables dans spec.motive.
function render_skiaIcons.getMotives() end

--- Renvoie la table des presets (nom -> spec) chargée depuis /art/skiaIcons/*.skiaIcon.json (champ 'presets').
---Source : lua/ge/extensions/render/skiaIcons.lua:174
---@return table<string, table>  Presets.
function render_skiaIcons.getPresets() end

--- Liste triée des noms de formes disponibles.
---Source : lua/ge/extensions/render/skiaIcons.lua:605
---@return string[]  Noms de formes utilisables dans spec.shape.
function render_skiaIcons.getShapes() end

--- Statistiques du pool pour le débogage.
---Source : lua/ge/extensions/render/skiaIcons.lua:575
---@return table  {live, looks, pooled, created, reused, destroyed, hasRenderer}.
function render_skiaIcons.getStats() end

--- Hook de fin de mission : la scène et son renderer sont perdus, tous les identifiants de billboards sont invalidés et les pools vidés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/skiaIcons.lua:544
function render_skiaIcons.onClientEndMission() end

--- Hook appelé au chargement de l'extension : supprime un renderer 'skiaIconBillboards' laissé par une VM Lua précédente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/skiaIcons.lua:589
function render_skiaIcons.onExtensionLoaded() end

--- Hook appelé au déchargement : identique à reload().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/render/skiaIcons.lua:525
function render_skiaIcons.onExtensionUnloaded() end

--- Relit la config partagée, la table de glyphes et les presets depuis le disque. Supprime le renderer (toutes les textures) ; les icônes vivantes se reconstruisent à leur prochain update.
---Source : lua/ge/extensions/render/skiaIcons.lua:525
---@return boolean  true si la config a pu être relue.
function render_skiaIcons.reload() end

--- Oublie les presets chargés pour que le prochain getIcon relise les fichiers *.skiaIcon.json. Plus léger que reload : les textures déjà construites sont conservées.
---Source : lua/ge/extensions/render/skiaIcons.lua:539
function render_skiaIcons.reloadPresets() end

--- Calcule la hauteur monde d'une icône qui se comporte comme un objet réel en distance moyenne mais reste bornée à l'écran : jamais sous minScreen (lisible de loin), jamais au-dessus de maxScreen (n'envahit pas la vue de près). Bornes exprimées en fraction de la hauteur de l'écran ; des bornes égales donnent une taille constante à l'écran. Utilise la caméra core_camera ; sans caméra, renvoie worldSize.
---Source : lua/ge/extensions/render/skiaIcons.lua:508
---@param pos vec3 Position de l'icône.
---@param worldSize number Hauteur en mètres dans la plage intermédiaire.
---@param minScreen number|nil Fraction minimale de la hauteur d'écran (défaut 0).
---@param maxScreen number|nil Fraction maximale de la hauteur d'écran (défaut 1).
---@return number  Hauteur monde à passer à Icon:update.
function render_skiaIcons.screenBoundedScale(pos, worldSize, minScreen, maxScreen) end

--- Poignée d'icône renvoyée par getIcon. Chaque méthode d'état renvoie l'icône elle-même (sauf isLive, visibility, release).
---@class render_skiaIcons_Icon
local render_skiaIcons_Icon = {}

--- Faux si l'icône n'a pas de billboard : libérée, style impossible à construire, ou pas de renderer.
---Source : lua/ge/extensions/render/skiaIcons.lua:450
---@return boolean  État.
function render_skiaIcons_Icon:isLive() end

--- Range le billboard dans le pool pour une icône du même style. La poignée est inutilisable ensuite.
---Source : lua/ge/extensions/render/skiaIcons.lua:454
function render_skiaIcons_Icon:release() end

--- Raccourci pour update(pos, nil, nil).
---Source : lua/ge/extensions/render/skiaIcons.lua:431
---@param pos vec3 Nouvelle position.
---@return Icon  L'icône.
function render_skiaIcons_Icon:setPos(pos) end

--- Raccourci pour update(nil, scale, nil).
---Source : lua/ge/extensions/render/skiaIcons.lua:432
---@param scale number Nouvelle hauteur monde en mètres.
---@return Icon  L'icône.
function render_skiaIcons_Icon:setScale(scale) end

--- Affiche ou masque l'icône avec fondu. Avec instant, saute le fondu et pousse le résultat tout de suite (utile pour un marqueur caché qu'on ne met plus à jour).
---Source : lua/ge/extensions/render/skiaIcons.lua:436
---@param visible boolean true pour visible.
---@param instant boolean|nil true pour supprimer le fondu.
---@return Icon  L'icône.
function render_skiaIcons_Icon:setVisible(visible, instant) end

--- S'assure que l'icône possède un billboard de son apparence actuelle : reconstruit après reload ou après la perte de la scène, récupère un billboard du pool ou en crée un.
---Source : lua/ge/extensions/render/skiaIcons.lua:369
---@return number|nil  Identifiant du billboard, ou nil si rien à dessiner.
function render_skiaIcons_Icon:sync() end

--- Appel par image. pos et scale gardent leur valeur actuelle quand ils sont nil ; dt fait avancer le fondu de visibilité (nil ou 0 le laisse en place).
---Source : lua/ge/extensions/render/skiaIcons.lua:405
---@param pos vec3|nil Position monde.
---@param scale number|nil Hauteur monde en mètres.
---@param dt number|nil Durée de l'image en secondes.
---@return Icon  L'icône.
function render_skiaIcons_Icon:update(pos, scale, dt) end

--- Avancement actuel du fondu entre 0 et 1, pour caler d'autres éléments visuels dessus.
---Source : lua/ge/extensions/render/skiaIcons.lua:446
---@return number  0 à 1.
function render_skiaIcons_Icon:visibility() end

