---@meta
-- tim19Atlas stub generated from lua/ge/extensions/editor/util/editorElementHelper.lua (BeamNG.drive 0.40.5 (buildbot 302427 on GitLab)). Do not edit.
-- Derived from BeamNG GmbH Lua code, distributed under the bCDDL 1.1 (see LICENSE). Contributor: Tim0219800 (tim19Atlas).

--- Instance du helper d'éléments (avec elements, autoAdditionalAttributes, mode, typeDataFieldName, container).
---@class editor_util_editorElementHelper
local editor_util_editorElementHelper = {}

--- Décoration : grand titre (couleur par nom : default, orange, red, green, blue, white, black).
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:240
---@param text string|nil Texte.
---@param color string|nil Nom de couleur.
---@return table  Élément.
function editor_util_editorElementHelper:addBigDecoHeader(text, color) end

--- Case à cocher, défaut false. Avec hideElementList, ces éléments sont déplacés juste après et masqués (hidden) tant que la case est décochée.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:35
---@param label string Libellé.
---@param fieldName string Clé.
---@param defaultValue boolean|nil Valeur par défaut.
---@param hideElementList table[]|nil Éléments à afficher seulement si coché.
---@param displayOptions table|nil Options.
---@return table  Élément.
function editor_util_editorElementHelper:addBool(label, fieldName, defaultValue, hideElementList, displayOptions) end

--- Référence à un autre élément du conteneur par identifiant, défaut « (none) » ; idType est ignoré par le code.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:212
---@param label string Libellé.
---@param fieldName string Clé.
---@param idType any Non utilisé.
---@param defaultValue string|nil Défaut.
---@param displayOptions table|nil Options.
---@return table  Élément.
function editor_util_editorElementHelper:addContainerId(label, fieldName, idType, defaultValue, displayOptions) end

--- Élément personnalisé : getNewFunction(e) renvoie une liste {fieldName, value}, setContainerFunction(e, données) charge les valeurs, drawFunction dessine. Les trois valent nop par défaut.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:22
---@param label string Libellé.
---@param getNewFunction function|nil Valeurs par défaut.
---@param setContainerFunction function|nil Chargement depuis le conteneur.
---@param drawFunction function|nil Dessin imgui.
---@return table  Élément.
function editor_util_editorElementHelper:addCustomElement(label, getNewFunction, setContainerFunction, drawFunction) end

--- Décoration : espace vertical de hauteur donnée (défaut 1).
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:245
---@param height number|nil Hauteur.
---@return table  Élément.
function editor_util_editorElementHelper:addDecoDummy(height) end

--- Décoration : titre de section coloré.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:241
---@param text string|nil Texte.
---@param color string|nil Nom de couleur.
---@return table  Élément.
function editor_util_editorElementHelper:addDecoHeader(text, color) end

--- Décoration : séparateur.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:243
---@return table  Élément.
function editor_util_editorElementHelper:addDecoSeparator() end

--- Décoration : espace vertical de 4.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:244
---@return table  Élément.
function editor_util_editorElementHelper:addDecoSpacer() end

--- Décoration : texte simple avec infobulle facultative.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:242
---@param text string|nil Texte.
---@param tooltip string|nil Infobulle.
---@return table  Élément.
function editor_util_editorElementHelper:addDecoText(text, tooltip) end

--- Liste déroulante ; si values est vide, elle contient « issues Values! ». Défaut : première valeur.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:177
---@param label string Libellé.
---@param fieldName string Clé.
---@param values string[]|nil Choix.
---@param defaultValue string|nil Valeur par défaut.
---@param valueTooltips table|nil Infobulles par valeur.
---@return table  Élément.
function editor_util_editorElementHelper:addDropdown(label, fieldName, values, defaultValue, valueTooltips) end

--- Ajoute un élément déjà construit à la liste : lui donne un _id unique, normalise displayOptions et le renvoie.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:246
---@param element table Élément (type, label, fieldName…).
---@return table  L'élément ajouté.
function editor_util_editorElementHelper:addElement(element) end

--- Sélecteur de fichier (chaîne de 1024 caractères) ; allowedExtensions est une liste de paires {description, motif}.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:107
---@param label string Libellé.
---@param fieldName string Clé.
---@param defaultValue string|nil Chemin par défaut.
---@param allowedExtensions table[]|nil Paires {libellé, motif}.
---@param displayOptions table|nil Options (optional = pas de contrôle d'existence).
---@return table  Élément.
function editor_util_editorElementHelper:addFile(label, fieldName, defaultValue, allowedExtensions, displayOptions) end

--- Fichier(s) attendu(s) à un emplacement fixe dans le dossier ; une chaîne ou une liste (un seul des fichiers est requis).
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:120
---@param label string Libellé.
---@param filepathsInfolder string|string[] Chemin(s) relatif(s).
---@param displayOptions table|nil Options.
---@return table  Élément.
function editor_util_editorElementHelper:addFixedFile(label, filepathsInfolder, displayOptions) end

--- Classement : nombre d'entrées et temps/résultats meilleur, moyen, pire. Défauts : 10, 80, 120, 200.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:152
---@param label string Libellé.
---@param fieldName string Préfixe des champs.
---@param defaultCount integer|nil Défaut 10.
---@param defaultBest number|nil Défaut 80.
---@param defaultMedium number|nil Défaut 120.
---@param defaultWorst number|nil Défaut 200.
---@return table  Élément.
function editor_util_editorElementHelper:addLeaderboard(label, fieldName, defaultCount, defaultBest, defaultMedium, defaultWorst) end

--- Sélecteur de modèle et configuration de véhicule ; défaut sbr / TT_RWD_S_M.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:96
---@param label string Libellé.
---@param fieldName string Préfixe des champs Model/Config/ConfigPath.
---@param defaultModel string|nil Modèle par défaut.
---@param defaultConfig string|nil Configuration par défaut.
---@param displayOptions table|nil Options.
---@return table  Élément.
function editor_util_editorElementHelper:addModelConfig(label, fieldName, defaultModel, defaultConfig, displayOptions) end

--- Champ numérique (FloatPtr), défaut 0.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:25
---@param label string Libellé.
---@param fieldName string Clé dans les données.
---@param defaultValue number|nil Valeur par défaut.
---@param displayOptions table|nil Options d'affichage.
---@return table  Élément.
function editor_util_editorElementHelper:addNumeric(label, fieldName, defaultValue, displayOptions) end

--- Fichier de parcours (*.path.json), élément de type 'race'.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:136
---@param label string Libellé.
---@param fieldName string Clé.
---@param defaultValue string|nil Défaut.
---@param ... any Transmis à addFile (displayOptions).
---@return table  Élément.
function editor_util_editorElementHelper:addRace(label, fieldName, defaultValue, ...) end

--- Champ numérique de type 'reward'.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:172
---@param label string Libellé.
---@param fieldName string Clé.
---@param defaultValue number|nil Défaut.
---@return table  Élément.
function editor_util_editorElementHelper:addReward(label, fieldName, defaultValue) end

--- Configuration de tours simple (lapConfigUtil), défaut {}.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:141
---@param label string Libellé.
---@param fieldName string Clé.
---@param displayOptions table|nil Options.
---@return table  Élément.
function editor_util_editorElementHelper:addSimpleLapConfig(label, fieldName, displayOptions) end

--- Fichier de sites (*.sites.json), élément de type 'sites'.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:147
---@param label string Libellé.
---@param fieldName string Clé.
---@param defaultValue string|nil Défaut.
---@return table  Élément.
function editor_util_editorElementHelper:addSites(label, fieldName, defaultValue) end

--- Champ texte (ArrayChar), longueur 1024 par défaut, défaut vide.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:29
---@param label string Libellé.
---@param fieldName string Clé.
---@param defaultValue string|nil Valeur par défaut.
---@param len integer|nil Taille du tampon.
---@param displayOptions table|nil Options.
---@return table  Élément.
function editor_util_editorElementHelper:addString(label, fieldName, defaultValue, len, displayOptions) end

--- Transform 3D éditable (position, rotation, échelle) avec gizmo (transformUtil). valueOptions : defaultPos, defaultRot, defaultScl, hasPos, hasRot, hasScl, oneDimScale ; displayOptions : drawMode ('sphere' par défaut, 'vehicle', 'sphereDir', 'halfBox', 'fullBox'), drawColor (défaut {1,0.25,0,0.5}).
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:58
---@param label string Libellé.
---@param fieldName string Préfixe des champs Pos/Rot/Scl.
---@param valueOptions table|nil Valeurs et composantes actives.
---@param displayOptions table|nil Rendu.
---@return table  Élément.
function editor_util_editorElementHelper:addTransform(label, fieldName, valueOptions, displayOptions) end

--- Filtre de véhicules (vehicleFilterUtil) : filtre de base, réglages de probabilité, ajouts/retraits manuels, maxVehicles (0 = tous), popAttribute (« Population »), véhicules auxiliaires et remorques chargées.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:187
---@param label string Libellé.
---@param fieldName string Clé.
---@param displayOptions table|nil Options.
---@return table  Élément.
function editor_util_editorElementHelper:addVehicleFilter(label, fieldName, displayOptions) end

--- Sélecteur de zones initiales et de destination (zoneSelectorUtil), lues dans le fichier de sites du dossier indiqué par globalInfoFolderFieldName.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:217
---@param label string Libellé.
---@param fieldName string Préfixe des champs.
---@param globalInfoFolderFieldName string Champ contenant le dossier d'infos globales.
---@param displayOptions table|nil Options.
---@return table  Élément.
function editor_util_editorElementHelper:addZoneSelector(label, fieldName, globalInfoFolderFieldName, displayOptions) end

--- Contrôle un conteneur : champs manquants, types différents de ceux attendus, modèles/configs inexistants, fichiers introuvables, etc. Renvoie une liste de problèmes {label, severity, fixable, data}. Le paramètre fix permet de corriger les problèmes réparables (déduit du code).
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:496
---@param c table Conteneur.
---@param fix boolean|nil Appliquer les corrections.
---@param tags any Étiquettes (déduit du code).
---@return table[]  Problèmes détectés.
function editor_util_editorElementHelper:checkContainer(c, fix, tags) end

--- Vide la liste des éléments.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:259
function editor_util_editorElementHelper:clear() end

--- Dessine le formulaire (éléments visibles) et gère l'édition des transforms par clic dans la vue 3D (en mode objectSelect, survol d'un transform = « Click to Edit »).
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:1287
---@param filterOptions table|nil Options de filtrage de l'affichage.
function editor_util_editorElementHelper:draw(filterOptions) end

--- Dessine une boîte alignée sur des axes (coin, vecteurs x, y, z, couleur) avec debugDrawer.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:1420
---@param corner vec3 Coin.
---@param x vec3 Axe x.
---@param y vec3 Axe y.
---@param z vec3 Axe z.
---@param clr any Couleur.
function editor_util_editorElementHelper:drawAxisBox(corner, x, y, z, clr) end

--- Dessine un transform sous forme de sphère avec direction (debugDrawer).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:1327
---@param e table Élément transform.
function editor_util_editorElementHelper:drawTransformAsSphereDir(e) end

--- Dessine un transform sous forme d'emprise de véhicule (debugDrawer).
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:1346
---@param e table Élément transform.
function editor_util_editorElementHelper:drawTransformAsVehicle(e) end

--- Vrai si un transform du helper (ou le transform de déclencheur de départ de l'éditeur de missions) est en cours d'édition.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:1271
---@return boolean  Édition en cours.
function editor_util_editorElementHelper:editingAnyTransform() end

--- Liste des noms de champs gérés avec leur type, tous éléments confondus.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:1519
---@return table[]  Entrées nom/type de champ.
function editor_util_editorElementHelper:getAllFieldNames() end

--- Rassemble les valeurs par défaut de tous les éléments dans une table fieldName -> valeur (nouveau conteneur).
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:327
---@return table<string, any>  Valeurs par défaut.
function editor_util_editorElementHelper:getNewData() end

--- Active (défaut true) ou désactive la gestion automatique d'attributs supplémentaires pour la clé donnée.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:1529
---@param key string Clé.
---@param auto boolean|nil Vrai par défaut.
function editor_util_editorElementHelper:setAutoAdditionalAttributes(key, auto) end

--- Mémorise le conteneur et charge dans chaque élément les valeurs de c[typeDataFieldName] ; appelle valueChangedCallback des éléments concernés. C.setContainerBaseFunction est un alias.
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:380
---@param c table Conteneur (mission, quête ou test).
function editor_util_editorElementHelper:setContainer(c) end

--- Met à jour mouseInfo : position caméra, rayon souris, impact du rayon (collision de la forêt désactivée le temps du tir), état bouton enfoncé/maintenu et transform survolé le plus proche.
---*(interne : appelée par le moteur ou la boucle principale)*
---Source : lua/ge/extensions/editor/util/editorElementHelper.lua:1203
---@param container table Conteneur courant.
function editor_util_editorElementHelper:updateMouseInfo(container) end

