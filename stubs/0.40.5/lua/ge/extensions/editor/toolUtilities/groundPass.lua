---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/toolUtilities/groundPass.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Le terraformage unique du terrain sur lequel les outils de l'éditeur posent leurs objets. Les réseaux routier et ferré sont creusés ensemble en une seule passe, avec un seul fondu (le rail est prioritaire, PRIO.RAIL). La pente de site de City Builder est posée par-dessus comme seconde passe : levée avant la passe réseau et reposée après. Chaque bouton Build appelle run(), chaque Restore appelle restore().
--- Accès : extension `editor_toolUtilities_groundPass` : `extensions.load("editor_toolUtilities_groundPass")`, puis la globale `editor_toolUtilities_groundPass`
---@class editor_toolUtilities_groundPass
---@field defaults table Valeurs par défaut des réglages numériques.
---@field params table Réglages courants : on, roads, rail (booléens) et doi, margin, falloff, smooth, roughness, scale, abutLen, abutShoulder.
editor_toolUtilities_groundPass = {}

--- Applique des réglages sauvegardés : seules les clés existantes dont le type correspond sont reprises. Ignore un argument non table.
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:189
---@param t table Réglages sauvegardés.
function editor_toolUtilities_groundPass.applyParams(t) end

--- Ajoute à out les éléments de terraformage de chaque réseau enregistré, selon les réglages p (ceux partagés par défaut). Un réseau décoché (p[id] == false) est ignoré.
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:51
---@param out table Liste de sortie.
---@param p table|nil Réglages ; défaut params.
---@return table  La liste out.
function editor_toolUtilities_groundPass.features(out, p) end

--- Copie des réglages, à garder dans le fichier de session de chaque outil.
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:183
---@return table  Copie de params.
function editor_toolUtilities_groundPass.getParams() end

--- Renvoie l'enregistrement de creusement (garde-le entre rechargements Lua et dans les sessions).
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:197
---@return table|nil  owner.terraBaseline.
function editor_toolUtilities_groundPass.getRecord() end

--- Vrai si un creusement est mémorisé (enregistrement partagé ou chose que les sources auraient à remettre).
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:150
---@return boolean  Un creusement existe.
function editor_toolUtilities_groundPass.hasCarve() end

--- Repose la pente de site gardée levée par les passes holdSites, sur le terrain de la dernière passe, en une transaction 'Grade Sites'. Sans effet (0) si rien n'est en attente.
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:129
---@return integer  Résultat de sites.lay(), 0 si rien ou si le réseau est encore en reconstruction.
function editor_toolUtilities_groundPass.laySites() end

--- Renvoie la fonction height(x, y) du terrain avant tous les creusements (terraform.groundBefore). Reconstruite seulement si les enregistrements ont changé ; sans enregistrement elle lit le terrain vivant.
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:162
---@return function  height(x, y).
function editor_toolUtilities_groundPass.naturalGround() end

--- Enregistre (ou remplace, si l'id existe déjà) la source de terraformage d'un réseau.
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:40
---@param id string Id du réseau, aussi clé de params (par exemple 'roads', 'rail').
---@param s table Source avec features(out, p) et éventuellement lift, finish, after, records, hasCarve.
function editor_toolUtilities_groundPass.register(id, s) end

--- Nouveau niveau : oublie l'enregistrement de creusement, puisque le terrain n'est plus celui où il a été fait.
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:209
function editor_toolUtilities_groundPass.reset() end

--- Remet le terrain d'origine sous les réseaux et la pente de site par-dessus (transaction 'Restore Ground').
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:146
---@return integer  Nombre d'éléments (0 en pratique).
function editor_toolUtilities_groundPass.restore() end

--- Terraforme les réseaux (si Terraform est actif) puis repose la pente des sites, en une transaction 'Build Ground'.
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:121
---@param p table|nil Réglages qui remplacent les réglages partagés pour cette exécution.
---@param laySites boolean|nil Pente les sites même s'ils ne l'étaient pas.
---@param holdSites boolean|nil Laisse la pente levée ; il faudra appeler laySites().
---@return integer  Nombre d'éléments de terraformage appliqués (0 si bloqué).
function editor_toolUtilities_groundPass.run(p, laySites, holdSites) end

--- Restaure un enregistrement de creusement (doit être une table avec gx table et n > 0, sinon il est effacé). L'id du bloc est remis à nil : checkOwner rattache l'enregistrement par le niveau.
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:202
---@param bl table|nil Enregistrement.
function editor_toolUtilities_groundPass.setRecord(bl) end

--- Branche la pente de site de City Builder (lift, lay, busy, record).
---Source : lua/ge/extensions/editor/toolUtilities/groundPass.lua:48
---@param s table|nil Objet de sites.
function editor_toolUtilities_groundPass.setSites(s) end

