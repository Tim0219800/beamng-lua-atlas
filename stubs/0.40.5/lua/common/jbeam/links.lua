---@meta
-- tim19Atlas stub generated from lua/common/jbeam/links.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Résolution des références entre lignes jbeam. Dans un fichier jbeam, une colonne dont le nom contient ':' (ex. "id1:", "torqueArm:", ou "links:" ) désigne le nom d'une ligne d'une autre section (nodes par défaut si rien après les deux-points, ex. "nodeArm:" ; "id1:nodes" explicite). Ce module repère ces liens (prepareLinksDestructive), les remplace par l'identifiant numérique cid de la cible (resolveLinks), et traite les liens de groupe "[groupe]:section" qui deviennent la liste des cid des lignes appartenant à ces groupes (resolveGroupLinks). C'est ce qui fait que les poutres référencent leurs nœuds par numéro dans les données finales.
--- Accès : `require("jbeam/links")`
---@class jbeam_links
local jbeam_links = {}

--- Parcourt toutes les sections du véhicule, détecte les liens, retire les clés de lien des lignes (modifie vehicle en place) et renvoie un journal à plat de triplets (ligne ou liste, clé, ligne cible) pour que resolveLinks écrive les cid.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/links.lua:15
---@param vehicle table Données jbeam du véhicule (modifiées en place).
---@param sectionRenames table<string, string> Renommages de sections (ancien nom -> nouveau).
---@return table  Liste plate de triplets {conteneur, clé, ligneCible, ...} (indices 1,2,3 puis 4,5,6...).
function jbeam_links.prepareLinksDestructive(vehicle, sectionRenames) end

--- Remplace les colonnes '[groupe]:section' par des listes de cid de lignes appartenant aux groupes cités (clé '_groupe_section').
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/links.lua:184
---@param vehicle table Données jbeam du véhicule.
---@return boolean  Toujours true.
function jbeam_links.resolveGroupLinks(vehicle) end

--- Écrit dans chaque lien le cid de sa cible puis reconstruit les sections de vehicle.validTables en les indexant par cid.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/common/jbeam/links.lua:159
---@param vehicle table Données jbeam du véhicule (avec validTables).
---@param links table Journal renvoyé par prepareLinksDestructive.
---@return boolean  Toujours true.
function jbeam_links.resolveLinks(vehicle, links) end

return jbeam_links
