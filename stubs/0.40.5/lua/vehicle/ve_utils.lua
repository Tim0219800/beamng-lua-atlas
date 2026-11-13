---@meta
-- tim19Atlas stub generated from lua/vehicle/ve_utils.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Chronomètre renvoyé par HighPerfTimer(). Stocke l'instant de départ en secondes dans self[1].
---@class ve_utils__HighPerfTimer
local ve_utils__HighPerfTimer = {}

--- Renvoie l'horloge haute précision absolue en millisecondes (pas la durée écoulée).
---Source : lua/vehicle/ve_utils.lua:33
---@return number  os.clockhp()*1000.
function ve_utils__HighPerfTimer:getTime() end

--- Redémarre le chronomètre à l'instant présent.
---Source : lua/vehicle/ve_utils.lua:18
function ve_utils__HighPerfTimer:reset() end

--- Renvoie le temps écoulé depuis le départ, en millisecondes, sans redémarrer.
---Source : lua/vehicle/ve_utils.lua:22
---@return number  Durée en ms.
function ve_utils__HighPerfTimer:stop() end

--- Renvoie le temps écoulé en millisecondes et redémarre le chronomètre.
---Source : lua/vehicle/ve_utils.lua:26
---@return number  Durée en ms.
function ve_utils__HighPerfTimer:stopAndReset() end

--- Crée un chronomètre haute précision démarré à l'instant de création (basé sur os.clockhp).
---Source : lua/vehicle/ve_utils.lua:14
---@return table  Objet _HighPerfTimer avec les méthodes reset, stop, stopAndReset, getTime.
function HighPerfTimer() end

--- Convertit une pression relative en psi en pression absolue en pascals : psi * 6894.757 + 101325.
---Source : lua/vehicle/ve_utils.lua:290
---@param psi number Pression relative en psi.
---@return number  Pression absolue en Pa.
function PSItoPascal(psi) end

--- Construit une table de recherche dense à partir de points {x, y} : un tableau dont l'index est x (entier) et la valeur y interpolée. Droite pour 2 points, spline Catmull-Rom pour 3 ou plus. Sert par exemple aux courbes de couple moteur.
---Source : lua/vehicle/ve_utils.lua:265
---@param points table Liste de {x, y} avec x entiers croissants.
---@param returnArray boolean|nil Si vrai et ffi disponible, renvoie un tableau C float[] (indexé à partir de 0) au lieu d'une table Lua.
---@return table|cdata|nil  Table indexée par x, ou nil si moins de 2 points.
function createCurve(points, returnArray) end

--- Renvoie une couleur du jeu tirée de la palette jet selon l'indice, pour distinguer des courbes ou des éléments de debug.
---Source : lua/vehicle/ve_utils.lua:224
---@param i integer Indice ; la couleur est jetColor((i % 17) / 16).
---@param a number|nil Alpha transmis à jetColor.
---@return color  Couleur du jeu.
function getContrastColor(i, a) end

--- Même palette que getContrastColor mais renvoie une chaîne hexadécimale CSS.
---Source : lua/vehicle/ve_utils.lua:228
---@param i integer Indice (modulo 17).
---@return string  Couleur au format "#rrggbb".
function getContrastColorStringRGB(i) end

--- Sauvegarde des données jbeam compilées dans un fichier texte (ouvre, écrit via saveCompiledJBeamRecursive, ferme). Sert au débogage.
---Source : lua/vehicle/ve_utils.lua:211
---@param data table Données à sauvegarder.
---@param filename string Chemin du fichier de sortie.
---@param lvl integer|nil Niveau initial (0 par défaut).
---@return boolean  false si le fichier n'a pas pu être ouvert (avertissement loggé), sinon true.
function saveCompiledJBeam(data, filename, lvl) end

--- Écrit récursivement une table de données au format texte type JSON dans un fichier ouvert, avec une indentation dépendant du niveau et un commentaire d'en-tête pour chaque table ayant un partPath.
---Source : lua/vehicle/ve_utils.lua:119
---@param f file Fichier ouvert en écriture (io.open).
---@param data table Données à écrire.
---@param level integer Niveau de récursion courant (0 au départ).
function saveCompiledJBeamRecursive(f, data, level) end

--- Convertit une table jbeam au format « première ligne = en-tête, lignes suivantes = valeurs » en liste de dictionnaires {colonne=valeur}. Une ligne qui est un dictionnaire seul définit des options communes appliquées aux lignes suivantes ; un dictionnaire placé en dernière colonne fusionne ses options dans la ligne. Si une ligne a un champ id, il est renommé name.
---Source : lua/vehicle/ve_utils.lua:37
---@param entry table Table jbeam brute (entry[1] = en-tête).
---@return table|boolean  Liste de lignes (table vide si entry est vide), ou false si l'en-tête/une ligne est invalide (un avertissement est loggé).
function tableFromHeaderTable(entry) end

