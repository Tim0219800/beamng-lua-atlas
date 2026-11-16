# `editor_api_aiPath`

*Fichier : `lua/ge/extensions/editor/api/aiPath.lua` · VM : Game Engine (GE) · 15 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_api_aiPath` : `extensions.load("editor_api_aiPath")`, puis la globale `editor_api_aiPath`

Module d'API de l'éditeur « aiPath » : coquille vide. Il mémorise seulement l'instance de l'éditeur reçue à l'initialisation et ne définit aucune autre fonction dans cette version.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_api_aiPath.initialize(editorInstance)` | Appelé par l'éditeur au chargement des modules d'API : mémorise l'instance de l'éditeur (variable locale) ; ne fait rien d'autre. *(interne)* | 8 |

### Détail des paramètres

#### `editor_api_aiPath.initialize(editorInstance)`

Appelé par l'éditeur au chargement des modules d'API : mémorise l'instance de l'éditeur (variable locale) ; ne fait rien d'autre.

- `editorInstance` (*table*) : Instance de l'éditeur.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/api/aiPath.lua`.*
