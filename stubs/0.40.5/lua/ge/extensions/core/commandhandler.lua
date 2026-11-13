---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/commandhandler.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Exécute les commandes asynchrones envoyées au jeu par le schéma de protocole « beamng:v1/<commande>/<données> » (lien navigateur, argument de ligne de commande -command, canal pipe). Les commandes reçues avant que l'interface soit prête sont mises en file puis rejouées à onUiReady. Au premier update, lit les arguments de démarrage (-command beamng:...).
--- Accès : extension `core_commandhandler` : `extensions.load("core_commandhandler")`, puis la globale `core_commandhandler`
---@class core_commandhandler
---@field onExtensionLoaded function Fonction vide (nop) : l'extension ne fait rien au chargement.
core_commandhandler = {}

--- Hook : restaure ignoreStartupCmd.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/commandhandler.lua:319
---@param d table table renvoyée par onSerialize
function core_commandhandler.onDeserialized(d) end

--- Hook : au premier update, cherche « -command beamng:... » dans Engine.getStartingArgs() et l'exécute (ignoré si l'extension a été rechargée).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/commandhandler.lua:291
function core_commandhandler.onFirstUpdate() end

--- Traite une commande de schéma « version/commande/données » (sans le préfixe « beamng: »). Met en file si l'UI n'est pas prête. Les commandes inconnues ou mal formées sont journalisées en erreur.
---Source : lua/ge/extensions/core/commandhandler.lua:53
---@param scheme string ex. « v1/openMap/{...json...} », encodé en pourcentage
---@param isStartingArg boolean vrai si la commande vient des arguments de démarrage du jeu
function core_commandhandler.onSchemeCommand(scheme, isStartingArg) end

--- Hook : renvoie {ignoreStartupCmd = true} pour que le rechargement du GE ne rejoue pas la commande de démarrage.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/commandhandler.lua:315
---@return table  données à sérialiser
function core_commandhandler.onSerialize() end

--- Hook : l'interface est prête ; exécute les commandes mises en file.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/commandhandler.lua:283
function core_commandhandler.onUiReady() end

