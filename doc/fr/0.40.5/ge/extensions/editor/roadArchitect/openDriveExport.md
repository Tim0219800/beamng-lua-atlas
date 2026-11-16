# `editor_roadArchitect_openDriveExport`

*Fichier : `lua/ge/extensions/editor/roadArchitect/openDriveExport.lua` · VM : Game Engine (GE) · 367 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** extension `editor_roadArchitect_openDriveExport` : `extensions.load("editor_roadArchitect_openDriveExport")`, puis la globale `editor_roadArchitect_openDriveExport`

Export du réseau Road Architect au format OpenDRIVE 1.8 (.xodr). Chaque route (hors superpositions) est convertie en géométrie OpenDRIVE : ligne de référence approchée par des cubiques paramétriques 2D (paramPoly3, tangentes de type Chordal Catmull-Rom), profil d'élévation en cubiques explicites, largeurs et hauteurs de voies par section. Le fichier est écrit via le sélecteur de fichier de l'éditeur (editor_fileDialog.saveFile). Si aucune route Road Architect n'existe, l'export se rabat sur tech_openDriveExporter pour exporter le réseau routier de la carte chargée.

## Exemple

```lua
editor_roadArchitect_openDriveExport.export()
```

## Remarques

- Types de voies exportés : 'road_lane' -> driving, 'sidewalk' -> walking, tout autre type (îlots, béton…) -> restricted.
- Les routes sans nœud sont ignorées ; les superpositions (isOverlay) ne sont pas exportées. Chaque route est écrite avec rule="RHT", junction="-1" et un id égal à son rang - 1.
- Les liens prédécesseur/successeur (balise link des routes et des voies), objets, signaux et surface ne sont pas exportés : les balises sont écrites vides ou en commentaire (le code contient un TODO pour le lien des voies). L'en-tête écrit north/south/east/west à 0.0.
- La marque centrale est toujours écrite comme ligne discontinue (broken) standard, quelles que soient les peintures du profil.
- Si le fichier ne peut pas être ouvert en écriture, io.open renvoie nil et l'écriture échoue (pas de test dans le code).

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `editor_roadArchitect_openDriveExport.export()` | Exporte le réseau Road Architect courant en .xodr. Filtre les routes vides, convertit les routes non superposées en géométrie OpenDRIVE, puis ouvre une boîte de dialogue d'enregistrement (extension .xodr, confirmation d'écrasement) et écrit le fichier. Sans route, exporte à la place le réseau routier de la carte via tech_openDriveExporter. | 336 |

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/ge/extensions/editor/roadArchitect/openDriveExport.lua`.*
