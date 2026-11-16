# `jbeam_links`

*Fichier : `lua/common/jbeam/links.lua` · VM : Commun (GE + véhicule) · 254 lignes · BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)*

**Accès :** `require("jbeam/links")`

Résolution des références entre lignes jbeam. Dans un fichier jbeam, une colonne dont le nom contient ':' (ex. "id1:", "torqueArm:", ou "links:" ) désigne le nom d'une ligne d'une autre section (nodes par défaut si rien après les deux-points, ex. "nodeArm:" ; "id1:nodes" explicite). Ce module repère ces liens (prepareLinksDestructive), les remplace par l'identifiant numérique cid de la cible (resolveLinks), et traite les liens de groupe "[groupe]:section" qui deviennent la liste des cid des lignes appartenant à ces groupes (resolveGroupLinks). C'est ce qui fait que les poutres référencent leurs nœuds par numéro dans les données finales.

## Remarques

- Trois formes de liens : (a) colonne de ligne 'nom:section' = valeur chaîne, remplacée par le cid de la cible (la clé 'nom:section' est supprimée et la colonne 'nom' reçoit le cid) ; (b) colonne dont la valeur est une table (liste de noms), chaque élément est remplacé par un cid ; (c) clé de section 'nom:section' avec une liste de noms (ex. torqueReactionNodes:) renommée 'nom_section'.
- sectionRenames (par ex. triggers2 -> triggers) est appliqué aux noms de section cible.
- Quand une cible est introuvable : avertissement dans le journal sauf si la ligne porte optional = true (ou si la clé fait partie d'une liste interne de liens optionnels comme torqueArm:, nodeArm:, nodeCoupling:...), et la ligne est supprimée de sa section (entry[rowKey] = nil).
- Une section cible inexistante provoque un avertissement et les données du lien sont abandonnées.
- resolveLinks réindexe aussi chaque section déclarée dans vehicle.validTables par cid ; vehicle.validTables doit donc exister.
- resolveGroupLinks : la colonne '[g1,g2]:nodes' (nom de champ de groupe entre crochets) est remplacée par une clé '_<champ>_<section>' contenant la liste de cid des lignes dont le champ de groupe correspond ; un champ de groupe de type chaîne est transformé en liste d'une chaîne.

## Fonctions

| Fonction | Description | Ligne |
|---|---|---|
| `jbeam_links.prepareLinksDestructive(vehicle, sectionRenames)` | Parcourt toutes les sections du véhicule, détecte les liens, retire les clés de lien des lignes (modifie vehicle en place) et renvoie un journal à plat de triplets (ligne ou liste, clé, ligne cible) pour que resolveLinks écrive les cid. *(interne)* | 15 |
| `jbeam_links.resolveGroupLinks(vehicle)` | Remplace les colonnes '[groupe]:section' par des listes de cid de lignes appartenant aux groupes cités (clé '_groupe_section'). *(interne)* | 184 |
| `jbeam_links.resolveLinks(vehicle, links)` | Écrit dans chaque lien le cid de sa cible puis reconstruit les sections de vehicle.validTables en les indexant par cid. *(interne)* | 159 |

### Détail des paramètres

#### `jbeam_links.prepareLinksDestructive(vehicle, sectionRenames)`

Parcourt toutes les sections du véhicule, détecte les liens, retire les clés de lien des lignes (modifie vehicle en place) et renvoie un journal à plat de triplets (ligne ou liste, clé, ligne cible) pour que resolveLinks écrive les cid.

- `vehicle` (*table*) : Données jbeam du véhicule (modifiées en place).
- `sectionRenames` (*table<string, string>*) : Renommages de sections (ancien nom -> nouveau).
- **renvoie** : table Liste plate de triplets {conteneur, clé, ligneCible, ...} (indices 1,2,3 puis 4,5,6...).

#### `jbeam_links.resolveGroupLinks(vehicle)`

Remplace les colonnes '[groupe]:section' par des listes de cid de lignes appartenant aux groupes cités (clé '_groupe_section').

- `vehicle` (*table*) : Données jbeam du véhicule.
- **renvoie** : boolean Toujours true.

#### `jbeam_links.resolveLinks(vehicle, links)`

Écrit dans chaque lien le cid de sa cible puis reconstruit les sections de vehicle.validTables en les indexant par cid.

- `vehicle` (*table*) : Données jbeam du véhicule (avec validTables).
- `links` (*table*) : Journal renvoyé par prepareLinksDestructive.
- **renvoie** : boolean Toujours true.

---
*tim19Atlas (Tim0219800) — dérivé du code Lua de BeamNG GmbH (bCDDL 1.1, voir LICENSE). Source : `lua/common/jbeam/links.lua`.*
