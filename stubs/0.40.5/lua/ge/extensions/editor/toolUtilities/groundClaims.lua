---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/groundClaims.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Registre partagé des « revendications de terrain » entre les outils de l'éditeur qui posent des surfaces sur le terrain. Chaque outil publie, sous un nom de propriétaire (owner), les anneaux (contours) qu'il occupe et la marge à respecter ; les autres outils lisent ces anneaux pour ne pas empiéter dessus. Un compteur de révision et des empreintes (fp) permettent de détecter qu'un autre outil a bougé son terrain.
--- Accès : extension `editor_toolUtilities_groundClaims` : `extensions.load("editor_toolUtilities_groundClaims")`, puis la globale `editor_toolUtilities_groundClaims`
---@class editor_toolUtilities_groundClaims
editor_toolUtilities_groundClaims = {}

--- Efface la revendication d'un propriétaire (publish sans anneau).
---Source : lua/ge/extensions/editor/toolUtilities/groundClaims.lua:71
---@param owner any Nom du propriétaire.
function editor_toolUtilities_groundClaims.clear(owner) end

--- Pour chaque autre propriétaire, son empreinte fp et la boîte {x0, y0, x1, y1} que couvre son terrain, marge comprise. Sert à savoir OÙ le terrain d'un autre a bougé.
---Source : lua/ge/extensions/editor/toolUtilities/groundClaims.lua:63
---@param owner any Propriétaire exclu du résultat.
---@return table<any, table>  owner -> { fp, box }.
function editor_toolUtilities_groundClaims.extents(owner) end

--- Comme others, mais chaque anneau est agrandi de la marge demandée par son propriétaire (geom.outsetClosedRing2D) : ce qu'il faut soustraire à son propre terrain. Une revendication sans marge est renvoyée telle quelle.
---Source : lua/ge/extensions/editor/toolUtilities/groundClaims.lua:92
---@param out table|nil Liste de sortie.
---@param owner any Propriétaire exclu.
---@return table  La liste out.
function editor_toolUtilities_groundClaims.keepOut(out, owner) end

--- Tout ce qui est proche de ring et que son propriétaire ne doit pas recouvrir : les anneaux de route fournis agrandis de roadMargin, plus la revendication de chaque autre outil agrandie de sa marge. Seuls les éléments dont la boîte touche celle de ring sont retenus.
---Source : lua/ge/extensions/editor/toolUtilities/groundClaims.lua:107
---@param ring table Contour testé (au moins 3 points) ; sinon renvoie deux tables vides.
---@param owner any Propriétaire exclu.
---@param roadRings table[]|nil Anneaux de route fournis par l'appelant.
---@param roadMargin number|nil Marge appliquée aux routes (m).
---@param pad number|nil Élargit la boîte qui définit « proche ».
---@param skip any|nil Ignore les anneaux portant cette étiquette (un site en édition ne se gêne pas lui-même).
---@return table[]  Anneaux obstacles.
---@return table<table, boolean>  Ensemble des anneaux de sortie qui sont des routes.
function editor_toolUtilities_groundClaims.obstructions(ring, owner, roadRings, roadMargin, pad, skip) end

--- Ajoute à out tous les anneaux des autres propriétaires (sans la marge). L'exclusion évite à un outil de se soustraire son propre terrain.
---Source : lua/ge/extensions/editor/toolUtilities/groundClaims.lua:77
---@param out table|nil Liste de sortie (créée si nil).
---@param owner any Propriétaire exclu.
---@param flushOnly boolean|nil Ne garde que les revendications sans marge (terrain avec lequel on se joint à ras).
---@param tags table|nil Si fourni, reçoit l'étiquette de chaque anneau (false si aucune) à l'indice de l'anneau dans out.
---@return table  La liste out.
function editor_toolUtilities_groundClaims.others(out, owner, flushOnly, tags) end

--- Remplace tout ce que ce propriétaire détient par les anneaux donnés, avec la marge que les autres doivent respecter. Incrémente la révision seulement si le contenu a changé.
---Source : lua/ge/extensions/editor/toolUtilities/groundClaims.lua:32
---@param owner any Nom du propriétaire (clé de la table) ; nil = sans effet.
---@param rings table[]|nil Anneaux de points {x, y} ; ceux de moins de 3 points sont ignorés.
---@param margin number|nil Marge (m) que les autres outils laissent autour ; défaut 0 (jonction affleurante).
---@param tags table|nil Étiquette par anneau (même indice que rings), pour qu'un outil qui édite cette chose ignore ses propres copies (voir obstructions).
function editor_toolUtilities_groundClaims.publish(owner, rings, margin, tags) end

--- Compteur de révision, incrémenté à chaque publication qui change quelque chose. Permet à un outil de remarquer que le terrain d'un autre a bougé sans le connaître directement.
---Source : lua/ge/extensions/editor/toolUtilities/groundClaims.lua:150
---@return integer  Révision courante.
function editor_toolUtilities_groundClaims.sig() end

