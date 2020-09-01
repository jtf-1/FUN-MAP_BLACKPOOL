--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- Name: Operation Blackpool
-- Author: Surrexen    à¼¼ ã�¤ â—•_â—• à¼½ã�¤    (ã�¥ï½¡â—•â€¿â—•ï½¡)ã�¥ 
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////MISSION LOGIC FUNCTIONS

function SEF_MissionSelector()	
	
	if ( NumberOfCompletedMissions >= TotalScenarios ) then
			
		OperationComplete = true
		trigger.action.outText("Operation Blackpool Has Been Successful", 15)
		--WRITE PROGRESS TABLES TO EMPTY AND SAVE WITH NO ARGUMENTS
		BlackpoolUnitInterment = {}
		SEF_SaveUnitIntermentTableNoArgs()
		BlackpoolStaticInterment = {}
		SEF_SaveStaticIntermentTableNoArgs()			
	else
		Randomiser = math.random(1,TotalScenarios)
		if ( trigger.misc.getUserFlag(Randomiser) > 0 ) then
			--SELECTED MISSION [Randomiser] ALREADY DONE, FLAG VALUE >=1, SELECT ANOTHER ONE
			SEF_MissionSelector()
		elseif ( trigger.misc.getUserFlag(Randomiser) == 0 ) then
			--SELECTED MISSION [Randomiser] IS AVAILABLE TO START, SET TO STARTED AND VALIDATE
			trigger.action.setUserFlag(Randomiser,1)
			SEF_RetrieveMissionInformation(Randomiser)
			--trigger.action.outText("Validating Mission Number "..Randomiser.." For Targeting", 15)
			SEF_ValidateMission()										
		else
			trigger.action.outText("Mission Selection Error", 15)
		end
	end		
end

function SEF_RetrieveMissionInformation ( MissionNumber )
	
	--SET GLOBAL VARIABLES TO THE SELECTED MISSION
	ScenarioNumber = MissionNumber
	AGMissionTarget = OperationBlackpool_AG[MissionNumber].TargetName
	AGTargetTypeStatic = OperationBlackpool_AG[MissionNumber].TargetStatic
	AGMissionBriefingText = OperationBlackpool_AG[MissionNumber].TargetBriefing		
end

function SEF_ValidateMission()
	
	--CHECK TARGET TO SEE IF IT IS ALIVE OR NOT
	if ( AGTargetTypeStatic == false and AGMissionTarget ~= nil ) then
		--TARGET IS NOT STATIC					
		if ( GROUP:FindByName(AGMissionTarget):IsAlive() == true ) then
			--GROUP VALID
			trigger.action.outSound('That Is Our Target.ogg')
			trigger.action.outText(AGMissionBriefingText,30)			
		elseif ( GROUP:FindByName(AGMissionTarget):IsAlive() == false or GROUP:FindByName(AGMissionTarget):IsAlive() == nil ) then
			--GROUP NOT VALID
			trigger.action.setUserFlag(ScenarioNumber,4)
			NumberOfCompletedMissions = NumberOfCompletedMissions + 1
			AGMissionTarget = nil
			AGMissionBriefingText = nil
			SEF_MissionSelector()						
		else			
			trigger.action.outText("Mission Validation Error - Unexpected Result In Group Size", 15)						
		end		
	elseif ( AGTargetTypeStatic == true and AGMissionTarget ~= nil ) then		
		--TARGET IS STATIC		
		if ( StaticObject.getByName(AGMissionTarget) ~= nil and StaticObject.getByName(AGMissionTarget):isExist() == true ) then
			--STATIC IS VALID
			trigger.action.outSound('That Is Our Target.ogg')
			trigger.action.outText(AGMissionBriefingText,30)								
		elseif ( StaticObject.getByName(AGMissionTarget) == nil or StaticObject.getByName(AGMissionTarget):isExist() == false ) then
			--STATIC TARGET NOT VALID, ASSUME TARGET ALREADY DESTROYED			
			trigger.action.setUserFlag(ScenarioNumber,4)
			NumberOfCompletedMissions = NumberOfCompletedMissions + 1	
			AGMissionTarget = nil
			AGMissionBriefingText = nil
			SEF_MissionSelector()
		else
			trigger.action.outText("Mission Validation Error - Unexpected Result In Static Test", 15)	
		end		
	elseif ( OperationComplete == true ) then
		trigger.action.outText("The Operation Is Complete - No Further Targets To Validate For Mission Assignment", 15)
	else		
		trigger.action.outText("Mission Validation Error - Mission Validation Unavailable, No Valid Targets", 15)
	end
end

function SEF_SkipScenario()	
	--CHECK MISSION IS NOT SUDDENLY FLAGGED AS STATE 4 (COMPLETED)
	if ( trigger.misc.getUserFlag(ScenarioNumber) >= 1 and trigger.misc.getUserFlag(ScenarioNumber) <= 3 ) then
		--RESET MISSION TO STATE 0 (NOT STARTED), CLEAR TARGET INFORMATION AND REROLL A NEW MISSION
		trigger.action.setUserFlag(ScenarioNumber,0) 
		AGMissionTarget = nil
		AGMissionBriefingText = nil
		SEF_MissionSelector()
	elseif ( OperationComplete == true ) then
		trigger.action.outText("The Operation Has Been Completed, All Objectives Have Been Met", 15)
	else		
		trigger.action.outText("Unable To Skip As Current Mission Is In A Completion State", 15)
	end
end

function MissionSuccess()
	
	--SET GLOBALS TO NIL
	AGMissionTarget = nil
	AGMissionBriefingText = nil
	
	local RandomMissionSuccessSound = math.random(1,5)
	trigger.action.outSound('AG Kill ' .. RandomMissionSuccessSound .. '.ogg')	
end

function SEF_MissionTargetStatus(TimeLoop, time)

	if (AGTargetTypeStatic == false and AGMissionTarget ~= nil) then
		--TARGET IS NOT STATIC
					
		if (GROUP:FindByName(AGMissionTarget):IsAlive() == true) then
			--GROUP STILL ALIVE
						
			return time + 10			
		elseif (GROUP:FindByName(AGMissionTarget):IsAlive() == false or GROUP:FindByName(AGMissionTarget):IsAlive() == nil) then 
			--GROUP DEAD
			trigger.action.outText("Mission Update - Mission Successful", 15)
			trigger.action.setUserFlag(ScenarioNumber,4)
			NumberOfCompletedMissions = NumberOfCompletedMissions + 1
			MissionSuccess()
			timer.scheduleFunction(SEF_MissionSelector, {}, timer.getTime() + 20)
			
			return time + 30			
		else			
			trigger.action.outText("Mission Target Status - Unexpected Result, Monitor Has Stopped", 15)						
		end		
	elseif (AGTargetTypeStatic == true and AGMissionTarget ~= nil) then
		--TARGET IS STATIC
		if ( StaticObject.getByName(AGMissionTarget) ~= nil and StaticObject.getByName(AGMissionTarget):isExist() == true ) then 
			--STATIC ALIVE
			
			return time + 10				
		else				
			--STATIC DESTROYED
			trigger.action.outText("Mission Update - Mission Successful", 15)
			trigger.action.setUserFlag(ScenarioNumber,4)
			NumberOfCompletedMissions = NumberOfCompletedMissions + 1
			MissionSuccess()
			timer.scheduleFunction(SEF_MissionSelector, {}, timer.getTime() + 20)
			
			return time + 30				
		end		
	else		
		return time + 10
	end	
end

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////MISSION TARGET TABLE

function SEF_InitializeMissionTable()
	
	OperationBlackpool_AG = {}	
	
	--[[
	OperationBlackpool_AG[1] = {				
		TargetName = "Ja'Din_Aircraft",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nPrimary Objective - Destroy Su-17 located near Tabqa Airfield  \nGrid DV65",
	}
	]]--	
	OperationBlackpool_AG[1] = {
    TargetName = "Patrol-1",
    TargetStatic = false,
    TargetBriefing = "Mission Update \nTarget: ISIL Convoy\n\nOur deep cover operative has sent word that an ISIL convoy has been patrolling the city of Ein Eikorum in order to recruit and control the remaining populate. Take out the convoy patrolling the city using whatever means possible.\n\nLocation: N 35.22.11 E 36.24.22 (Map Grid: BV61)\nSuggested Munition(s): Laser guided munitions, Rockets, Retarded Bombs",
  }			
	OperationBlackpool_AG[2] = {
		TargetName = "Deir_ez_Zor_11",
		TargetStatic = false,
		TargetBriefing = "Mission Update \n17 September 2016\nTarget: ISIL Militia ENE of Deir ez Zor Airport \nIn May 2015, ISIL militants launched an offensive, capturing both Palmyra and the area surrounding Deir ez-Zor, and cutting off the remaining supply line to Deir ez-Zor. The city was then effectively under siege by ISIL, leaving supplies to be solely delivered by transport helicopters. Consequently, ISIL began launching frequent attacks, which continued until 10 September 2017, against the Deir ez-Zor Airport with the aim of halting the delivery of supplies.\n\nLocation: N 35.17.29 E 40.09.09 (Map Grid: SE of Grid EV)\nSuggested Munition(s): Cluster munitions, extra fuel, and A-A missiles",
	}	
	OperationBlackpool_AG[3] = {
		TargetName = "Al_Tanf_Armor",
		TargetStatic = false,
		TargetBriefing = "Mission Update \nTarget: Militia Armor & troops\n\nA U.S. aircraft conducted airstrikes against vehicles, including a tank and bulldozer belonging to pro-government militias that were setting up fighting positions within the Al-Tanf deconfliction zone.\n\nLocation: N 33.32.19 E 38.07.34 (Map Grid: DT11)\nSuggested Munition(s): Armor piercing & cluster munitions.",
	}						
	OperationBlackpool_AG[4] = {
		TargetName = "Barzah_SciCtr_1",
		TargetStatic = true,
		TargetBriefing = "Mission Update \n13 April 2018 \nTarget: Barzah Science Center\n\nA Syrian government offensive to recapture the rebel-held Eastern Ghouta suburb began in February 2018. The offensive was condemned by Western media and governments for its use of chemical weapons. In retaliation the US Join Chiefs targeted 3 locations, one of which is the Barzah Science Center in northern Damascus. The center was found to be the center responsible for Syria's chemical weapons program. In April 2018, a long range strike using multiple cruise missiles was carried out.\n\nLocation: N 33.32.43 E 36.18.14 (Map Grid: BT41)\nSuggested Munition(s): Cruise Missiles / Long Range Glide Bombs / Laser guided munitions\nNotes: JTAC1 is on station for spotting & lasing.",
	}					
	OperationBlackpool_AG[5] = {
		TargetName = "Him_Shanshar_1",
		TargetStatic = true,
		TargetBriefing = "Mission Update \n13 April 2018 \nTarget: Him_Shanshar Warehouses\n\nA Syrian government offensive to recapture the rebel-held Eastern Ghouta suburb began in February 2018. The offensive was condemned by Western media and governments for its use of chemical weapons. In retaliation the US Join Chiefs targeted 3 locations, one of which were 3 warehouses in Him_Shanshar. The warehouses contained parts of Syria�s chemical weapons cache. In April 2018, a long range strike using multiple cruise missiles was carried out.\n\nLocation: N 34.41.23 E 36.29.03 (Map Grid: BU64) \nSuggested Munition(s): Cruise Missiles / Long Range Glide Bombs",
  }
	OperationBlackpool_AG[6] = {
    TargetName = "RussianCargo-1",
    TargetStatic = false,
    TargetBriefing = "Mission Update \nTarget: Russian Cargo Vessel\n\nDespite global sanctions against Syria, Russia has been sending arms and supplies to the current Syrian regime. A Russian cargo ship is currently on route from the West and intel suggest it plans to unload its cargo in the port of Latakia. Stop this vessel at all costs from reaching the port.\nPort Location: N 35.31.15 E 35.45.38 (Map Grid: YE53)\nSuggested Munition(s): Harpoon(s) & Laser guided munitions",
  }
  OperationBlackpool_AG[7] = {
    TargetName = "Static Locomotive 1",
    TargetStatic = true,
    TargetBriefing = "Mission Update \nTarget: Locomotive\n\nA train suspected of transporting nuclear machinery needed to develop the Syrian nuclear weapons program is preparing to leave the city of Busra in South Syria. The city is heavily guarded with manpads and AAA. Your primary mission is to destroy the locomotive and cripple the train.\nLocation: N 32.31.5 E 36.28.38 (Map Grid: BS60)\nSuggested Munition(s): Unguided bombs Mk-83/Mk-84",
  }
  OperationBlackpool_AG[8] = {
    TargetName = "BusraAirDefense1",
    TargetStatic = false,
    TargetBriefing = "Mission Update \nTarget: Manpads & AAA\n\nSyrian troops have fortified the city of Busra to guard a train suspected of transporting nuclear machinery needed to develop the Syrian nuclear weapons program. Your primary mission is to destroy all of the Manpads & AAA in the city.\nLocation: N 32.31.5 E 36.28.38 (Map Grid: BS60)\nSuggested Munition(s): Unguided bombs",
  }
	--Debug Code
	--[[
	trigger.action.outText("Target 1 Name: "..OperationBlackpool_AG[1].TargetName, 15)
	trigger.action.outText("Target 1 Type: "..OperationBlackpool_AG[1].TargetType\, 15)
	trigger.action.outText(OperationBlackpool_AG[1].TargetBriefing, 15)
	
	OperationBlackpool_AG[1] = {}
	OperationBlackpool_AG[1][1] = "Test Sector - Supply 1"
	OperationBlackpool_AG[1][2] = "Unit"
	trigger.action.outText("Target 1 Name: "..OperationBlackpool_AG[1][1], 15)
	trigger.action.outText("Target 1 Type: "..OperationBlackpool_AG[1][2], 15)
	]]--
end

--////End Mission Target Table
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////ON DEMAND MISSION INFORMATION

local function CheckObjectiveRequest()
	
	if ( AGMissionBriefingText ~= nil ) then
		trigger.action.outText(AGMissionBriefingText, 15)
		trigger.action.outSound('That Is Our Target.ogg')
	elseif ( OperationComplete == true ) then
		trigger.action.outText("The Operation Has Been Completed, There Are No Further Objectives", 15)
	elseif ( AGMissionBriefingText == nil and OperationComplete == false ) then
		trigger.action.outText("Check Objective Request Error - No Briefing Available And Operation Is Not Completed", 15)
	else
		trigger.action.outText("Check Objective Request Error - Unexpected Result Occured", 15)
	end	
end

function TargetReport()
			
	if (AGTargetTypeStatic == false and AGMissionTarget ~=nil) then
		TargetGroup = GROUP:FindByName(AGMissionTarget)	
		
		if (GROUP:FindByName(AGMissionTarget):IsAlive() == true) then
		
			TargetRemainingUnits = Group.getByName(AGMissionTarget):getSize()	
			
			MissionPlayersBlue = SET_CLIENT:New():FilterCoalitions("blue"):FilterActive():FilterOnce()
			
			MissionPlayersBlue:ForEachClient(
				function(Client)
					if Client:IsAlive() == true then
						ClientPlayerName = Client:GetPlayerName()	  
						ClientUnitName = Client:GetName()			  
						ClientGroupName = Client:GetClientGroupName() 			
						ClientGroupID = Client:GetClientGroupID()	   	
				
						PlayerUnit = UNIT:FindByName(ClientUnitName)		
					
						PlayerCoord = PlayerUnit:GetCoordinate()
						TargetCoord = TargetGroup:GetCoordinate()
						TargetHeight = math.floor(TargetGroup:GetCoordinate():GetLandHeight() * 100)/100
						TargetHeightFt = math.floor(TargetHeight * 3.28084)
						PlayerDistance = PlayerCoord:Get2DDistance(TargetCoord)

						TargetVector = PlayerCoord:GetDirectionVec3(TargetCoord)
						TargetBearing = PlayerCoord:GetAngleRadians (TargetVector)	
					
						PlayerBR = PlayerCoord:GetBRText(TargetBearing, PlayerDistance, SETTINGS:SetImperial())
					
						--List the amount of units remaining in the group
						if (TargetRemainingUnits > 1) then
							SZMessage = "There are "..TargetRemainingUnits.." targets remaining for this mission" 
						elseif (TargetRemainingUnits == 1) then
							SZMessage = "There is "..TargetRemainingUnits.." target remaining for this mission" 
						elseif (TargetRemainingUnits == nil) then					
							SZMessage = "Unable To Determine Group Size"
						else			
							SZMessage = "Nothing to report"		
						end		
					
						BRMessage = "Target bearing "..PlayerBR
						ELEMessage = "Elevation "..TargetHeight.."m".." / "..TargetHeightFt.."ft"
					--[[
						_SETTINGS:SetLL_Accuracy(0)
						CoordStringLLDMS = TargetCoord:ToStringLLDMS(SETTINGS:SetImperial())
						_SETTINGS:SetLL_Accuracy(3)
						CoordStringLLDDM = TargetCoord:ToStringLLDDM(SETTINGS:SetImperial())
						_SETTINGS:SetLL_Accuracy(2)
						CoordStringLLDMSDS = TargetCoord:\(SETTINGS:SetImperial())
						  ]]--
						--trigger.action.outTextForGroup(ClientGroupID, "Target Report For "..ClientPlayerName.."\n".."\n"..AGMissionBriefingText.."\n"..BRMessage.."\n"..SZMessage.."\n"..CoordStringLLDMS.."\n"..CoordStringLLDDM.."\n"..CoordStringLLDMSDS.."\n"..ELEMessage, 30)							
				    trigger.action.outTextForGroup(ClientGroupID, "Target Report For "..ClientPlayerName.."\n".."\n"..AGMissionBriefingText.."\n"..BRMessage.."\n"..SZMessage.."\n"..ELEMessage, 30)              
				
					else						
					end				
				end
			)
		else
			trigger.action.outText("Target Report Unavailable", 15)
		end
		
	elseif (AGTargetTypeStatic == true and AGMissionTarget ~=nil) then
		TargetGroup = STATIC:FindByName(AGMissionTarget, false)
		
		MissionPlayersBlue = SET_CLIENT:New():FilterCoalitions("blue"):FilterActive():FilterOnce()

		MissionPlayersBlue:ForEachClient(
			function(Client)
				if Client:IsAlive() == true then
					ClientPlayerName = Client:GetPlayerName()	
					ClientUnitName = Client:GetName()			
					ClientGroupName = Client:GetClientGroupName()				
					ClientGroupID = Client:GetClientGroupID()
				
					PlayerUnit = UNIT:FindByName(ClientUnitName)		
					
					PlayerCoord = PlayerUnit:GetCoordinate()
					TargetCoord = TargetGroup:GetCoordinate()
					TargetHeight = math.floor(TargetGroup:GetCoordinate():GetLandHeight() * 100)/100
					TargetHeightFt = math.floor(TargetHeight * 3.28084)
					PlayerDistance = PlayerCoord:Get2DDistance(TargetCoord)
					
					TargetVector = PlayerCoord:GetDirectionVec3(TargetCoord)
					TargetBearing = PlayerCoord:GetAngleRadians (TargetVector)	
										
					PlayerBR = PlayerCoord:GetBRText(TargetBearing, PlayerDistance, SETTINGS:SetImperial())

					BRMessage = "Target bearing "..PlayerBR
					ELEMessage = "Elevation "..TargetHeight.."m".." / "..TargetHeightFt.."ft"
					--[[
					_SETTINGS:SetLL_Accuracy(0)
					CoordStringLLDMS = TargetCoord:ToStringLLDMS(SETTINGS:SetImperial())
					_SETTINGS:SetLL_Accuracy(3)
					CoordStringLLDDM = TargetCoord:ToStringLLDDM(SETTINGS:SetImperial())
					_SETTINGS:SetLL_Accuracy(2)
					CoordStringLLDMSDS = TargetCoord:ToStringLLDMSDS(SETTINGS:SetImperial())
					--]]
					--trigger.action.outTextForGroup(ClientGroupID, "Target Report For "..ClientPlayerName.."\n".."\n"..AGMissionBriefingText.."\n"..BRMessage.."\n"..CoordStringLLDMS.."\n"..CoordStringLLDDM.."\n"..CoordStringLLDMSDS.."\n"..ELEMessage, 30)
					trigger.action.outTextForGroup(ClientGroupID, "Target Report For "..ClientPlayerName.."\n".."\n"..AGMissionBriefingText.."\n"..BRMessage.."\n"..ELEMessage, 30)             
												
				else
				end				
			end
		)		
	elseif ( OperationComplete == true ) then
		trigger.action.outText("The Operation Has Been Completed, There Are No Further Targets", 15)	
	else
		trigger.action.outText("No Target Information Available", 15)
	end
end
--////End On Demand Mission Information
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////AI SUPPORT FLIGHT FUNCTIONS
--[[

SQ BLUE SEAD F-16C
SQ BLUE CAS A-10C
SQ BLUE ASS AJS37
SQ BLUE CAP F-15C

Flags

5001 = Fighter Screen Enabled
5002 = Close Air Support Enabled
5003 = Anti-Ship Strike Enabled
5004 = SEAD Enabled
5005 = Pinpoint Strike Enabled
5891 = Drone JTAC Enabled

5010 = true if Fighter Screen active
5020 = true if Close Air Support is active
5030 = true if Anti Ship Strike is active
5040 = true if SEAD Mission is active
5050 = true if Pinpoint Strike Mission is active
5892 - true if Drone support is active

5011 = Fighter Screen Push Command
5021 = Close Air Support Push Command
5031 = Anti Ship Push Command
5041 = SEAD Mission Push Command
5051 = Pinpoint Strike Push Command


--////COMBAT AIR PATROL FIGHTER SCREEN
function RequestFighterSupport(CAPSector)
  
  if ( trigger.misc.getUserFlag(5001) == 1 ) then 
    if ( trigger.misc.getUserFlag(5010) == 0 ) then
      
      local RouteNumber = CAPSector
      
      BLUECAP1 = SPAWN
        :New( "RT BLUE CAP "..RouteNumber )
        :InitLimit( 2, 2 )
        :InitRandomizeTemplate( { "SQ BLUE CAP F-15C" } )
        :OnSpawnGroup(
          function( SpawnGroup )                
            RTBLUECAPGROUPNAME = SpawnGroup.GroupName
            RTBLUECAPGROUPID = Group.getByName(RTBLUECAPGROUPNAME):getID()                        
          end
        )       
        :Spawn()
      
      trigger.action.outText("Fighter Screen Launched",60)
      --Set flag 5010 to 1
      trigger.action.setUserFlag(5010,1)  
      
    elseif ( trigger.misc.getUserFlag(5010) == 1) then
      --Check if the spawned Fighter Screen group is still alive or not
            
      if ( BLUECAP1:IsAlive() ) then
        trigger.action.outText("Fighter Screen Is Currently Active, Further Support Is Unavailable",60)
      else
        trigger.action.setUserFlag(5010,0)
        RequestFighterSupport(CAPSector)
      end     
    else      
    end
  else
    trigger.action.outText("Fighter Screen Unavailable For This Mission",60)    
  end
end

function AbortCAPMission()

  if (trigger.misc.getUserFlag(5010) == 1 ) then
    if ( GROUP:FindByName(RTBLUECAPGROUPNAME):IsAlive() ) then
      --If Alive, Perform RTB command
      local RTB = {}
      --RTB.fromWaypointIndex = 2
      RTB.goToWaypointIndex = 6
                
      local RTBTask = {id = 'SwitchWaypoint', params = RTB}
      Group.getByName(RTBLUECAPGROUPNAME):getController():setOption(0, 3)
      Group.getByName(RTBLUECAPGROUPNAME):getController():setCommand(RTBTask) 
      
      trigger.action.outText("Fighter Screen Is Returning To Base",60)
    else
      trigger.action.outText("Fighter Screen Does Not Have Fighters To Recall",60)
    end
  else
    trigger.action.outText("Fighter Screen Has Not Been Deployed",60)
  end
end

--////CLOSE AIR SUPPORT
function RequestCASSupport(CASSector)

  if ( trigger.misc.getUserFlag(5002) == 1 ) then
    if ( trigger.misc.getUserFlag(5020) == 0 ) then

      local RouteNumber = CASSector
      
      BLUECAS1 = SPAWN
        :New( "RT BLUE CAS "..RouteNumber )
        :InitLimit( 2, 2 )
        :InitRandomizeTemplate( { "SQ BLUE CAS A-10C" } )
        :OnSpawnGroup(
          function( SpawnGroup )                
            RTBLUECASGROUPNAME = SpawnGroup.GroupName
            RTBLUECASGROUPID = Group.getByName(RTBLUECASGROUPNAME):getID()                        
          end
        )
        :Spawn()
      
      trigger.action.outText("Close Air Support Launched",60)
      --Set flag 5020 to 1
      trigger.action.setUserFlag(5020,1)  
      
    elseif ( trigger.misc.getUserFlag(5020) == 1) then
      --Check if the spawned Close Air Support group is still alive or not
      
      if ( BLUECAS1:IsAlive() ) then
        trigger.action.outText("Close Air Support Is Currently Active, Further Support Is Unavailable",60)
      else        
        trigger.action.setUserFlag(5020,0)
        RequestCASSupport(CASSector)
      end   
    else      
    end
  else
    trigger.action.outText("Close Air Support Unavailable For This Mission",60)
  end 
end

function AbortCASMission()

  if ( trigger.misc.getUserFlag(5020) == 1 ) then
    if ( GROUP:FindByName(RTBLUECASGROUPNAME):IsAlive() ) then
      --If Alive, Perform RTB command
      local RTB = {}
      --RTB.fromWaypointIndex = 2
      RTB.goToWaypointIndex = 5
                
      local RTBTask = {id = 'SwitchWaypoint', params = RTB}     
      Group.getByName(RTBLUECASGROUPNAME):getController():setOption(0, 3) -- (0, 4) is weapons hold, (0, 3) is return fire
      Group.getByName(RTBLUECASGROUPNAME):getController():setCommand(RTBTask) 
      
      trigger.action.outText("Close Air Support Is Returning To Base",60)
    else
      trigger.action.outText("Close Air Support Does Not Have Planes To Recall",60)
    end
  else
    trigger.action.outText("Close Air Support Has Not Been Deployed",60)
  end
end

--////ANTI-SHIPPING
function RequestASSSupport(ASSSector)
  
  if ( trigger.misc.getUserFlag(5003) == 1 ) then 
    if ( trigger.misc.getUserFlag(5030) == 0 ) then
      
      local RouteNumber = ASSSector
      
      BLUEASS1 = SPAWN
        :New( "RT BLUE ASS "..RouteNumber )
        :InitLimit( 2, 2 )
        :InitRandomizeTemplate( { "SQ BLUE ASS AJS37" } ) --"SQ BLUE ASS AJS37", "SQ BLUE ASS F/A-18C"
        :OnSpawnGroup(
          function( SpawnGroup )                
            RTBLUEASSGROUPNAME = SpawnGroup.GroupName
            RTBLUEASSGROUPID = Group.getByName(RTBLUEASSGROUPNAME):getID()                        
          end
        )
        :Spawn()          
      
      trigger.action.outText("Anti-Shipping Strike Launched",60)
      --Set flag 5030 to 1
      trigger.action.setUserFlag(5030,1)    
      
    elseif ( trigger.misc.getUserFlag(5030) == 1) then
      --Check if the spawned Anti-Shipping group is still alive or not
      
      if ( BLUEASS1:IsAlive() ) then
        trigger.action.outText("Anti-Shipping Is Currently Active, Further Support Is Unavailable",60)
      else
        trigger.action.setUserFlag(5030,0)
        RequestASSSupport(ASSSector)
      end   
    else      
    end
  else
    trigger.action.outText("Anti-Shipping Strike Unavailable For This Mission",60)  
  end 
end

function AbortASSMission()

  if ( trigger.misc.getUserFlag(5030) == 1 ) then
    if ( GROUP:FindByName(RTBLUEASSGROUPNAME):IsAlive() ) then
      --If Alive, Perform RTB command
      local RTB = {}
      --RTB.fromWaypointIndex = 2
      RTB.goToWaypointIndex = 7
                
      local RTBTask = {id = 'SwitchWaypoint', params = RTB}
      Group.getByName(RTBLUEASSGROUPNAME):getController():setOption(0, 3)
      Group.getByName(RTBLUEASSGROUPNAME):getController():setCommand(RTBTask) 
      
      trigger.action.outText("Anti-Shipping Support Is Returning To Base",60)
    else
      trigger.action.outText("Anti-Shipping Support Does Not Have Planes To Recall",60)
    end
  else
    trigger.action.outText("Anti-Shipping Support Has Not Been Deployed",60)
  end
end

--////SEAD
function RequestSEADSupport(SEADSector)
  
  if ( trigger.misc.getUserFlag(5004) == 1 ) then
    if ( trigger.misc.getUserFlag(5040) == 0 ) then
      
      local RouteNumber = SEADSector
      
      BLUESEAD1 = SPAWN
        :New( "RT BLUE SEAD "..RouteNumber )
        :InitLimit( 2, 2 )
        :InitRandomizeTemplate( { "SQ BLUE SEAD F-16C", "SQ BLUE SEAD F/A-18C" } )
        :OnSpawnGroup(
          function( SpawnGroup )                
            RTBLUESEADGROUPNAME = SpawnGroup.GroupName
            RTBLUESEADGROUPID = Group.getByName(RTBLUESEADGROUPNAME):getID()  
                        
          end
        )
        :Spawn()
      
      trigger.action.outText("SEAD Mission Launched",60)
      --Set flag 5040 to 1
      trigger.action.setUserFlag(5040,1)  
      
    elseif ( trigger.misc.getUserFlag(5040) == 1) then
      --Check if the spawned SEAD group is still alive or not
      
      if ( BLUESEAD1:IsAlive() ) then
        trigger.action.outText("SEAD Is Currently Active, Further Support Is Unavailable",60)
      else
        trigger.action.setUserFlag(5040,0)
        RequestSEADSupport(SEADSector)
      end   
    else      
    end
  else
    trigger.action.outText("SEAD Unavailable For This Mission",60)
  end   
end

function AbortSEADMission()

  if ( trigger.misc.getUserFlag(5040) == 1 ) then
    if ( GROUP:FindByName(RTBLUESEADGROUPNAME):IsAlive() ) then
      --If Alive, Perform RTB command
      local RTB = {}
      --RTB.fromWaypointIndex = 2
      RTB.goToWaypointIndex = 5
                
      local RTBTask = {id = 'SwitchWaypoint', params = RTB}
      Group.getByName(RTBLUESEADGROUPNAME):getController():setOption(0, 3)
      Group.getByName(RTBLUESEADGROUPNAME):getController():setCommand(RTBTask)  
      
      trigger.action.outText("SEAD Support Is Returning To Base",60)
    else
      trigger.action.outText("SEAD Support Does Not Have Planes To Recall",60)
    end
  else
    trigger.action.outText("SEAD Support Has Not Been Deployed",60)
  end
end


--////PINPOINT STRIKE
function RequestPINSupport(PinSector)
  
  if ( trigger.misc.getUserFlag(5005) == 1 ) then
    if ( trigger.misc.getUserFlag(5050) == 0 ) then
      
      PINRouteNumber = PinSector
      
      BLUEPIN1 = SPAWN
        :New( "RT BLUE PIN "..PINRouteNumber )
        :InitLimit( 2, 2 )
        :InitRandomizeTemplate( { "SQ BLUE PIN F-117A", "SQ BLUE PIN Tornado GR4", "SQ BLUE PIN F-15E" } )
        :OnSpawnGroup(
          function( SpawnGroup )                
            RTBLUEPINGROUPNAME = SpawnGroup.GroupName
            RTBLUEPINGROUPID = Group.getByName(RTBLUEPINGROUPNAME):getID()                        
          end
        )
        :Spawn()
      
      trigger.action.outText("Pinpoint Strike Mission Launched",60)
      --Set flag 5050 to 1
      trigger.action.setUserFlag(5050,1)  
      
    elseif ( trigger.misc.getUserFlag(5050) == 1) then
      --Check if the spawned Pinpoint Strike group is still alive or not
      
      if ( BLUEPIN1:IsAlive() ) then
        trigger.action.outText("Pinpoint Strike Is Currently Active, Further Support Is Unavailable",60)
      else
        trigger.action.setUserFlag(5050,0)
        RequestPINSupport(PinSector)
      end   
    else      
    end
  else
    trigger.action.outText("Pinpoint Strike Unavailable For This Mission",60)
  end 
end

function AbortPINMission()

  if ( trigger.misc.getUserFlag(5050) == 1 ) then
    if ( GROUP:FindByName(RTBLUEPINGROUPNAME):IsAlive() ) then
      --If Alive, Perform RTB command
      local RTB = {}
      --RTB.fromWaypointIndex = 2
      RTB.goToWaypointIndex = 6
                
      local RTBTask = {id = 'SwitchWaypoint', params = RTB}
      Group.getByName(RTBLUEPINGROUPNAME):getController():setOption(0, 3)
      Group.getByName(RTBLUEPINGROUPNAME):getController():setCommand(RTBTask) 
      
      trigger.action.outText("Pinpoint Strike Support Is Returning To Base",60)
    else
      trigger.action.outText("Pinpoint Strike Support Does Not Have Planes To Recall",60)
    end
  else
    trigger.action.outText("Pinpoint Strike Support Has Not Been Deployed",60)
  end
end

function SEF_PinpointStrikeTargetAcquisition()
  
  --See https://wiki.hoggitworld.com/view/DCS_task_bombing for further details
  --CHECK TARGET IS IN THE SAME SECTOR THE FLIGHT WAS CALLED TO, GET DETAILS IF IT IS AND ABORT IF NOT
  if ( AGMissionTarget ~= nil and string.find(AGMissionTarget, PINRouteNumber) ) then   
    if ( AGTargetTypeStatic == true ) then
      if ( StaticObject.getByName(AGMissionTarget):isExist() == true ) then
        TargetGroupPIN = STATIC:FindByName(AGMissionTarget, false)
        TargetCoordForStrike = TargetGroupPIN:GetCoordinate():GetVec2()
          
        local target = {}
        target.point = TargetCoordForStrike
        target.expend = "Two"
        target.weaponType = 14
        target.attackQty = 1
        target.groupAttack = true
        local engage = {id = 'Bombing', params = target}
        Group.getByName(RTBLUEPINGROUPNAME):getController():pushTask(engage)
        trigger.action.outText("The Pinpoint Strike Flight Reports Target Coordinates Are Locked In And They Are Engaging!", 15)  
      else
        trigger.action.outText("Pinpoint Strike Mission Unable To Locate Target, Aborting Mission", 15)
        AbortPINMission()
      end
    elseif ( AGTargetTypeStatic == false ) then
      if ( GROUP:FindByName(AGMissionTarget):IsAlive() == true ) then
        TargetGroupPIN = GROUP:FindByName(AGMissionTarget, false)
        TargetCoordForStrike = TargetGroupPIN:GetCoordinate():GetVec2()
          
        local target = {}
        target.point = TargetCoordForStrike
        target.expend = "Two"
        target.weaponType = 14 -- See https://wiki.hoggitworld.com/view/DCS_enum_weapon_flag for other weapon launch codes
        target.attackQty = 1
        target.groupAttack = true
        local engage = {id = 'Bombing', params = target}
        Group.getByName(RTBLUEPINGROUPNAME):getController():pushTask(engage)
        trigger.action.outText("The Pinpoint Strike Flight Reports Target Coordinates Are Locked In And They Are Engaging!", 15)    
      else
        trigger.action.outText("Pinpoint Strike Mission Unable To Locate Target", 15)
        AbortPINMission()
      end
    else
      trigger.action.outText("Pinpoint Strike Mission Unable To Locate Target", 15)
      AbortPINMission()
    end
  else
    trigger.action.outText("The Pinpoint Strike Flight Reports The Mission Target Is Not In Their Designated Sector", 15)
    AbortPINMission()   
  end 
end

--////DRONE JTAC
function RequestDroneSupport(DRONESector)
  
  if ( trigger.misc.getUserFlag(5891) == 1 ) then 
    if ( trigger.misc.getUserFlag(5892) == 0 ) then
      
      local RouteNumber = DRONESector
      
      BLUEDRONE1 = SPAWN
        :New( "RT BLUE Drone "..RouteNumber )
        :InitLimit( 1, 1 )
        :InitRandomizeTemplate( { "SQ BLUE MQ-9 Reaper" } )
        :OnSpawnGroup(
          function( SpawnGroup )                
            RTBLUEDRONEGROUPNAME = SpawnGroup.GroupName
            RTBLUEDRONEGROUPID = Group.getByName(RTBLUEDRONEGROUPNAME):getID()                        
          end
        )       
        :Spawn()
      
      trigger.action.outText("MQ-9 Reaper Aerial Drone Launched",60)
      --Set flag 5892 to 1
      trigger.action.setUserFlag(5892,1)  
      
    elseif ( trigger.misc.getUserFlag(5892) == 1) then
      --Check if the spawned drone is still alive or not
            
      if ( BLUEDRONE1:IsAlive() ) then
        trigger.action.outText("MQ-9 Reaper Aerial Drone Is Currently Active, Further Support Is Unavailable",60)
      else
        trigger.action.setUserFlag(5892,0)
        RequestDroneSupport(DRONESector)
      end     
    else      
    end
  else
    trigger.action.outText("MQ-9 Reaper Aerial Drone Unavailable For This Mission",60)    
  end
end

function AbortDroneMission()

  if (trigger.misc.getUserFlag(5892) == 1 ) then
    if ( GROUP:FindByName(RTBLUEDRONEGROUPNAME):IsAlive() ) then
      --If Alive, Perform RTB command
      local RTB = {}
      --RTB.fromWaypointIndex = 2
      RTB.goToWaypointIndex = 3
                
      local RTBTask = {id = 'SwitchWaypoint', params = RTB}
      Group.getByName(RTBLUEDRONEGROUPNAME):getController():setOption(0, 3)
      Group.getByName(RTBLUEDRONEGROUPNAME):getController():setCommand(RTBTask) 
      
      trigger.action.outText("MQ-9 Reaper Aerial Drone Is Returning To Base",60)
    else
      trigger.action.outText("MQ-9 Reaper Aerial Drone Is Unable To Be Recalled",60)
    end
  else
    trigger.action.outText("MQ-9 Reaper Aerial Drone Has Not Been Deployed",60)
  end
end
]]--
--////AI FLAG SWITCHES ETC
--[[
function SEF_CAPCommenceAttack()
  missionCommands.addCommandForCoalition(coalition.side.BLUE, "Fighter Screen Commence Attack", nil, function() trigger.action.setUserFlag(5011,1) end, nil)
  trigger.action.outText("Fighter Screen Push Command Available",60)
end

function SEF_CASCommenceAttack()
  missionCommands.addCommandForCoalition(coalition.side.BLUE, "Close Air Support Commence Attack", nil, function() trigger.action.setUserFlag(5021,1) end, nil)
  trigger.action.outText("Close Air Support Push Command Available",60)
end

function SEF_AntiShipCommenceAttack()
  missionCommands.addCommandForCoalition(coalition.side.BLUE, "Anti-Ship Strike Commence Attack", nil, function() trigger.action.setUserFlag(5031,1) end, nil)
  trigger.action.outText("Anti-Ship Strike Push Command Available",60)
end

function SEF_SEADCommenceAttack()
  missionCommands.addCommandForCoalition(coalition.side.BLUE, "SEAD Commence Attack", nil, function() trigger.action.setUserFlag(5041,1) end, nil)
  trigger.action.outText("SEAD Push Command Available",60)
end

function SEF_PinpointStrikeCommenceAttack()
  missionCommands.addCommandForCoalition(coalition.side.BLUE, "Pinpoint Strike Commence Attack", nil, function() trigger.action.setUserFlag(5051,1) end, nil)
  trigger.action.outText("Pinpoint Strike Push Command Available",60)
end

function SEF_CAPRemovePush()
  missionCommands.removeItemForCoalition(coalition.side.BLUE, {[1] = nil, [2] = "Fighter Screen Commence Attack"})
  trigger.action.setUserFlag(5011,0)
end

function SEF_CASRemovePush()
  missionCommands.removeItemForCoalition(coalition.side.BLUE, {[1] = nil, [2] = "Close Air Support Commence Attack"})
  trigger.action.setUserFlag(5021,0)
end

function SEF_ASSRemovePush()
  missionCommands.removeItemForCoalition(coalition.side.BLUE, {[1] = nil, [2] = "Anti-Ship Strike Commence Attack"})
  trigger.action.setUserFlag(5031,0)
end

function SEF_SEADRemovePush()
  missionCommands.removeItemForCoalition(coalition.side.BLUE, {[1] = nil, [2] = "SEAD Commence Attack"})
  trigger.action.setUserFlag(5041,0)
end

function SEF_PINRemovePush()
  missionCommands.removeItemForCoalition(coalition.side.BLUE, {[1] = nil, [2] = "Pinpoint Strike Commence Attack"})
  trigger.action.setUserFlag(5051,0)
end

function SEF_CheckAIPushFlags( timeloop, time ) 
  if ( trigger.misc.getUserFlag(5011) == 1 ) then
    timer.scheduleFunction(SEF_CAPRemovePush, 53, timer.getTime() + 1)
    return time + 2
  elseif ( trigger.misc.getUserFlag(5021) == 1 ) then
    timer.scheduleFunction(SEF_CASRemovePush, 53, timer.getTime() + 1)
    return time + 2
  elseif ( trigger.misc.getUserFlag(5031) == 1 ) then
    timer.scheduleFunction(SEF_ASSRemovePush, 53, timer.getTime() + 1)
    return time + 2
  elseif ( trigger.misc.getUserFlag(5041) == 1 ) then
    timer.scheduleFunction(SEF_SEADRemovePush, 53, timer.getTime() + 1)
    return time + 2
  elseif ( trigger.misc.getUserFlag(5051) == 1 ) then
    timer.scheduleFunction(SEF_PINRemovePush, 53, timer.getTime() + 1)
    return time + 2
  else
    return time + 2
  end
end
]]--
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////Radio Menu 

function SEF_RadioMenuSetup()
	--////Set Up Menu
	--table missionCommands.addSubMenuForCoalition(enum coalition.side, string name , table path)
	--table missionCommands.addCommand(string name, table/nil path, function functionToRun , any anyArguement)
	--table missionCommands.addCommandForCoalition(enum coalition.side, string name, table/nil path, function functionToRun , any anyArguement)

	--////Setup Submenu For Support Requests
	--SupportMenuMain = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request Support", nil)
	--SupportMenuAbort = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Abort Directives", nil)
	--SupportMenuCAP  = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request Fighter Support", SupportMenuMain)
	--SupportMenuCAS  = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request Close Air Support", SupportMenuMain)
	--SupportMenuSEAD = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request SEAD Support", SupportMenuMain)
	--SupportMenuASS = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request Anti-Shipping Support", SupportMenuMain)
	--SupportMenuPIN = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request Pinpoint Strike", SupportMenuMain)
	--SupportMenuDrone = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Request MQ-9 Reaper Drone", SupportMenuMain)
	
	--////Setup Menu Option To Get The Current Objective
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Check Current Objective", nil, function() CheckObjectiveRequest() end, nil)
	--////Target Report to get target numbers and coordinates 
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Target Report", nil, function() TargetReport() end, nil)
	--////Drop Smoke On The Target
	missionCommands.addCommandForCoalition(coalition.side.BLUE, "Smoke Current Objective", nil, function() SEF_TargetSmoke() end, nil)
	
	
	--////AI Support Flights Mission Abort Codes
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Abort Mission Fighter Screen", SupportMenuAbort, function() AbortCAPMission() end, nil)	
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Abort Mission Close Air Support", SupportMenuAbort, function() AbortCASMission() end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Abort Mission Anti-Shipping", SupportMenuAbort, function() AbortASSMission() end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Abort Mission SEAD", SupportMenuAbort, function() AbortSEADMission() end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Abort Mission Pinpoint Strike", SupportMenuAbort, function() AbortPINMission() end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Abort Mission MQ-9 Reaper Drone", SupportMenuAbort, function() AbortDroneMission() end, nil)	
	
	--////Blackpool Mission Options
	BlackpoolOptions = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Blackpool Options", nil)
	--BlackpoolCAPOptions = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Blackpool CAP Options", BlackpoolOptions)
	--BlackpoolSNDOptions = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Blackpool Sound Options", BlackpoolOptions)
	--BlackpoolCAPKhasab = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Enable Khasab Vipers", BlackpoolCAPOptions, function() SEF_KhasabCAP() end, nil)
	--BlackpoolFleetCats = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Enable Fleet Tomcats", BlackpoolCAPOptions, function() SEF_FleetTomcats() end, nil)
	--BlackpoolFleetBugs = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Enable Fleet Hornets", BlackpoolCAPOptions, function() SEF_FleetHornets() end, nil)
	--BlackpoolToggleFiringSounds = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Toggle Firing Sounds", BlackpoolSNDOptions, function() SEF_ToggleFiringSounds() end, nil)
	--BlackpoolDisableShips  = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Naval Ships AI Off", BlackpoolOptions, function() SEF_DisableShips() end, nil)
	--BlackpoolDefenceCheck  = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Check Defence Networks", BlackpoolOptions, function() SEF_CheckDefenceNetwork() end, nil)
	BlackpoolSkipScenario  = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Skip This Mission", BlackpoolOptions, function() SEF_SkipScenario() end, nil)	
	--BlackpoolCheckScenario  = missionCommands.addCommandForCoalition(coalition.side.BLUE, "Check mission status", BlackpoolOptions, function() SEF_ValidateMission() end, nil) 
	
	
	--////CAP Support Sector List
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "North Sector", SupportMenuCAP, function() RequestFighterSupport('Northern Syria') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Middle Sector", SupportMenuCAP, function() RequestFighterSupport('Central Syria') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "South Sector", SupportMenuCAP, function() RequestFighterSupport('Southern Syria') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bandar Lengeh", SupportMenuCAP, function() RequestFighterSupport('Bandar Lengeh') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Larak Island", SupportMenuCAP, function() RequestFighterSupport('Larak') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qeshm Island", SupportMenuCAP, function() RequestFighterSupport('Qeshm') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Havadarya", SupportMenuCAP, function() RequestFighterSupport('Havadarya') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bandar Abbas", SupportMenuCAP, function() RequestFighterSupport('Bandar Abbas') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Minab", SupportMenuCAP, function() RequestFighterSupport('Minab') end, nil)
	
	--SupportMenuCAP2 = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Other Sectors", SupportMenuCAP)
	
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Seerik", SupportMenuCAP2, function() RequestFighterSupport('Seerik') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bandar-e-Jask", SupportMenuCAP2, function() RequestFighterSupport('Bandar-e-Jask') end, nil)
	
	--////CAS Support Sector List
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Abu Musa Island", SupportMenuCAS, function() RequestCASSupport('Abu Musa') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sirri Island", SupportMenuCAS, function() RequestCASSupport('Sirri') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tunb Islands", SupportMenuCAS, function() RequestCASSupport('Tunb') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bandar Lengeh", SupportMenuCAS, function() RequestCASSupport('Bandar Lengeh') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Larak Island", SupportMenuCAS, function() RequestCASSupport('Larak') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qeshm Island", SupportMenuCAS, function() RequestCASSupport('Qeshm') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Havadarya", SupportMenuCAS, function() RequestCASSupport('Havadarya') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bandar Abbas", SupportMenuCAS, function() RequestCASSupport('Bandar Abbas') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Minab", SupportMenuCAS, function() RequestCASSupport('Minab') end, nil)
	
	--SupportMenuCAS2 = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Other Sectors", SupportMenuCAS)
	
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Seerik", SupportMenuCAS2, function() RequestCASSupport('Seerik') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bandar-e-Jask", SupportMenuCAS2, function() RequestCASSupport('Bandar-e-Jask') end, nil)
	
	--////SEAD Support Sector List
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Abu Musa Island", SupportMenuSEAD, function() RequestSEADSupport('Abu Musa') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sirri Island", SupportMenuSEAD, function() RequestSEADSupport('Sirri') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tunb Islands", SupportMenuSEAD, function() RequestSEADSupport('Tunb') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bandar Lengeh", SupportMenuSEAD, function() RequestSEADSupport('Bandar Lengeh') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Larak Island", SupportMenuSEAD, function() RequestSEADSupport('Larak') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qeshm Island", SupportMenuSEAD, function() RequestSEADSupport('Qeshm') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Havadarya", SupportMenuSEAD, function() RequestSEADSupport('Havadarya') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bandar Abbas", SupportMenuSEAD, function() RequestSEADSupport('Bandar Abbas') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Minab", SupportMenuSEAD, function() RequestSEADSupport('Minab') end, nil)
	
	--SupportMenuSEAD2 = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Other Sectors", SupportMenuSEAD)
	
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Seerik", SupportMenuSEAD2, function() RequestSEADSupport('Seerik') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bandar-e-Jask", SupportMenuSEAD2, function() RequestSEADSupport('Bandar-e-Jask') end, nil)
	
	--////ANTI-SHIP Support Sector List
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Abu Musa Island", SupportMenuASS, function() RequestASSSupport('Abu Musa') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sirri Island", SupportMenuASS, function() RequestASSSupport('Sirri') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bandar Lengeh", SupportMenuASS, function() RequestASSSupport('Bandar Lengeh') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qeshm Island", SupportMenuASS, function() RequestASSSupport('Qeshm') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Havadarya", SupportMenuASS, function() RequestASSSupport('Havadarya') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Seerik", SupportMenuASS, function() RequestASSSupport('Seerik') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bandar-e-Jask", SupportMenuASS, function() RequestASSSupport('Bandar-e-Jask') end, nil)
	
	--////PIN Support Sector List
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Abu Musa Island", SupportMenuPIN, function() RequestPINSupport('Abu Musa') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sirri Island", SupportMenuPIN, function() RequestPINSupport('Sirri') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tunb Islands", SupportMenuPIN, function() RequestPINSupport('Tunb') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bandar Lengeh", SupportMenuPIN, function() RequestPINSupport('Bandar Lengeh') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Larak Island", SupportMenuPIN, function() RequestPINSupport('Larak') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qeshm Island", SupportMenuPIN, function() RequestPINSupport('Qeshm') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Havadarya", SupportMenuPIN, function() RequestPINSupport('Havadarya') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bandar Abbas", SupportMenuPIN, function() RequestPINSupport('Bandar Abbas') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Minab", SupportMenuPIN, function() RequestPINSupport('Minab') end, nil)
	
	--SupportMenuPIN2 = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Other Sectors", SupportMenuPIN)
	
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Seerik", SupportMenuPIN2, function() RequestPINSupport('Seerik') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bandar-e-Jask", SupportMenuPIN2, function() RequestPINSupport('Bandar-e-Jask') end, nil)

	--////Drone Support Sector List
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Abu Musa Island", SupportMenuDrone, function() RequestDroneSupport('Abu Musa') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Sirri Island", SupportMenuDrone, function() RequestDroneSupport('Sirri') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Tunb Islands", SupportMenuDrone, function() RequestDroneSupport('Tunb') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bandar Lengeh", SupportMenuDrone, function() RequestDroneSupport('Bandar Lengeh') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Larak Island", SupportMenuDrone, function() RequestDroneSupport('Larak') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Qeshm Island", SupportMenuDrone, function() RequestDroneSupport('Qeshm') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Havadarya", SupportMenuDrone, function() RequestDroneSupport('Havadarya') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bandar Abbas", SupportMenuDrone, function() RequestDroneSupport('Bandar Abbas') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Minab", SupportMenuDrone, function() RequestDroneSupport('Minab') end, nil)
	
	--SupportMenuDrone2 = missionCommands.addSubMenuForCoalition(coalition.side.BLUE, "Other Sectors", SupportMenuDrone)
	
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Seerik", SupportMenuDrone2, function() RequestDroneSupport('Seerik') end, nil)
	--missionCommands.addCommandForCoalition(coalition.side.BLUE, "Sector Bandar-e-Jask", SupportMenuDrone2, function() RequestDroneSupport('Bandar-e-Jask') end, nil)	
end	


--////End Radio Menu Functions
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////NAVAL FUNCTIONS

function SEF_ROEWeaponFreeRoosevelt()	
	Group.getByName("CVN71"):getController():setOption(0, 2)
	--trigger.action.outText("Roosevelt ROE Set To Weapons Free", 15)
end

function SEF_ROEWeaponFreeTarawa()	
	Group.getByName("LHA-1"):getController():setOption(0, 2)
	--trigger.action.outText("Tarawa ROE Set To Weapons Free", 15)
end
						
function SEF_ROEHoldRoosevelt()	
	Group.getByName("CVN71"):getController():setOption(0, 4)
	--trigger.action.outText("Roosevelt ROE Set Back To Weapons Hold", 15)
end

function SEF_ROEHoldTarawa()	
	Group.getByName("LHA-1"):getController():setOption(0, 4)
	--trigger.action.outText("Tarawa ROE Set Back To Weapons Hold", 15)
end

function SEF_RooseveltShipTargeting()		
	SEF_ROEWeaponFreeRoosevelt()	
	timer.scheduleFunction(SEF_ROEHoldRoosevelt, {}, timer.getTime() + 5) 	
end

function SEF_TarawaShipTargeting()		
	SEF_ROEWeaponFreeTarawa()	
	timer.scheduleFunction(SEF_ROEHoldTarawa, {}, timer.getTime() + 5) 	
end

function SEF_CarrierRooseveltDefenceZone()
	CarrierRooseveltDefenceZone = ZONE_GROUP:New("Carrier Roosevelt", GROUP:FindByName( "CVN71" ), 40233) --Approx 25nm		
end

function SEF_CarrierTarawaDefenceZone()
	CarrierTarawaDefenceZone = ZONE_GROUP:New("Carrier Tarawa", GROUP:FindByName( "LHA-1" ), 24140)	--Approx 15nm	
end

function SEF_NavalDefenceZoneScanner(Timeloop, time)
	--trigger.action.outText("Carrier Roosevelt Is Scanning For Targets", 15)
	RooseveltScanResult = CarrierRooseveltDefenceZone:Scan( { Unit.Category.AIRPLANE, Unit.Category.HELICOPTER } )
	RooseveltRedPresense = CarrierRooseveltDefenceZone:IsSomeInZoneOfCoalition(coalition.side.RED)
	RooseveltDefenceZoneCount = 0
			
	if ( RooseveltRedPresense == true ) then				
		SET_CARRIERROOSEVELTDEFENCE = SET_UNIT:New():FilterCoalitions( "red" ):FilterCategories({"helicopter","plane"}):FilterOnce()		
		SET_CARRIERROOSEVELTDEFENCE:ForEachUnitCompletelyInZone( CarrierRooseveltDefenceZone, function ( GroupObject )
			RooseveltDefenceZoneCount = RooseveltDefenceZoneCount + 1
			end
		)		
		if ( RooseveltDefenceZoneCount > 1 ) then
			--trigger.action.outText("Carrier Roosevelt Has Detected "..RooseveltDefenceZoneCount.." Targets In Their Airspace", 15)			
			SEF_RooseveltShipTargeting()						
		elseif ( RooseveltDefenceZoneCount == 1 ) then
			--trigger.action.outText("Carrier Roosevelt Has Detected "..RooseveltDefenceZoneCount.." Target In Their Airspace", 15)			
			SEF_RooseveltShipTargeting()			
		else			
		end		
	else	
	end
	
	--trigger.action.outText("Carrier Tarawa Is Scanning For Targets", 15)
	TarawaScanResult = CarrierTarawaDefenceZone:Scan( { Unit.Category.AIRPLANE, Unit.Category.HELICOPTER } )
	TarawaRedPresense = CarrierTarawaDefenceZone:IsSomeInZoneOfCoalition(coalition.side.RED)
	TarawaDefenceZoneCount = 0
			
	if ( TarawaRedPresense == true ) then				
		SET_CARRIERTARAWADEFENCE = SET_UNIT:New():FilterCoalitions( "red" ):FilterCategories({"helicopter","plane"}):FilterOnce()		
		SET_CARRIERTARAWADEFENCE:ForEachUnitCompletelyInZone( CarrierTarawaDefenceZone, function ( GroupObject )
			TarawaDefenceZoneCount = TarawaDefenceZoneCount + 1
			end
		)		
		if ( TarawaDefenceZoneCount > 1 ) then
			--trigger.action.outText("Carrier Tarawa Has Detected "..TarawaDefenceZoneCount.." Targets In Their Airspace", 15)			
			SEF_TarawaShipTargeting()						
		elseif ( TarawaDefenceZoneCount == 1 ) then
			--trigger.action.outText("Carrier Tarawa Has Detected "..TarawaDefenceZoneCount.." Target In Their Airspace", 15)			
			SEF_TarawaShipTargeting()			
		else
		end		
	else
	end	
	
	return time + 20	
end

--////End Naval Functions
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////OVERRIDE FUNCTIONS


--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////RED BOMBER ATTACK FUNCTIONS

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////BLUE AWACS/TANKER SPAWN

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////TARGET SMOKE FUNCTIONS

function SEF_TargetSmokeLock()
	TargetSmokeLockout = 1
end

function SEF_TargetSmokeUnlock()
	TargetSmokeLockout = 0
end

function SEF_TargetSmoke()
	
	if ( TargetSmokeLockout == 0 ) then
		if ( AGTargetTypeStatic == false and AGMissionTarget ~= nil ) then
			--TARGET IS NOT STATIC					
			if ( GROUP:FindByName(AGMissionTarget):IsAlive() == true ) then
				--GROUP VALID
				SEFTargetSmokeGroupCoord = GROUP:FindByName(AGMissionTarget):GetCoordinate()
				SEFTargetSmokeGroupCoord:SmokeRed()
				--SEFTargetSmokeGroupCoord:SmokeBlue()
				--SEFTargetSmokeGroupCoord:SmokeGreen()
				--SEFTargetSmokeGroupCoord:SmokeOrange()
				--SEFTargetSmokeGroupCoord:SmokeWhite()
				trigger.action.outSound('Target Smoke.ogg')
				trigger.action.outText("Target Has Been Marked With Red Smoke", 15)
				SEF_TargetSmokeLock()
				timer.scheduleFunction(SEF_TargetSmokeUnlock, 53, timer.getTime() + 300)				
			else			
				trigger.action.outText("Target Smoke Currently Unavailable - Unable To Acquire Target Group", 15)						
			end		
		elseif ( AGTargetTypeStatic == true and AGMissionTarget ~= nil ) then		
			--TARGET IS STATIC		
			if ( StaticObject.getByName(AGMissionTarget) ~= nil and StaticObject.getByName(AGMissionTarget):isExist() == true ) then
				--STATIC IS VALID
				SEFTargetSmokeStaticCoord = STATIC:FindByName(AGMissionTarget):GetCoordinate()
				SEFTargetSmokeStaticCoord:SmokeRed()
				--SEFTargetSmokeStaticCoord:SmokeBlue()
				--SEFTargetSmokeStaticCoord:SmokeGreen()
				--SEFTargetSmokeStaticCoord:SmokeOrange()
				--SEFTargetSmokeStaticCoord:SmokeWhite()
				trigger.action.outSound('Target Smoke.ogg')		
				trigger.action.outText("Target Has Been Marked With Red Smoke", 15)
				SEF_TargetSmokeLock()
				timer.scheduleFunction(SEF_TargetSmokeUnlock, 53, timer.getTime() + 300)				
			else
				trigger.action.outText("Target Smoke Currently Unavailable - Unable To Acquire Target Building", 15)	
			end			
		else		
			trigger.action.outText("Target Smoke Currently Unavailable - No Valid Targets", 15)
		end
	else
		trigger.action.outText("Target Smoke Currently Unavailable - Smoke Shells Are Being Reloaded", 15)
	end	
end

--////End Target Smoke Functions
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////OTHER FUNCTIONS

--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--////MAIN

		--////GLOBAL VARIABLE INITIALISATION	
		NumberOfCompletedMissions = 0
		TotalScenarios = 7
		OperationComplete = false
		OnShotSoundsEnabled = 0
		SoundLockout = 0
		TargetSmokeLockout = 0	
		--////MOOSE ENVIRONMENT INITIALISATION
		_SETTINGS:SetPlayerMenuOff()
		_SETTINGS:SetImperial()
		
		--////ENABLE CAP/CAS/ASS/SEAD/PIN/DRONE
		--trigger.action.setUserFlag(5001,1)
		--trigger.action.setUserFlag(5002,1)
		--trigger.action.setUserFlag(5003,1)
		--trigger.action.setUserFlag(5004,1)
		--trigger.action.setUserFlag(5005,1)
		--trigger.action.setUserFlag(5891,1)
		--////ENABLE RED BOMBER ATTACKS
		--trigger.action.setUserFlag(5006,1)
		
		--////FUNCTIONS
		SEF_InitializeMissionTable()		
		SEF_MissionSelector()
		SEF_RadioMenuSetup()
		--SEF_BLUEAwacsSpawn()
		--SEF_BLUETexacoSpawn()
		--SEF_BLUEShellSpawn()
		--SEF_BLUE2TexacoSpawn()
		--SEF_BLUE2ShellSpawn()
		SEF_CarrierRooseveltDefenceZone()
		SEF_CarrierTarawaDefenceZone()
		
		--////SCHEDULERS
		--AI FLIGHT PUSH FLAGS
		--timer.scheduleFunction(SEF_CheckAIPushFlags, 53, timer.getTime() + 1)
		--MISSION TARGET STATUS
		timer.scheduleFunction(SEF_MissionTargetStatus, 53, timer.getTime() + 10)
		--RED BOMBER ATTACKS - WAIT 10-15 MINUTES BEFORE STARTING
		--timer.scheduleFunction(SEF_RedBomberScheduler, 53, timer.getTime() + math.random(600, 900))
		--NAVAL DEFENCE ZONE SCANNER - WAIT 5 MINUTES BEFORE STARTING
		--timer.scheduleFunction(SEF_NavalDefenceZoneScanner, 53, timer.getTime() + 300)				
	
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////