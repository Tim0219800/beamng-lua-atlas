---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/resaveMaterials.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de migration pour les développeurs : charge d'anciens fichiers de matériaux TorqueScript (materials.cs), puis les resauvegarde au nouveau format (JSON) via un PersistenceManager, en supprimant ensuite les objets chargés. Le traitement démarre dès le chargement de l'extension, dans un job asynchrone.
--- Accès : extension `util_resaveMaterials` : `extensions.load("util_resaveMaterials")`, puis la globale `util_resaveMaterials`
---@class util_resaveMaterials
util_resaveMaterials = {}

--- Appelé au chargement de l'extension : désactive des catégories de logs console et crée le job work (yield toutes les secondes).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/resaveMaterials.lua:62
function util_resaveMaterials.onExtensionLoaded() end

--- Corps du job : pour chaque materials.cs trouvé, exécute le script, repère les objets créés à partir de ce fichier, les marque modifiés, les sauvegarde au nouveau format puis les supprime. Logue DONE à la fin.
---Source : lua/ge/extensions/util/resaveMaterials.lua:25
---@param job table Objet job du core_jobsystem (non utilisé directement)
function util_resaveMaterials.work(job) end

