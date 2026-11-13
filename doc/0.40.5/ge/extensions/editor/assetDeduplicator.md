# `editor_assetDeduplicator`

*Fichier : `lua/ge/extensions/editor/assetDeduplicator.lua` · VM : Game Engine (GE) · 996 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_assetDeduplicator` : `extensions.load("editor_assetDeduplicator")`, puis la globale `editor_assetDeduplicator`

Outil d'éditeur « Asset Deduplicator » (menu Window > Assets) : repère les fichiers en double du niveau courant et propose de les remplacer par des fichiers lien. Il construit un cache de hashs (/temp/assetdeduplicator.cache.json, version 3, lié à la version du jeu) via un job, puis compare soit par hash de contenu (sans risque), soit par nom de fichier (revue manuelle requise). Utile surtout aux équipes qui préparent des niveaux ; rien à appeler depuis un mod.

## Remarques

- Écrit/lit le cache dans /temp/assetdeduplicator.cache.json ; les boutons « Reset current level asset cache » et « Deep clean asset cache » l'invalident.
- Le lancement du job de cache se fait une seule fois par session (jobLaunchedThisSession) à la première ouverture de la fenêtre.
- Bug mineur probable : « Deep clean asset cache » met cacheData à nil, alors que le reste du code suppose une table (tableIsEmpty(cacheData) est ensuite rappelé) — déduit du code.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_assetDeduplicator.onEditorActivated()` | Hook appelé à l'activation de l'éditeur ; corps vide. *(interne)* *(hook)* | 976 |
| `editor_assetDeduplicator.onEditorDeactivated()` | Hook appelé à la désactivation de l'éditeur ; corps vide. *(interne)* *(hook)* | 980 |
| `editor_assetDeduplicator.onEditorGui()` | Hook appelé à chaque frame de l'éditeur : dessine la fenêtre « Asset Deduplicator » (état du cache, choix du mode hash/nom, bouton « Run assessment », prévisualisation et application des liens, boutons de reset du cache). Lance le job de génération de cache à la première ouverture. *(interne)* *(hook)* | 849 |
| `editor_assetDeduplicator.onEditorInitialized()` | Hook appelé à l'initialisation de l'éditeur : ajoute l'entrée de menu « Asset Deduplicator » (groupe Assets) et enregistre la fenêtre 'assetDeduplicator' (500x300). *(interne)* *(hook)* | 984 |
| `editor_assetDeduplicator.onWindowMenuItem()` | Callback du menu : affiche la fenêtre 'assetDeduplicator'. *(hook)* | 38 |

## Appels vers le moteur (C++)

- `FS:` `fileExists`, `fileSize`, `findFiles`, `getFileRealPath`, `getUserPath`, `hashFile`, `isLinkFile`, `removeFile`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/assetDeduplicator.lua`.*
