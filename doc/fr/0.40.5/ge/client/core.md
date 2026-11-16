# `client_core`

*Fichier : `lua/ge/client/core.lua` · VM : Game Engine (GE) · 1220 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("client/core")`

Initialisation du « core » graphique du client : crée par code Lua les matériaux, shaders et state blocks de base qui étaient autrefois des scripts Torque. Il couvre les matériaux communs (WarningMaterial, BlankWhite, Corona_Mat, ciels BlackSky/BlueSky/GreySky, grilles Grid512_*, matériaux du track editor, flèche de spawn), les états d'échantillonnage (SamplerClampLinear/Point, SamplerWrapLinear/Point), les shaders de particules, de réflexion, de feuillage et de terrain, l'eau (WaterMat, UnderwaterMat et versions « Basic »), le ciel (atmosphère ScatterSky, SkyLut, étoiles, lune, Voie lactée, météores), les nuages et le matériau de surbrillance et de transparence des véhicules (VehicleHighlightMat, vehicleGhost). Il charge aussi tous les fichiers *.materials.json du dossier core/.

## Remarques

- createVehicleData choisit le modèle de shader selon Engine.Render.getAdapterType() : Direct3D11 donne pixVersion 4, sinon 6 avec le define BNG_HLSL_MODEL=6.
- M.initialized (champ défini dynamiquement, non déclaré en haut du fichier) vaut true une fois initializeCore ou reloadCore exécuté ; initializeCore ne fait rien s'il est déjà vrai.
- Sous Direct3D11, le shader de surbrillance VehicleHighlightShader et vehicleGhost utilisent highlight.hlsl / ghost.hlsl dans shaders/common/vehicle/.
- Les créations sont protégées par scenetree.findObject pour la plupart des objets, ce qui rend les appels répétés sans danger.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `client_core.initializeCore()` | Initialise le client une seule fois : graine aléatoire (setRandomSeed(-1)), objectsRequiredForStartup, création du canvas, matériaux de base, shaders, eau, ciel, nuages et données véhicule. *(interne)* | 1182 |
| `client_core.loadCoreMaterials()` | Crée les matériaux communs et ceux du track editor, puis charge chaque fichier core/**/*.materials.json avec loadJsonMaterialsFile. *(interne)* | 719 |
| `client_core.reloadCore()` | Recrée le canvas via initializeCanvas (utile après un changement de configuration de fenêtre) et marque le core comme initialisé. Ne recrée pas les matériaux. *(interne)* | 1209 |

## Appels vers le moteur (C++)

- `FS:` `findFiles`
- `scenetree.` `findObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/client/core.lua`.*
