---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/photomode/overlays.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestion des « overlays » du mode photo : des superpositions d'images (cadres, filigranes, applis UI) décrites par un dossier contenant overlay.json, une vignette overlay.png facultative et des images. Le module découvre les overlays sous /ui/ui-vue/src/modules/pause/views/photomode/overlays, les met en cache, permet de les créer, cloner, renommer, enregistrer et supprimer (seulement ceux du dossier utilisateur) et diffuse l'évènement UI PhotomodeOverlaysChanged à chaque changement. Il fournit aussi la liste des applis UI et des textures de livrée utilisables comme calques.
--- Accès : extension `ui_photomode_overlays` : `extensions.load("ui_photomode_overlays")`, puis la globale `ui_photomode_overlays`
---@class ui_photomode_overlays
ui_photomode_overlays = {}

--- Copie un overlay (overlay.json, vignette et images) vers un nouveau dossier. Fonctionne aussi pour les overlays non éditables.
---Source : lua/ge/extensions/ui/photomode/overlays.lua:288
---@param sourceId string Identifiant de l'overlay à copier
---@param destId string Identifiant de la copie (valide et inexistant)
---@return table  {ok = true, id = destId} ou {ok = false, reason = ...}
function ui_photomode_overlays.cloneOverlay(sourceId, destId) end

--- Crée un nouveau dossier d'overlay avec un overlay.json (version 1, name = destId, author vide, layers vides par défaut, surchargés par version, name, author et layers de la charge utile).
---Source : lua/ge/extensions/ui/photomode/overlays.lua:251
---@param destId string Identifiant du nouvel overlay (doit être valide et inexistant)
---@param payload table|nil Valeurs initiales facultatives
---@return table  {ok = true, id = destId} ou {ok = false, reason = ...}
function ui_photomode_overlays.createOverlay(destId, payload) end

--- Supprime le dossier d'un overlay éditable (overlay.json, vignette, images) puis invalide le cache et diffuse PhotomodeOverlaysChanged.
---Source : lua/ge/extensions/ui/photomode/overlays.lua:494
---@param id string Identifiant de l'overlay
---@return table  {ok = true} ou {ok = false, reason = ...}
function ui_photomode_overlays.deleteOverlay(id) end

--- Force une nouvelle découverte des overlays (recherche récursive de overlay.json), remplace le cache et renvoie la liste triée par nom. Chaque entrée contient les champs de overlay.json plus id, images, editable, folderPath, hasThumbnail, ts.
---Source : lua/ge/extensions/ui/photomode/overlays.lua:206
---@return table[]  Liste d'overlays
function ui_photomode_overlays.discover() end

--- Renvoie les overlays en cache, en lançant la découverte si le cache est vide.
---Source : lua/ge/extensions/ui/photomode/overlays.lua:211
---@return table[]  Liste d'overlays
function ui_photomode_overlays.getOverlays() end

--- Parcourt /art/dynamicDecals/textures (png, jpg, jpeg) et regroupe les images par tags lus dans le fichier compagnon <image>.dynDecalTexture.json. Les images sans tag vont dans la catégorie « others ». Catégories et images sont triées sans tenir compte de la casse.
---Source : lua/ge/extensions/ui/photomode/overlays.lua:443
---@return table[]  Catégories {value, label, items = {{name, label, path}}}
function ui_photomode_overlays.listLiveryGraphics() end

--- Liste les applis UI disponibles comme calques via ui_apps.getUIAppsData() : appName, displayName, description, category, première prévisualisation, photomode (booléen) et css (left, top, width, height en chaînes, valeurs par défaut 0px, 0px, 320px, 48px). Les applis compatibles mode photo viennent en premier, puis tri par nom. Renvoie une liste vide si ui_apps est indisponible.
---Source : lua/ge/extensions/ui/photomode/overlays.lua:401
---@return table[]  Applis triées
function ui_photomode_overlays.listUiApps() end

--- Hook appelé au chargement de l'extension : vide le cache et réarme la découverte initiale.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/overlays.lua:536
function ui_photomode_overlays.onExtensionLoaded() end

--- Hook appelé au déchargement : vide le cache.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/overlays.lua:541
function ui_photomode_overlays.onExtensionUnloaded() end

--- Hook appelé par le moteur quand des fichiers changent. Si l'un des chemins est sous le dossier des overlays, invalide le cache et diffuse PhotomodeOverlaysChanged.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/overlays.lua:525
---@param files table Liste d'éléments {filename = ...}
function ui_photomode_overlays.onFilesChanged(files) end

--- Hook appelé quand l'UI est prête : lance une seule fois la découverte des overlays pour préremplir le cache.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/photomode/overlays.lua:545
function ui_photomode_overlays.onUiReady() end

--- Renomme un overlay éditable : change son nom affiché et/ou son identifiant (donc son dossier). Avec un nouvel identifiant, copie les fichiers, met à jour name dans le nouvel overlay.json et supprime l'ancien dossier.
---Source : lua/ge/extensions/ui/photomode/overlays.lua:316
---@param sourceId string Identifiant actuel
---@param destId string Nouvel identifiant (peut être identique à sourceId)
---@param newName string|nil Nouveau nom affiché ; ignoré si vide, l'ancien nom est alors conservé
---@return table  {ok = true, id = ...} ou {ok = false, reason = ...}
function ui_photomode_overlays.renameOverlay(sourceId, destId, newName) end

--- Écrit la charge utile dans overlay.json d'un overlay existant et éditable, puis invalide le cache et diffuse PhotomodeOverlaysChanged.
---Source : lua/ge/extensions/ui/photomode/overlays.lua:215
---@param id string Identifiant (nom de dossier) de l'overlay
---@param payload table Nouveau contenu de overlay.json (version, name, author, layers…)
---@return table  {ok = true} ou {ok = false, reason = ...}
function ui_photomode_overlays.saveOverlay(id, payload) end

