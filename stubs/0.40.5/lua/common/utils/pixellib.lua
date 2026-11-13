---@meta
-- tim19Atlas stub generated from lua/common/utils/pixellib.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petite bibliothèque de dessin de pixels en mémoire (tampon RGBA 8 bits via FFI) : points, lignes, cercles, rectangles, icônes et texte en police bitmap 'mini_font' (majuscules, chiffres et quelques signes). Le tampon s'enregistre en image (GBitmap:saveFile). Se charge avec require('utils/pixellib') ; M.create() renvoie un objet LuaPixelBuffer. Utile pour générer des images de debug (cartes, graphiques) sans UI. Voir M.test() pour un exemple complet.
--- Accès : `require("utils/pixellib")`
---@class utils_pixellib
local utils_pixellib = {}

--- Crée un objet LuaPixelBuffer vide ; appeler ensuite :init(width, height) pour allouer le tampon.
---Source : lua/common/utils/pixellib.lua:32
---@return table  Instance LuaPixelBuffer
function utils_pixellib.create() end

--- Démonstration : dessine plusieurs primitives et du texte dans un tampon 250x250 puis l'enregistre en 'helloworld.png'.
---Source : lua/common/utils/pixellib.lua:240
function utils_pixellib.test() end

--- Tampon de pixels RGBA renvoyé par create(). Champs : width, height, bufSize, buf (cdata rgba_pixel_t[?]).
---@class utils_pixellib_LuaPixelBuffer
local utils_pixellib_LuaPixelBuffer = {}

--- Texte descriptif 'LuaPixelBuffer - ... [resolution: W x H (RGBA)]'.
---Source : lua/common/utils/pixellib.lua:65
---@return string  Description
function utils_pixellib_LuaPixelBuffer:__tostring() end

--- Alloue le tableau FFI de n pixels. Appelé par init.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils/pixellib.lua:60
---@param n integer Nombre de pixels
function utils_pixellib_LuaPixelBuffer:_allocate_buffer(n) end

--- Dessine le contour d'un cercle (algorithme du point milieu).
---Source : lua/common/utils/pixellib.lua:97
---@param pos vec3 Centre (x,y)
---@param radius number Rayon en pixels
---@param color table Couleur
---@param lineWidth number|nil Épaisseur du trait, 1 par défaut
function utils_pixellib_LuaPixelBuffer:drawCircle(pos, radius, color, lineWidth) end

--- Dessine un disque plein.
---Source : lua/common/utils/pixellib.lua:130
---@param pos vec3 Centre (x,y)
---@param radius number Rayon en pixels
---@param color table Couleur
function utils_pixellib_LuaPixelBuffer:drawFilledCircle(pos, radius, color) end

--- Remplit un rectangle (bornes incluses : width+1 par height+1 pixels).
---Source : lua/common/utils/pixellib.lua:155
---@param p1 vec3 Coin supérieur gauche (x,y)
---@param width number Largeur
---@param height number Hauteur
---@param color table Couleur
function utils_pixellib_LuaPixelBuffer:drawFilledRect(p1, width, height, color) end

--- Dessine une petite icône : 'x' (croix de 5x5) ou 'o' (cercle de rayon 2). Autre type : rien.
---Source : lua/common/utils/pixellib.lua:194
---@param pos vec3 Centre (x,y)
---@param type string 'x' ou 'o'
---@param color table Couleur
function utils_pixellib_LuaPixelBuffer:drawIcon(pos, type, color) end

--- Dessine un segment (parcours pixel par pixel selon l'axe dominant).
---Source : lua/common/utils/pixellib.lua:217
---@param pos1 vec3 Début (x,y)
---@param pos2 vec3 Fin (x,y)
---@param color table Couleur
---@param lineWidth number|nil Épaisseur, 1 par défaut
function utils_pixellib_LuaPixelBuffer:drawLine(pos1, pos2, color, lineWidth) end

--- Écrit la couleur sur un pixel (copie r, g, b, a, sans mélange alpha). Ignore les coordonnées hors tampon.
---Source : lua/common/utils/pixellib.lua:69
---@param x number Colonne
---@param y number Ligne
---@param color table Couleur {r,g,b,a} 0..255
function utils_pixellib_LuaPixelBuffer:drawPixel(x, y, color) end

--- Dessine un point : un pixel si size vaut 1/nil/0, sinon un disque plein de diamètre approximatif size.
---Source : lua/common/utils/pixellib.lua:83
---@param x number Colonne
---@param y number Ligne
---@param color table Couleur
---@param size number|nil Taille en pixels, 1 par défaut
function utils_pixellib_LuaPixelBuffer:drawPoint(x, y, color, size) end

--- Dessine le contour d'un rectangle avec 4 lignes.
---Source : lua/common/utils/pixellib.lua:141
---@param p1 vec3 Coin supérieur gauche (x,y)
---@param width number Largeur
---@param height number Hauteur
---@param color table Couleur
---@param lineWidth number|nil Épaisseur, 1 par défaut
function utils_pixellib_LuaPixelBuffer:drawRect(p1, width, height, color, lineWidth) end

--- Écrit du texte avec la police bitmap interne (5 pixels de haut). pos.y est le bas de la ligne.
---Source : lua/common/utils/pixellib.lua:164
---@param pos vec3 Position (x,y)
---@param text string Texte (mis en majuscules)
---@param color table Couleur
---@return integer  Nombre de caractères effectivement dessinés
function utils_pixellib_LuaPixelBuffer:drawText(pos, text, color) end

--- Remplit tout le tampon avec une couleur.
---Source : lua/common/utils/pixellib.lua:93
---@param color table Couleur
function utils_pixellib_LuaPixelBuffer:fill(color) end

--- Lit un pixel du tampon.
---Source : lua/common/utils/pixellib.lua:78
---@param x integer Colonne
---@param y integer Ligne
---@return cdata|nil  rgba_pixel_t (champs r,g,b,a), nil si hors tampon
function utils_pixellib_LuaPixelBuffer:getPixel(x, y) end

--- Alloue le tampon et fixe width/height (arrondis à l'entier inférieur). Pixels initialement à zéro (transparents noirs).
---Source : lua/common/utils/pixellib.lua:38
---@param width number Largeur en pixels
---@param height number Hauteur en pixels
function utils_pixellib_LuaPixelBuffer:init(width, height) end

--- Enregistre le tampon comme image via un GBitmap du moteur (format selon l'extension, ex. .png). Loggue une erreur si le chargement dans le bitmap échoue.
---Source : lua/common/utils/pixellib.lua:56
---@param filename string Fichier de sortie
function utils_pixellib_LuaPixelBuffer:saveFile(filename) end

return utils_pixellib
