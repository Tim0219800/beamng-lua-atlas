---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/vehicleFilterUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance liée à un `element` d'éditeur.
---@class editor_util_vehicleFilterUtil
local editor_util_vehicleFilterUtil = {}

--- Dessine l'éditeur de filtre complet (options d'éligibilité, filtre de base, réglages de probabilité, ajouts/retraits manuels, aperçu des véhicules résultants).
---Source : lua/ge/extensions/editor/util/vehicleFilterUtil.lua:785
---@param ctd table Données du conteneur.
---@param container table Conteneur parent.
---@param labelFn function Fonction appelée avec l'élément pour dessiner son libellé.
---@return boolean  true si une valeur a été modifiée.
function editor_util_vehicleFilterUtil:draw(ctd, container, labelFn) end

--- Constructeur : mémorise l'élément et charge (une fois) le module configListGenerator.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/vehicleFilterUtil.lua:565
---@param element table Définition de l'élément UI (fieldName, _id, …).
function editor_util_vehicleFilterUtil:init(element) end

--- Prépare une seule fois les données de filtre (filterByProp, filterUiData), initialise baseFilter/probabilitySettings et génère la liste initiale d'options de véhicules.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/vehicleFilterUtil.lua:581
function editor_util_vehicleFilterUtil:initialize() end

--- Restaure le filtre depuis ctd[element.fieldName] (copie profonde) ou les valeurs par défaut, puis vide tous les caches pour régénération.
---Source : lua/ge/extensions/editor/util/vehicleFilterUtil.lua:727
---@param ctd table Données du conteneur.
---@param container table Conteneur parent (non utilisé).
function editor_util_vehicleFilterUtil:setContainer(ctd, container) end

