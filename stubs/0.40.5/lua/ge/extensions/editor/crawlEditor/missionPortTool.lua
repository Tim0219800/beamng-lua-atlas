---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/crawlEditor/missionPortTool.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Outil de migration de l'éditeur de crawl : convertit d'anciennes missions crawl (dossier /gameplay/missions/<niveau>/crawl/<mission>/ contenant bounds.sites.json et race.race.json) vers le nouveau système de crawl. Pour chaque mission il génère un fichier .boundary.json (zone issue de bounds.sites.json), un .path.json (nœuds issus des pathnodes de race.race.json, avec drapeaux de recovery), un .startingPosition.json (position de départ) dans /levels/<niveau>/crawls/, puis un .trail.json dans le dossier de la mission, qui relie le tout. Passe par gameplay/crawl/saveSystem (saveBoundary, savePath, saveStartingPosition, saveTrail).
--- Accès : extension `editor_crawlEditor_missionPortTool` : `extensions.load("editor_crawlEditor_missionPortTool")`, puis la globale `editor_crawlEditor_missionPortTool`
---@class editor_crawlEditor_missionPortTool
editor_crawlEditor_missionPortTool = {}

--- Rescanne les missions du niveau courant et ouvre la fenêtre de portage.
---Source : lua/ge/extensions/editor/crawlEditor/missionPortTool.lua:492
function editor_crawlEditor_missionPortTool.openPortingDialog() end

--- Convertit une mission crawl : lit bounds.sites.json, race.race.json, crée boundary/path/startingPosition dans /levels/<niveau>/crawls/ et le trail dans le dossier de la mission. Journalise chaque erreur avec le tag mission_port_tool.
---Source : lua/ge/extensions/editor/crawlEditor/missionPortTool.lua:132
---@param missionDir string Chemin du dossier de la mission (le nom de la mission est son dernier segment)
---@param targetLevel string|nil Identifiant du niveau de destination ; par défaut le niveau chargé
---@return boolean  true si boundary, path et trail ont été sauvés ; false en cas d'échec (la position de départ est facultative)
function editor_crawlEditor_missionPortTool.portMission(missionDir, targetLevel) end

--- Dessine la fenêtre imgui « Mission Port Tool » (Port All Missions, liste des missions convertibles du niveau courant avec un bouton par mission, Refresh, Close) si le dialogue est ouvert. À appeler à chaque frame (depuis l'éditeur).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/crawlEditor/missionPortTool.lua:409
function editor_crawlEditor_missionPortTool.showPortingDialog() end

