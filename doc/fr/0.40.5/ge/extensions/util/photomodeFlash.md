# `util_photomodeFlash`

*Fichier : `lua/ge/extensions/util/photomodeFlash.lua` · VM : Game Engine (GE) · 407 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `util_photomodeFlash` : `extensions.load("util_photomodeFlash")`, puis la globale `util_photomodeFlash`

Flash de mode photo : crée un projecteur (SpotLight, avec ombres, non sauvegardé dans le niveau) collé à la caméra pendant le mode photo, orienté vers le point visé (raycast depuis la caméra, sinon distance de mise au point DOF). Deux modes : « always » (allumé en continu) et « pulse » (allumé uniquement pendant la prise de capture). En mode pulse, runCapture attend 2 frames de préchauffage, déclenche la capture via le module screenshot, puis éteint le flash à la réception de onScreenshotAllDone (ou après 60 frames de secours). L'interface du mode photo appelle applyFromUi.

## Exemple

```lua
extensions.util_photomodeFlash.applyFromUi(true, true, 25000, 55, 0, 0)
extensions.util_photomodeFlash.runCapture('takeScreenShot')
```

## Remarques

- Le projecteur est décalé de la caméra : 0,12 m à droite, 0,06 m vers le haut et 0,05 m vers l'avant ; portée 40 m ; carte d'ombre 1024.
- Le flash ne s'applique que si le mode photo est ouvert (variable globale photoModeOpen ou ui_photomode_shared.S.photoModeOpen) et si la caméra active n'est pas « path ».
- Types de capture acceptés par runCapture (kind) : takeScreenShot, takeBigScreenShot, takeHugeScreenShot, takeCustomScreenShot, takeMotionBlurScreenShot, publish, steam. Ils délèguent au module screenshot ; « steam » ne passe pas par le hook de fin de capture.
- runCapture sans flash actif lance simplement la capture. En mode pulse, une deuxième demande pendant une impulsion est refusée (false, "capture_busy").
- Les valeurs hue, saturation et outerAngle sont arrondies à l'entier ; l'intensité n'est que bornée.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `util_photomodeFlash.applyFromUi(enabled, fireOnCapture, intensity, outerAngle, hue, saturation)` | Applique les réglages issus de l'interface du mode photo : bornage des valeurs puis activation du flash (ou désactivation si enabled n'est pas true). | 330 |
| `util_photomodeFlash.enable(en)` | Active ou désactive le flash : à l'activation crée le SpotLight dans MissionGroup et l'oriente ; à la désactivation le supprime. Annule toute impulsion en attente. | 268 |
| `util_photomodeFlash.onExtensionUnloaded()` | Hook appelé au déchargement : désactive le flash et supprime le projecteur. *(interne)* *(hook)* | 402 |
| `util_photomodeFlash.onPreRender(dtReal, dtSim, dtRaw)` | Hook appelé chaque frame avant le rendu : replace le projecteur sur la caméra et fait avancer la machine à états de l'impulsion (préchauffage, capture, nettoyage, délai de secours). *(interne)* *(hook)* | 346 |
| `util_photomodeFlash.onScreenshotAllDone()` | Hook appelé quand toutes les captures d'écran en cours sont terminées : démarre le nettoyage (extinction du flash) d'une impulsion en attente. Ignoré si le mode photo n'est pas ouvert. *(interne)* *(hook)* | 394 |
| `util_photomodeFlash.runCapture(kind, ...)` | Déclenche une capture d'écran en tenant compte du flash : direct si le flash est inactif ou en mode always, avec impulsion de lumière en mode pulse. | 291 |

### Détail des paramètres

#### `util_photomodeFlash.applyFromUi(enabled, fireOnCapture, intensity, outerAngle, hue, saturation)`

Applique les réglages issus de l'interface du mode photo : bornage des valeurs puis activation du flash (ou désactivation si enabled n'est pas true).

- `enabled` (*boolean*) : Active le flash (désactive sinon)
- `fireOnCapture` (*boolean*) : true pour le mode pulse, sinon always
- `intensity` (*number*) : Intensité (0 à 1 000 000)
- `outerAngle` (*number*) : Angle extérieur en degrés (1 à 179)
- `hue` (*number*) : Teinte en degrés (0 à 360)
- `saturation` (*number*) : Saturation en pourcentage (0 à 100)

#### `util_photomodeFlash.enable(en)`

Active ou désactive le flash : à l'activation crée le SpotLight dans MissionGroup et l'oriente ; à la désactivation le supprime. Annule toute impulsion en attente.

- `en` (*boolean*) : true pour activer (toute autre valeur désactive)

#### `util_photomodeFlash.onPreRender(dtReal, dtSim, dtRaw)`

Hook appelé chaque frame avant le rendu : replace le projecteur sur la caméra et fait avancer la machine à états de l'impulsion (préchauffage, capture, nettoyage, délai de secours).

- `dtReal` (*number*) : Delta de temps réel (non utilisé)
- `dtSim` (*number*) : Delta de temps de simulation (non utilisé)
- `dtRaw` (*number*) : Delta de temps brut (non utilisé)

#### `util_photomodeFlash.runCapture(kind, ...)`

Déclenche une capture d'écran en tenant compte du flash : direct si le flash est inactif ou en mode always, avec impulsion de lumière en mode pulse.

- `kind` (*string*) : Type de capture (voir notes)
- `...` (*any*) : Arguments transmis à la fonction du module screenshot correspondante (jusqu'à 6 selon le type)
- **renvoie** : boolean true si la capture est lancée ou planifiée
- **renvoie** : string|nil Code d'erreur : "capture_busy" ou "screenshot_request_failed"

## Champs

| Champ | Type | Description |
|---|---|---|
| `capturePulseActive` | boolean | true pendant une impulsion de flash liée à une capture |
| `enabled` | boolean | true si le flash est actif (le projecteur existe) |
| `hue` | integer | Teinte de la couleur en degrés, 0 à 360 (défaut 0) |
| `intensity` | number | Intensité du projecteur (défaut 25000, de 0 à 1 000 000) |
| `mode` | string | "always" (continu) ou "pulse" (seulement pendant une capture) |
| `outerAngle` | integer | Angle extérieur du cône en degrés (défaut 55, de 1 à 179) |
| `saturation` | integer | Saturation en pourcentage, 0 à 100 (défaut 0 : lumière blanche) |

## Appels vers le moteur (C++)

- `worldEditorCppApi.` `createObject`

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/util/photomodeFlash.lua`.*
