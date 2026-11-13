---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/siteLights.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Un seul endroit qui transforme un enregistrement de lumière en objet de scène, pour tous les outils de la suite. Chaque lumière est une lumière de nuit dès qu'elle est posée : sombre de jour, allumée après le crépuscule, commutée par l'environnement (core_environment). Fournit la création (spawn), la mise à jour (apply), un drapeau pour redemander à l'environnement de rescanner la scène (markDirty) et une boucle légère à appeler chaque frame (flush) qui garde les lumières neuves en phase avec le jour et la nuit.
--- Accès : extension `editor_toolUtilities_siteLights` : `extensions.load("editor_toolUtilities_siteLights")`, puis la globale `editor_toolUtilities_siteLights`
---@class editor_toolUtilities_siteLights
---@field TONES table<string, number[]> Teintes nommées : warm {1.00, 0.72, 0.34} (sodium), white {1.00, 0.95, 0.88}, cool {0.78, 0.87, 1.00} (iodures métalliques). Évite que deux sites voisins soient éclairés de couleurs différentes.
editor_toolUtilities_siteLights = {}

--- Règle une lumière existante d'après un enregistrement : rayon (ou portée et angles pour un projecteur), luminosité, couleur, ombres désactivées, position, et rotation vers (dx, dy, dz) pour un projecteur.
---Source : lua/ge/extensions/editor/toolUtilities/siteLights.lua:108
---@param obj userdata Objet PointLight ou SpotLight.
---@param lt table Enregistrement de lumière.
function editor_toolUtilities_siteLights.apply(obj, lt) end

--- À appeler chaque frame par chaque outil qui crée des lumières. Peu coûteux tant que rien n'est dû : effectue le rescan différé, suit l'état jour/nuit de l'environnement (core_environment.getLightState) et commute (setLightEnabled, ou couleur d'instance pour une lentille émissive) les objets marqués.
---Source : lua/ge/extensions/editor/toolUtilities/siteLights.lua:57
function editor_toolUtilities_siteLights.flush() end

--- Signale qu'une lumière est neuve (avec obj : elle sera mise dans l'état jour/nuit courant) ou qu'un rescan complet de la scène est dû (sans obj : fait après une pause de 250 ms). La suppression d'une lumière n'a pas besoin de rescan : l'environnement ignore celles qui ont disparu.
---Source : lua/ge/extensions/editor/toolUtilities/siteLights.lua:49
---@param obj userdata|nil Lumière ou élément lumineux neuf.
function editor_toolUtilities_siteLights.markDirty(obj) end

--- Crée un objet lumière pour un enregistrement (SpotLight s'il porte une direction, sinon PointLight), l'enregistre sous name et l'ajoute à folder. Renvoie nil si la création échoue. Sauf always, la lumière est confiée à l'environnement via markDirty.
---Source : lua/ge/extensions/editor/toolUtilities/siteLights.lua:135
---@param folder userdata|nil Groupe de scène parent.
---@param name string|nil Nom d'objet (nil = sans nom).
---@param lt table Enregistrement de lumière.
---@return userdata|nil  Objet lumière créé.
function editor_toolUtilities_siteLights.spawn(folder, name, lt) end

