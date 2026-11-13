---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/compileMeshes.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de build hors-ligne : compile les maillages .dae (Collada) en .cdae (chargement plus rapide) pour les dossiers art/, assets/, vehicles/, levels/, content/ et /core/art/. Chaque sous-dossier est traité isolément (matériaux et objets temporaires dans ObjectsTempGroup). Un cache dans collada_cache/ (clé = SHA1 du .dae) évite de recompiler. À la fin, le jeu s'arrête avec un code de sortie (0 = tout compilé, 1 = fichiers manqués). Il se lance dès le chargement de l'extension.
--- Accès : extension `util_compileMeshes` : `extensions.load("util_compileMeshes")`, puis la globale `util_compileMeshes`
---@class util_compileMeshes
util_compileMeshes = {}

--- Hook de chargement : crée le job work (core_jobsystem.create(work, 1)).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/compileMeshes.lua:238
function util_compileMeshes.onExtensionLoaded() end

--- Boucle principale de compilation, exécutée comme job : trouve tous les .dae, compile ou récupère depuis le cache, écrit la liste des liens en dur, vérifie les fichiers manqués, puis appelle shutdown(code).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/compileMeshes.lua:51
---@param job table Job de core_jobsystem (job.yield est appelé à chaque fichier).
function util_compileMeshes.work(job) end

