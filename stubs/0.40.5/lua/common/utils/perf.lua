---@meta
-- tim19Atlas stub generated from lua/common/utils/perf.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Petite bibliothèque de mesure de performance par hook : pendant qu'elle est activée, chaque appel/retour de fonction Lua est chronométré, et des statistiques par fonction sont calculées par fenêtres de temps. Se charge avec require('utils/perf'). Réservé au débogage, ralentit fortement l'exécution ; peut alimenter l'UI de debug via un évènement guihooks.
--- Accès : globale `perf`
---@class perf
---@field data table Dernières statistiques calculées (voir notes). Vide tant qu'aucune fenêtre n'est terminée.
perf = {}

--- Désactive le profilage et remet M.update à nop.
---Source : lua/common/utils/perf.lua:124
function perf.disable() end

--- Active le profilage par hook (événements 'call' et 'return').
---Source : lua/common/utils/perf.lua:116
---@param _windowSize number|nil Durée d'une fenêtre de statistiques en secondes, 10 par défaut
---@param _guiHook string|nil Nom d'évènement guihooks.trigger auquel envoyer M.data à chaque fenêtre
---@param _srcData table|nil Champs ajoutés tels quels à M.data
function perf.enable(_windowSize, _guiHook, _srcData) end

--- Force le calcul des statistiques de la fenêtre en cours (et remet les compteurs à zéro), puis renvoie M.data.
---Source : lua/common/utils/perf.lua:89
---@return table  Statistiques (voir notes)
function perf.getData() end

--- Calcule les statistiques courantes et les écrit dans un CSV, trié par score décroissant.
---Source : lua/common/utils/perf.lua:94
---@param filename string Fichier de sortie
---@return boolean|nil  false si ouverture impossible, nil sinon
function perf.saveDataToCSV(filename) end

--- À appeler à chaque frame une fois activé : compte les frames et déclenche le calcul des statistiques à chaque fenêtre écoulée. nop si désactivé.
---Source : lua/common/utils/perf.lua:38
function perf.update() end

