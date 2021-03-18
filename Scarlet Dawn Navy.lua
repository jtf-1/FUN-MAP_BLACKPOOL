--//////////////////////////////////////////////////////
-- Name: Operation Scarlet Dawn - Navy Module
-- Author: Surrexen    à¼¼ ã�¤ â—•_â—• à¼½ã�¤    (ã�¥ï½¡â—•â€¿â—•ï½¡)ã�¥ 
--//////////////////////////////////////////////////////
--////MAIN

trigger.action.outSound('Background Chatter.ogg')

--////CARRIER GROUP PATROL ROUTE
--////Set Carrier Group To Patrol Waypoints Indefinately
if ( Group.getByName("CVN-71 Theodore Roosevelt") ) then
GROUP:FindByName("CVN-71 Theodore Roosevelt"):PatrolRoute()
end

if ( Group.getByName("LHA-1") ) then
GROUP:FindByName("LHA-1"):PatrolRoute()
end

if ( Group.getByName("Tripoli-Sub") ) then
GROUP:FindByName("Tripoli-Sub"):PatrolRoute()
end

if ( Group.getByName("Tartus-Speedboats") ) then
GROUP:FindByName("Tartus-Speedboats"):PatrolRoute()
end

if ( Group.getByName("Latakia - Navy") ) then
	GROUP:FindByName("Latakia - Navy"):PatrolRoute()
end

if ( Group.getByName("Tartus - Navy") ) then
	GROUP:FindByName("Tartus - Navy"):PatrolRoute()
end

--if ( Group.getByName("CVN-73 George Washington") ) then
--GROUP:FindByName("CVN-73 George Washington"):PatrolRoute()
--end

--local airbossRoosevelt=AIRBOSS:New("CVN-71 Theodore Roosevelt")
--AIRBOSS:SetTACAN(71, X, RSV)
--AIRBOSS:SetICLS(1, RSV)
--airbossRoosevelt:Start()

--local airbossTarawa=AIRBOSS:New("LHA-1")
--AIRBOSS:SetTACAN(1, X, TWA)
--AIRBOSS:SetICLS(2, TWA)
--airbossTarawa:Start()



local airbossRoosevelt=AIRBOSS:New("CVN-71 Theodore Roosevelt")
airbossRoosevelt:SetSoundfilesFolder("Airboss Soundfiles/")
airbossRoosevelt:SetVoiceOversLSOByRaynor()
airbossRoosevelt:SetVoiceOversMarshalByRaynor()
airbossRoosevelt:SetRespawnAI(true)
airbossRoosevelt:SetStaticWeather(false)
airbossRoosevelt:SetRecoveryTanker(ArcoRoosevelt)
airbossRoosevelt:SetTACAN(71, "X", "RSV")
airbossRoosevelt:SetICLS(1, "RSV")
airbossRoosevelt:SetBeaconRefresh(300)
airbossRoosevelt:SetLSORadio(308.475, AM)
airbossRoosevelt:SetMarshalRadio(285.675, AM)
airbossRoosevelt:SetCarrierControlledArea(50)
airbossRoosevelt:SetCollisionDistance(25, distance)
airbossRoosevelt:AddRecoveryWindow("23:15", "23:45", 3, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("00:15", "00:45", 3, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("01:15", "01:45", 3, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("02:15", "02:45", 3, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("03:15", "03:45", 3, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("04:15", "04:45", 3, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("05:15", "05:45", 3, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("06:15", "06:45", 1, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("07:15", "07:45", 1, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("08:15", "08:45", 1, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("09:15", "09:45", 1, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("10:15", "10:45", 1, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("11:15", "11:45", 1, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("12:15", "12:45", 1, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("13:15", "13:45", 1, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("14:15", "14:45", 1, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("15:15", "15:45", 1, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("16:15", "16:45", 1, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("17:15", "17:45", 1, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("18:15", "18:45", 1, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("19:15", "19:45", 1, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("20:15", "20:45", 3, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("21:15", "21:45", 3, nil, true, 28)
airbossRoosevelt:AddRecoveryWindow("22:15", "22:45", 3, nil, true, 28)
airbossRoosevelt:SetPatrolAdInfinitum(switch)
airbossRoosevelt:SetDefaultPlayerSkill("Flight Student")
airbossRoosevelt:SetMenuSmokeZones(false)
airbossRoosevelt:SetMenuMarkZones(false)
airbossRoosevelt:SetMenuSingleCarrier(true)
airbossRoosevelt:SetMenuRecovery(15, 28, false, 30)
airbossRoosevelt:SetAutoSave("C:\\AirbossGrades\\")
--airbossRoosevelt:SetTrapSheet("C:\\AirbossGrades\\TrapSheets\\", "trap")
airbossRoosevelt:Start()


