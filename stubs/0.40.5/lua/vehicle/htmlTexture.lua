---@meta
-- tim19Atlas stub generated from lua/vehicle/htmlTexture.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Aide pour afficher une page web (HTML/JS) sur une texture du véhicule (écran de tableau de bord, afficheur). `create` ou `new` crée une vue web (obj:createWebView) liée à un tag de matériau/texture ; `call` ou la méthode callJS exécutent ensuite une fonction JavaScript dans cette page avec des données encodées en JSON. À utiliser depuis un contrôleur ou une extension du véhicule.
--- Accès : `require("htmlTexture")`
---@class htmlTexture
local htmlTexture = {}

--- Met en file l'exécution de `jsMethod(<JSON>)` dans la vue web identifiée par son tag (obj:queueWebViewJS).
---Source : lua/vehicle/htmlTexture.lua:38
---@param webViewTag string Tag de la vue web.
---@param jsMethod string Nom de la fonction JavaScript à appeler.
---@param data any Argument encodé en JSON (jsonEncode).
function htmlTexture.call(webViewTag, jsMethod, data) end

--- Crée une vue web sans renvoyer d'objet (même logique de usagemode que new). Prévu pour le véhicule propriétaire.
---Source : lua/vehicle/htmlTexture.lua:45
---@param webViewTag string Tag de la texture web.
---@param uri string Adresse de la page HTML.
---@param width integer Largeur en pixels.
---@param height integer Hauteur en pixels.
---@param fps number|nil Images par seconde (25 par défaut en mode automatic).
---@param usagemode string|nil 'automatic' (défaut), 'once' ou 'manual'.
function htmlTexture.create(webViewTag, uri, width, height, fps, usagemode) end

--- Crée une vue web et renvoie un objet pratique avec les méthodes callJS et streamJS.
---Source : lua/vehicle/htmlTexture.lua:17
---@param webViewTag string Identifiant/tag de la texture web du matériau.
---@param uri string Adresse de la page HTML à afficher.
---@param width integer Largeur de la texture en pixels.
---@param height integer Hauteur de la texture en pixels.
---@param fps number|nil Images par seconde (mode automatic uniquement, 25 par défaut).
---@param usagemode string|nil 'automatic' (défaut), 'once' ou 'manual'.
---@return table  Objet {webViewTag, uri, width, height, fps, usageModeID} avec callJS(jsMethod, data) et streamJS(streamName, jsMethod, data).
function htmlTexture.new(webViewTag, uri, width, height, fps, usagemode) end

return htmlTexture
