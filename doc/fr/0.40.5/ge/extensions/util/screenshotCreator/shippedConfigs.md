# `util_screenshotCreator_shippedConfigs`

*Fichier : `lua/ge/extensions/util/screenshotCreator/shippedConfigs.lua` · VM : Game Engine (GE) · 93 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_screenshotCreator_shippedConfigs` : `extensions.load("util_screenshotCreator_shippedConfigs")`, puis la globale `util_screenshotCreator_shippedConfigs`

Détermine si un modèle de véhicule ou une configuration (.pc) est « livré » avec le jeu, c'est-à-dire non exclu par le fichier de filtres de déploiement /DevTools/deployfilters/shared_prepack.txt. Le fichier est lu une fois (règles en minuscules, lignes vides et commentaires # ignorés), les règles de type glob (*, **, ?) sont converties en motifs Lua et les résultats sont mis en cache. Utilisé par le créateur de vignettes (modelSelection, job) pour ne photographier que les véhicules livrés.

## Remarques

- Un chemin est considéré comme livré par défaut ; il cesse de l'être dès qu'une règle du fichier le reconnaît (préfixe exact ou motif glob).
- Si le fichier /DevTools/deployfilters/shared_prepack.txt n'existe pas (cas d'une installation normale du jeu, ce dossier DevTools étant un outil interne), aucune règle n'est chargée et tout est considéré comme livré.
- Les chemins testés sont /vehicles/<modèle>/ et /vehicles/<modèle>/<config>.pc (en minuscules).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_screenshotCreator_shippedConfigs.clearCache()` | Oublie les règles chargées et le cache de résultats ; le fichier de filtres sera relu au prochain appel. | 87 |
| `util_screenshotCreator_shippedConfigs.isConfigShipped(modelName, configName)` | Indique si le modèle ET le fichier /vehicles/<modèle>/<config>.pc sont livrés. | 82 |
| `util_screenshotCreator_shippedConfigs.isModelShipped(modelName)` | Indique si le dossier /vehicles/<modèle>/ n'est pas exclu par les filtres de déploiement. | 78 |

### Détail des paramètres

#### `util_screenshotCreator_shippedConfigs.isConfigShipped(modelName, configName)`

Indique si le modèle ET le fichier /vehicles/<modèle>/<config>.pc sont livrés.

- `modelName` (*string*) : Nom du modèle.
- `configName` (*string*) : Nom de la configuration, sans extension .pc.
- **renvoie** : boolean true si la config est livrée.

#### `util_screenshotCreator_shippedConfigs.isModelShipped(modelName)`

Indique si le dossier /vehicles/<modèle>/ n'est pas exclu par les filtres de déploiement.

- `modelName` (*string*) : Nom du modèle (dossier de véhicule).
- **renvoie** : boolean true si le modèle est livré.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/screenshotCreator/shippedConfigs.lua`.*
