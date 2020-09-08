--assert(loadfile("F:\\_Google Drive\\DCS Missions\\SydADF2012.lua"))()
--SA6 % availability - 100% is full complement
--SA2 % availability
--SA3 % availability
--SA10 % availability
--EWR % availability

--Editable part v

local SA6pc = 5
local SA2pc = 5
local SA3pc = 5
local SA10pc = 30
local EWRpc = 40

--Editable part ^

SA6sam=SET_GROUP:New():FilterPrefixes("SAM-SA6"):FilterActive(true):FilterOnce()
SA2sam=SET_GROUP:New():FilterPrefixes("SAM-SA2"):FilterActive(true):FilterOnce()
SA3sam=SET_GROUP:New():FilterPrefixes("SAM-SA3"):FilterActive(true):FilterOnce()
SA10sam=SET_GROUP:New():FilterPrefixes("SAM-SA10"):FilterActive(true):FilterOnce()
EWR=SET_GROUP:New():FilterPrefixes("EWR"):FilterActive(true):FilterStart()
--All=SET_GROUP:New():FilterActive(true):FilterStart()

local SA6count=SA6sam:Count()
local SA3count=SA3sam:Count()
local SA2count=SA2sam:Count()
local SA10count=SA10sam:Count()
local EWRcount=EWR:Count()


--We will reduce the complement of the SAM's by the fixed percentage requested above by removing some


local SA6toKeep = UTILS.Round(SA6count/100*SA6pc, 0)

--if SA6toKeep>0 then
local SA6toDestroy = SA6count - SA6toKeep
  for i = 1, SA6toDestroy do
    local grpObj = SA6sam:GetRandom()
    --env.info(grpObj:GetName())
    grpObj:Destroy(true)

  end
--end 

local SA2toKeep = UTILS.Round(SA2count/100*SA2pc, 0)

--if SA2toKeep>0 then
local SA2toDestroy = SA2count - SA2toKeep
  for i = 1, SA2toDestroy do
   local grpObj = SA2sam:GetRandom()
    --env.info(grpObj:GetName())
    grpObj:Destroy(true)

  end
--end 

local SA3toKeep = UTILS.Round(SA3count/100*SA3pc, 0)

--if SA3toKeep>0 then
local SA3toDestroy = SA3count - SA3toKeep
  for i = 1, SA3toDestroy do
    local grpObj = SA3sam:GetRandom()
    --env.info(grpObj:GetName())
    grpObj:Destroy(true)

  end
--end 

local SA10toKeep = UTILS.Round(SA10count/100*SA10pc, 0)

--if SA10toKeep>0 then
local SA10toDestroy = SA10count - SA10toKeep
  for i = 1, SA10toDestroy do
    local grpObj = SA10sam:GetRandom()
    --env.info(grpObj:GetName())
    grpObj:Destroy(true)

  end
--end

local EWRtoKeep = UTILS.Round(EWRcount/100*EWRpc, 0)

--if EWRtoKeep>0 then
local EWRtoDestroy = EWRcount - EWRtoKeep
  for i = 1, EWRtoDestroy do
    local grpObj = EWR:GetRandom()
    --env.info(grpObj:GetName())
    grpObj:Destroy(true)

  end
--end 

redIADS = SkynetIADS:create('SYRIA')
redIADS:setUpdateInterval(15)
redIADS:addEarlyWarningRadarsByPrefix('EWR')
redIADS:addSAMSitesByPrefix('SAM')
redIADS:getSAMSitesByNatoName('SA-2'):setGoLiveRangeInPercent(80)
redIADS:getSAMSitesByNatoName('SA-3'):setGoLiveRangeInPercent(80)
redIADS:getSAMSitesByNatoName('SA-10'):setGoLiveRangeInPercent(80)
redIADS:activate()    

-- Define a SET_GROUP object that builds a collection of groups that define the EWR network.
DetectionSetGroup = SET_GROUP:New()
DetectionSetGroup:FilterPrefixes("EWR")
DetectionSetGroup:FilterStart()
-- Setup the detection and group targets to a 30km range!
Detection = DETECTION_AREAS:New( DetectionSetGroup, 30000 )
-- Setup the A2A dispatcher, and initialize it.
A2ADispatcher = AI_A2A_DISPATCHER:New( Detection )
-- Set 100km as the radius to engage any target by airborne friendlies.
A2ADispatcher:SetEngageRadius(120000) -- radius to engage any target by airborne friendlies
-- Set 200km as the radius to ground control intercept.
A2ADispatcher:SetGciRadius(60000) -- radius to check if a target can be engaged by an ground controlled intercept
A2ADispatcher:SetDefaultTakeoffFromParkingCold()
A2ADispatcher:SetDefaultLandingAtEngineShutdown()
A2ADispatcher:SetDefaultFuelThreshold(0.20)
A2ADispatcher:SetDefaultDamageThreshold(0.40)
A2ADispatcher:SetDisengageRadius(100000)
A2ADispatcher:SetDefaultCapLimit( 1 ) -- Maximum 2 CAP per squadron.
A2ADispatcher:SetDefaultOverhead(.5)
BorderZone = ZONE_POLYGON:New( "RED-BORDER", GROUP:FindByName( "SyAF-GCI" ) )
NorthCapZone = ZONE_POLYGON:New( "CAPzoneNorth", GROUP:FindByName( "CAP zone North" ) )
SouthCapZone = ZONE_POLYGON:New( "CAPzoneSouth", GROUP:FindByName( "CAP zone South" ) )
A2ADispatcher:SetBorderZone( BorderZone )

--SQNs
A2ADispatcher:SetSquadron( "North CAP", "Hama", { "CAPnorth" }) --mig29, Qty=total aircraft pool
A2ADispatcher:SetSquadronGrouping( "North CAP", 2 ) --Qty=spawns per group
A2ADispatcher:SetSquadronCap2( "North CAP", 800, 1200, 3000, 8000, "Baro", NorthCapZone, 600, 700, 6000, 8000, "Baro")
A2ADispatcher:SetSquadronCapInterval( "North CAP", 1, 900, 1200)

A2ADispatcher:SetSquadron( "Russia GCI", "Bassel Al-Assad", { "Russia GCI" }) --su30
A2ADispatcher:SetSquadronGrouping( "Russia GCI", 1 )--Qty=spawns per group
A2ADispatcher:SetSquadronGci2( "Russia GCI", 800, 1200, 2000, 5000, "Baro" )

A2ADispatcher:SetSquadron( "695 Squadron", "Rene Mouawad", { "695 Squadron" }) --mig23
A2ADispatcher:SetSquadronGrouping( "695 Squadron", 1 )--Qty=spawns per group
A2ADispatcher:SetSquadronGci2( "695 Squadron", 800, 1200, 2000, 5000, "Baro" )

A2ADispatcher:SetSquadron( "South CAP", "Al-Dumayr", { "CAPsouth" }) --mig29, Qty=total aircraft pool
A2ADispatcher:SetSquadronGrouping( "South CAP", 2 ) --Qty=spawns per group
A2ADispatcher:SetSquadronCap2( "South CAP", 800, 1200, 3000, 8000, "Baro", SouthCapZone, 600, 700, 6000, 8000, "Baro")
A2ADispatcher:SetSquadronCapInterval( "South CAP", 1, 900, 1200)

A2ADispatcher:SetSquadron( "54 Squadron", "Marj Ruhayyil", { "54 Squadron" }) --mig23
A2ADispatcher:SetSquadronGrouping( "54 Squadron", 1 )--Qty=spawns per group
A2ADispatcher:SetSquadronGci2( "54 Squadron", 800, 1200, 2000, 5000, "Baro" )

A2ADispatcher:SetSquadron( "698 Squadron", "Rayak", { "698 Squadron" }) --mig29a
A2ADispatcher:SetSquadronGrouping( "698 Squadron", 1 )--Qty=spawns per group
A2ADispatcher:SetSquadronGci2( "698 Squadron", 800, 1200, 2000, 5000, "Baro" )


A2ADispatcher:SetTacticalDisplay(false)
A2ADispatcher:Start()



local Zone={}
Zone.Alpha   = ZONE:New("Aleppo")   --Core.Zone#ZONE
Zone.Bravo   = ZONE:New("Golan")   --Core.Zone#ZONE
--Zone.Charlie = ZONE:New("Zone Charlie") --Core.Zone#ZONE
--Zone.Delta   = ZONE:New("Zone Delta")   --Core.Zone#ZONE
-- Set of all zones defined in the ME
local AllZones=SET_ZONE:New():FilterOnce()

SCHEDULER:New( nil, function()
  local mission=AUFTRAG:NewCAS(Zone.Alpha)
  local fg=FLIGHTGROUP:New("2 Squadron")
  fg:AddMission(mission)
  
  local mission=AUFTRAG:NewCAS(Zone.Alpha)
  local fg=FLIGHTGROUP:New("turkishCAS")
  fg:AddMission(mission)  
  
  local mission=AUFTRAG:NewCAS(Zone.Bravo)
  local fg=FLIGHTGROUP:New("767 Squadron")
  fg:AddMission(mission)
  
  local mission=AUFTRAG:NewCAS(Zone.Bravo)
  local fg=FLIGHTGROUP:New("Cobra 1")
  fg:AddMission(mission)  
end, {},300, 600, .8)

SCHEDULER:New( nil, function()
  local mission=AUFTRAG:NewCAS(Zone.Alpha)
  local fg=FLIGHTGROUP:New("825 Squadron")
  fg:AddMission(mission)
 
  local mission=AUFTRAG:NewCAS(Zone.Alpha)
  local fg=FLIGHTGROUP:New("74 Warthog")
  fg:AddMission(mission) 
  
  local mission=AUFTRAG:NewCAS(Zone.Bravo)
  local fg=FLIGHTGROUP:New("976 Squadron AI")
  fg:AddMission(mission) 
  
  local mission=AUFTRAG:NewCAS(Zone.Bravo)
  local fg=FLIGHTGROUP:New("Hawg 1")
  fg:AddMission(mission) 
end, {},500, 1000, .8)

--Aleppo
SPAWN:New('defenders'):InitLimit(8,0):SpawnScheduled(600,.9)
SPAWN:New('attackers'):InitLimit(8,0):SpawnScheduled(600,.9)
SPAWN:New('defenders-1'):InitLimit(8,0):SpawnScheduled(600,.9)
SPAWN:New('attackers-1'):InitLimit(8,0):SpawnScheduled(600,.9)

--Golan
SPAWN:New('defenders-2'):InitLimit(7,0):SpawnScheduled(600,.9)
SPAWN:New('defenders-3'):InitLimit(7,0):SpawnScheduled(600,.9)
SPAWN:New('attackers-4'):InitLimit(8,0):SpawnScheduled(600,.9)