# `core_cameraModes_relative`

*Fichier : `lua/ge/extensions/core/cameraModes/relative.lua` · VM : Game Engine (GE) · 404 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("extensions/core/cameraModes/relative")` (fichier sous extensions/ mais pas une extension classique)

Caméra libre « relative au véhicule » (désactivée par défaut) : une caméra volante dont la position est exprimée dans le repère du véhicule (nœuds ref/left/back), donc qui accompagne le véhicule en mouvement. Déplacement et regard au clavier/souris (vitesse x5 loin du véhicule), zoom manuel, 10 emplacements mémorisables de position/rotation/FOV (touches de raccourci, menu radial « Relative Camera »), lumière ponctuelle attachée (0 / 500 / 2500 / 5000 lm) et préréglages de nearClip (niveau, 0.5 mm, 1 cm, 10 cm). Peut être préinitialisée par des emplacements nommés définis dans le jbeam (éléments numérotés avec .name). Renvoie un constructeur.

## Remarques

- Crée à la demande un objet PointLight 'relativecameralight' (canSave = false, rayon 20 m) dans scenetree.
- Si les nœuds ref/left/back manquent, utilise les nœuds 0, 1, 2 (journal de debug). Après un changement de modèle de véhicule, la caméra est recalculée une image plus tard.
- La page extraite indique hotkey(modifier) mais le code est hotkey(hotkey, modifier) ; modifier 0 = charger l'emplacement, 1 = l'enregistrer. loadSlot accepte un numéro ou un nom d'emplacement.
- La lumière est éteinte (storeLightInfo) quand la caméra perd le focus et restaurée (restoreLightInfo) quand elle le retrouve.

## Classe `C`

Mode relatif. Champs : pos (vec3 repère véhicule), rot (vec3 degrés), slots, lightIntensity, nearClip (nil = niveau), manualzoom, camMaxDist.

Le module renvoie un constructeur : `local obj = require("core_cameraModes_relative")(options)`.

| Méthode | Description | Ligne |
|---|---|---|
| `C:_updateLight(intensity)` | Applique une intensité (>= 0) à la lumière de la caméra, la crée si besoin. | 48 |
| `C:deserialize(s)` | Restaure l'état de serialize. | 202 |
| `C:hotkey(hotkey, modifier)` | Raccourci clavier d'emplacement ; ignoré sans focus. | 236 |
| `C:init()` | Valeurs par défaut (resetCameraOnVehicleReset = false, disabledByDefault, canUseVehicleTriggerCrosshair) puis onVehicleCameraConfigChanged et reset. | 23 |
| `C:listParams()` | Réglages UI : light, nearClip, slots, fov. | 214 |
| `C:loadSlot(slot)` | Charge un emplacement ; message UI si vide. | 159 |
| `C:onCameraChanged(focused)` | Hook : au gain de focus, ajoute les menus et rallume la lumière ; à la perte, éteint la lumière. | 250 |
| `C:onVehicleCameraConfigChanged()` | Hook : garantit refNodes (défaut 0,1,2) et planifie le recalcul de caméra. | 39 |
| `C:reset()` | Revient à la position et rotation initiales et recrée les lisseurs. | 259 |
| `C:restoreLightInfo()` | Remet la lumière mémorisée par storeLightInfo. | 143 |
| `C:saveSlot(slot)` | Enregistre position, rotation et FOV dans l'emplacement indiqué. | 150 |
| `C:sendMenus()` | Ajoute les entrées du menu radial quickAccess (lumière, nearClip, emplacements) tant que la caméra a le focus. | 64 |
| `C:serialize()` | État pour les vues flux vidéo : pos, rot, fov, light, nearClip. | 192 |
| `C:setFOV(fov)` | Fixe le FOV du zoom manuel. | 178 |
| `C:setMaxDistance(d)` | Limite l'éloignement par rapport au nœud ref. | 269 |
| `C:setOffset(pos)` | Fixe la position de la caméra dans le repère du véhicule. | 186 |
| `C:setParam(key, value)` | Modifie light, nearClip, fov ou slots (enregistre ou charge l'emplacement donné). | 226 |
| `C:setRefNodes(centerNodeID, leftNodeID, backNodeID)` | Définit les nœuds de référence du véhicule. | 389 |
| `C:setRotation(rot)` | Fixe la rotation de la caméra. | 182 |
| `C:storeLightInfo()` | Mémorise l'intensité et éteint la lumière. | 245 |
| `C:update(data)` | Intègre les entrées, déplace la caméra dans le repère du véhicule et écrit data.res (pos, rot, nearClip) ; positionne la lumière. | 273 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/core/cameraModes/relative.lua`.*
