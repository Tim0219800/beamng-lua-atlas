# `client_init`

*Fichier : `lua/ge/client/init.lua` · VM : Game Engine (GE) · 200 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/init")`

Initialisation du client graphique (portage de client.cs de Torque). initClient prépare le rendu (postFx, renderManager, systèmes d'éclairage), crée les contrôles GameViewportCtrl « OnlyGui » et CefGui « maincef » (interface web), charge les datablocks (core/art/datablocks, art, assets) puis affiche le menu principal. reloadClient ne recharge que les systèmes d'éclairage et les post-effets.

## Remarques

- Le nom « maincef » ne doit pas changer : il est codé en dur côté C++ (commentaire du code). Son URL de départ est local://local/ui/entrypoints/main/index.html.
- Avec l'argument de ligne de commande -noui, GameViewportCtrl n'est pas créé.
- Si l'adaptateur graphique est « GFX Null Device », l'initialisation des PostFX est sautée (erreur journalisée).
- Avec -convertCSMaterials, les dossiers de datablocks ne sont pas chargés.
- $defaultLevelEnviromentMap est fixée à BNG_Sky_02_cubemap (cubemap par défaut des niveaux sans globalEnviromentMap).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `client_init.initClient()` | Séquence complète d'initialisation du client : rendu de base, contrôles GUI, datablocks, audioData.cs s'il existe, puis loadMainMenu. *(interne)* | 164 |
| `client_init.loadMainMenu()` | Affiche le contrôle « OnlyGui » comme contenu du canvas (menu principal), si les deux objets existent. *(interne)* | 89 |
| `client_init.reloadClient()` | Recharge les systèmes d'éclairage et les post-effets (reloadLightingSystems, reloadPostEffects), utile après un changement de configuration graphique. *(interne)* | 193 |

## Appels vers le moteur (C++)

- `Engine.` `getStartingArgs`
- `FS:` `expandFilename`, `fileExists`
- `TorqueScriptLua.` `exec`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/init.lua`.*
