# `odometer`

*Fichier : `lua/vehicle/extensions/odometer.lua` · VM : Véhicule · 78 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `odometer` : `extensions.load (VM véhicule)("odometer")`, puis la globale `odometer`

Compteur kilométrique 'relatif' pour les statistiques : intègre la distance parcourue à partir de electrics.values.wheelspeed avec un filtre de 'corde' (±5 cm) pour ignorer les oscillations avant/arrière, puis soumet la distance à gameplayStatistic (métriques 'vehicle/odometer/<modèle>.length' et 'vehicle/total_odometer.length'). Ne compte que quand l'IA est désactivée.

## Exemple

```lua
local d = extensions.odometer.getRelativeRecording()  -- distance cumulée en m
```

## Remarques

- Algorithme : lead accumule |wheelspeed| * dt * signe(avgWheelAV) ; dès que |lead| dépasse ropeLength (0,05 m) l'excédent est ajouté à relativeOdometer et lead est borné.
- submitStatistic n'envoie rien si ai.mode ~= 'disabled' ou si moins de 1 m a été accumulé depuis le dernier envoi. Si la vitesse moyenne depuis l'envoi dépasse 150 m/s (550 km/h) la distance est écartée comme incohérente. Un relativeOdometer NaN est ramené à la valeur précédente avec un log d'erreur.
- Envoi automatique toutes les 30 s de temps accumulé (quand l'IA est désactivée) et à chaque reset. Le nom du modèle est extrait de v.vehicleDirectory (motif /vehicles/<modèle>).
- Anomalie : submitedTime n'est remis à 0 qu'après un envoi périodique ; la vitesse moyenne testée (distance / submitedTime) est donc calculée sur du temps accumulé depuis le dernier envoi périodique, pas depuis le dernier submitStatistic.
- startRecording est vide (la remise à zéro est commentée) ; onExtensionLoaded est vide.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `odometer.getRelativeRecording()` | Renvoie la distance relative cumulée. | 39 |
| `odometer.onExtensionLoaded()` | Hook de chargement ; vide. *(interne)* *(hook)* | 43 |
| `odometer.onReset()` | Hook de reset du véhicule : soumet la distance accumulée aux statistiques. *(interne)* *(hook)* | 15 |
| `odometer.startRecording()` | Prévu pour remettre l'enregistrement à zéro ; ne fait rien (code commenté). | 35 |
| `odometer.submitStatistic()` | Envoie la distance non encore soumise à gameplayStatistic (conditions décrites dans les notes). | 46 |
| `odometer.updateGFX(dt)` | Appelé chaque frame : intègre la distance et déclenche l'envoi périodique. *(interne)* | 19 |

### Détail des paramètres

#### `odometer.getRelativeRecording()`

Renvoie la distance relative cumulée.

- **renvoie** : number Distance en mètres.

#### `odometer.updateGFX(dt)`

Appelé chaque frame : intègre la distance et déclenche l'envoi périodique.

- `dt` (*number*) : Pas de temps en secondes.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/vehicle/extensions/odometer.lua`.*
