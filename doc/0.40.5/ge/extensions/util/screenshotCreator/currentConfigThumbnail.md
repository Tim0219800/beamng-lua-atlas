# `util_screenshotCreator_currentConfigThumbnail`

*Fichier : `lua/ge/extensions/util/screenshotCreator/currentConfigThumbnail.lua` · VM : Game Engine (GE) · 75 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_currentConfigThumbnail` : `extensions.load("util_screenshotCreator_currentConfigThumbnail")`, puis la globale `util_screenshotCreator_currentConfigThumbnail`

Sous-module de screenshotCreator qui génère la vignette de la configuration courante d'un véhicule. start() prépare une capture asynchrone : à chaque frame (onPreRender), une coroutine résout le cadrage selon le mode sélectionné (framingManager), capture la vignette hors écran (délai de 5 s maximum) puis appelle le callback avec le résultat. Une seule capture peut être active à la fois.

## Remarques

- Si le cadrage ne peut pas être résolu, le callback est appelé avec success = false et le message d'erreur en quatrième argument.
- Le nom du modèle est lu dans vehicle.jbeam ou vehicle.JBeam.

**Dépendances (chargées avant) :** `util_screenshotCreator_settings`, `util_screenshotCreator_capture`, `util_screenshotCreator_framing_legacy`, `util_screenshotCreator_framing_isometric`, `util_screenshotCreator_framing_procedural`, `util_screenshotCreator_framing_configured`, `util_screenshotCreator_framingManager`

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_currentConfigThumbnail.onExtensionUnloaded()` | Hook appelé au déchargement : abandonne la capture en cours sans appeler son callback. *(interne)* *(hook)* | 70 |
| `util_screenshotCreator_currentConfigThumbnail.onPreRender()` | Hook appelé chaque frame avant le rendu : fait avancer la coroutine de capture. En cas d'erreur Lua, logue l'erreur, libère la capture et appelle le callback avec success = false. *(interne)* *(hook)* | 57 |
| `util_screenshotCreator_currentConfigThumbnail.start(vehicle, configName, outputPath, callback, token)` | Démarre la capture de la vignette d'un véhicule. Refuse (false, "busy") si une capture est déjà en cours. | 43 |

### Détail des paramètres

#### `util_screenshotCreator_currentConfigThumbnail.start(vehicle, configName, outputPath, callback, token)`

Démarre la capture de la vignette d'un véhicule. Refuse (false, "busy") si une capture est déjà en cours.

- `vehicle` (*userdata*) : Véhicule à photographier
- `configName` (*string*) : Nom de la configuration
- `outputPath` (*string*) : Chemin du fichier image à produire
- `callback` (*function*) : callback(success, outputPath, token, errorMessage?) appelé à la fin
- `token` (*any*) : Valeur renvoyée telle quelle au callback
- **renvoie** : boolean true si la capture est lancée, false si occupé
- **renvoie** : string|nil "busy" en cas de refus

## Champs

| Champ | Type | Description |
|---|---|---|
| `dependencies` | table |  |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/currentConfigThumbnail.lua`.*
