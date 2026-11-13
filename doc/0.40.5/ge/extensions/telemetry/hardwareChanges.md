# `telemetry_hardwareChanges`

*Fichier : `lua/ge/extensions/telemetry/hardwareChanges.lua` · VM : Game Engine (GE) · 79 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `telemetry_hardwareChanges` : `extensions.load("telemetry_hardwareChanges")`, puis la globale `telemetry_hardwareChanges`

Module utilitaire de la télémétrie matérielle (chargé par require) : compare deux instantanés de manettes pour produire des événements de connexion/déconnexion, et dit quelles transitions d'affichage (fenêtre/plein écran) sont suivies. S'appuie sur telemetry/hardwareInput.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `telemetry_hardwareChanges.connectionChanges(previous, current)` | Compare deux instantanés et renvoie la liste des événements {…champs du périphérique, connected = true\|false}. Les connexions viennent d'abord, triées par nom, puis les déconnexions. Si un même nom change de vidpid ou de productName, il produit une connexion (nouvel appareil) et une déconnexion (ancien). | 46 |
| `telemetry_hardwareChanges.controllerSnapshot(controllerInfo)` | Construit un instantané indexé par nom de périphérique, limité aux types gamepad, joystick, wheel et xinput (clavier, souris, openxr, vinput ignorés). Chaque entrée contient device, deviceType, productName, vidpid et forceFeedback ; pour un volant, le nom anglais officiel est cherché via hardwareInput.officialEnglishName. | 15 |
| `telemetry_hardwareChanges.isTrackedDisplayTransition(from, to)` | Vrai seulement pour les passages directs 'Window' vers 'Fullscreen' et 'Fullscreen' vers 'Window'. | 69 |

### Détail des paramètres

#### `telemetry_hardwareChanges.connectionChanges(previous, current)`

Compare deux instantanés et renvoie la liste des événements {…champs du périphérique, connected = true|false}. Les connexions viennent d'abord, triées par nom, puis les déconnexions. Si un même nom change de vidpid ou de productName, il produit une connexion (nouvel appareil) et une déconnexion (ancien).

- `previous` (*table<string, table>*) : Instantané précédent.
- `current` (*table<string, table>*) : Instantané actuel.
- **renvoie** : table[] Événements de changement.

#### `telemetry_hardwareChanges.controllerSnapshot(controllerInfo)`

Construit un instantané indexé par nom de périphérique, limité aux types gamepad, joystick, wheel et xinput (clavier, souris, openxr, vinput ignorés). Chaque entrée contient device, deviceType, productName, vidpid et forceFeedback ; pour un volant, le nom anglais officiel est cherché via hardwareInput.officialEnglishName.

- `controllerInfo` (*table[]|nil*) : Liste des contrôleurs (name, type, productName, vidpid, ffbAxes…).
- **renvoie** : table<string, table> Instantané par nom de périphérique.

#### `telemetry_hardwareChanges.isTrackedDisplayTransition(from, to)`

Vrai seulement pour les passages directs 'Window' vers 'Fullscreen' et 'Fullscreen' vers 'Window'.

- `from` (*string*) : Ancien mode d'affichage.
- `to` (*string*) : Nouveau mode d'affichage.
- **renvoie** : boolean true si la transition est suivie.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/telemetry/hardwareChanges.lua`.*
