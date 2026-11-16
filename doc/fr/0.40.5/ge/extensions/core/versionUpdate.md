# `core_versionUpdate`

*Fichier : `lua/ge/extensions/core/versionUpdate.lua` · VM : Game Engine (GE) · 55 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `core_versionUpdate` : `extensions.load("core_versionUpdate")`, puis la globale `core_versionUpdate`

Détecte au démarrage si le jeu vient d'être mis à jour vers une nouvelle version majeure (comparaison des deux premiers nombres de beamng_version avec le réglage lastVersion). Dans ce cas il lance FS:folderCleanup pour sauvegarder les dossiers utilisateur de l'ancienne version, puis enregistre la version courante dans les réglages. Un moddeur s'en sert rarement ; updatedFromVersion() indique de quelle version on vient.

## Exemple

```lua
local ancienne = core_versionUpdate.updatedFromVersion()
if ancienne then log('I', 'mod', 'mise à jour depuis ' .. ancienne) end
```

## Remarques

- Nouvelle installation (pas de lastVersion et onlineFeatures == 'ask') ou même version majeure : pas de sauvegarde, sauf si le réglage folderCleanupRequested est vrai, auquel cas FS:folderCleanup("") est exécuté.
- Si lastVersion est absent mais que ce n'est pas une nouvelle installation, la valeur « 0.0.0.0.unknown_before_0.38 » est utilisée.
- M.updateBackupPath (chemin renvoyé par FS:folderCleanup) est défini mais absent de la liste des champs exportés ; il n'existe que lors d'une mise à jour majeure.
- onUpdate attend 2 appels (contournement d'un bug du système de réglages), puis se retire (M.onUpdate = nil), relance extensions.hookUpdate('onUpdate') pour reconstruire la liste des hooks, écrit lastVersion et efface folderCleanupRequested.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `core_versionUpdate.onExtensionLoaded()` | Hook appelé au chargement : compare version courante et dernière version enregistrée, lance éventuellement la sauvegarde/nettoyage des dossiers et mémorise lastVersion. *(interne)* *(hook)* | 12 |
| `core_versionUpdate.onUpdate()` | Hook appelé à chaque image, mais seulement jusqu'à la 2e fois : enregistre la version courante dans les réglages puis se supprime lui-même. *(interne)* *(hook)* | 41 |
| `core_versionUpdate.updatedFromVersion()` | Renvoie la version dont on vient de migrer. | 51 |

### Détail des paramètres

#### `core_versionUpdate.updatedFromVersion()`

Renvoie la version dont on vient de migrer.

- **renvoie** : string|nil Ancienne version, nil s'il n'y a pas eu de mise à jour majeure à ce lancement.

## Champs

| Champ | Type | Description |
|---|---|---|
| `lastVersion` | string|nil | Version précédente du jeu si une mise à jour majeure a été détectée à ce lancement, sinon nil. |

## Hooks émis

Évènements diffusés aux extensions par `extensions.hook` :

- `onUpdate` — écouté par 186 module(s)

## Appels vers le moteur (C++)

- `FS:` `folderCleanup`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/versionUpdate.lua`.*
