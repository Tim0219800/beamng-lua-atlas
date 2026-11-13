---@meta
-- tim19Atlas stub generated from lua/ge/extensions/core/hardwareinfo.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension GE `core_hardwareinfo` : collecte les informations matérielles et système (OS, mémoire, CPU, GPU, batterie, disque, mods) via Engine.Platform, calcule des avertissements de performance (mémoire insuffisante, GPU Intel intégré, trop de mods, disque presque plein, fichiers du jeu modifiés, dossier OneDrive, version piratée) et les envoie à l'UI. Gère aussi le benchmark physique « bananabench » et l'analyse d'espace disque. Utile à un moddeur pour lire les caractéristiques de la machine.
--- Accès : extension `core_hardwareinfo` : `extensions.load("core_hardwareinfo")`, puis la globale `core_hardwareinfo`
---@class core_hardwareinfo
core_hardwareinfo = {}

--- Enregistre dans les réglages que l'utilisateur a pris connaissance d'un avertissement (PerformanceWarnings.<warning> = true) et renvoie l'état à l'UI.
---Source : lua/ge/extensions/core/hardwareinfo.lua:202
---@param warning string Code msg de l'avertissement (ex. 'toomanymods').
function core_hardwareinfo.acknowledgeWarning(warning) end

--- Callback appelé par le moteur pendant/après l'analyse disque : relaie vers l'UI ; à la fin (data.running faux) mémorise le résultat et rafraîchit le rapport.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hardwareinfo.lua:211
---@param data table Données d'analyse : running, name, size…
function core_hardwareinfo.diskInfoCallback(data) end

--- Construit et renvoie le rapport matériel complet avec avertissements et états (voir notes).
---Source : lua/ge/extensions/core/hardwareinfo.lua:10
---@return table  Rapport {os, pwr, mem, cpu, gpu, disk, mods, hs?, globalState, sailingTheHighSeas}.
function core_hardwareinfo.getInfo() end

--- Lit 'bananabench.json' (dernier benchmark). Nom exporté avec faute de frappe.
---Source : lua/ge/extensions/core/hardwareinfo.lua:194
---@return table|nil  Résultat du benchmark ou nil.
function core_hardwareinfo.latestBananbench() end

--- Indique si 'bananabench.json' existe.
---Source : lua/ge/extensions/core/hardwareinfo.lua:198
---@return boolean  true si le fichier existe.
function core_hardwareinfo.latestBenchmarkExists() end

--- Écrit dans un fichier JSON les informations brutes mémoire, CPU, GPU, OS et alimentation (sans avertissements).
---Source : lua/ge/extensions/core/hardwareinfo.lua:164
---@param filename string Chemin du fichier JSON de sortie.
function core_hardwareinfo.logInfo(filename) end

--- Hook appelé par le moteur quand le benchmark est terminé : lit le fichier de résultat et l'envoie à l'UI (guihooks BananaBenchReady, nil si le fichier est absent).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hardwareinfo.lua:183
---@param outFilename string Chemin du fichier de résultat.
---@return nil  nil si le fichier n'existe pas, sinon rien.
function core_hardwareinfo.onBananaBenchReady(outFilename) end

--- Hook appelé quand le gestionnaire de mods est prêt : envoie le rapport à jour à l'UI.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/core/hardwareinfo.lua:207
function core_hardwareinfo.onModManagerReady() end

--- Calcule le rapport (getInfo) et l'envoie à l'UI par guihooks 'HardwareInfo'.
---Source : lua/ge/extensions/core/hardwareinfo.lua:157
function core_hardwareinfo.requestInfo() end

--- Lance l'analyse d'espace disque C++ si elle n'a pas déjà été faite ; sinon renvoie à l'UI les résultats connus (guihooks diskInfoCallback).
---Source : lua/ge/extensions/core/hardwareinfo.lua:225
function core_hardwareinfo.runDiskUsage() end

--- Supprime l'ancien 'bananabench.json' et lance le benchmark physique C++ (Engine.Platform.runBananaBench). Le résultat arrive via onBananaBenchReady.
---Source : lua/ge/extensions/core/hardwareinfo.lua:175
function core_hardwareinfo.runPhysicsBenchmark() end

