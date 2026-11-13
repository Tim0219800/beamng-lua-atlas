# `editor_scriptAIManager`

*Fichier : `lua/ge/extensions/editor/scriptAIManager.lua` · VM : Game Engine (GE) · 593 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_scriptAIManager` : `extensions.load("editor_scriptAIManager")`, puis la globale `editor_scriptAIManager`

Fenêtre 'Script AI Manager' (menu Gameplay) : enregistre, rejoue et sauvegarde la conduite des véhicules de la scène pour les concepteurs de niveaux. Pour chaque véhicule, elle pilote le module ai du véhicule par queueLuaCommand (ai.startRecording, ai.stopRecording, ai.startFollowing, ai.stopFollowing, ai.scriptStop) et reçoit les enregistrements et l'état du script par des hooks. Elle affiche l'état, la progression, un tracé 3D du chemin enregistré et gère les fichiers *.track.json.

## Exemple

```lua
local recs = extensions.editor_scriptAIManager.getCurrentRecordings()
for vehId, rec in pairs(recs) do print(vehId, #rec.path) end
```

## Remarques

- Les pistes sont écrites et lues dans /replays/scriptai/tracks/ avec l'extension .track.json ; le fichier contient levelName, vehicle (JBeam), recording, version = 2, startDelay et timeOffset.
- Options par véhicule (menu 'More') : Loop (loopCount -1 ou 1), Debug (tracé), Start Offset (coupe X secondes au début), Start Delay (retarde le départ) ; il faut relancer la lecture après les avoir changées.
- Avance rapide : be:setPhysicsSpeedFactor(2) quand elle est cochée, 0 quand elle est décochée.
- À chaque frame de onEditorGui, be:queueAllObjectLua demande à tous les véhicules ai.scriptState() ; la réponse arrive par onVehicleSubmitInfo.
- Le tracé du chemin n'affiche que les points à moins de 100 à 200 m de la caméra (borne entre 100 et 200 selon la distance au point de focus) et peut coûter en performances.
- Le code commenté de persistance (aiscript.json) n'est pas actif.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_scriptAIManager.getCurrentRecordings()` | Renvoie la table des enregistrements en mémoire, indexée par id de véhicule (chaque enregistrement contient notamment le chemin path). | 576 |
| `editor_scriptAIManager.onDeserialized(data)` | Hook de restauration après rechargement Lua : réinstalle recordings et vehState. *(interne)* *(hook)* | 561 |
| `editor_scriptAIManager.onDrawDebug(lastDebugFocusPos, dtReal, dtSim, dtRaw)` | Hook de dessin debug : trace en prismes carrés colorés le chemin enregistré de chaque véhicule (si Display Path est coché et la fenêtre visible), limité aux points proches de la caméra. *(interne)* *(hook)* | 464 |
| `editor_scriptAIManager.onEditorGui()` | Hook de dessin appelé chaque frame : demande l'état de script de tous les véhicules et dessine le tableau (nom, état, progression, boutons enregistrer/lire/stop/sauvegarder/charger/More) et les options de débogage (Fast forward, Display IDs, Display Path). *(interne)* *(hook)* | 130 |
| `editor_scriptAIManager.onEditorInitialized()` | Hook d'initialisation de l'éditeur : enregistre la fenêtre (640x200) et l'entrée de menu 'Script AI Manager' (groupe Gameplay). *(interne)* *(hook)* | 571 |
| `editor_scriptAIManager.onSerialize()` | Hook de sérialisation (rechargement Lua) : renvoie {recordings, vehState}. *(interne)* *(hook)* | 557 |
| `editor_scriptAIManager.onVehicleSubmitInfo(vehId, data)` | Appelé par le véhicule (via extensions.hook) avec ai.scriptState() : calcule le pourcentage (time / endScriptTime), détecte l'état de sommeil (time < startDelay) et le passage à 'idle' quand le script est terminé (data nil). *(interne)* *(hook)* | 515 |
| `editor_scriptAIManager.onVehicleSubmitRecording(vehId, data)` | Appelé par le véhicule (via extensions.hook) quand un enregistrement est terminé : stocke les données dans recordings[vehId]. Ne pas appeler directement. *(interne)* *(hook)* | 509 |
| `editor_scriptAIManager.onVehicleSwitched(oldVehicle, newVehicle, player)` | Hook appelé au changement de véhicule joueur : met à jour le véhicule actif dans la liste. *(interne)* *(hook)* | 567 |
| `editor_scriptAIManager.onWindowMenuItem()` | Appelé par l'entrée de menu : retrouve le véhicule joueur actif et affiche la fenêtre. *(interne)* *(hook)* | 552 |

### Détail des paramètres

#### `editor_scriptAIManager.getCurrentRecordings()`

Renvoie la table des enregistrements en mémoire, indexée par id de véhicule (chaque enregistrement contient notamment le chemin path).

- **renvoie** : table<integer, table> Enregistrements par id de véhicule.

#### `editor_scriptAIManager.onDeserialized(data)`

Hook de restauration après rechargement Lua : réinstalle recordings et vehState.

- `data` (*table*) : Données renvoyées par onSerialize.

#### `editor_scriptAIManager.onDrawDebug(lastDebugFocusPos, dtReal, dtSim, dtRaw)`

Hook de dessin debug : trace en prismes carrés colorés le chemin enregistré de chaque véhicule (si Display Path est coché et la fenêtre visible), limité aux points proches de la caméra.

- `lastDebugFocusPos` (*any*) : Non utilisé : le code lit Lua.lastDebugFocusPos.
- `dtReal` (*number*) : Delta temps réel.
- `dtSim` (*number*) : Delta temps simulation.
- `dtRaw` (*number*) : Delta temps brut.

#### `editor_scriptAIManager.onSerialize()`

Hook de sérialisation (rechargement Lua) : renvoie {recordings, vehState}.

- **renvoie** : table Données à restaurer.

#### `editor_scriptAIManager.onVehicleSubmitInfo(vehId, data)`

Appelé par le véhicule (via extensions.hook) avec ai.scriptState() : calcule le pourcentage (time / endScriptTime), détecte l'état de sommeil (time < startDelay) et le passage à 'idle' quand le script est terminé (data nil).

- `vehId` (*integer*) : Id du véhicule.
- `data` (*table|nil*) : État du script (status, time, scriptTime, endScriptTime, posError...) ou nil si plus de script.

#### `editor_scriptAIManager.onVehicleSubmitRecording(vehId, data)`

Appelé par le véhicule (via extensions.hook) quand un enregistrement est terminé : stocke les données dans recordings[vehId]. Ne pas appeler directement.

- `vehId` (*integer*) : Id du véhicule.
- `data` (*table*) : Enregistrement renvoyé par ai.stopRecording().

#### `editor_scriptAIManager.onVehicleSwitched(oldVehicle, newVehicle, player)`

Hook appelé au changement de véhicule joueur : met à jour le véhicule actif dans la liste.

- `oldVehicle` (*integer*) : Ancien véhicule (déduit du code).
- `newVehicle` (*integer*) : Nouveau véhicule, id utilisé pour trouver l'index.
- `player` (*integer*) : Joueur concerné.

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `be:` `enterVehicle`, `getObject`, `getObjectCount`, `getPlayerVehicleID`, `queueAllObjectLua`, `setPhysicsSpeedFactor`
- `debugDrawer:` `drawLine`, `drawSquarePrism`, `drawText`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/scriptAIManager.lua`.*
