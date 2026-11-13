---@meta
-- tim19Atlas stub generated from lua/ge/extensions/campaign/comics.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Affiche une bande dessinée (suite de planches) dans l'interface de la campagne. playComic construit la liste des planches à partir de comicData puis ouvre l'écran UI « campaign.comic » ; quand l'animation Spine est terminée, le callback fourni est appelé. Le canal audio GUI est joué pendant l'affichage.
--- Accès : extension `campaign_comics` : `extensions.load("campaign_comics")`, puis la globale `campaign_comics`
---@class campaign_comics
campaign_comics = {}

--- Hook de changement de scénario : si sc est nil ou si son état est « pre-start », restaure les volumes audio mémorisés.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/campaign/comics.lua:68
---@param sc table|nil Scénario courant ; son champ state est lu.
function campaign_comics.onScenarioChange(sc) end

--- Hook appelé par l'interface à la fin de l'animation Spine : exécute le callback mémorisé (une seule fois), restaure les volumes et arrête le canal AudioChannelGui (arrêt avec paramètre 1).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/campaign/comics.lua:56
function campaign_comics.onSpineAnimationFinished() end

--- Prépare les planches, lance le canal audio AudioChannelGui et navigue vers l'écran « campaign.comic » avec la liste des planches. Mémorise le callback de fin.
---Source : lua/ge/extensions/campaign/comics.lua:18
---@param comicData table Description de la BD : path, order, backgroundSound.
---@param comicFinishedCallback function|nil Appelée une fois la BD terminée ; nop si absente.
function campaign_comics.playComic(comicData, comicFinishedCallback) end

