---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/terraform/terraform.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Moteur de terraformage du terrain de l'éditeur. Il modifie la heightmap du TerrainBlock pour l'aligner sur des 'sources' (bandes de route : liste de {pos, width, binormal}) ou des 'features' (quads et anneaux avec un mode par élément), avec un falloff par champ de distance (SDF), un lissage par relaxation, du bruit et un masque d'occupation par priorité (table PRIO). Il enregistre aussi des 'baselines' (hauteurs d'origine et écrites) pour pouvoir restaurer le terrain, et fournit une paire de boutons 'Terraform To X' / 'Restore Terrain' pour les outils de splines. Utilisé par editor_terraformTool et par les outils de routes, ponts et lieux.
--- Accès : extension `editor_terraform_terraform` : `extensions.load("editor_terraform_terraform")`, puis la globale `editor_terraform_terraform`
---@class editor_terraform_terraform
---@field PRIO table<string, number> Bandes de priorité du masque d'occupation : LAKE 1, CARPARK 1.5, OPENSPACE 1.75, BUILDING 2, PAVING 2.5, PATH 3, STRUCTURE 4, RIM 4.2, AREAWAY 4.3, GROUND 5, RAIL 5.5.
editor_terraform_terraform = {}

--- Creuse des features dans le pad de travail d'un outil. Même creusement que terraformToQuads et même falloff, mais le niveau n'est pas marqué modifié et aucune étape d'annulation n'est créée ; l'appelant garde les hauteurs (baselineOut) et les restitue lui-même. Pas de bande de priorité.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:1191
---@param DOI number Domaine d'influence (m).
---@param margin number Marge (m).
---@param falloffExp number Falloff.
---@param features table Liste de features.
---@param passes integer|nil Passes de lissage.
---@param baselineOut table|nil Reçoit la baseline.
function editor_terraform_terraform.carvePad(DOI, margin, falloffExp, features, passes, baselineOut) end

--- Comme carveToSources, mais la surface est donnée en quads explicites (avec le Z bilinéaire exact par cellule) : une culée sur un tablier bombé arrive pile à la hauteur du tablier, sans creux. Annule la baseline précédente, vide le masque d'occupation, fait une passe terraformToQuads et mémorise la baseline.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:1201
---@param obj table Objet qui reçoit terraBaseline.
---@param DOI number Domaine d'influence (m).
---@param margin number Marge (m).
---@param falloffExp number Falloff.
---@param roughness number Rugosité.
---@param scale number Échelle du bruit.
---@param features table Liste de features (avec quad ou rings, et un mode).
---@param smoothPasses integer|nil Passes de lissage.
function editor_terraform_terraform.carveToQuads(obj, DOI, margin, falloffExp, roughness, scale, features, smoothPasses) end

--- Comme carveToSources, mais chaque élément de 'groups' est une liste de runs terraformés ensemble en une seule passe (une seule capture de baseline sur leur fenêtre commune). À utiliser quand une zone est faite de bandes qui se chevauchent ; les groupes eux-mêmes doivent être disjoints.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:785
---@param obj table Objet qui reçoit terraBaseline.
---@param DOI number Domaine d'influence (m).
---@param margin number Marge (m).
---@param falloffExp number Falloff.
---@param roughness number Rugosité.
---@param scale number Échelle du bruit.
---@param groups table Liste de groupes ; chaque groupe est une liste de runs.
---@param smoothPasses integer|nil Passes de lissage.
---@param clips table|nil Extrémités à ne pas dépasser.
function editor_terraform_terraform.carveToSourceGroups(obj, DOI, margin, falloffExp, roughness, scale, groups, smoothPasses, clips) end

--- Terraformage avec mémoire de baseline : annule d'abord obj.terraBaseline, puis terraforme chaque 'run' de sources sur sa propre boîte serrée (utile pour deux culées de pont aux extrémités opposées) et fusionne les baselines dans obj.terraBaseline.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:766
---@param obj table Objet qui reçoit terraBaseline.
---@param DOI number Domaine d'influence (m).
---@param margin number Marge (m).
---@param falloffExp number Falloff.
---@param roughness number Rugosité.
---@param scale number Échelle du bruit.
---@param sources table Liste de runs (chaque run est une source).
---@param smoothPasses integer|nil Passes de lissage.
---@param clips table|nil Extrémités à ne pas dépasser.
function editor_terraform_terraform.carveToSources(obj, DOI, margin, falloffExp, roughness, scale, sources, smoothPasses, clips) end

--- Renvoie la bande de priorité qui possède une cellule dans le masque d'occupation (coordonnées de grille absolues), 0 si aucune.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:144
---@param gx integer Indice de grille X.
---@param gy integer Indice de grille Y.
---@return number  Priorité de la cellule.
function editor_terraform_terraform.cellPriorityAt(gx, gy) end

--- Réserve toutes les cellules couvertes par un ensemble de features, à une priorité donnée, sans modifier aucune hauteur (appelle terraformToQuads en claimOnly).
---Source : lua/ge/extensions/editor/terraform/terraform.lua:1180
---@param features table Liste de features.
---@param priority number Bande de priorité.
function editor_terraform_terraform.claimFeatures(features, priority) end

--- Abaisse sans condition le terrain sous des empreintes de surface (tabliers de pont) : un sommet de grille est ramené à (dessus du tablier - marge) seulement s'il dépasse au-dessus du tablier. Enregistre l'historique des sommets abaissés.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:1247
---@param features table Empreintes de tablier.
---@param marginM number|nil Marge sous le tablier en mètres (0.4 par défaut).
---@return integer  Nombre de sommets abaissés (0 si rien à faire ou pas de terrain).
function editor_terraform_terraform.clampBelowDecks(features, marginM) end

--- Renvoie le dernier indice de grille valide en X et Y du bloc de terrain (nombre de cellules moins 1).
---Source : lua/ge/extensions/editor/terraform/terraform.lua:80
---@param tb userdata TerrainBlock.
---@return integer  Dernier indice en X.
---@return integer  Dernier indice en Y.
function editor_terraform_terraform.gridDims(tb) end

--- Renvoie une fonction height(x, y) donnant le sol tel qu'il était avant les terraformages enregistrés dans 'baselines' (leurs hauteurs d'origine), et le terrain actuel ailleurs. Quand deux enregistrements contiennent la même cellule, le premier de la liste gagne.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:815
---@param baselines table Liste de baselines (terraBaseline).
---@return function  function(x, y) renvoyant la hauteur monde (nil hors terrain selon le code).
function editor_terraform_terraform.groundBefore(baselines) end

--- Distance, au-delà du bord d'une empreinte, sur laquelle le sol est tenu : (0.5 + racine de 2) * squareSize (demi-cellule de peau plus anneau d'une cellule).
---Source : lua/ge/extensions/editor/terraform/terraform.lua:37
---@param squareSize number Taille d'une cellule du terrain en mètres.
---@return number  Portée en mètres.
function editor_terraform_terraform.heldReach(squareSize) end

--- Vide le masque d'occupation persistant (hauteurs et priorités par cellule).
---Source : lua/ge/extensions/editor/terraform/terraform.lua:74
function editor_terraform_terraform.resetMask() end

--- Restaure le terrain qu'un objet a creusé (l'objet reste en place) et oublie son enregistrement obj.terraBaseline.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:802
---@param obj table Objet portant terraBaseline.
---@param recordHistory boolean|nil true pour que la restauration soit annulable (Ctrl+Z) ; les chemins de suppression passent false.
---@return boolean  true s'il y avait un terraformage à défaire (utile pour griser un bouton).
function editor_terraform_terraform.restoreBaseline(obj, recordHistory) end

--- Restaure une fenêtre capturée par terraformToSources(..., baselineOut) : réécrit les hauteurs d'origine, puis rafraîchit la grille une fois. Les cellules modifiées depuis (sculpture, autre route) ne sont pas touchées.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:680
---@param bl table|nil Baseline.
---@param recordHistory boolean|nil true pour enregistrer une étape annulable 'Restore Terrain'.
function editor_terraform_terraform.revertBaseline(bl, recordHistory) end

--- Copie toutes les hauteurs du terrain (grille complète) et l'état du masque d'occupation pour pouvoir y revenir. Ne fait rien sans terrain.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:100
function editor_terraform_terraform.snapshotBaseline() end

--- Remplace le terraformage 'from' par 'to' (chacun peut être nil) en n'écrivant que les cellules dont la hauteur change, pour limiter les appels moteur.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:707
---@param from table|nil Baseline à retirer.
---@param to table|nil Baseline à poser.
function editor_terraform_terraform.swapBaseline(from, to) end

--- Dessine la paire de boutons 'Terraform To X' et 'Restore Terrain' partagée par les outils de splines. 'own' (optionnel) permet à un outil de fournir son propre terraformage ({run(obj, p), restore(obj), hasCarve(obj)}).
---Source : lua/ge/extensions/editor/terraform/terraform.lua:844
---@param obj table Objet terraformé.
---@param canTerraform boolean Affiche le bouton de terraformage ou un espace vide.
---@param p table Paramètres : doi, margin, falloff, roughness, scale, smooth.
---@param label string Nom affiché dans les info-bulles et les identifiants.
---@param icons table Icônes (terrainToLine, settings_backup_restore).
---@param cols table Couleurs (blueB, blueD).
---@param iconsBig any Taille des icônes (ImVec2).
---@param own table|nil Terraformage propre à l'outil.
function editor_terraform_terraform.terraformButtons(obj, canTerraform, p, label, icons, cols, iconsBig, own) end

--- Terraforme la heightmap à partir de features explicites (quads ou anneaux) avec support par anneau de cellules voisines et mode par feature. Avec claimOnly, s'arrête après la fusion : seul le masque d'occupation est écrit, aucune hauteur.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:968
---@param DOI number Domaine d'influence (m).
---@param margin number Marge (m).
---@param falloffExp number Falloff.
---@param roughness number Rugosité.
---@param scale number Échelle du bruit.
---@param features table Liste de features.
---@param passes integer|nil Passes de lissage.
---@param protect any Protection de zones (déduit du code, non détaillé).
---@param priority number|nil Bande de priorité (voir PRIO), 0 par défaut.
---@param baselineOut table|nil Reçoit la baseline des cellules déplacées.
---@param claimOnly boolean|nil true : n'écrit que le masque.
function editor_terraform_terraform.terraformToQuads(DOI, margin, falloffExp, roughness, scale, features, passes, protect, priority, baselineOut, claimOnly) end

--- Terraforme la heightmap d'après des poids de quads et un falloff par champ de distance : le sol sous les sources prend la hauteur de la source, puis se fond dans le terrain sur la marge et le DOI. Écrit dans le terrain, marque le niveau modifié et peut enregistrer une étape d'annulation. Retourne sans rien faire s'il n'y a pas de sources, de terrain block ou de terrain editor.
---Source : lua/ge/extensions/editor/terraform/terraform.lua:572
---@param DOI number Domaine d'influence en mètres (minimum 1).
---@param margin number Marge latérale (apron) en mètres, convertie en cellules.
---@param falloffExp number Exposant/distance de décroissance du falloff (valeur 'falloff' de l'outil).
---@param roughness number Rugosité du bruit dans [0, 1].
---@param scale number Échelle du bruit dans [0, 1].
---@param sources table Liste de sources ; chaque source est une liste de {pos, width, binormal}.
---@param smoothPasses integer|nil Nombre de passes de flou sur l'apron (défaut 5).
---@param baselineOut table|nil Si fourni, rempli avec la baseline (gx, gy, z, w, n, xMin, yMin, xMax, yMax).
---@param clips table|nil Extrémités de route dont le falloff ne doit pas déborder vers l'avant (le tablier reste tenu).
function editor_terraform_terraform.terraformToSources(DOI, margin, falloffExp, roughness, scale, sources, smoothPasses, baselineOut, clips) end

