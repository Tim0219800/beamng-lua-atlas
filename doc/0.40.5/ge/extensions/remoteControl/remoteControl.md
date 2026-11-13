# `remoteControl_remoteControl`

*Fichier : `lua/ge/extensions/remoteControl/remoteControl.lua` · VM : Game Engine (GE) · 95 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `remoteControl_remoteControl` : `extensions.load("remoteControl_remoteControl")`, puis la globale `remoteControl_remoteControl`

Exemple/prototype de télécommande HTTP : au chargement, démarre un petit serveur HTTP (utils/simpleHttpServer) sur 0.0.0.0:8081 qui sert les fichiers de /lua/ge/extensions/remoteControl/ et quelques routes d'API, et enregistre un périphérique d'entrée virtuel « httpcontrollerv1 » (1 axe, 2 boutons déclarés) auprès du gestionnaire d'entrées virtuelles. Il sert de base pour piloter le jeu depuis un téléphone ou un navigateur.

## Remarques

- Routes HTTP : GET /hello/<nombre> renvoie « hello world: <nombre> » ; /api/getInfo/ renvoie la version, l'architecture, l'ip et le port ; /api/ping renvoie ["pong"] ; /api/btn inverse l'état du bouton 0 et émet un évènement vinput.
- SÉCURITÉ : le serveur écoute sur toutes les interfaces (0.0.0.0) sans authentification.
- onUpdate émet en continu une valeur d'axe sinusoïdale (sin(t)+1)/2 sur l'axe 0 : ce n'est qu'une démonstration, pas un vrai contrôle.
- M.onFirstUpdate est assigné à une variable locale jamais définie (donc nil) : champ sans effet.
- onUpdate appelle ws.update() même si le serveur n'a pas été créé (ws nil avant onExtensionLoaded) ; en pratique onExtensionLoaded précède onUpdate.
- Les variables httpListenPort et port sont dupliquées (8081 deux fois) ; le serveur utilise `port`.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `remoteControl_remoteControl.onExtensionLoaded()` | Hook appelé au chargement de l'extension : démarre le serveur HTTP et déclare les routes. *(interne)* *(hook)* | 17 |
| `remoteControl_remoteControl.onExtensionUnloaded()` | Hook appelé au déchargement : désenregistre le périphérique virtuel (le serveur HTTP n'est pas arrêté explicitement). *(interne)* *(hook)* | 62 |
| `remoteControl_remoteControl.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé à chaque image : traite les requêtes HTTP et émet les évènements du périphérique virtuel (l'enregistre à la première image). *(interne)* *(hook)* | 46 |

### Détail des paramètres

#### `remoteControl_remoteControl.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé à chaque image : traite les requêtes HTTP et émet les évènements du périphérique virtuel (l'enregistre à la première image).

- `dtReal` (*number*) : Delta temps réel (s).
- `dtSim` (*number*) : Delta temps simulé (s).
- `dtRaw` (*number*) : Delta temps brut (s).

## Champs

| Champ | Type | Description |
|---|---|---|
| `_unittests` | table | Table de tests unitaires (testExampleSuccess, testExampleFailure_shouldFail) pour le lanceur de tests du jeu. |
| `onFirstUpdate` | nil | Référence à une variable locale non définie : vaut nil. ⚠ référence `onFirstUpdate` non définie dans le fichier (vaut probablement nil) |

## Classe `tests`

Tests d'exemple exposés par _unittests ; les fonctions doivent commencer par « test ».

| Méthode | Description | Ligne |
|---|---|---|
| `tests.testExampleFailure_shouldFail(context)` | Test d'exemple qui échoue volontairement. | 83 |
| `tests.testExampleSuccess(context)` | Test d'exemple qui réussit (42 == 42). | 72 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/remoteControl/remoteControl.lua`.*
