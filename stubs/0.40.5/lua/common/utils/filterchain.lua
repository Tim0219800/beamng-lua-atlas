---@meta
-- tim19Atlas stub generated from lua/common/utils/filterchain.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Preuve de concept de 'chaîne de filtres' fonctionnelle : on décrit une chaîne par des textes comme 'smooth(2)' ou 'interval(0.1, 0.1)' qui sont compilés (load) en une fonction update chaînant les filtres. Les filtres sont dans la table locale F (smooth, interval, scale, digitize, floor, clamp, examine, startdelay) ; chaque filtre est un objet avec une méthode get(self, dt, ...). Se charge avec require('utils/filterchain') mais seule la fonction de test est exportée : la fabrique newFilterchain est locale et inaccessible. Le fichier définit aussi deux globales de debug (locals, getVarByName).
--- Accès : `require("utils/filterchain")`
---@class utils_filterchain
local utils_filterchain = {}

--- Exemple d'utilisation : crée une chaîne avec le filtre 'interval(0.1, 0.1)' en mode debug (examine) et appelle update 30 fois avec dt = 0.02, en affichant la sortie par dump.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/utils/filterchain.lua:234
function utils_filterchain.test() end

--- Table locale des fabriques de filtres (non exportée). Chaque fonction renvoie un objet filtre avec get(self, dt, ...).
---@class utils_filterchain_F
local utils_filterchain_F = {}

--- Filtre qui borne la valeur entre minval et maxval.
---Source : lua/common/utils/filterchain.lua:123
---@param minval number|nil Minimum, 0 par défaut
---@param maxval number|nil Maximum, 1 par défaut
---@return table  Filtre {get}
function utils_filterchain_F.clamp(minval, maxval) end

--- Filtre qui renvoie 1 si la valeur dépasse le seuil, sinon 0.
---Source : lua/common/utils/filterchain.lua:108
---@param threshold number|nil Seuil, 0.5 par défaut
---@return table  Filtre {get}
function utils_filterchain_F.digitize(threshold) end

--- Filtre de debug : loggue (niveau D, origine filterchain.examine) le texte str suivi des arguments, et renvoie les arguments à partir de commonArgumentsCount+1 (retire les arguments communs comme dt).
---Source : lua/common/utils/filterchain.lua:145
---@param str string Étiquette du log
---@param commonArgumentsCount integer|nil Nombre d'arguments communs à ne pas renvoyer, 0 par défaut
---@return table  Filtre {get}
function utils_filterchain_F.examine(str, commonArgumentsCount) end

--- Filtre qui renvoie math.floor(valeur).
---Source : lua/common/utils/filterchain.lua:117
---@return table  Filtre {get}
function utils_filterchain_F.floor() end

--- Fabrique un filtre clignotant (Interval) : alterne état actif et inactif.
---Source : lua/common/utils/filterchain.lua:67
---@param offsetTime number|nil Décalage de phase, 0 par défaut (stocké mais non utilisé dans get)
---@param timeOn number|nil Durée à l'état actif en s, 0.1 par défaut
---@param timeOff number|nil Durée à l'état inactif en s, 0.1 par défaut
---@return table  Objet Interval
function utils_filterchain_F.interval(offsetTime, timeOn, timeOff) end

--- Filtre qui multiplie la valeur par scaleVal.
---Source : lua/common/utils/filterchain.lua:102
---@param scaleVal number Facteur
---@return table  Filtre {get}
function utils_filterchain_F.scale(scaleVal) end

--- Fabrique un filtre de lissage à vitesse limitée (Smooth).
---Source : lua/common/utils/filterchain.lua:44
---@param rate number|nil Variation maximale par seconde, 1 par défaut
---@return table  Objet Smooth
function utils_filterchain_F.smooth(rate) end

--- Fabrique un filtre (Startdelay) qui retarde une montée de valeur : tant que l'entrée croît depuis moins de startdelay secondes, la sortie reste à l'ancienne valeur.
---Source : lua/common/utils/filterchain.lua:158
---@param startdelay number|nil Délai en secondes, 0 par défaut
---@return table  Objet Startdelay
function utils_filterchain_F.startdelay(startdelay) end

--- Objet renvoyé par F.interval : alterne un état actif (onTime) et inactif (offTime).
---@class utils_filterchain_Interval
local utils_filterchain_Interval = {}

--- Fait avancer le chronomètre interne de dt. Quand l'état est actif, renvoie {dt, ...} (arguments inchangés), sinon {dt, 0, 0, ...} (autant de zéros que d'arguments).
---Source : lua/common/utils/filterchain.lua:79
---@param dt number Pas de temps (s)
---@param ... number Valeurs à transmettre ou annuler (la première décide, déduit du code)
---@return table  {dt, valeurs...}
function utils_filterchain_Interval:get(dt, ...) end

--- Objet renvoyé par F.smooth : rapproche son état de l'échantillon à vitesse maximale rate (unités par seconde).
---@class utils_filterchain_Smooth
local utils_filterchain_Smooth = {}

--- Fait avancer l'état vers sample d'au plus dt*rate et le renvoie. Au premier appel l'état est initialisé à sample.
---Source : lua/common/utils/filterchain.lua:52
---@param dt number Pas de temps (s)
---@param sample number Valeur cible
---@return number  Valeur lissée
function utils_filterchain_Smooth:get(dt, sample) end

--- Objet renvoyé par F.startdelay.
---@class utils_filterchain_Startdelay
local utils_filterchain_Startdelay = {}

--- Si l'échantillon ne dépasse pas la valeur précédente, la mémorise et la renvoie. S'il la dépasse, renvoie l'ancienne valeur tant que le temps de montée cumulé est inférieur à startdelay, puis l'échantillon.
---Source : lua/common/utils/filterchain.lua:167
---@param dt number Pas de temps (s)
---@param sample number Valeur d'entrée
---@return number  Valeur filtrée
function utils_filterchain_Startdelay:get(dt, sample) end

--- GLOBALE de debug : retrouve une variable à partir d'un nom pointé (ex. 'mv.foo') dans une portée (par défaut _G). Le motif utilisé ('([^.]*).(.*)') découpe seulement en deux morceaux au premier séparateur ; fonctionne pour des noms à un ou deux niveaux (déduit du code).
---Source : lua/common/utils/filterchain.lua:37
---@param name string Nom pointé, ex. 'a.b'
---@param scope table|nil Table de départ, _G par défaut
---@return any  Valeur trouvée
function getVarByName(name, scope) end

--- GLOBALE de debug : renvoie une table {nomLocal = valeur} des variables locales de la fonction appelante (debug.getlocal au niveau 2).
---Source : lua/common/utils/filterchain.lua:22
---@return table<string, any>  Variables locales de l'appelant
function locals() end

return utils_filterchain
