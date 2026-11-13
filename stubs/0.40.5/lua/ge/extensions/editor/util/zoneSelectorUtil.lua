---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/zoneSelectorUtil.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance liée à un `element` d'éditeur.
---@class editor_util_zoneSelectorUtil
local editor_util_zoneSelectorUtil = {}

--- Dessine l'interface : combos d'ajout, boutons Select All / Remove All, listes avec bouton Remove, résumé. Écrit les listes dans ctd.
---Source : lua/ge/extensions/editor/util/zoneSelectorUtil.lua:93
---@param ctd table Données du conteneur.
---@param container table Conteneur parent (non utilisé ici).
---@param labelFn function Fonction appelée avec l'élément pour dessiner son libellé.
---@return boolean  true si une liste a été modifiée.
function editor_util_zoneSelectorUtil:draw(ctd, container, labelFn) end

--- Constructeur : mémorise l'élément.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/zoneSelectorUtil.lua:11
---@param element table Définition de l'élément UI (fieldName, globalInfoFolderFieldName…).
function editor_util_zoneSelectorUtil:init(element) end

--- Charge les noms de zones depuis `<dossier global>/garages.sites.json` (une seule fois par fichier) dans element.loadedZones.
---Source : lua/ge/extensions/editor/util/zoneSelectorUtil.lua:15
---@param ctd table Données du conteneur contenant le dossier global.
function editor_util_zoneSelectorUtil:loadZonesFromSitesFile(ctd) end

--- Lit initialZones/destinationZones depuis ctd et réinitialise l'état de chargement pour forcer un rechargement.
---Source : lua/ge/extensions/editor/util/zoneSelectorUtil.lua:82
---@param ctd table Données du conteneur.
function editor_util_zoneSelectorUtil:setContainer(ctd) end

