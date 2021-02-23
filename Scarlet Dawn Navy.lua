--//////////////////////////////////////////////////////
-- Name: Operation Scarlet Dawn - Navy Module
-- Author: Surrexen    à¼¼ ã�¤ â—•_â—• à¼½ã�¤    (ã�¥ï½¡â—•â€¿â—•ï½¡)ã�¥ 
--//////////////////////////////////////////////////////
--////MAIN

trigger.action.outSound('Background Chatter.ogg')

--////CARRIER GROUP PATROL ROUTE
--////Set Carrier Group To Patrol Waypoints Indefinately
if ( Group.getByName("CVN71") ) then
GROUP:FindByName("CVN71"):PatrolRoute()
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

--local airbossRoosevelt=AIRBOSS:New("CVN-71 Theodore Roosevelt")
--AIRBOSS:SetTACAN(71, X, RSV)
--AIRBOSS:SetICLS(1, RSV)
--airbossRoosevelt:Start()

--local airbossTarawa=AIRBOSS:New("LHA-1")
--AIRBOSS:SetTACAN(1, X, TWA)
--AIRBOSS:SetICLS(2, TWA)
--airbossTarawa:Start()