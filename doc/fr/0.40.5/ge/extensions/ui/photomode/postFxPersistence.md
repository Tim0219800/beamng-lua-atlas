# `ui_photomode_postFxPersistence`

*Fichier : `lua/ge/extensions/ui/photomode/postFxPersistence.lua` · VM : Game Engine (GE) · 154 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `ui_photomode_postFxPersistence` : `extensions.load("ui_photomode_postFxPersistence")`, puis la globale `ui_photomode_postFxPersistence`

Sauvegarde et relecture sur disque de l'état des effets de post-traitement du mode photo (profondeur de champ, flou de mouvement, occlusion spéculaire, qualité SSAO/SSR/reflets/miroirs, visibilité des occupants). Le fichier sert à restaurer les réglages d'origine du joueur après une session photo. Les valeurs lues sont normalisées (booléens, nombres, chaînes) et les champs inconnus sont ignorés.

## Remarques

- Fichier écrit : settings/photomodePostFxRestoreState.json, au format {version = 1, effects = {...}}. Un ancien fichier sans enveloppe (table d'effets directe) est aussi accepté à la lecture.
- Champs booléens : dofEnabled, dofAutofocus, specularOcclusionEnabled, screenSpaceShadowsEnabled, motionBlurEnabled, occupantsVisible. Champs numériques : dofMaxBlurNear, dofMaxBlurFar, dofFocusRange, dofAperture, dofFalloffSharpness, motionBlurStrength. Champs chaînes : ssaoQualityMode, ssrQualityMode, reflectionQualityMode, mirrorsQualityMode.
- Si un champ DOF (dofEnabled, dofMaxBlurNear, dofMaxBlurFar, dofFocusRange) est présent mais pas dofAutofocus, dofAutofocus est forcé à false.
- Les booléens acceptent true/false, 1/0, "1"/"0", "true"/"false" ; toute autre valeur donne false.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `ui_photomode_postFxPersistence.loadRestoreState()` | Lit le fichier de sauvegarde et renvoie l'état normalisé des effets, ou nil si le fichier est absent, illisible ou sans champ connu. | 145 |
| `ui_photomode_postFxPersistence.saveRestoreState(effectsState)` | Normalise la table d'effets puis l'écrit dans RESTORE_STATE_FILE. Renvoie nil, false si la table n'est pas valide ou ne contient aucun champ connu. | 137 |

### Détail des paramètres

#### `ui_photomode_postFxPersistence.loadRestoreState()`

Lit le fichier de sauvegarde et renvoie l'état normalisé des effets, ou nil si le fichier est absent, illisible ou sans champ connu.

- **renvoie** : table|nil État normalisé des effets.

#### `ui_photomode_postFxPersistence.saveRestoreState(effectsState)`

Normalise la table d'effets puis l'écrit dans RESTORE_STATE_FILE. Renvoie nil, false si la table n'est pas valide ou ne contient aucun champ connu.

- `effectsState` (*table*) : Table d'effets (champs listés dans les notes) ; les champs inconnus sont ignorés.
- **renvoie** : table|nil État normalisé, ou nil si rien à sauvegarder.
- **renvoie** : boolean true si l'écriture du fichier a réussi (une erreur est journalisée sinon).

## Champs

| Champ | Type | Description |
|---|---|---|
| `RESTORE_STATE_FILE` | string | Chemin relatif du fichier de sauvegarde : "settings/photomodePostFxRestoreState.json". |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/ui/photomode/postFxPersistence.lua`.*
