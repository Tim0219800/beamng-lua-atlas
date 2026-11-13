---@meta
-- tim19Atlas stub generated from lua/ge/extensions/util/testExtensionProxies.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Extension de test du système d'ExtensionProxy. Au chargement, elle crée 11 objets ExtensionProxyTester (id 0 à 10) et les soumet comme « event sinks » à un proxy créé par newExtensionProxy(M), de sorte que les hooks de l'extension (comme onUpdate) soient redistribués à chaque instance. Utile seulement pour comprendre ce mécanisme ou le déboguer.
--- Accès : extension `util_testExtensionProxies` : `extensions.load("util_testExtensionProxies")`, puis la globale `util_testExtensionProxies`
---@class util_testExtensionProxies
util_testExtensionProxies = {}

--- Appelé au chargement de l'extension. Crée 11 testeurs, un proxy d'extension, et lui soumet les testeurs avec submitEventSinks.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/testExtensionProxies.lua:27
function util_testExtensionProxies.onExtensionLoaded() end

--- Appelé au déchargement de l'extension. Détruit le proxy d'extension.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/testExtensionProxies.lua:22
function util_testExtensionProxies.onExtensionUnloaded() end

--- Objet de test avec un champ id ; reçoit les hooks redistribués par le proxy.
---@class util_testExtensionProxies_ExtensionProxyTester
local util_testExtensionProxies_ExtensionProxyTester = {}

--- Hook de mise à jour : affiche dans la console l'id du testeur et dtReal.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/util/testExtensionProxies.lua:16
---@param dtReal number Temps réel écoulé (s).
---@param dtSim number Temps de simulation écoulé (s).
---@param dtRaw number Temps brut écoulé (s).
function util_testExtensionProxies_ExtensionProxyTester:onUpdate(dtReal, dtSim, dtRaw) end

