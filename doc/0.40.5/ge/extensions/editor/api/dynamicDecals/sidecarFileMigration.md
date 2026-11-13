# `editor_api_dynamicDecals_sidecarFileMigration`

*Fichier : `lua/ge/extensions/editor/api/dynamicDecals/sidecarFileMigration.lua` · VM : Game Engine (GE) · 40 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_dynamicDecals_sidecarFileMigration` : `extensions.load("editor_api_dynamicDecals_sidecarFileMigration")`, puis la globale `editor_api_dynamicDecals_sidecarFileMigration`

Migration des fichiers « sidecar » des textures de decals dynamiques. Passe un sidecar de la version 1 à la version 2 : supprime le champ path et remplace le type sdf (obsolète) par le booléen isSdfCompatible.

## Remarques

- Types de texture connus : greyscale=0, color=1, sdf=2 (obsolète), fillTexture=3.
- Seule la migration v1 -> v2 existe ; une donnée d'une autre version est laissée intacte.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_dynamicDecals_sidecarFileMigration.migrate(data)` | Modifie la table en place : si data.version == 1, la passe en version 2 (path = nil, isSdfCompatible = (type == sdf)). | 34 |

### Détail des paramètres

#### `editor_api_dynamicDecals_sidecarFileMigration.migrate(data)`

Modifie la table en place : si data.version == 1, la passe en version 2 (path = nil, isSdfCompatible = (type == sdf)).

- `data` (*table*) : Contenu du sidecar décodé

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/dynamicDecals/sidecarFileMigration.lua`.*
