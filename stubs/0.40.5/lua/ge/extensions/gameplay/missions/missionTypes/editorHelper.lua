---@meta
-- tim19Atlas stub generated from lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Classe d'éditeur de type de mission. Champs d'instance : elements (liste ordonnée), autoAdditionalAttributes, mission (mission en cours d'édition), mouseInfo (état de la souris pour les gizmos).
---@class gameplay_missions_missionTypes_editorHelper
local gameplay_missions_missionTypes_editorHelper = {}

--- Case à cocher ; défaut false. Si hideElementList est donné, ces éléments sont déplacés juste après et masqués quand la case est décochée.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:32
---@param label string Libellé.
---@param fieldName string Clé dans missionTypeData.
---@param defaultValue boolean|nil Valeur par défaut.
---@param hideElementList table[]|nil Éléments à afficher seulement quand la case est cochée.
---@param displayOptions table|nil Options d'affichage.
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addBool(label, fieldName, defaultValue, hideElementList, displayOptions) end

--- Ajoute un élément personnalisé géré par vos propres fonctions.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:19
---@param label string Libellé.
---@param getNewFunction function|nil function(element) -> liste {fieldName, value} des valeurs par défaut.
---@param setMissionFunction function|nil function(element, missionTypeData) appelée au chargement d'une mission.
---@param drawFunction function|nil function(element, missionTypeData, mission, mouseInfo) -> true si la valeur a changé.
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addCustomElement(label, getNewFunction, setMissionFunction, drawFunction) end

--- Décoration : espace vertical de hauteur donnée (1 par défaut).
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:197
---@param height number|nil Hauteur.
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addDecoDummy(height) end

--- Décoration : titre coloré (default, orange, red, green, blue, white, black).
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:193
---@param text string|nil Texte.
---@param color string|nil Nom de couleur.
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addDecoHeader(text, color) end

--- Décoration : ligne de séparation.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:195
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addDecoSeparator() end

--- Décoration : espace vertical de 4 pixels.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:196
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addDecoSpacer() end

--- Décoration : ligne de texte avec infobulle facultative.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:194
---@param text string|nil Texte.
---@param tooltip string|nil Infobulle.
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addDecoText(text, tooltip) end

--- Liste déroulante de valeurs ; si la liste est vide, elle contient « issues Values! ». Défaut : premier élément.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:166
---@param label string Libellé.
---@param fieldName string Clé dans missionTypeData.
---@param values table Valeurs possibles.
---@param defaultValue any Valeur par défaut.
---@param valueTooltips table|nil Infobulles par valeur.
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addDropdown(label, fieldName, values, defaultValue, valueTooltips) end

--- Ajoute un élément déjà construit à la liste (attribue _id, normalise displayOptions). Toutes les méthodes addXxx passent par elle et renvoient l'élément.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:198
---@param element table Élément {type, ...}.
---@return table  L'élément ajouté.
function gameplay_missions_missionTypes_editorHelper:addElement(element) end

--- Chemin de fichier avec sélecteur de fichier.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:104
---@param label string Libellé.
---@param fieldName string Clé dans missionTypeData.
---@param defaultValue string|nil Chemin par défaut.
---@param allowedExtensions table[]|nil Liste de paires {description, motif}, par ex. {"Sites File","*.sites.json"}.
---@param displayOptions table|nil Options (optional : le fichier n'est alors pas contrôlé).
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addFile(label, fieldName, defaultValue, allowedExtensions, displayOptions) end

--- Fichier attendu à un nom fixe dans le dossier de la mission (une chaîne, ou une liste dont un des fichiers est requis). Ne stocke aucune valeur.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:113
---@param label string Libellé.
---@param filepathsInMissionfolder string|string[] Nom(s) de fichier.
---@param displayOptions table|nil Options d'affichage.
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addFixedFile(label, filepathsInMissionfolder, displayOptions) end

--- Réglages de classement : nombre d'entrées et résultats de référence meilleur / moyen / pire. Défauts : 10, 80, 120, 200.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:141
---@param label string Libellé.
---@param fieldName string Préfixe des clés.
---@param defaultCount integer|nil Nombre d'entrées.
---@param defaultBest number|nil Meilleur résultat.
---@param defaultMedium number|nil Résultat moyen.
---@param defaultWorst number|nil Pire résultat.
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addLeaderboard(label, fieldName, defaultCount, defaultBest, defaultMedium, defaultWorst) end

--- Champ contenant l'id d'une autre mission ; défaut « (none) ».
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:176
---@param label string Libellé.
---@param fieldName string Clé dans missionTypeData.
---@param defaultValue string|nil Valeur par défaut.
---@param displayOptions table|nil Options d'affichage.
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addMissionId(label, fieldName, defaultValue, displayOptions) end

--- Choix d'un véhicule (modèle + configuration). Défaut : modèle « sbr », config « TT_RWD_S_M ». Stocké dans <fieldName>Model / Config / ConfigPath.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:93
---@param label string Libellé.
---@param fieldName string Préfixe des clés.
---@param defaultModel string|nil Modèle par défaut.
---@param defaultConfig string|nil Config par défaut.
---@param displayOptions table|nil Options d'affichage.
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addModelConfig(label, fieldName, defaultModel, defaultConfig, displayOptions) end

--- Champ numérique (flottant) ; défaut 0.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:22
---@param label string Libellé.
---@param fieldName string Clé dans missionTypeData.
---@param defaultValue number|nil Valeur par défaut.
---@param displayOptions table|nil Options d'affichage (optional, associatedStars...).
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addNumeric(label, fieldName, defaultValue, displayOptions) end

--- Fichier de course (addFile filtré sur *.path.json) de type « race ».
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:125
---@param label string Libellé.
---@param fieldName string Clé dans missionTypeData.
---@param defaultValue string|nil Chemin par défaut.
---@param ... any displayOptions transmises à addFile.
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addRace(label, fieldName, defaultValue, ...) end

--- Champ numérique de type « reward » (récompense).
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:161
---@param label string Libellé.
---@param fieldName string Clé dans missionTypeData.
---@param defaultValue number|nil Valeur par défaut.
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addReward(label, fieldName, defaultValue) end

--- Configuration simple de tours (outil editor/util/lapConfigUtil).
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:130
---@param label string Libellé.
---@param fieldName string Clé dans missionTypeData.
---@param displayOptions table|nil Options d'affichage.
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addSimpleLapConfig(label, fieldName, displayOptions) end

--- Fichier de sites (addFile filtré sur *.sites.json) de type « sites ».
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:136
---@param label string Libellé.
---@param fieldName string Clé dans missionTypeData.
---@param defaultValue string|nil Chemin par défaut.
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addSites(label, fieldName, defaultValue) end

--- Champ texte (tampon de 1024 caractères par défaut) ; défaut chaîne vide.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:26
---@param label string Libellé.
---@param fieldName string Clé dans missionTypeData.
---@param defaultValue string|nil Valeur par défaut.
---@param len integer|nil Taille du tampon.
---@param displayOptions table|nil Options d'affichage.
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addString(label, fieldName, defaultValue, len, displayOptions) end

--- Position / rotation / échelle éditables dans le monde 3D (gizmo transformUtil). Stockés dans <fieldName>Pos, <fieldName>Rot, <fieldName>Scl.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:55
---@param label string Libellé.
---@param fieldName string Préfixe des clés.
---@param valueOptions table|nil {defaultPos, defaultRot, defaultScl, hasPos, hasRot, hasScl, oneDimScale}.
---@param displayOptions table|nil {drawMode='sphere'|'vehicle'|'sphereDir'|'halfBox'|'fullBox', drawColor={r,g,b,a}, ...}.
---@return table  Élément.
function gameplay_missions_missionTypes_editorHelper:addTransform(label, fieldName, valueOptions, displayOptions) end

--- Vérifie missionTypeData par rapport aux éléments : champs manquants, types différents, champs en trop, modèles/configs/fichiers inexistants. Renvoie la liste de problèmes {label, severity, fixable, data}.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:374
---@param m table Mission.
---@param fix boolean|nil Paramètre déclaré mais non utilisé dans la partie lue (déduit du code).
---@return table[]  Liste de problèmes.
function gameplay_missions_missionTypes_editorHelper:checkMission(m, fix) end

--- Vide la liste des éléments.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:211
function gameplay_missions_missionTypes_editorHelper:clear() end

--- Dessine tous les éléments (widgets imgui et gizmos 3D) ; marque mission._dirty quand une valeur change. filterOptions.onlyStar limite l'affichage aux éléments associés à une étoile.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1024
---@param filterOptions table|nil {onlyStar = clé d'étoile}.
function gameplay_missions_missionTypes_editorHelper:draw(filterOptions) end

--- Dessine une boîte alignée sur trois axes à partir d'un coin avec debugDrawer.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1179
---@param corner vec3 Coin.
---@param x vec3 Axe X (vecteur).
---@param y vec3 Axe Y (vecteur).
---@param z vec3 Axe Z (vecteur).
---@param clr ColorF Couleur.
function gameplay_missions_missionTypes_editorHelper:drawAxisBox(corner, x, y, z, clr) end

--- Dessine une transformation comme une sphère avec une flèche de direction.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1066
---@param e table Élément transform.
function gameplay_missions_missionTypes_editorHelper:drawTransformAsSphereDir(e) end

--- Dessine une transformation comme un boîtier de véhicule (autres fonctions d'aide de dessin).
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1105
---@param e table Élément transform.
function gameplay_missions_missionTypes_editorHelper:drawTransformAsVehicle(e) end

--- Indique si une transformation (d'un élément ou du déclencheur de départ) est en cours d'édition.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1011
---@return boolean  true si oui.
function gameplay_missions_missionTypes_editorHelper:editingAnyTransform() end

--- Liste tous les champs missionTypeData gérés par l'éditeur, avec leur type.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1278
---@return table[]  Liste de champs avec type.
function gameplay_missions_missionTypes_editorHelper:getAllFieldNames() end

--- Construit la table missionTypeData par défaut d'une nouvelle mission en rassemblant les valeurs par défaut de tous les éléments.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:256
---@return table<string, any>  Champ -> valeur par défaut.
function gameplay_missions_missionTypes_editorHelper:getNewData() end

--- Active ou désactive la génération automatique d'un attribut additionnel de mission.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:1288
---@param key string Clé de l'attribut.
---@param auto boolean|nil true par défaut.
function gameplay_missions_missionTypes_editorHelper:setAutoAdditionalAttributes(key, auto) end

--- Charge une mission dans l'éditeur : mémorise self.mission et met à jour chaque widget depuis mission.missionTypeData, puis appelle valueChangedCallback.
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:297
---@param m table Mission (avec missionTypeData).
function gameplay_missions_missionTypes_editorHelper:setMission(m) end

--- Met à jour mouseInfo : position caméra, rayon et impact du rayon sous la souris (collision de la forêt désactivée le temps du tir), état clic/maintien/relâché, élément survolé.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/gameplay/missions/missionTypes/editorHelper.lua:946
---@param mission table Mission en cours d'édition.
function gameplay_missions_missionTypes_editorHelper:updateMouseInfo(mission) end

