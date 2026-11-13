---@meta
-- tim19Atlas stub generated from lua/vehicle/protocols.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Gestionnaire des protocoles de télémétrie UDP du véhicule (OutGauge pour tableaux de bord externes, MotionSim pour plateformes de mouvement). Au init, il charge chaque module de lua/vehicle/protocols/*.lua activé dans les réglages, ouvre un socket UDP par protocole, remplit un paquet C (ffi) à la fréquence demandée (temps réel, pas temps de simulation) et l'envoie. Il calcule aussi les grandeurs lissées partagées (vitesse, accélération, angles et vitesses angulaires) que les modules lisent dans protocols.xxx. N'agit que pour le premier joueur assis, et jamais en multi-siège.
--- Accès : globale `protocols`
---@class protocols
---@field update function nop, ou updatePhysics(dtSim) si au moins un protocole utilise le pas physique. Appelée à chaque pas de physique.
---@field updateGFX function nop, ou la mise à jour graphique si au moins un protocole n'utilise pas le pas physique.
protocols = {}

--- Ferme les sockets UDP de tous les protocoles actifs et vide la liste.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols.lua:193
function protocols.destroy() end

--- Détruit les protocoles existants, puis (si activés dans les réglages et si on n'est pas en multi-siège) charge, initialise et active chaque module de protocole trouvé, installe update/updateGFX et initialise les lisseurs.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols.lua:206
function protocols.init() end

--- Indique si au moins un protocole actif demande le pas de physique ; sert à enregistrer update() dans la boucle de physique.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols.lua:257
---@return boolean  true si un protocole utilise le pas physique.
function protocols.isPhysicsStepUsed() end

--- Hook appelé quand les joueurs assis changent : si un premier joueur est assis, remet les lisseurs à zéro.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols.lua:265
---@param anyPlayerSeated boolean Vrai si au moins un joueur est assis (non utilisé directement).
function protocols.onPlayersChanged(anyPlayerSeated) end

--- Remet à zéro les lisseurs et appelle reset() de chaque module de protocole qui en définit une.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols.lua:125
function protocols.reset() end

--- Hook appelé quand les réglages utilisateur changent : relance init() pour appliquer les nouveaux réglages de protocoles.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/vehicle/protocols.lua:261
function protocols.settingsChanged() end

