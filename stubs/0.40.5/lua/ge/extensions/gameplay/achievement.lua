---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/achievement.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE qui relie les statistiques de jeu (gameplay_statistic) aux succès et statistiques du fournisseur en ligne (OnlineServiceProvider : Steam, EOS…). Au démarrage elle lit lua/ge/extensions/gameplay/achievements.json, construit la liste des succès en attente et des statistiques à publier, puis s'abonne aux métriques correspondantes. Quand une métrique atteint le seuil unlockAt, le succès est débloqué. Elle gère aussi trois succès « manuels » (VEHICLE_EXPLORER, LEVEL_EXPLORER, VEHICLE_FAVOURITE). Un moddeur s'en sert surtout via unlockAchievement.
--- Accès : extension `gameplay_achievement` : `extensions.load("gameplay_achievement")`, puis la globale `gameplay_achievement`
---@class gameplay_achievement
---@field dependencies table<integer, string> Extensions chargées avant : {"gameplay_statistic"}.
gameplay_achievement = {}

--- Hook appelé au démarrage d'un niveau ; relance startup() (sans effet si déjà démarré).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/achievement.lua:376
function gameplay_achievement.onClientStartMission() end

--- Hook appelé au déchargement de l'extension ; envoie les statistiques et progressions encore en file d'attente.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/achievement.lua:380
function gameplay_achievement.onExtensionUnloaded() end

--- Hook appelé à la première mise à jour du jeu : lance startup() si le fournisseur en ligne fonctionne, sinon journalise un avertissement.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/achievement.lua:364
function gameplay_achievement.onFirstUpdate() end

--- Hook appelé quand le fournisseur de service en ligne devient prêt ; lance startup().
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/achievement.lua:372
function gameplay_achievement.onOnlineServiceProviderReady() end

--- Callback enregistré auprès de gameplay_statistic pour chaque métrique suivie. Publie les statistiques en ligne correspondantes, pousse la progression des succès et débloque ceux dont la valeur atteint unlockAt (puis les retire de la liste en attente). Désabonne la métrique si plus personne ne l'utilise.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/achievement.lua:108
---@param key string Nom de la métrique modifiée.
---@param oldvalue table|nil Ancienne entrée de la métrique (non utilisée).
---@param newvalue table Nouvelle entrée : champs value (number) et career (boolean).
function gameplay_achievement.statCallback(key, oldvalue, newvalue) end

--- Débloque un succès par son identifiant via OnlineServiceProvider.unlockAchievement. Ne le fait qu'une fois par session pour un même identifiant.
---Source : lua/ge/extensions/gameplay/achievement.lua:385
---@param achievementId string Identifiant du succès côté plateforme.
function gameplay_achievement.unlockAchievement(achievementId) end

