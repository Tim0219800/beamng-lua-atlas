---@meta
-- tim19Atlas stub generated from lua/ge/extensions/ui/console.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Console de développement « consoleNG » en ImGui (fenêtre « beamng.consoleNG »). Elle affiche le journal du jeu (lu à chaque image via Engine.getFrameLog) avec filtres par niveau (E, W, I, D, A), filtre par origine en motif Lua, pause (touche Arrêt défil), statistiques de journal et défilement automatique. Elle permet aussi d'exécuter des commandes dans quatre contextes : Lua du moteur de jeu (GE), TorqueScript, JavaScript de l'interface (CEF) ou Lua d'un véhicule précis. Un moddeur l'ouvre avec ui_console.toggle() pour déboguer.
--- Accès : extension `ui_console` : `extensions.load("ui_console")`, puis la globale `ui_console`
---@class ui_console
---@field dependencies string[] Extensions chargées avant celle-ci : ui_imgui.
---@field inputCallback nil Toujours nil : assigné depuis une variable locale inexistante (bug).
---@field onExtensionUnloaded nil Toujours nil : assigné depuis une variable locale inexistante (bug), donc aucun hook de déchargement.
ui_console = {}

--- Ferme la fenêtre de la console.
---Source : lua/ge/extensions/ui/console.lua:172
function ui_console.hide() end

--- Hook appelé après un rechargement de Lua : restaure l'état sauvegardé par onSerialize.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/console.lua:1215
---@param data table Table renvoyée par onSerialize.
function ui_console.onDeserialized(data) end

--- Hook appelé au chargement de l'extension : charge les réglages et l'historique, initialise le thème ImGui de l'éditeur et construit la liste des contextes d'exécution.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/console.lua:1230
function ui_console.onExtensionLoaded() end

--- Hook appelé quand un fichier surveillé change. Recharge l'historique si le fichier est /consoleHistory.json.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/console.lua:1239
---@param filename string Chemin du fichier modifié.
---@param type string Type de changement (non utilisé).
function ui_console.onFileChanged(filename, type) end

--- Hook appelé avant un rechargement de Lua : sauvegarde l'état de la fenêtre (ouverte, filtre d'origine, saisie en cours, filtre de niveaux, plein écran, position, défilement).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/console.lua:1199
---@return table  Données à restituer à onDeserialized.
function ui_console.onSerialize() end

--- Hook appelé à chaque image. Si la fenêtre est ouverte, lit les nouvelles lignes du journal (sauf en pause), dessine la console ImGui et traite les commandes saisies ; à la fermeture, rend le contrôle du véhicule.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/console.lua:556
---@param dtReal number Durée réelle de l'image en secondes (non utilisée).
---@param dtSim number Durée simulée de l'image en secondes (non utilisée).
---@param dtRaw number Durée brute de l'image en secondes (non utilisée).
function ui_console.onUpdate(dtReal, dtSim, dtRaw) end

--- Hook appelé quand un véhicule devient actif ou inactif : reconstruit la liste des contextes d'exécution (refreshCombo).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/console.lua:1178
function ui_console.onVehicleActiveChanged() end

--- Hook appelé quand un véhicule est détruit : reconstruit la liste des contextes d'exécution.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/console.lua:1178
function ui_console.onVehicleDestroyed() end

--- Hook appelé quand un véhicule apparaît : reconstruit la liste des contextes d'exécution.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/console.lua:1178
function ui_console.onVehicleSpawned() end

--- Hook appelé quand le véhicule du joueur change : reconstruit la liste des contextes d'exécution.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/ui/console.lua:1178
function ui_console.onVehicleSwitched() end

--- Ouvre la fenêtre de la console.
---Source : lua/ge/extensions/ui/console.lua:168
function ui_console.show() end

--- Ouvre la fenêtre si elle est fermée, la ferme si elle est ouverte.
---Source : lua/ge/extensions/ui/console.lua:176
function ui_console.toggle() end

---Source : lua/ge/extensions/ui/console.lua:429
---@param data any
function ConsoleInputCallback(data) end

