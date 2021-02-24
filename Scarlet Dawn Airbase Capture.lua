
REDCAPTURETEAM = SPAWN:New("Syrian APC Tigr 233036")
BLUECAPTURETEAM = SPAWN:New("US M1025 HMMWV")


function SEF_CAPAIRBASE(Airbase, Coalition)
	
	if ( Coalition == 1 ) then
		RedHeloSpawnVec2 = ZONE:FindByName(Airbase.." LZ Red"):GetVec2()
		REDCAPTURETEAM:SpawnFromVec2(RedHeloSpawnVec2)	
	elseif ( Coalition == 2 ) then
		BlueHeloSpawnVec2 = ZONE:FindByName(Airbase.." LZ Blue"):GetVec2()
		BLUECAPTURETEAM:SpawnFromVec2(BlueHeloSpawnVec2)		
	else
	end
end