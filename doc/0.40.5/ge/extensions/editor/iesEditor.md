# `editor_iesEditor`

*Fichier : `lua/ge/extensions/editor/iesEditor.lua` · VM : Game Engine (GE) · 1033 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_iesEditor` : `extensions.load("editor_iesEditor")`, puis la globale `editor_iesEditor`

Fenêtre d'éditeur « IES Cookie Importer (WIP) » (menu Window > Experimental). Elle lit un fichier photométrique IES, affiche ses métadonnées (en-tête, type photométrique, unités, direction de pic), un aperçu, et génère une image « cookie » de lumière (PNG nommé par défaut <fichier>.color.png, avec métadonnées) via editor/api/iesImporter. Utile à un moddeur qui veut créer des textures de projection de phares à partir de données IES.

## Remarques

- Chemin IES par défaut : '/art/special/ies/'. Le chemin de sortie est déduit par iesCookie.inferCookiePathFromIES, sinon <chemin sans .ies>.color.png ; il est recalculé à chaque validation et le dossier est créé au besoin.
- Paramètres (défaut, bornes appliquées avant génération) : résolution 2^9 = 512 (exposant 5 à 12, soit 32 à 4096), angle auto vrai / 35 degrés manuel (0.001 à 179), projection perspective ou linear, rotation 0 (-360 à 360), centre auto faux / theta 0 (0 à 180) / phi 0 (0 à 360), edgeFeather 0 (0 à 1), percentile 100 (0.001 à 100), gamma 1 (0.1 à 4), scale 1 (0 à 4), inversion faux.
- L'angle et le centre manuels sont ignorés quand autoAngle / autoCenter est activé (le centre auto vient de la direction de pic du fichier IES).
- La génération tourne dans un job du jobsystem ; s'il est indisponible, elle se fait en synchrone (generateCookieSync). Une seconde génération pendant qu'une autre tourne est refusée.
- Les fonctions de dessin et les aides sont locales (non exportées) ; seul le cycle de vie de l'extension est exposé. Le sélecteur de fichiers utilise editor_fileDialog.openFile (filtre .ies).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_iesEditor.onEditorGui()` | Appelé à chaque frame par l'éditeur : initialise les valeurs par défaut une fois, traite la fin éventuelle du job de génération, puis dessine la fenêtre (tableau fichiers/infos et aperçu, puis réglages). *(interne)* *(hook)* | 983 |
| `editor_iesEditor.onEditorInitialized()` | Appelé à l'initialisation de l'éditeur : ajoute l'entrée de menu dans le groupe 'Experimental', enregistre la fenêtre (980x700), initialise les valeurs par défaut et logue 'Initialized'. *(interne)* *(hook)* | 1022 |
| `editor_iesEditor.onWindowMenuItem()` | Affiche la fenêtre 'iesEditor' (editor.showWindow) ; appelé par l'entrée de menu. *(interne)* *(hook)* | 1018 |

## Appels vers le moteur (C++)

- `FS:` `directoryCreate`, `directoryExists`, `fileExists`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/iesEditor.lua`.*
