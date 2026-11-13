---@meta
-- tim19Atlas stub generated from lua/common/libs/ezSVG/EzSVG.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- EzSVG : bibliothèque tierce (Patrick Borgeat, 2012, reprise par BeamNG) pour générer des fichiers SVG depuis Lua. On crée des éléments (Circle, Rect, Line, Path, Polyline, Text, Group, dégradés…), on les ajoute à un groupe ou un document (add) puis on écrit le fichier avec Document:writeTo. Une pile de styles par défaut (setStyle, pushStyle, popStyle) s'applique aux éléments créés. Utile pour exporter des tracés (routes, graphes) depuis un script.
--- Accès : `require("libs/ezSVG/EzSVG")`
---@class libs_ezSVG_EzSVG
---@field knownTags table<integer, string> Liste des balises SVG connues (rect, circle, ellipse, line, polyline, polygon, path, text, tspan, textPath, image, svg, g, defs, tref, linearGradient, radialGradient, stop, use, symbol, pattern, mask) pour lesquelles un style par défaut existe.
---@field styleStack table Pile des jeux de styles sauvegardés par pushStyle.
local libs_ezSVG_EzSVG = {}

--- Crée un cercle.
---Source : lua/common/libs/ezSVG/EzSVG.lua:421
---@param cx number Centre X
---@param cy number Centre Y
---@param r number Rayon
---@param style table|nil Style
function libs_ezSVG_EzSVG.Circle(cx, cy, r, style) end

--- Crée le document SVG racine (groupe svg avec xmlns, taille et fond facultatif). Possède add et writeTo(filename).
---Source : lua/common/libs/ezSVG/EzSVG.lua:850
---@param width number Largeur
---@param height number Hauteur
---@param bgcolor string|nil Couleur de fond (ajoute un rectangle)
---@param style table|nil Style
---@return table  Document
function libs_ezSVG_EzSVG.Document(width, height, bgcolor, style) end

--- Crée une ellipse.
---Source : lua/common/libs/ezSVG/EzSVG.lua:430
---@param cx number Centre X
---@param cy number Centre Y
---@param rx number Rayon X
---@param ry number Rayon Y
---@param style table|nil Style
function libs_ezSVG_EzSVG.Ellipse(cx, cy, rx, ry, style) end

--- Crée un groupe <g> contenant d'autres éléments (méthode add).
---Source : lua/common/libs/ezSVG/EzSVG.lua:709
---@param style table|nil Style
function libs_ezSVG_EzSVG.Group(style) end

--- Crée une image référencée.
---Source : lua/common/libs/ezSVG/EzSVG.lua:641
---@param href string URL ou chemin de l'image
---@param x number X
---@param y number Y
---@param width number Largeur
---@param height number Hauteur
---@param style table|nil Style
function libs_ezSVG_EzSVG.Image(href, x, y, width, height, style) end

--- Crée un segment.
---Source : lua/common/libs/ezSVG/EzSVG.lua:440
---@param x1 number X de départ
---@param y1 number Y de départ
---@param x2 number X d'arrivée
---@param y2 number Y d'arrivée
---@param style table|nil Style
function libs_ezSVG_EzSVG.Line(x1, y1, x2, y2, style) end

--- Crée un dégradé linéaire (stops ajoutés ensuite sur l'objet).
---Source : lua/common/libs/ezSVG/EzSVG.lua:750
---@param x1 number X de départ
---@param y1 number Y de départ
---@param x2 number X d'arrivée
---@param y2 number Y d'arrivée
---@param userSpaceUnits boolean|nil Utiliser les unités utilisateur (déduit du nom)
---@param spread string|nil Méthode d'étalement (spreadMethod)
---@param style table|nil Style
function libs_ezSVG_EzSVG.LinearGradient(x1, y1, x2, y2, userSpaceUnits, spread, style) end

--- Crée un masque <mask>.
---Source : lua/common/libs/ezSVG/EzSVG.lua:817
---@param x number X
---@param y number Y
---@param width number Largeur
---@param height number Hauteur
---@param maskUnits string|nil Attribut SVG
---@param maskContentUnits string|nil Attribut SVG
---@param style table|nil Style
function libs_ezSVG_EzSVG.Mask(x, y, width, height, maskUnits, maskContentUnits, style) end

--- Crée un tracé <path> dont les commandes d est construit par des méthodes sur l'objet.
---Source : lua/common/libs/ezSVG/EzSVG.lua:450
---@param style table|nil Style
function libs_ezSVG_EzSVG.Path(style) end

--- Crée un motif de remplissage <pattern>.
---Source : lua/common/libs/ezSVG/EzSVG.lua:800
---@param x number X
---@param y number Y
---@param width number Largeur
---@param height number Hauteur
---@param preserveAspectRatio string|nil Attribut SVG
---@param patternUnits string|nil Attribut SVG
---@param patternContentUnits string|nil Attribut SVG
---@param viewbox string|nil Attribut SVG viewBox
---@param style table|nil Style
function libs_ezSVG_EzSVG.Pattern(x, y, width, height, preserveAspectRatio, patternUnits, patternContentUnits, viewbox, style) end

--- Crée un polygone fermé.
---Source : lua/common/libs/ezSVG/EzSVG.lua:624
---@param points table<integer, number> Liste plate de coordonnées {x1, y1, …}
---@param style table|nil Style
function libs_ezSVG_EzSVG.Polygon(points, style) end

--- Crée une polyligne ouverte.
---Source : lua/common/libs/ezSVG/EzSVG.lua:620
---@param points table<integer, number> Liste plate de coordonnées {x1, y1, x2, y2, …}
---@param style table|nil Style
function libs_ezSVG_EzSVG.Polyline(points, style) end

--- Crée un dégradé radial.
---Source : lua/common/libs/ezSVG/EzSVG.lua:764
---@param cx number Centre X
---@param cy number Centre Y
---@param r number Rayon
---@param fx number|nil Foyer X
---@param fy number|nil Foyer Y
---@param userSpaceUnits boolean|nil Utiliser les unités utilisateur (déduit du nom)
---@param spread string|nil Méthode d'étalement
---@param style table|nil Style
function libs_ezSVG_EzSVG.RadialGradient(cx, cy, r, fx, fy, userSpaceUnits, spread, style) end

--- Crée un rectangle, éventuellement à coins arrondis.
---Source : lua/common/libs/ezSVG/EzSVG.lua:628
---@param x number X
---@param y number Y
---@param width number Largeur
---@param height number Hauteur
---@param rx number|nil Rayon des coins en X
---@param ry number|nil Rayon des coins en Y
---@param style table|nil Style
function libs_ezSVG_EzSVG.Rect(x, y, width, height, rx, ry, style) end

--- Crée un élément <svg> imbriqué (groupe positionné).
---Source : lua/common/libs/ezSVG/EzSVG.lua:901
---@param x number X
---@param y number Y
---@param width number Largeur
---@param height number Hauteur
---@param style table|nil Style
function libs_ezSVG_EzSVG.SVG(x, y, width, height, style) end

--- Crée un <symbol> (modèle réutilisable via Use).
---Source : lua/common/libs/ezSVG/EzSVG.lua:791
---@param preserveAspectRatio string|nil Attribut SVG
---@param viewBox string|nil Attribut SVG
---@param style table|nil Style
function libs_ezSVG_EzSVG.Symbol(preserveAspectRatio, viewBox, style) end

--- Crée un élément texte.
---Source : lua/common/libs/ezSVG/EzSVG.lua:664
---@param text string Contenu
---@param x number X
---@param y number Y
---@param style table|nil Style
function libs_ezSVG_EzSVG.Text(text, x, y, style) end

--- Crée une référence de texte (<tref>) vers un autre élément.
---Source : lua/common/libs/ezSVG/EzSVG.lua:702
---@param href any Élément ou identifiant référencé (déduit du code)
---@param style table|nil Style
function libs_ezSVG_EzSVG.TextRef(href, style) end

--- Crée un <use> qui réutilise un élément défini ailleurs.
---Source : lua/common/libs/ezSVG/EzSVG.lua:779
---@param href any Élément ou identifiant à réutiliser
---@param x number|nil X
---@param y number|nil Y
---@param width number|nil Largeur
---@param height number|nil Hauteur
---@param style table|nil Style
function libs_ezSVG_EzSVG.Use(href, x, y, width, height, style) end

--- Réinitialise les styles par défaut de toutes les balises connues (tables vides).
---Source : lua/common/libs/ezSVG/EzSVG.lua:379
function libs_ezSVG_EzSVG.clearStyle() end

--- Gris : rgb(v, v, v).
---Source : lua/common/libs/ezSVG/EzSVG.lua:919
---@param v number Niveau 0..255
---@return string  Couleur
function libs_ezSVG_EzSVG.gray(v) end

--- Convertit une couleur TSV en chaîne rgb(). Les trois composantes sont en 0..255 (divisées par 255).
---Source : lua/common/libs/ezSVG/EzSVG.lua:923
---@param h number Teinte 0..255
---@param s number Saturation 0..255
---@param v number Valeur 0..255
---@return string  Couleur rgb(...)
function libs_ezSVG_EzSVG.hsv(h, s, v) end

--- Restaure les styles par défaut sauvegardés ; erreur si la pile est vide.
---Source : lua/common/libs/ezSVG/EzSVG.lua:399
function libs_ezSVG_EzSVG.popStyle() end

--- Sauvegarde une copie des styles par défaut sur la pile.
---Source : lua/common/libs/ezSVG/EzSVG.lua:386
function libs_ezSVG_EzSVG.pushStyle() end

--- Formate une couleur SVG "rgb(r, g, b)" (valeurs 0..255, arrondies à l'entier inférieur).
---Source : lua/common/libs/ezSVG/EzSVG.lua:915
---@param r number Rouge
---@param g number Vert
---@param b number Bleu
---@return string  Couleur
function libs_ezSVG_EzSVG.rgb(r, g, b) end

--- Définit un style par défaut, pour une balise ou pour toutes. Accepte soit (clé, valeur, balise?), soit (table de styles, balise?).
---Source : lua/common/libs/ezSVG/EzSVG.lua:407
---@param key string|table Nom de propriété (stroke_width…) ou table de propriétés
---@param value any Valeur (ou nom de balise si key est une table)
---@param tag string|nil Balise ciblée ; toutes si nil
function libs_ezSVG_EzSVG.setStyle(key, value, tag) end

return libs_ezSVG_EzSVG
