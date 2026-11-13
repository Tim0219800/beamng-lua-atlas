# `suspensionFrequencyTester`

*Fichier : `lua/ge/suspensionFrequencyTester.lua` · VM : Game Engine (GE) · 201 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("suspensionFrequencyTester")`

Outil de développement qui mesure la fréquence de la suspension d'un véhicule. Il affiche une fenêtre ImGui « Suspension Frequency Tester » : pour deux noeuds (essieu avant 279, essieu arrière 425 par défaut) il lit la hauteur z à chaque frame et la passe dans 1000 filtres de détection de fréquence (newFreqExists) entre 0.5 Hz et 5 Hz, puis compare à des catégories (Too Soft 0.9 Hz, Luxury 1.1, Average 1.2, Sporty 1.4, Rally 1.8, Racetrack 2.2, Aero-Critical 5.0). Le fichier explique l'usage : poser la voiture sur la glace, retirer l'amortissement, puis lancer extensions.suspensionFrequencyTester.run() depuis la console.

## Exemple

```lua
extensions.load('suspensionFrequencyTester')
extensions.suspensionFrequencyTester.run()
```

## Remarques

- Les ids de noeuds 279 et 425 sont codés en dur pour un véhicule précis ; on peut les changer dans la fenêtre (champs 'Front axle node ID' / 'Rear axle node ID').
- Le module lit imgui à son chargement (ui_imgui) : il ne doit donc être chargé que côté GE avec l'interface imgui disponible.
- L'affichage 'm/Hz' du tableau est une intégrale d'amplitudes divisée par la largeur de la bande en Hz (formatée en entier par %i).
- Le commentaire d'en-tête dit extensions.suspensionFrequencyTester.run() ; la page automatique indique require(...) : les deux supposent que le module est chargé comme extension.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `suspensionFrequencyTester.onUpdate(dtReal, dtSim, dtRaw)` | Hook appelé chaque frame par le système d'extensions : dessine la fenêtre si elle est ouverte, puis (si un véhicule joueur existe) met à jour pour chaque noeud les amplitudes de tous les filtres de fréquence à partir de la position z du noeud (veh:getNodePositionXYZ) et de dtSim. *(interne)* *(hook)* | 176 |
| `suspensionFrequencyTester.run()` | Ouvre la fenêtre et remet à zéro les amplitudes et les filtres de fréquence de chaque noeud pour recommencer une mesure. | 190 |

### Détail des paramètres

#### `suspensionFrequencyTester.onUpdate(dtReal, dtSim, dtRaw)`

Hook appelé chaque frame par le système d'extensions : dessine la fenêtre si elle est ouverte, puis (si un véhicule joueur existe) met à jour pour chaque noeud les amplitudes de tous les filtres de fréquence à partir de la position z du noeud (veh:getNodePositionXYZ) et de dtSim.

- `dtReal` (*number*) : Durée réelle de la frame (s) ; non utilisée.
- `dtSim` (*number*) : Durée simulée de la frame (s), passée aux filtres.
- `dtRaw` (*number*) : Durée brute de la frame (s) ; non utilisée.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/suspensionFrequencyTester.lua`.*
