---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/trackBuilder/pieces.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Catalogue géométrique des « pièces » du Track Builder (hex, square, free). Chaque fonction reçoit les paramètres d'une pièce et renvoie, à partir de la pièce précédente (la 'tipPiece' mémorisée par toSegment), une table décrivant la nouvelle extrémité : position, origin, hdg (cap en radians), polyMult (densité de points) et pointsType ('bezier', 'arc' ou 'custom'), avec points de contrôle (controlPointA/B), rayon/angle ou points personnalisés. toSegment est le point d'entrée : il choisit la fonction selon piece.piece (init, hexForward, hexCurve, freeBezier, hexLoop, etc.).
--- Accès : extension `util_trackBuilder_pieces` : `extensions.load("util_trackBuilder_pieces")`, puis la globale `util_trackBuilder_pieces`
---@class util_trackBuilder_pieces
---@field splineTrack table|nil Référence vers le module splineTrack, nil dans ce fichier ; doit fournir getTrackPosition() pour les pièces à positionnement absolu.
util_trackBuilder_pieces = {}

--- Courbe de Bézier approchant un arc (constante 0,5523) ; hardness change la longueur des tangentes (négatif : réduit, positif : augmente).
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:118
---@param radius number Rayon de base.
---@param angle number Angle de virage (rad).
---@param direction number Sens du virage : 1 ou -1.
---@param hardness number Dureté de la courbe.
---@param radiusMult number Multiplicateur du rayon (sqrt(3) en hex, 1 sinon).
---@return table  Pièce de type 'bezier'.
function util_trackBuilder_pieces.bezierCurve(radius, angle, direction, hardness, radiusMult) end

--- Virage de rayon et d'angle donnés. Si hardness est non nul, passe par bezierCurve ; sinon renvoie un arc ('arc') avec radius, angle et direction.
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:142
---@param radius number Rayon.
---@param angle number Angle (rad).
---@param direction number 1 ou -1 (gauche/droite).
---@param hardness number|nil Dureté ; 0 ou nil pour un arc pur.
---@param radiusMult number Multiplicateur du rayon.
---@return table  Pièce de type 'arc' ou 'bezier'.
function util_trackBuilder_pieces.curve(radius, angle, direction, hardness, radiusMult) end

--- Bézier libre : décalage (xOff, yOff), changement de cap dirOff et longueurs des tangentes avant/arrière. En mode absolute, le décalage est calculé depuis la position courante du curseur de piste (splineTrack.getTrackPosition()). Renvoie aussi des positions/caps locaux et globaux.
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:193
---@param xOff number Décalage latéral.
---@param yOff number Décalage vers l'avant.
---@param dirOff number Changement de cap (rad).
---@param forwardLen number Longueur de la tangente de départ.
---@param backwardLen number Longueur de la tangente d'arrivée.
---@param isHex boolean Grille hexagonale.
---@param absolute boolean|nil Position relative au curseur de piste plutôt qu'à la dernière pièce.
---@param empty boolean|nil Si vrai, aucune géométrie générée (noPoints).
---@return table  Pièce de type 'bezier' (avec globalPosition, localPosition, globalHdg, localHdg).
function util_trackBuilder_pieces.customBezier(xOff, yOff, dirOff, forwardLen, backwardLen, isHex, absolute, empty) end

--- Déplace le curseur de piste sans générer de géométrie (noPoints). Peut aussi changer le cap (dirOff en pas de pi/3 en hex, pi/2 sinon) et la hauteur (zOff).
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:510
---@param xOff number Décalage latéral.
---@param yOff number Décalage vers l'avant.
---@param zOff number Décalage vertical.
---@param dirOff number Nombre de pas de rotation.
---@param absolute boolean|nil Part de la position du curseur de piste.
---@param isHex boolean Grille hexagonale.
---@return table  Pièce vide.
function util_trackBuilder_pieces.emptyOffset(xOff, yOff, zOff, dirOff, absolute, isHex) end

--- Ligne droite de la longueur donnée dans la direction de la tipPiece (points de contrôle à 25 % de la longueur).
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:101
---@param length number Longueur en mètres.
---@return table  Pièce de type 'bezier'.
function util_trackBuilder_pieces.forward(length) end

--- Spirale à angle libre ; les longueurs de tangentes sont choisies par tranches de 15° jusqu'à 75°.
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:314
---@param size number Taille.
---@param inside boolean Spirale vers l'intérieur.
---@param dir number Sens : 1 ou -1.
---@param angle number Angle en radians (au plus 75° = 1,309 rad, sinon erreur).
---@return table  Pièce de type 'bezier'.
function util_trackBuilder_pieces.freeSpiral(size, inside, dir, angle) end

--- Fonction auxiliaire pour les loopings : intègre numériquement la spirale d'Euler (clothoïde, intégrales de Fresnel cos/sin(t²·pi/2)) de 0 à d.
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:375
---@param d number Borne supérieure d'intégration.
---@return table  {x, y} du point de la clothoïde.
function util_trackBuilder_pieces.fresnelSC(d) end

--- Renvoie le vecteur unitaire horizontal du cap : (sin hdg, cos hdg, 0).
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:87
---@param hdg number Cap en radians.
---@return vec3  Direction.
function util_trackBuilder_pieces.getHdgVector(hdg) end

--- Spirale hexagonale (virage de 60°) vers l'intérieur ou l'extérieur, décrite par une Bézier.
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:249
---@param size number Taille de la spirale.
---@param inside boolean Spirale vers l'intérieur.
---@param dir number Sens : 1 ou -1.
---@return table  Pièce de type 'bezier'.
function util_trackBuilder_pieces.hexSpiral(size, inside, dir) end

--- Pièce initiale : position (0,0,0) et cap 0 par défaut, sans points.
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:91
---@param p table|nil Table facultative avec position (vec3) et hdg (rad).
---@return table  Pièce avec noPoints = true.
function util_trackBuilder_pieces.initialTrackPiece(p) end

--- Looping vertical construit avec une clothoïde, avec décalage latéral xOffset réparti en pente douce ; renvoie jusqu'à 300 points personnalisés (position, rot).
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:403
---@param xOffset number Décalage latéral entre l'entrée et la sortie.
---@param radius number Rayon (minimum 1).
---@param isHex boolean Grille hexagonale (décalage × sqrt(3)).
---@return table  Pièce de type 'custom' avec customPoints.
function util_trackBuilder_pieces.loop(xOffset, radius, isHex) end

--- Courbe en S de longueur donnée décalée latéralement de xOffset ; en hex, ajoute 0,5 à la longueur si xOffset est impair pour rester sur la grille triangulaire.
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:165
---@param length number Longueur vers l'avant.
---@param xOffset number Décalage latéral (positif vers la droite du cap).
---@param hardness number|nil Dureté (0 par défaut).
---@param isHex boolean Grille hexagonale.
---@return table  Pièce de type 'bezier'.
function util_trackBuilder_pieces.offsetCurve(length, xOffset, hardness, isHex) end

--- Fonction auxiliaire : renvoie q * v.
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:539
---@param v vec3 Vecteur.
---@param q quat Rotation.
---@return vec3  Vecteur tourné.
function util_trackBuilder_pieces.rotateVectorByQuat(v, q) end

--- Spirale carrée (virage de 90°), même principe que hexSpiral.
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:282
---@param size number Taille.
---@param inside boolean Spirale vers l'intérieur.
---@param dir number Sens : 1 ou -1.
---@return table  Pièce de type 'bezier'.
function util_trackBuilder_pieces.squareSpiral(size, inside, dir) end

--- Convertit la description d'une pièce en table de segment. Mémorise tip comme pièce précédente puis délègue à initialTrackPiece, forward, curve, offsetCurve, customBezier, hexSpiral, squareSpiral, freeSpiral, loop ou emptyOffset selon piece.piece. Renvoie nil si le type est inconnu.
---Source : lua/ge/extensions/util/trackBuilder/pieces.lua:12
---@param piece table Description de la pièce (champ piece = nom du type, plus length, direction, hardness, radius, xOffset, xOff, yOff, zOff, dirOff, size, inside, angle, absolute, empty… selon le type).
---@param tip table Pièce précédente (position, hdg).
---@return table|nil  Table de segment.
function util_trackBuilder_pieces.toSegment(piece, tip) end

