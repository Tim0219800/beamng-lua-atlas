---@meta
-- tim19Atlas stub generated from lua/ge/extensions/telemetry/hardwareChanges.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Module utilitaire de la télémétrie matérielle (chargé par require) : compare deux instantanés de manettes pour produire des événements de connexion/déconnexion, et dit quelles transitions d'affichage (fenêtre/plein écran) sont suivies. S'appuie sur telemetry/hardwareInput.
--- Accès : extension `telemetry_hardwareChanges` : `extensions.load("telemetry_hardwareChanges")`, puis la globale `telemetry_hardwareChanges`
---@class telemetry_hardwareChanges
telemetry_hardwareChanges = {}

--- Compare deux instantanés et renvoie la liste des événements {…champs du périphérique, connected = true|false}. Les connexions viennent d'abord, triées par nom, puis les déconnexions. Si un même nom change de vidpid ou de productName, il produit une connexion (nouvel appareil) et une déconnexion (ancien).
---Source : lua/ge/extensions/telemetry/hardwareChanges.lua:46
---@param previous table<string, table> Instantané précédent.
---@param current table<string, table> Instantané actuel.
---@return table[]  Événements de changement.
function telemetry_hardwareChanges.connectionChanges(previous, current) end

--- Construit un instantané indexé par nom de périphérique, limité aux types gamepad, joystick, wheel et xinput (clavier, souris, openxr, vinput ignorés). Chaque entrée contient device, deviceType, productName, vidpid et forceFeedback ; pour un volant, le nom anglais officiel est cherché via hardwareInput.officialEnglishName.
---Source : lua/ge/extensions/telemetry/hardwareChanges.lua:15
---@param controllerInfo table[]|nil Liste des contrôleurs (name, type, productName, vidpid, ffbAxes…).
---@return table<string, table>  Instantané par nom de périphérique.
function telemetry_hardwareChanges.controllerSnapshot(controllerInfo) end

--- Vrai seulement pour les passages directs 'Window' vers 'Fullscreen' et 'Fullscreen' vers 'Window'.
---Source : lua/ge/extensions/telemetry/hardwareChanges.lua:69
---@param from string Ancien mode d'affichage.
---@param to string Nouveau mode d'affichage.
---@return boolean  true si la transition est suivie.
function telemetry_hardwareChanges.isTrackedDisplayTransition(from, to) end

