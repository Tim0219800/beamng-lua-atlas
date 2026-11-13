# `editor_util_vehicleSelectUtil`

*Fichier : `lua/ge/extensions/editor/util/vehicleSelectUtil.lua` · VM : Game Engine (GE) · 491 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/editor/util/vehicleSelectUtil")` (fichier sous extensions/ mais pas une extension classique)

Classe utilitaire imgui de l'éditeur : un sélecteur de véhicule en cascade Type > Modèle > Config, avec en option jusqu'à 3 peintures (paintNameKeys paintName/paintName2/paintName3) et un fichier de config personnalisé (.pc). Le module renvoie un constructeur : `require('editor/util/vehicleSelectUtil')(name, data)`. Utilisé par exemple par le nœud flowgraph imVehicleSelect, multiSpawnManager, trafficManager et le mission editor.

## Exemple

```lua
local sel = require('editor/util/vehicleSelectUtil')('Mon véhicule')
sel:setOptions({enablePaints = true, paintLayers = 2})
-- dans un callback imgui :
local reason = sel:widget() -- 'type' | 'model' | 'config' | 'paintName' | 'customConfig' | nil
if reason then print(sel.model, sel.config, sel.configPath) end
```

## Remarques

- widget() renvoie la raison du changement (updateReason) ou nil : 'type', 'model', 'config', 'paintName'/'paintName2'/'paintName3' (clé du champ) ou 'customConfig'.
- Résultat lu dans les champs de l'instance : model (clé), config (clé), configPath ('vehicles/<model>/<config>.pc' ou chemin custom), paintName, paintName2, paintName3, vehType, customConfigActive.
- Types autorisés par défaut : Car, Truck, Automation, Trailer, Prop, Utility, Traffic, Unknown, Any ; si allowedTypes n'a qu'un élément, le combo Type est désactivé. Sous-types de config autorisés : PropTraffic, PropParked.
- Si un seul modèle (ou une seule config) est disponible, il est sélectionné automatiquement et le combo est grisé.
- setModelListByField et setConfigListByField sont des stubs vides (marqués TODO) : ils ne font rien.
- fetchData met self.modelName = dumps(Name), donc le nom contient des guillemets tant qu'il est issu de ce chemin.
- Dans la boucle des modèles, si un modèle n'a pas de Name, `label` vaut nil et la concaténation lève une erreur.

## Classe `C`

Instance du sélecteur. Champs d'options : allowedTypes, allowedSubtypes, modelBlacklist (table clé->true), configBlacklist (model -> {configKey = true}), enableConfigs (true), enablePaints (false), enableCustomConfig (false), paintLayers (3), columnWidth (80 par défaut, multiplié par im.uiscale).

Le module renvoie un constructeur : `local obj = require("editor_util_vehicleSelectUtil")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:fetchData()` | Charge si nécessaire les listes de modèles (filtrés par type et blacklist, triés par nom), de configs (filtrées par blacklist et sous-types) et de peintures du modèle courant. | 155 |
| `C:getPaintPtr(paintTbl)` | Convertit une peinture (table {r,g,b,a}, ou table avec baseColor en tableau ou en x/y/z/w) en tableau flottant imgui à 4 composantes ; blanc par défaut. | 135 |
| `C:init(name, data)` | Constructeur : crée un id unique, réinitialise sélections et options, puis applique `data` s'il est donné. | 19 |
| `C:onActivate()` | Callback d'edit mode vide. | 479 |
| `C:onDeactivate()` | Callback d'edit mode vide. | 482 |
| `C:resetConfig()` | Efface les configs, la config choisie et la config personnalisée. | 89 |
| `C:resetModel()` | Efface la liste des modèles et le modèle choisi. | 83 |
| `C:resetOptions()` | Remet les options par défaut (types autorisés, blacklists vides, enableConfigs vrai, enablePaints faux, 3 couches de peinture). | 115 |
| `C:resetPaint()` | Efface les peintures disponibles et choisies. | 99 |
| `C:resetSelections()` | Efface type, modèle, config et peintures. | 107 |
| `C:setConfig(config)` | Définit directement la config par sa clé (le modèle doit déjà être défini) ; calcule configName et configPath. Remet config à nil si la config n'existe pas. | 55 |
| `C:setConfigListByField(model, key, value, disallow)` | Stub (TODO) : devrait filtrer les configs d'un modèle par champ/valeur ; ne fait rien. | 131 |
| `C:setModel(model)` | Définit directement le modèle par sa clé ; renseigne vehType et modelName depuis core_vehicles.getModel, ou remet model à nil si inconnu. | 42 |
| `C:setModelListByField(key, value, disallow)` | Stub (TODO) : devrait filtrer les modèles par champ/valeur ; ne fait rien. | 127 |
| `C:setOptions(data)` | Copie les options enableConfigs, enablePaints, enableCustomConfig, paintLayers et columnWidth présentes (truthy) dans data vers l'instance. | 73 |
| `C:widget()` | Dessine l'interface (combos Type, Model, Config, Paint 1-3, champ de config personnalisée) et applique les remises à zéro en cascade. | 206 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/util/vehicleSelectUtil.lua`.*
