---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/meshSpline.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil Mesh Spline du world editor : on trace une spline (nœuds, largeurs, normales) le long de laquelle des meshes statiques (TSStatic) sont répétés, par exemple glissières, barrières ou lampadaires. Ce fichier gère la fenêtre de l'outil, les entrées souris/clavier, le rendu de la spline, l'import depuis des TSStatic existants (polygone ou menu contextuel du scenetree), le terraformage, la sauvegarde de session et le « bake » (verrouiller la spline pour que ses meshes soient sauvegardés avec le niveau). L'état des splines vit dans meshSpline/splineMgr.lua ; le placement des meshes dans meshSpline/populate.lua.
--- Accès : extension `editor_meshSpline` : `extensions.load("editor_meshSpline")`, puis la globale `editor_meshSpline`
---@class editor_meshSpline
editor_meshSpline = {}

--- Appelle fn(mesh, true) pour chaque mesh que l'outil détient pour la spline d'id donné (le « each » de splineLock). Ne fait rien si la spline n'existe plus.
---Source : lua/ge/extensions/editor/meshSpline.lua:108
---@param id string Identifiant de la mesh spline.
---@param fn function Callback appelé avec le mesh et true.
function editor_meshSpline.eachObjectById(id, fn) end

--- Hook appelé en quittant la carte : supprime toutes les mesh splines, y compris désactivées.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshSpline.lua:1907
function editor_meshSpline.onClientEndMission() end

--- Hook de désérialisation : recrée les splines, reprend les meshes des splines verrouillées (pop.adopt), borne l'indice sélectionné et recalcule la table id vers indice.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshSpline.lua:164
---@param data table|nil Données renvoyées par onSerialize.
function editor_meshSpline.onDeserialized(data) end

--- Hook appelé à chaque image par le world editor : applique l'import différé, reconstruit les splines « dirty » même si l'outil est inactif (pour les splines liées), puis, si l'outil est actif, dessine sa fenêtre, gère l'audition de meshes, le polygone d'import, les événements souris/clavier et le rendu. Outil inactif : dessine seulement les enveloppes des splines.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshSpline.lua:1782
function editor_meshSpline.onEditorGui() end

--- Hook d'initialisation du world editor : crée le mode meshSplineEditMode, enregistre la fenêtre « meshSpline » et celle d'audition, et ajoute l'entrée « Convert to Mesh Spline » au menu contextuel du scenetree (valide si au moins 2 TSStatic sont sélectionnés).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshSpline.lua:1886
function editor_meshSpline.onEditorInitialized() end

--- Hook de sérialisation d'extension (avant rechargement Lua) : quitte la vue d'audition, libère les meshes des splines verrouillées, sérialise chaque spline, puis supprime toutes les splines. Renvoie une table vide s'il n'y en a aucune.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/meshSpline.lua:141
---@return table  Liste des splines sérialisées.
function editor_meshSpline.onSerialize() end

--- Verrouille ou déverrouille la mesh spline d'identifiant donné et la reconstruit immédiatement. Avant un verrouillage, reconstruit d'abord une spline « dirty » pour verrouiller ce qui est affiché. Ne fait rien si l'id est inconnu. Utilisé aussi par le Master Spline pour ses enfants liés.
---Source : lua/ge/extensions/editor/meshSpline.lua:98
---@param id string Identifiant (UUID) de la mesh spline.
---@param isLocked boolean true pour verrouiller (isEnabled = false), false pour déverrouiller.
function editor_meshSpline.setLockedById(id, isLocked) end

--- Définit l'indice du nœud sélectionné (sélection partagée entre outils).
---Source : lua/ge/extensions/editor/meshSpline.lua:138
---@param idx integer Indice de nœud, base 1.
function editor_meshSpline.setSelectedNodeIdx(idx) end

--- Définit l'indice de la spline sélectionnée (sélection partagée entre outils).
---Source : lua/ge/extensions/editor/meshSpline.lua:135
---@param idx integer Indice de spline, base 1.
function editor_meshSpline.setSelectedSplineIdx(idx) end

