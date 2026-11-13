---@meta
-- tim19Atlas: C++ objects exposed to Lua (vehicle VM), BeamNG.drive 0.40.5 (buildbot 302427 on GitLab). Do not edit.
-- Collected from the running game by the tim19_atlas mod. Contributor: Tim0219800 (tim19Atlas). See LICENSE.

---@class BeamEngineClass
---@field __gc any
---@field __index any
local BeamEngineClass = {}
---@param ... any
---@return any
function BeamEngineClass:deleteAllObjects(...) end
---@param ... any
---@return any
function BeamEngineClass:directoryExists(...) end
---@param ... any
---@return any
function BeamEngineClass:enableStackTraceFile(...) end
---@param ... any
---@return any
function BeamEngineClass:exec(...) end
---@param ... any
---@return any
function BeamEngineClass:fileExists(...) end
---@param ... any
---@return any
function BeamEngineClass:findFiles(...) end
---@param ... any
---@return any
function BeamEngineClass:getEnabled(...) end
---@param ... any
---@return any
function BeamEngineClass:getGroundModelByName(...) end
---@param ... any
---@return any
function BeamEngineClass:getSimulationTimeScale(...) end
---@param ... any
---@return any
function BeamEngineClass:getSlot(...) end
---@param ... any
---@return any
function BeamEngineClass:getSlotCount(...) end
---@param ... any
---@return any
function BeamEngineClass:instabilityDetected(...) end
---@param ... any
---@return any
function BeamEngineClass:log(...) end
---@param ... any
---@return any
function BeamEngineClass:queueAllObjectLua(...) end
---@param ... any
---@return any
function BeamEngineClass:queueAllObjectLuaExcept(...) end
---@param ... any
---@return any
function BeamEngineClass:resetGroundModels(...) end
---@param ... any
---@return any
function BeamEngineClass:setDynamicCollisionEnabled(...) end
---@param ... any
---@return any
function BeamEngineClass:setEnabled(...) end
---@param ... any
---@return any
function BeamEngineClass:setGroundModelByName(...) end
---@param ... any
---@return any
function BeamEngineClass:setSimulationTimeScale(...) end
---@param ... any
---@return any
function BeamEngineClass:spawnObject(...) end
---@param ... any
---@return any
function BeamEngineClass:update(...) end

---@class BeamObject
---@field __gc any
---@field __index any
---@field __setDrawDebugMode any
---@field __setSlidingGroundSpeed any
---@field __setTestP any
local BeamObject = {}
---@param ... any
---@return any
function BeamObject:actuateBeam(...) end
---@param ... any
---@return any
function BeamObject:actuateBeamRaw(...) end
---@param ... any
---@return any
function BeamObject:actuateDynamicBeam(...) end
---@param ... any
---@return any
function BeamObject:addDecal(...) end
---@param ... any
---@return any
function BeamObject:addDynamicBeamNode(...) end
---@param ... any
---@return any
function BeamObject:addDynamicBeamStaticPoint(...) end
---@param ... any
---@return any
function BeamObject:addParticle(...) end
---@param ... any
---@return any
function BeamObject:addParticleByNodes(...) end
---@param ... any
---@return any
function BeamObject:addParticleByNodesRelative(...) end
---@param ... any
---@return any
function BeamObject:addParticleVelWidthTypeCount(...) end
---@param ... any
---@return any
function BeamObject:addRail(...) end
---@param ... any
---@return any
function BeamObject:addRailLink(...) end
---@param ... any
---@return any
function BeamObject:addSlidenode(...) end
---@param ... any
---@return any
function BeamObject:addWheelNode(...) end
---@param ... any
---@return any
function BeamObject:apply2nodeTorque(...) end
---@param ... any
---@return any
function BeamObject:apply3nodeTorque(...) end
---@param ... any
---@return any
function BeamObject:applyClusterLinearAngularAccel(...) end
---@param ... any
---@return any
function BeamObject:applyForce(...) end
---@param ... any
---@return any
function BeamObject:applyForceTime(...) end
---@param ... any
---@return any
function BeamObject:applyForceVector(...) end
---@param ... any
---@return any
function BeamObject:applyForceVectorD(...) end
---@param ... any
---@return any
function BeamObject:applyForceVectorTime(...) end
---@param ... any
---@return any
function BeamObject:applyMotionTracking(...) end
---@param ... any
---@return any
function BeamObject:applyTorqueAxisCouple(...) end
---@param ... any
---@return any
function BeamObject:attachCoupler(...) end
---@param ... any
---@return any
function BeamObject:attachExternalCoupler(...) end
---@param ... any
---@return any
function BeamObject:attachLocalCoupler(...) end
---@param ... any
---@return any
function BeamObject:attachSlidenode(...) end
---@param ... any
---@return any
function BeamObject:beamIsBroken(...) end
---@param ... any
---@return any
function BeamObject:breakBeam(...) end
---@param ... any
---@return any
function BeamObject:breakCollisionTriangle(...) end
---@param ... any
---@return any
function BeamObject:breakMeshes(...) end
---@param ... any
---@return any
function BeamObject:breakRails(...) end
---@param ... any
---@return any
function BeamObject:breakTorsionbar(...) end
---@param ... any
---@return any
function BeamObject:calcBeamStats(...) end
---@param ... any
---@return any
function BeamObject:calcCenterOfGravity(...) end
---@param ... any
---@return any
function BeamObject:calcCenterOfGravityRel(...) end
---@param ... any
---@return any
function BeamObject:calcCenterOfPressureRel(...) end
---@param ... any
---@return any
function BeamObject:calcTotalAeroForces(...) end
---@param ... any
---@return any
function BeamObject:calcTotalAeroTorque(...) end
---@param ... any
---@return any
function BeamObject:castRayStatic(...) end
---@param ... any
---@return any
function BeamObject:changeGroupPressure(...) end
---@param ... any
---@return any
function BeamObject:changePressureGroupDrag(...) end
---@param ... any
---@return any
function BeamObject:closestNodeLineDistances(...) end
---@param ... any
---@return any
function BeamObject:commitLoad(...) end
---@param ... any
---@return any
function BeamObject:createSFXSource(...) end
---@param ... any
---@return any
function BeamObject:createSFXSource2(...) end
---@param ... any
---@return any
function BeamObject:createWebView(...) end
---@param ... any
---@return any
function BeamObject:cutSFX(...) end
---@param ... any
---@return any
function BeamObject:deflatePressureGroup(...) end
---@param ... any
---@return any
function BeamObject:deleteAllDynamicBeam(...) end
---@param ... any
---@return any
function BeamObject:deleteDynamicBeam(...) end
---@param ... any
---@return any
function BeamObject:deleteSFXSource(...) end
---@param ... any
---@return any
function BeamObject:deleteSFXSources(...) end
---@param ... any
---@return any
function BeamObject:destroyMaterials(...) end
---@param ... any
---@return any
function BeamObject:detachCoupler(...) end
---@param ... any
---@return any
function BeamObject:detachSlidenode(...) end
---@param ... any
---@return any
function BeamObject:detectBeamFrequency(...) end
---@param ... any
---@return any
function BeamObject:externalCouplerCount(...) end
---@param ... any
---@return any
function BeamObject:findSlidenodeId(...) end
---@param ... any
---@return any
function BeamObject:finishLoading(...) end
---@param ... any
---@return any
function BeamObject:get3NodeDisplacement(...) end
---@param ... any
---@return any
function BeamObject:get3nodeAngularVelocity(...) end
---@param ... any
---@return any
function BeamObject:getAbsNodePosition(...) end
---@param ... any
---@return any
function BeamObject:getAbsNodePositionXYZ(...) end
---@param ... any
---@return any
function BeamObject:getAerodynamicsMode(...) end
---@param ... any
---@return any
function BeamObject:getAerodynamicsState(...) end
---@param ... any
---@return any
function BeamObject:getAirDensity(...) end
---@param ... any
---@return any
function BeamObject:getAirDensityAtSeaLevel(...) end
---@param ... any
---@return any
function BeamObject:getAirSpeed(...) end
---@param ... any
---@return any
function BeamObject:getAirflowSpeed(...) end
---@param ... any
---@return any
function BeamObject:getAltitude(...) end
---@param ... any
---@return any
function BeamObject:getBeamCount(...) end
---@param ... any
---@return any
function BeamObject:getBeamCurLengthRefRatio(...) end
---@param ... any
---@return any
function BeamObject:getBeamDebugDeformation(...) end
---@param ... any
---@return any
function BeamObject:getBeamDeformation(...) end
---@param ... any
---@return any
function BeamObject:getBeamDeformationResidue(...) end
---@param ... any
---@return any
function BeamObject:getBeamForce(...) end
---@param ... any
---@return any
function BeamObject:getBeamFrequencyAmplitude(...) end
---@param ... any
---@return any
function BeamObject:getBeamLength(...) end
---@param ... any
---@return any
function BeamObject:getBeamLengthF(...) end
---@param ... any
---@return any
function BeamObject:getBeamLengthRefRatio(...) end
---@param ... any
---@return any
function BeamObject:getBeamLengthRestRatio(...) end
---@param ... any
---@return any
function BeamObject:getBeamPressureRel(...) end
---@param ... any
---@return any
function BeamObject:getBeamRefLength(...) end
---@param ... any
---@return any
function BeamObject:getBeamRestLength(...) end
---@param ... any
---@return any
function BeamObject:getBeamStress(...) end
---@param ... any
---@return any
function BeamObject:getBeamStressDamp(...) end
---@param ... any
---@return any
function BeamObject:getBeamVectorFromNode(...) end
---@param ... any
---@return any
function BeamObject:getBeamVectorFromNodeXYZ(...) end
---@param ... any
---@return any
function BeamObject:getBeamVelocity(...) end
---@param ... any
---@return any
function BeamObject:getCameraPosition(...) end
---@param ... any
---@return any
function BeamObject:getCenterPosition(...) end
---@param ... any
---@return any
function BeamObject:getCenterPositionXYZ(...) end
---@param ... any
---@return any
function BeamObject:getClusterAngVelWithoutWheels(...) end
---@param ... any
---@return any
function BeamObject:getClusterCenterOfMassWithoutWheelsXYZ(...) end
---@param ... any
---@return any
function BeamObject:getClusterRotationSlow(...) end
---@param ... any
---@return any
function BeamObject:getClusterRotationSlowC(...) end
---@param ... any
---@return any
function BeamObject:getClusterRotationStep(...) end
---@param ... any
---@return any
function BeamObject:getClusterVelocityAngVelWithoutWheels(...) end
---@param ... any
---@return any
function BeamObject:getClusterVelocityAngVelWithoutWheelsXYZ(...) end
---@param ... any
---@return any
function BeamObject:getClusterVelocityWithoutWheels(...) end
---@param ... any
---@return any
function BeamObject:getCollidableTriangleCount(...) end
---@param ... any
---@return any
function BeamObject:getCornerPosition(...) end
---@param ... any
---@return any
function BeamObject:getDensityAtNode(...) end
---@param ... any
---@return any
function BeamObject:getDirection(...) end
---@param ... any
---@return any
function BeamObject:getDirectionVector(...) end
---@param ... any
---@return any
function BeamObject:getDirectionVectorRight(...) end
---@param ... any
---@return any
function BeamObject:getDirectionVectorRightXYZ(...) end
---@param ... any
---@return any
function BeamObject:getDirectionVectorUp(...) end
---@param ... any
---@return any
function BeamObject:getDirectionVectorUpXYZ(...) end
---@param ... any
---@return any
function BeamObject:getDirectionVectorXYZ(...) end
---@param ... any
---@return any
function BeamObject:getDissipatedEnergy(...) end
---@param ... any
---@return any
function BeamObject:getDistanceFromTerrain(...) end
---@param ... any
---@return any
function BeamObject:getDistanceFromTerrainPoint(...) end
---@param ... any
---@return any
function BeamObject:getDynamicBeamLength(...) end
---@param ... any
---@return any
function BeamObject:getDynamicBeamRestLength(...) end
---@param ... any
---@return any
function BeamObject:getEnvPressure(...) end
---@param ... any
---@return any
function BeamObject:getEnvTemperature(...) end
---@param ... any
---@return any
function BeamObject:getFlow(...) end
---@param ... any
---@return any
function BeamObject:getForwardVector(...) end
---@param ... any
---@return any
function BeamObject:getFrontAirflowSpeed(...) end
---@param ... any
---@return any
function BeamObject:getFrontPosition(...) end
---@param ... any
---@return any
function BeamObject:getFrontPositionRelative(...) end
---@param ... any
---@return any
function BeamObject:getFrontPositionXYZ(...) end
---@param ... any
---@return any
function BeamObject:getGhostEnabled(...) end
---@param ... any
---@return any
function BeamObject:getGraphicsStepCount(...) end
---@param ... any
---@return any
function BeamObject:getGravity(...) end
---@param ... any
---@return any
function BeamObject:getGravityVector(...) end
---@param ... any
---@return any
function BeamObject:getGroundModelId(...) end
---@param ... any
---@return any
function BeamObject:getGroundSpeed(...) end
---@param ... any
---@return any
function BeamObject:getGroupPressure(...) end
---@param ... any
---@return any
function BeamObject:getHydroDisplacement(...) end
---@param ... any
---@return any
function BeamObject:getHydroDisplacementFrom(...) end
---@param ... any
---@return any
function BeamObject:getID(...) end
---@param ... any
---@return any
function BeamObject:getId(...) end
---@param ... any
---@return any
function BeamObject:getImpactDeformEnergyNode(...) end
---@param ... any
---@return any
function BeamObject:getInitialHeight(...) end
---@param ... any
---@return any
function BeamObject:getInitialLength(...) end
---@param ... any
---@return any
function BeamObject:getInitialQuaternion(...) end
---@param ... any
---@return any
function BeamObject:getInitialWidth(...) end
---@param ... any
---@return any
function BeamObject:getLastMailbox(...) end
---@param ... any
---@return any
function BeamObject:getLastMailboxToBuffer(...) end
---@param ... any
---@return any
function BeamObject:getLastMailboxVersion(...) end
---@param ... any
---@return any
function BeamObject:getMeshesContainingMaterial(...) end
---@param ... any
---@return any
function BeamObject:getMeshsMaterials(...) end
---@param ... any
---@return any
function BeamObject:getNodeAeroForceXYZ(...) end
---@param ... any
---@return any
function BeamObject:getNodeCluster(...) end
---@param ... any
---@return any
function BeamObject:getNodeClusterGeneration(...) end
---@param ... any
---@return any
function BeamObject:getNodeCount(...) end
---@param ... any
---@return any
function BeamObject:getNodeCoupler(...) end
---@param ... any
---@return any
function BeamObject:getNodeForce(...) end
---@param ... any
---@return any
function BeamObject:getNodeForceNonInertial(...) end
---@param ... any
---@return any
function BeamObject:getNodeForceNonInertialZ(...) end
---@param ... any
---@return any
function BeamObject:getNodeForceOnBeamDir(...) end
---@param ... any
---@return any
function BeamObject:getNodeForceVector(...) end
---@param ... any
---@return any
function BeamObject:getNodeForceVectorNonInertialXYZ(...) end
---@param ... any
---@return any
function BeamObject:getNodeForceVectorXYZ(...) end
---@param ... any
---@return any
function BeamObject:getNodeFrictionCoef(...) end
---@param ... any
---@return any
function BeamObject:getNodeLatch(...) end
---@param ... any
---@return any
function BeamObject:getNodeMass(...) end
---@param ... any
---@return any
function BeamObject:getNodePosition(...) end
---@param ... any
---@return any
function BeamObject:getNodePositionRelative(...) end
---@param ... any
---@return any
function BeamObject:getNodePositionRelativeXYZ(...) end
---@param ... any
---@return any
function BeamObject:getNodeReactionForce(...) end
---@param ... any
---@return any
function BeamObject:getNodeSlidingFrictionCoef(...) end
---@param ... any
---@return any
function BeamObject:getNodeSpeed(...) end
---@param ... any
---@return any
function BeamObject:getNodeTag(...) end
---@param ... any
---@return any
function BeamObject:getNodeTemperature(...) end
---@param ... any
---@return any
function BeamObject:getNodeVelocity(...) end
---@param ... any
---@return any
function BeamObject:getNodeVelocityVector(...) end
---@param ... any
---@return any
function BeamObject:getNodeVelocityVectorXYZ(...) end
---@param ... any
---@return any
function BeamObject:getNodesVector(...) end
---@param ... any
---@return any
function BeamObject:getObjectCenterPosition(...) end
---@param ... any
---@return any
function BeamObject:getObjectCenterPositionXYZ(...) end
---@param ... any
---@return any
function BeamObject:getObjectCollisionIds(...) end
---@param ... any
---@return any
function BeamObject:getObjectDirectionVector(...) end
---@param ... any
---@return any
function BeamObject:getObjectDirectionVectorUp(...) end
---@param ... any
---@return any
function BeamObject:getObjectDirectionVectorUpXYZ(...) end
---@param ... any
---@return any
function BeamObject:getObjectDirectionVectorXYZ(...) end
---@param ... any
---@return any
function BeamObject:getObjectFrontPosition(...) end
---@param ... any
---@return any
function BeamObject:getObjectFrontPositionXYZ(...) end
---@param ... any
---@return any
function BeamObject:getObjectInitialHeight(...) end
---@param ... any
---@return any
function BeamObject:getObjectInitialLength(...) end
---@param ... any
---@return any
function BeamObject:getObjectInitialWidth(...) end
---@param ... any
---@return any
function BeamObject:getOriginalFrontPositionRelative(...) end
---@param ... any
---@return any
function BeamObject:getOriginalNodeMass(...) end
---@param ... any
---@return any
function BeamObject:getOriginalNodePositionRelative(...) end
---@param ... any
---@return any
function BeamObject:getOriginalNodePositionRelativeXYZ(...) end
---@param ... any
---@return any
function BeamObject:getPhysicsDt(...) end
---@param ... any
---@return any
function BeamObject:getPhysicsFPS(...) end
---@param ... any
---@return any
function BeamObject:getPitchAngularVelocity(...) end
---@param ... any
---@return any
function BeamObject:getPosition(...) end
---@param ... any
---@return any
function BeamObject:getPositionXYZ(...) end
---@param ... any
---@return any
function BeamObject:getPressureGroupVolume(...) end
---@param ... any
---@return any
function BeamObject:getProjectedNodePosition(...) end
---@param ... any
---@return any
function BeamObject:getRealdt(...) end
---@param ... any
---@return any
function BeamObject:getRelativeAirDensity(...) end
---@param ... any
---@return any
function BeamObject:getRollAngularVelocity(...) end
---@param ... any
---@return any
function BeamObject:getRollPitchYaw(...) end
---@param ... any
---@return any
function BeamObject:getRollPitchYawAngularVelocity(...) end
---@param ... any
---@return any
function BeamObject:getRollPitchYawRad(...) end
---@param ... any
---@return any
function BeamObject:getRotation(...) end
---@param ... any
---@return any
function BeamObject:getSafeLocalQueueNumber(...) end
---@param ... any
---@return any
function BeamObject:getSelfCollisionMode(...) end
---@param ... any
---@return any
function BeamObject:getSelfCollisionState(...) end
---@param ... any
---@return any
function BeamObject:getSensorVectorRaw(...) end
---@param ... any
---@return any
function BeamObject:getSensorX(...) end
---@param ... any
---@return any
function BeamObject:getSensorY(...) end
---@param ... any
---@return any
function BeamObject:getSensorZ(...) end
---@param ... any
---@return any
function BeamObject:getSensorZnonInertial(...) end
---@param ... any
---@return any
function BeamObject:getSensorsFFI(...) end
---@param ... any
---@return any
function BeamObject:getSimTime(...) end
---@param ... any
---@return any
function BeamObject:getSimulationTimeScale(...) end
---@param ... any
---@return any
function BeamObject:getSmoothRefVelocityXYZ(...) end
---@param ... any
---@return any
function BeamObject:getStaticFrictionCoef(...) end
---@param ... any
---@return any
function BeamObject:getSurfaceHeightBelow(...) end
---@param ... any
---@return any
function BeamObject:getSwitchableMaterial(...) end
---@param ... any
---@return any
function BeamObject:getTerrainDrivability(...) end
---@param ... any
---@return any
function BeamObject:getTerrainHeight(...) end
---@param ... any
---@return any
function BeamObject:getTerrainNormal(...) end
---@param ... any
---@return any
function BeamObject:getTorsionbarAngle(...) end
---@param ... any
---@return any
function BeamObject:getTorsionbarDeformation(...) end
---@param ... any
---@return any
function BeamObject:getTriangleCount(...) end
---@param ... any
---@return any
function BeamObject:getUpdateUIflag(...) end
---@param ... any
---@return any
function BeamObject:getVelocity(...) end
---@param ... any
---@return any
function BeamObject:getVelocityXYZ(...) end
---@param ... any
---@return any
function BeamObject:getWheel(...) end
---@param ... any
---@return any
function BeamObject:getWheelAirTemperature(...) end
---@param ... any
---@return any
function BeamObject:getWheelAvgTemperature(...) end
---@param ... any
---@return any
function BeamObject:getWheelCoreTemperature(...) end
---@param ... any
---@return any
function BeamObject:getWheelFFI(...) end
---@param ... any
---@return any
function BeamObject:getWind(...) end
---@param ... any
---@return any
function BeamObject:getYawAngularVelocity(...) end
---@param ... any
---@return any
function BeamObject:hasIbody(...) end
---@param ... any
---@return any
function BeamObject:hasNodeCollidedDuring(...) end
---@param ... any
---@return any
function BeamObject:inSameNodeCluster(...) end
---@param ... any
---@return any
function BeamObject:inWater(...) end
---@param ... any
---@return any
function BeamObject:initLuaCallbacks(...) end
---@param ... any
---@return any
function BeamObject:isCollidingWithObject(...) end
---@param ... any
---@return any
function BeamObject:isNodeColliding(...) end
---@param ... any
---@return any
function BeamObject:isPlayingSFX(...) end
---@param ... any
---@return any
function BeamObject:isTriangleBroken(...) end
---@param ... any
---@return any
function BeamObject:nodeDot(...) end
---@param ... any
---@return any
function BeamObject:nodeLength(...) end
---@param ... any
---@return any
function BeamObject:nodeLineSectionDistance(...) end
---@param ... any
---@return any
function BeamObject:nodeSquaredLength(...) end
---@param ... any
---@return any
function BeamObject:nodeVecCos(...) end
---@param ... any
---@return any
function BeamObject:nodeVecPlanarCos(...) end
---@param ... any
---@return any
function BeamObject:nodeVecPlanarCosRightForward(...) end
---@param ... any
---@return any
function BeamObject:nodeVecPlanarSinForward2(...) end
---@param ... any
---@return any
function BeamObject:playRPMLeds(...) end
---@param ... any
---@return any
function BeamObject:playSFX(...) end
---@param ... any
---@return any
function BeamObject:playSFXOnce(...) end
---@param ... any
---@return any
function BeamObject:playSFXOnceCT(...) end
---@param ... any
---@return any
function BeamObject:playSFXOnceStatic(...) end
---@param ... any
---@return any
function BeamObject:playSFXOnceStaticCT(...) end
---@param ... any
---@return any
function BeamObject:propUpdate(...) end
---@param ... any
---@return any
function BeamObject:queueGameEngineLua(...) end
---@param ... any
---@return any
function BeamObject:queueHookJS(...) end
---@param ... any
---@return any
function BeamObject:queueLuaCommand(...) end
---@param ... any
---@return any
function BeamObject:queueMainHookJS(...) end
---@param ... any
---@return any
function BeamObject:queueObjectFastLuaCommand(...) end
---@param ... any
---@return any
function BeamObject:queueObjectLuaCommand(...) end
---@param ... any
---@return any
function BeamObject:queueOtherObjectsLuaCommand(...) end
---@param ... any
---@return any
function BeamObject:queueStreamDataJS(...) end
---@param ... any
---@return any
function BeamObject:queueWebViewJS(...) end
---@param ... any
---@return any
function BeamObject:queueWebViewStreamJS(...) end
---@param ... any
---@return any
function BeamObject:recvSteering(...) end
---@param ... any
---@return any
function BeamObject:requestReset(...) end
---@param ... any
---@return any
function BeamObject:resetMaterials(...) end
---@param ... any
---@return any
function BeamObject:respawnWithPartConfig(...) end
---@param ... any
---@return any
function BeamObject:screwBeam(...) end
---@param ... any
---@return any
function BeamObject:sendForceFeedback(...) end
---@param ... any
---@return any
function BeamObject:sendRPMLeds(...) end
---@param ... any
---@return any
function BeamObject:setAerodynamicsMode(...) end
---@param ... any
---@return any
function BeamObject:setBeam(...) end
---@param ... any
---@return any
function BeamObject:setBeamAnisotropic(...) end
---@param ... any
---@return any
function BeamObject:setBeamBounded(...) end
---@param ... any
---@return any
function BeamObject:setBeamDeform(...) end
---@param ... any
---@return any
function BeamObject:setBeamDeformationTriggerRatio(...) end
---@param ... any
---@return any
function BeamObject:setBeamLbeam(...) end
---@param ... any
---@return any
function BeamObject:setBeamLength(...) end
---@param ... any
---@return any
function BeamObject:setBeamLengthRefDeformedRatio(...) end
---@param ... any
---@return any
function BeamObject:setBeamLengthRefRatio(...) end
---@param ... any
---@return any
function BeamObject:setBeamLengthRefRatioTarget(...) end
---@param ... any
---@return any
function BeamObject:setBeamPressureRel(...) end
---@param ... any
---@return any
function BeamObject:setBeamPressured(...) end
---@param ... any
---@return any
function BeamObject:setBeamSpringDamp(...) end
---@param ... any
---@return any
function BeamObject:setBeamStrength(...) end
---@param ... any
---@return any
function BeamObject:setBoundedBeamDamp(...) end
---@param ... any
---@return any
function BeamObject:setBoundedBeamLongBound(...) end
---@param ... any
---@return any
function BeamObject:setBoundedBeamShortBound(...) end
---@param ... any
---@return any
function BeamObject:setBoundedBeamSpringDampLimits(...) end
---@param ... any
---@return any
function BeamObject:setClusterPosRelRot(...) end
---@param ... any
---@return any
function BeamObject:setCouplerStrength(...) end
---@param ... any
---@return any
function BeamObject:setDebugString(...) end
---@param ... any
---@return any
function BeamObject:setDynamicBeam(...) end
---@param ... any
---@return any
function BeamObject:setEngineSound(...) end
---@param ... any
---@return any
function BeamObject:setEngineSoundParameter(...) end
---@param ... any
---@return any
function BeamObject:setGhostEnabled(...) end
---@param ... any
---@return any
function BeamObject:setGravity(...) end
---@param ... any
---@return any
function BeamObject:setGroupPressure(...) end
---@param ... any
---@return any
function BeamObject:setGroupPressureRel(...) end
---@param ... any
---@return any
function BeamObject:setMaterialEmissiveFactor(...) end
---@param ... any
---@return any
function BeamObject:setNode(...) end
---@param ... any
---@return any
function BeamObject:setNodeFrictionSlidingCoefs(...) end
---@param ... any
---@return any
function BeamObject:setNodeMass(...) end
---@param ... any
---@return any
function BeamObject:setNodeMaterial(...) end
---@param ... any
---@return any
function BeamObject:setNodePair(...) end
---@param ... any
---@return any
function BeamObject:setNodePair2WheelId(...) end
---@param ... any
---@return any
function BeamObject:setNodePosition(...) end
---@param ... any
---@return any
function BeamObject:setNodeTag(...) end
---@param ... any
---@return any
function BeamObject:setNodeTemperature(...) end
---@param ... any
---@return any
function BeamObject:setNodeVolumePitchCT(...) end
---@param ... any
---@return any
function BeamObject:setPersistentData(...) end
---@param ... any
---@return any
function BeamObject:setPhysicsStepEnabled(...) end
---@param ... any
---@return any
function BeamObject:setPitch(...) end
---@param ... any
---@return any
function BeamObject:setPlanets(...) end
---@param ... any
---@return any
function BeamObject:setPrecompressionRatio(...) end
---@param ... any
---@return any
function BeamObject:setPropLight(...) end
---@param ... any
---@return any
function BeamObject:setReferenceNodes(...) end
---@param ... any
---@return any
function BeamObject:setSFXNode(...) end
---@param ... any
---@return any
function BeamObject:setSFXparameter(...) end
---@param ... any
---@return any
function BeamObject:setSelfCollisionMode(...) end
---@param ... any
---@return any
function BeamObject:setSimulationTimeScale(...) end
---@param ... any
---@return any
function BeamObject:setSleepingEnabled(...) end
---@param ... any
---@return any
function BeamObject:setSlidenodeSpringStrength(...) end
---@param ... any
---@return any
function BeamObject:setSlipTireMarkThreshold(...) end
---@param ... any
---@return any
function BeamObject:setTorsionbar(...) end
---@param ... any
---@return any
function BeamObject:setTorsionbarAngle(...) end
---@param ... any
---@return any
function BeamObject:setTorsionbarPrecompressionAngle(...) end
---@param ... any
---@return any
function BeamObject:setTorsionbarSpringDamp(...) end
---@param ... any
---@return any
function BeamObject:setTriangle(...) end
---@param ... any
---@return any
function BeamObject:setVolume(...) end
---@param ... any
---@return any
function BeamObject:setVolumePitch(...) end
---@param ... any
---@return any
function BeamObject:setVolumePitchCT(...) end
---@param ... any
---@return any
function BeamObject:setWaterFlow(...) end
---@param ... any
---@return any
function BeamObject:setWheel(...) end
---@param ... any
---@return any
function BeamObject:setWheelCoreTemperature(...) end
---@param ... any
---@return any
function BeamObject:setWheelTorqueAndBrakeTorque(...) end
---@param ... any
---@return any
function BeamObject:setWind(...) end
---@param ... any
---@return any
function BeamObject:stopLatching(...) end
---@param ... any
---@return any
function BeamObject:stopSFX(...) end
---@param ... any
---@return any
function BeamObject:switchMaterial(...) end
---@param ... any
---@return any
function BeamObject:torsionbarIsBroken(...) end
---@param ... any
---@return any
function BeamObject:wheelTurnRadius(...) end

---@class BeamEngineClass_static
---@operator call: BeamEngineClass
BeamEngineClass = {}

---@class BeamObject_static
---@operator call: BeamObject
BeamObject = {}

---@class debugdrawer_static
debugdrawer = {}

---@class wheelData_static
wheelData = {}

---@type BeamEngineClass
BeamEngine = nil

---@type BeamEngineClass
FS = nil

---@type BeamEngineClass
Lua = nil

---@type BeamObject
obj = nil

