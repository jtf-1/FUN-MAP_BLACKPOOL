--//////////////////////////////////////////////////////////
-- Name: Operation Scarlet Dawn - Airforce Module
-- Author: Surrexen    à¼¼ ã�¤ â—•_â—• à¼½ã�¤    (ã�¥ï½¡â—•â€¿â—•ï½¡)ã�¥
--//////////////////////////////////////////////////////////

--[[
"Abu al-Duhur"
"Adana Sakirpasa"
"Aleppo"
"Al-Dumayr"
"Al Qusayr"
"An Nasiriyah"
"Bassel Al-Assad"
"Beirut-Rafic Hariri"
"Damascus"
"Eyn Shemer"
"Haifa"
"Hama"
"Hatay"
"Incirlik"
"Jirah"
"King Hussein Air College"
"Kiryat Shmona"
"Khalkhalah"
"Kuweires"
"Marj as Sultan North"
"Marj as Sultan South"
"Marj Ruhayyil"
"Megiddo"
"Mezzeh"
"Minakh"
"Palmyra"
"Qabr as Sitt"
"Ramat David"
"Rayak"
"Rene Mouawad"
"Tabqa"
"Taftanaz"
"Wujah Al Hajar"
]]--

CAPZoneBlueCarrier 	= ZONE_GROUP:New("CAP Zone Carrier", GROUP:FindByName( "CVN-71 Theodore Roosevelt" ), 25000)

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--////VARIABLES

RedSquadronName1 = "Alpha"
RedSquadronName2 = "Beta"
RedSquadronName3 = "Gamma"
RedSquadronName4 = "Delta"
RedSquadronName5 = "Epsilon"

REDSQUADRON1GROUPNAME = ""
REDSQUADRON2GROUPNAME = ""
REDSQUADRON3GROUPNAME = ""
REDSQUADRON4GROUPNAME = ""
REDSQUADRON5GROUPNAME = ""

BlueSquadronName1 = "USN Fighter"
BlueSquadronName2 = "USAF Fighter"
BlueSquadronName3 = "IAF Fighter"
BlueSquadronName4 = "USMC Fighter"  --CAP Group for Phase 2
BlueSquadronName5 = "US Fighter"  --CAP Group for Phase 2


BLUESQUADRON1GROUPNAME = ""
BLUESQUADRON2GROUPNAME = ""
BLUESQUADRON3GROUPNAME = ""
BLUESQUADRON4GROUPNAME = ""
BLUESQUADRON5GROUPNAME = ""



BlueSquadronsEnabled = 1
RedSquadronsEnabled = 1

BlueRespawnTimerInitialMin = 30 --300
BlueRespawnTimerInitialMax = 60 --450
RedRespawnTimerInitialMin = 300
RedRespawnTimerInitialMax = 450

BlueRespawnTimerMin = 600
BlueRespawnTimerMax = 1200
RedRespawnTimerMin  = 900 --900
RedRespawnTimerMax  = 1500 --1500

RedFlightLevelMin = 5
RedFlightLevelMax = 20
BlueFlightLevelMin = 5
BlueFlightLevelMax = 20

RedPatrolWaypointDistance = 60000 --46300
RedPatrolWaypointInitial = 18520

BluePatrolWaypointDistance = 46300
BluePatrolWaypointInitial = 18520

EngagementDistance = 90000

CleanupTime = 300

AlphaStatus = "Alpha Squadron\nAirspace Is Controlled By Syria\n"
BetaStatus = "Beta Squadron\nAirspace Is Controlled By Syria\n"
GammaStatus = "Gamma Squadron\nAirspace Is Controlled By Syria\n"
DeltaStatus = "Delta Squadron\nAirspace Is Controlled By Syria\n"
EpsilonStatus = "Epsilon Squadron\nAirspace Is Controlled By Syria\n"

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--////TABLES

USAFAirForceCAP = { 
				  "USAF F-16C", 
				  "USAF F/A-18C", 
				  "USAF F-15C", 
				  }
					 
IncirlikAirForceCAP = { 
					  "USAF F-16C", 
					  "USAF F/A-18C", 
					  "USAF F-15C",
					  "THK F-16C",
					  }					 

USNAirForceCAP = { 
				 "USAF F/A-18C", 
				 "USAF F-14B", 
				 }
					 
THKFAirForceCAP = {
				  "THK F-16C",
				  }

IAFAirForceCAP = { 
				 "IAF F-16C", 
				 "IAF F-15C", 
				 }

RJAFAirForceCAP = { 
				  "RJAF F-16C" 
				  }					 

CombinedBlueCAP  = { 
				   "USAF F-16C", 
				   "USAF F/A-18C", 
				   "USAF F-15C", 
				   "USAF F-14B", 				    
				   }

SyAAFAirForceCAP = { 
				   "SyAAF MiG-29A",
				   "SyAAF MiG-21Bis", 
				   "SyAAF MiG-23MLD",					  
				   --"SyAAF MiG-19P", 
				   }

--////F-14A ~7.6% Chance				   
PalmyraCAP = {
			 "SyAAF MiG-29A",
			 "SyAAF MiG-21Bis",
			 "SyAAF MiG-23MLD",			 
			 "IRIAF F-4E", 
			 "IRIAF F-5E-3",			 
			 "IRIAF Mirage F1",
			 "SyAAF MiG-29A",
			 "SyAAF MiG-21Bis",
			 "SyAAF MiG-23MLD",			 
			 "IRIAF F-4E", 
			 "IRIAF F-5E-3",			 
			 "IRIAF Mirage F1",			 
			 "IRIAF F-14A",
			 }

--////MiG-31 ~5.9% Chance
CoastalCAP = {
			 "SyAAF MiG-29A",
			 "SyAAF MiG-21Bis", 
			 "SyAAF MiG-23MLD",	
			 "VVS MiG-29S",
			 "VVS Su-27", 
			 "VVS Su-30", 
			 "VVS Su-33",
			 "VVS MiG-25PD",
			 "SyAAF MiG-29A",
			 "SyAAF MiG-21Bis", 
			 "SyAAF MiG-23MLD",	
			 "VVS MiG-29S",
			 "VVS Su-27", 
			 "VVS Su-30", 
			 "VVS Su-33",
			 "VVS MiG-25PD",			 
			 "VVS MiG-31",			 
			 }		

--////F-14A ~9.1% Chance
IRIAFAirForceCAP = { 
				   "IRIAF F-4E", 
				   "IRIAF F-5E-3", 
				   "IRIAF MiG-21Bis", 
				   "IRIAF MiG-29A", 
				   "IRIAF Mirage F1", 
				   "IRIAF F-4E", 
				   "IRIAF F-5E-3", 
				   "IRIAF MiG-21Bis", 
				   "IRIAF MiG-29A", 
				   "IRIAF Mirage F1",
				   "IRIAF F-14A", 
				   }

--////MiG-31 ~5.9% Chance
VVSAirForcesCAP = { 
				  "VVS MiG-21Bis", 
				  "VVS MiG-29A", 
				  "VVS MiG-29S", 
				  "VVS MiG-23MLD", 
				  "VVS MiG-25PD",					 
				  "VVS Su-27", 
				  "VVS Su-30", 
				  "VVS Su-33",
				  "VVS MiG-21Bis", 
				  "VVS MiG-29A", 
				  "VVS MiG-29S", 
				  "VVS MiG-23MLD", 
				  "VVS MiG-25PD",					 
				  "VVS Su-27", 
				  "VVS Su-30", 
				  "VVS Su-33",	
				  "VVS MiG-31", 
				  }

--////MiG-31 or F-14A ~13.3% Chance
CombinedRedCAP = { 
				 "SyAAF MiG-29A",
				 "SyAAF MiG-21Bis", 
				 "SyAAF MiG-23MLD",				 
				 "IRIAF F-4E", 
				 "IRIAF F-5E-3", 
				 "IRIAF MiG-21Bis", 
				 "IRIAF MiG-29A", 
				 "IRIAF F-14A", 
				 "IRIAF Mirage F1", 
				 "VVS MiG-21Bis", 
				 "VVS MiG-29A", 
				 "VVS MiG-29S", 
				 "VVS MiG-23MLD", 
				 "VVS MiG-25PD", 
				 "VVS MiG-31", 
				 "VVS Su-27", 
				 "VVS Su-30", 
				 "VVS Su-33", 
				 }

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

USAFAWACS_DATA = {}
USAFAWACS_DATA[1] = {
	TimeStamp 	= nil,
	Vec2 		= nil	
}

TEXACO_DATA = {}
TEXACO_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

SHELL_DATA = {}
SHELL_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

ARCO_DATA = {}
ARCO_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

REDSQUADRON1_DATA = {}
REDSQUADRON1_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
REDSQUADRON1_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

REDSQUADRON2_DATA = {}
REDSQUADRON2_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
REDSQUADRON2_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

REDSQUADRON3_DATA = {}
REDSQUADRON3_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
REDSQUADRON3_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

REDSQUADRON4_DATA = {}
REDSQUADRON4_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
REDSQUADRON4_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

REDSQUADRON5_DATA = {}
REDSQUADRON5_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
REDSQUADRON5_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

BLUESQUADRON1_DATA = {}
BLUESQUADRON1_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
BLUESQUADRON1_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

BLUESQUADRON2_DATA = {}
BLUESQUADRON2_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
BLUESQUADRON2_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

BLUESQUADRON3_DATA = {}
BLUESQUADRON3_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
BLUESQUADRON3_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

BLUESQUADRON4_DATA = {}
BLUESQUADRON4_DATA[1] = {
  TimeStamp   = nil,
  Vec2    = nil
}
BLUESQUADRON4_DATA[2] = {
  TimeStamp   = nil,
  Vec2    = nil
}
BLUESQUADRON5_DATA = {}
BLUESQUADRON5_DATA[1] = {
  TimeStamp   = nil,
  Vec2    = nil
}
BLUESQUADRON5_DATA[2] = {
  TimeStamp   = nil,
  Vec2    = nil
}
USAEFCAP_DATA = {}
USAEFCAP_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
USAEFCAP_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAEFCAS_DATA = {}
USAEFCAS_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
USAEFCAS_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAEFSEAD_DATA = {}
USAEFSEAD_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
USAEFSEAD_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAEFPIN_DATA = {}
USAEFPIN_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
USAEFPIN_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAEFASS_DATA = {}
USAEFASS_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
USAEFASS_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAEFDRONE_DATA = {}
USAEFDRONE_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

SYAAFAN26B_DATA = {}
SYAAFAN26B_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

IRIAFMI8_DATA = {}
IRIAFMI8_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAFC130_DATA = {}
USAFC130_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

USAFUH60A_DATA = {}
USAFUH60A_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

SYAAFSU24M_DATA = {}
SYAAFSU24M_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
SYAAFSU24M_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

VVSSU25T_DATA = {}
VVSSU25T_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}
VVSSU25T_DATA[2] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

VVSTU95MS_DATA = {}
VVSTU95MS_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

VVSTU160_DATA = {}
VVSTU160_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}

VVSTU22M3_DATA = {}
VVSTU22M3_DATA[1] = {
	TimeStamp 	= nil,
	Vec2		= nil
}				 

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--////AIRBASE INFORMATION

SEF_AIRBASEINFORMATION = {}
SEF_AIRBASEINFORMATION[1] = {				
		AirbaseName = "Abu al-Duhur",
		Neighbours = { "Aleppo", "Kuweires", "Jirah", "Tabqa", "Palmyra", "Hama", "Al Qusayr", "Rene Mouawad", "Bassel Al-Assad", "Taftanaz", "Minakh", "Hatay" },			
}	
SEF_AIRBASEINFORMATION[2] = {				
		AirbaseName = "Adana Sakirpasa",
		Neighbours = { "Incirlik", "Hatay", "Bassel Al-Assad", "Taftanaz", "Minakh", "Aleppo" },			
}
SEF_AIRBASEINFORMATION[3] = {				
		AirbaseName = "Aleppo",
		Neighbours = { "Minakh", "Kuweires", "Jirah", "Tabqa", "Abu al-Duhur", "Taftanaz", "Hatay", "Bassel Al-Assad", "Hama", "Incirlik", "Adana Sakirpasa", "Al Qusayr" },		
}
SEF_AIRBASEINFORMATION[4] = {				
		AirbaseName = "Al-Dumayr",
		Neighbours = { "An Nasiriyah", "Palmyra", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "Mezzeh", "Marj as Sultan North", "Marj as Sultan South", "Rayak", "Beirut-Rafic Hariri", "Wujah Al Hajar", "Rene Mouawad", "Al Qusayr", "Hama", "Kiryat Shmona", "Haifa", "Ramat David", "Megiddo", "King Hussein Air College" },
}
SEF_AIRBASEINFORMATION[5] = {				
		AirbaseName = "Al Qusayr",
		Neighbours = { "Hama", "Palmyra", "Rayak", "Al-Dumayr", "Mezzeh", "Bassel Al-Assad", "Taftanaz", "Abu al-Duhur", "Aleppo", "Rene Mouawad", "Wujah Al Hajar", "Beirut-Rafic Hariri", "Kiryat Shmona", "Khalkhalah", "Marj as Sultan North", "Marj as Sultan South", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "An Nasiriyah" },		
}
SEF_AIRBASEINFORMATION[6] = {				
		AirbaseName = "An Nasiriyah",
		Neighbours = { "Hama", "Palmyra", "Rayak", "Al-Dumayr", "Mezzeh", "Bassel Al-Assad", "Rene Mouawad", "Wujah Al Hajar", "King Hussein Air College", "Beirut-Rafic Hariri", "Kiryat Shmona", "Khalkhalah", "Marj as Sultan North", "Marj as Sultan South", "Marj Ruhayyil", "Damascus", "Qabr as Sitt" },		
}
SEF_AIRBASEINFORMATION[7] = {				
		AirbaseName = "Bassel Al-Assad",
		Neighbours = { "Adana Sakirpasa", "Incirlik", "Hatay", "Minakh", "Taftanaz", "Abu al-Duhur", "Hama", "Rene Mouawad", "Wujah Al Hajar", "Beirut-Rafic Hariri", "Rayak", "An Nasiriyah", "Al Qusayr", "Jirah", "Kuweires" },		
}
SEF_AIRBASEINFORMATION[8] = {				
		AirbaseName = "Beirut-Rafic Hariri",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "Mezzeh", "Marj as Sultan North", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "Bassel Al-Assad", "King Hussein Air College" },		
}
SEF_AIRBASEINFORMATION[9] = {				
		AirbaseName = "Damascus",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Beirut-Rafic Hariri", "Qabr as Sitt", "Mezzeh", "Marj as Sultan North", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "King Hussein Air College" },		
}
SEF_AIRBASEINFORMATION[10] = {				
		AirbaseName = "Eyn Shemer",
		Neighbours = { "Haifa", "Ramat David", "Megiddo", "King Hussein Air College", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Kiryat Shmona", "Rayak", "Beirut-Rafic Hariri", "Mezzeh", "Qabr as Sitt", "Marj as Sultan North", "Marj as Sultan South" },		
}
SEF_AIRBASEINFORMATION[11] = {				
		AirbaseName = "Haifa",
		Neighbours = { "Eyn Shemer", "Ramat David", "Megiddo", "King Hussein Air College", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Kiryat Shmona", "Rayak", "Beirut-Rafic Hariri", "Mezzeh", "Qabr as Sitt", "Marj as Sultan North", "Marj as Sultan South", "Wujah Al Hajar", "Al-Dumayr" },		
}
SEF_AIRBASEINFORMATION[12] = {				
		AirbaseName = "Hama",
		Neighbours = { "Al Qusayr", "Hatay", "Taftanaz", "Abu al-Duhur", "Tabqa", "Palmyra", "Wujah Al Hajar", "Rene Mouawad", "Bassel Al-Assad", "Minakh", "Jirah", "Kuweires", "Aleppo", "Rayak", "Beirut-Rafic Hariri", "An Nasiriyah", "Mezzeh", "Damascus", "Qabr as Sitt", "Al-Dumayr", "Marj as Sultan North", "Marj as Sultan South" },		
}
SEF_AIRBASEINFORMATION[13] = {				
		AirbaseName = "Hatay",
		Neighbours = { "Adana Sakirpasa", "Incirlik", "Minakh", "Aleppo", "Kuweires", "Abu al-Duhur", "Taftanaz", "Bassel Al-Assad", "Jirah", "Hama" },		
}
SEF_AIRBASEINFORMATION[14] = {				
		AirbaseName = "Incirlik",
		Neighbours = { "Adana Sakirpasa", "Hatay", "Minakh", "Aleppo", "Taftanaz", "Bassel Al-Assad" },		
}
SEF_AIRBASEINFORMATION[15] = {				
		AirbaseName = "Jirah",
		Neighbours = { "Tabqa", "Kuweires", "Abu al-Duhur", "Taftanaz", "Aleppo", "Minakh", "Hama", "Bassel Al-Assad", "Palmyra", "Hatay" },		
}
SEF_AIRBASEINFORMATION[16] = {				
		AirbaseName = "King Hussein Air College",
		Neighbours = { "Haifa", "Eyn Shemer", "Megiddo", "Ramat David", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Rayak", "Beirut-Rafic Hariri", "An Nasiriyah", "Mezzeh", "Damascus", "Qabr as Sitt", "Al-Dumayr", "Marj as Sultan North", "Marj as Sultan South" },		
}
SEF_AIRBASEINFORMATION[17] = {				
		AirbaseName = "Kiryat Shmona",
		Neighbours = { "Haifa", "Eyn Shemer", "Megiddo", "Ramat David", "King Hussein Air College", "Khalkhalah", "Marj Ruhayyil", "Rayak", "Beirut-Rafic Hariri", "An Nasiriyah", "Mezzeh", "Damascus", "Qabr as Sitt", "Al-Dumayr", "Marj as Sultan North", "Marj as Sultan South", "Wujah Al Hajar", "Rene Mouawad", "Al Qusayr" },		
}
SEF_AIRBASEINFORMATION[18] = {				
		AirbaseName = "Khalkhalah",
		Neighbours = { "Haifa", "Eyn Shemer", "Megiddo", "Ramat David", "King Hussein Air College", "Kiryat Shmona", "Marj Ruhayyil", "Rayak", "Beirut-Rafic Hariri", "An Nasiriyah", "Mezzeh", "Damascus", "Qabr as Sitt", "Al-Dumayr", "Marj as Sultan North", "Marj as Sultan South", "Wujah Al Hajar", "Rene Mouawad", "Al Qusayr" },		
}
SEF_AIRBASEINFORMATION[19] = {				
		AirbaseName = "Kuweires",
		Neighbours = { "Jirah", "Tabqa", "Abu al-Duhur", "Taftanaz", "Aleppo", "Minakh", "Hatay", "Bassel Al-Assad", "Hama", "Palmyra" },		
}
SEF_AIRBASEINFORMATION[20] = {				
		AirbaseName = "Marj as Sultan North",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Beirut-Rafic Hariri", "Qabr as Sitt", "Mezzeh", "Damascus", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "King Hussein Air College" },		
}
SEF_AIRBASEINFORMATION[21] = {				
		AirbaseName = "Marj as Sultan South",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Beirut-Rafic Hariri", "Qabr as Sitt", "Mezzeh", "Damascus", "Marj as Sultan North", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "King Hussein Air College" },		
}
SEF_AIRBASEINFORMATION[22] = {				
		AirbaseName = "Marj Ruhayyil",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Beirut-Rafic Hariri", "Qabr as Sitt", "Mezzeh", "Damascus", "Marj as Sultan South", "Marj as Sultan North", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "King Hussein Air College" },		
}
SEF_AIRBASEINFORMATION[23] = {				
		AirbaseName = "Megiddo",
		Neighbours = { "Eyn Shemer", "Ramat David", "Haifa", "King Hussein Air College", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Kiryat Shmona", "Rayak", "Beirut-Rafic Hariri", "Mezzeh", "Qabr as Sitt", "Marj as Sultan North", "Marj as Sultan South", "Wujah Al Hajar", "Al-Dumayr" },		
}
SEF_AIRBASEINFORMATION[24] = {				
		AirbaseName = "Mezzeh",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Beirut-Rafic Hariri", "Qabr as Sitt", "Damascus", "Marj as Sultan North", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "King Hussein Air College" },		
}
SEF_AIRBASEINFORMATION[25] = {				
		AirbaseName = "Minakh",
		Neighbours = { "Aleppo", "Kuweires", "Jirah", "Tabqa", "Abu al-Duhur", "Taftanaz", "Hatay", "Bassel Al-Assad", "Hama", "Incirlik", "Adana Sakirpasa" },		
}
SEF_AIRBASEINFORMATION[26] = {				
		AirbaseName = "Palmyra",
		Neighbours = { "Tabqa", "An Nasiriyah", "Al-Dumayr", "Hama", "Abu al-Duhur", "Jirah", "Kuweires", "Al Qusayr" },		
}
SEF_AIRBASEINFORMATION[27] = {				
		AirbaseName = "Qabr as Sitt",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Beirut-Rafic Hariri", "Marj as Sultan North", "Mezzeh", "Damascus", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "King Hussein Air College" },		
}
SEF_AIRBASEINFORMATION[28] = {				
		AirbaseName = "Ramat David",
		Neighbours = { "Eyn Shemer", "Megiddo", "Haifa", "King Hussein Air College", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Kiryat Shmona", "Rayak", "Beirut-Rafic Hariri", "Mezzeh", "Qabr as Sitt", "Marj as Sultan North", "Marj as Sultan South", "Wujah Al Hajar", "Al-Dumayr" },		
}
SEF_AIRBASEINFORMATION[29] = {				
		AirbaseName = "Rayak",
		Neighbours = { "Haifa", "Eyn Shemer", "Ramat David", "Megiddo", "Wujah Al Hajar", "Rene Mouawad", "Beirut-Rafic Hariri", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "Mezzeh", "Marj as Sultan North", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "Bassel Al-Assad", "King Hussein Air College" },		
}
SEF_AIRBASEINFORMATION[30] = {				
		AirbaseName = "Rene Mouawad",
		Neighbours = { "Hama", "Palmyra", "Rayak", "Al-Dumayr", "Mezzeh", "Bassel Al-Assad", "Taftanaz", "Abu al-Duhur", "Al Qusayr", "Wujah Al Hajar", "Beirut-Rafic Hariri", "Kiryat Shmona", "Khalkhalah", "Marj as Sultan North", "Marj as Sultan South", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "An Nasiriyah" },		
}
SEF_AIRBASEINFORMATION[31] = {				
		AirbaseName = "Tabqa",
		Neighbours = { "Palmyra", "Hama", "Abu al-Duhur", "Taftanaz", "Aleppo", "Kuweires", "Jirah", "Minakh" },		
}
SEF_AIRBASEINFORMATION[32] = {				
		AirbaseName = "Taftanaz",
		Neighbours = { "Aleppo", "Kuweires", "Jirah", "Tabqa", "Hama", "Al Qusayr", "Rene Mouawad", "Bassel Al-Assad", "Abu al-Duhur", "Minakh", "Hatay" },		
}
SEF_AIRBASEINFORMATION[33] = {				
		AirbaseName = "Wujah Al Hajar",
		Neighbours = { "Haifa", "Ramat David", "Megiddo", "Beirut-Rafic Hariri", "Rene Mouawad", "Rayak", "Kiryat Shmona", "Khalkhalah", "Marj Ruhayyil", "Damascus", "Qabr as Sitt", "Mezzeh", "Marj as Sultan North", "Marj as Sultan South", "Al-Dumayr", "An Nasiriyah", "Al Qusayr", "Hama", "Bassel Al-Assad" },		
}

function SEF_BLUESQUADRONSTOGGLE()

	if ( BlueSquadronsEnabled == 1 ) then		
		BlueSquadronsEnabled = 0
		trigger.action.outText("Allied AI CAP Flights Are Now Disabled", 15)		
	elseif ( BlueSquadronsEnabled == 0 ) then			
		BlueSquadronsEnabled = 1
		trigger.action.outText("Allied AI CAP Flights Are Now Enabled", 15)
	else
	end	
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--////RED SQUADRONS
--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function SEF_REDSQUADRON1_SCHEDULER()
    
	if ( RedSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(REDSQUADRON1GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON1GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_REDSQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))			
		else
			SEF_REDSQUADRON1_INITIALISE()
			
			timer.scheduleFunction(SEF_REDSQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_REDSQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))		
	end	
end

function SEF_REDSQUADRON2_SCHEDULER()
    
	if ( RedSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(REDSQUADRON2GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON2GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_REDSQUADRON2_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))			
		else
			SEF_REDSQUADRON2_INITIALISE()
			
			timer.scheduleFunction(SEF_REDSQUADRON2_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_REDSQUADRON2_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))		
	end	
end

function SEF_REDSQUADRON3_SCHEDULER()
    
	if ( RedSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(REDSQUADRON3GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON3GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_REDSQUADRON3_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))			
		else
			SEF_REDSQUADRON3_INITIALISE()
			
			timer.scheduleFunction(SEF_REDSQUADRON3_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_REDSQUADRON3_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))		
	end	
end

function SEF_REDSQUADRON4_SCHEDULER()
    
	if ( RedSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(REDSQUADRON4GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON4GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_REDSQUADRON4_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))			
		else
			SEF_REDSQUADRON4_INITIALISE()
			
			timer.scheduleFunction(SEF_REDSQUADRON4_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_REDSQUADRON4_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))		
	end	
end

function SEF_REDSQUADRON5_SCHEDULER()
    
	if ( RedSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(REDSQUADRON5GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON5GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_REDSQUADRON5_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))			
		else
			SEF_REDSQUADRON5_INITIALISE()
			
			timer.scheduleFunction(SEF_REDSQUADRON5_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_REDSQUADRON5_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerMin, RedRespawnTimerMax))		
	end	
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function SEF_REDSQUADRON1_INITIALISE()

	--Retrieve The Standard Deployment For The Squadron
	SEF_REDSQUADRON1_DEPLOYMENT()
	
	SET_AIRFIELDPERIMETERCLIENTS = SET_CLIENT:New():FilterCoalitions("blue"):FilterCategories( { "plane", "helicopter" } ):FilterActive():FilterOnce()
	
	AlphaPrimaryPerimeterCount = 0			
			
	--ALPHA
	SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(AlphaPrimaryAirbase.." Perimeter Zone"), function ( GroupObject )	
		AlphaPrimaryPerimeterCount = AlphaPrimaryPerimeterCount + 1		
		end
	)
	
	--////ALPHA			
	if ( AlphaPrimaryPerimeterCount > 0 ) then		
		AlphaStatus = AlphaPrimaryAirbase.." - Alpha Squadron\nAirspace Is Being Contested By The Allies\n"
		
		-- Alpha   - Minakh -> Aleppo -> Kuweires -> Jirah -> Tabqa
		
		if ( AlphaPrimaryAirbase == "Minakh" ) then
			
			AleppoPerimeterCount = 0
			KuweiresPerimeterCount = 0
			JirahPerimeterCount = 0
					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Aleppo".." Perimeter Zone"), function ( GroupObject )
				AleppoPerimeterCount = AleppoPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Kuweires".." Perimeter Zone"), function ( GroupObject )
				KuweiresPerimeterCount = KuweiresPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Jirah".." Perimeter Zone"), function ( GroupObject )
				JirahPerimeterCount = JirahPerimeterCount + 1		
				end
			)

			if ( Airbase.getByName("Aleppo"):getCoalition() == 1 and AleppoPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Aleppo", AlphaDestinationAirbase)			
			elseif ( Airbase.getByName("Kuweires"):getCoalition() == 1 and KuweiresPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Kuweires", AlphaDestinationAirbase)						
			elseif ( Airbase.getByName("Jirah"):getCoalition() == 1 and JirahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Jirah", AlphaDestinationAirbase)			
			elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 ) then			
				SEF_REDSQUADRON1_SPAWN("Tabqa", AlphaDestinationAirbase)				
			end		
		elseif ( AlphaPrimaryAirbase == "Aleppo" ) then
		
			MinakhPerimeterCount = 0
			KuweiresPerimeterCount = 0
			JirahPerimeterCount = 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Minakh".." Perimeter Zone"), function ( GroupObject )
				MinakhPerimeterCount = MinakhPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Kuweires".." Perimeter Zone"), function ( GroupObject )
				KuweiresPerimeterCount = KuweiresPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Jirah".." Perimeter Zone"), function ( GroupObject )
				JirahPerimeterCount = JirahPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Minakh"):getCoalition() == 1 and MinakhPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Minakh", AlphaDestinationAirbase)
			elseif ( Airbase.getByName("Kuweires"):getCoalition() == 1 and KuweiresPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Kuweires", AlphaDestinationAirbase)
			elseif ( Airbase.getByName("Jirah"):getCoalition() == 1 and JirahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Jirah", AlphaDestinationAirbase)
      elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 ) then      
				SEF_REDSQUADRON1_SPAWN("Tabqa", AlphaDestinationAirbase)
			end		
		elseif ( AlphaPrimaryAirbase == "Kuweires" ) then
		
			MinakhPerimeterCount = 0
			AleppoPerimeterCount = 0
			JirahPerimeterCount = 0

			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Minakh".." Perimeter Zone"), function ( GroupObject )
				MinakhPerimeterCount = MinakhPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Aleppo".." Perimeter Zone"), function ( GroupObject )
				AleppoPerimeterCount = AleppoPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Jirah".." Perimeter Zone"), function ( GroupObject )
				JirahPerimeterCount = JirahPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Minakh"):getCoalition() == 1 and MinakhPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Minakh", AlphaDestinationAirbase)			
			elseif ( Airbase.getByName("Aleppo"):getCoalition() == 1 and AleppoPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Aleppo", AlphaDestinationAirbase)			
			elseif ( Airbase.getByName("Jirah"):getCoalition() == 1 and JirahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Jirah", AlphaDestinationAirbase)			
      elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 ) then      
				SEF_REDSQUADRON1_SPAWN("Tabqa", AlphaDestinationAirbase)				
			end		
		elseif ( AlphaPrimaryAirbase == "Jirah" ) then
		
			MinakhPerimeterCount = 0
			AleppoPerimeterCount = 0
			KuweiresPerimeterCount = 0

			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Minakh".." Perimeter Zone"), function ( GroupObject )
				MinakhPerimeterCount = MinakhPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Aleppo".." Perimeter Zone"), function ( GroupObject )
				AleppoPerimeterCount = AleppoPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Kuweires".." Perimeter Zone"), function ( GroupObject )
				KuweiresPerimeterCount = KuweiresPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Minakh"):getCoalition() == 1 and MinakhPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Minakh", AlphaDestinationAirbase)			
			elseif ( Airbase.getByName("Aleppo"):getCoalition() == 1 and AleppoPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Aleppo", AlphaDestinationAirbase)			
			elseif ( Airbase.getByName("Kuweires"):getCoalition() == 1 and KuweiresPerimeterCount == 0 ) then			
				SEF_REDSQUADRON1_SPAWN("Kuweires", AlphaDestinationAirbase)			
      elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 ) then      
				SEF_REDSQUADRON1_SPAWN("Tabqa", AlphaDestinationAirbase)				
			end			
		elseif ( AlphaPrimaryAirbase == "Tabqa" and Airbase.getByName("Tabqa"):getCoalition() == 1 ) then
			SEF_REDSQUADRON1_SPAWN("Tabqa", AlphaDestinationAirbase)
    elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 ) then      
			SEF_REDSQUADRON1_SPAWN("Tabqa", AlphaDestinationAirbase)
		end		
	else
		AlphaStatus = AlphaPrimaryAirbase.." - Alpha Squadron\nAirspace Is Controlled By Syria\n"
		SEF_REDSQUADRON1_SPAWN(AlphaPrimaryAirbase, AlphaDestinationAirbase)
	end	
end

function SEF_REDSQUADRON1_DEPLOYMENT()	
		
	--ALPHA
	if ( Airbase.getByName("Minakh"):getCoalition() == 1 and Airbase.getByName("Aleppo"):getCoalition() == 1 and Airbase.getByName("Kuweires"):getCoalition() == 1 and Airbase.getByName("Jirah"):getCoalition() == 1 ) then
		--Case 1111: Set Alpha To Minakh and Patrol Minakh, Hold The Forward Line
		AlphaPrimaryAirbase = "Minakh"
		AlphaDestinationAirbase = "Minakh"
	elseif ( Airbase.getByName("Minakh"):getCoalition() ~= 1 and Airbase.getByName("Aleppo"):getCoalition() == 1 and Airbase.getByName("Kuweires"):getCoalition() == 1 and Airbase.getByName("Jirah"):getCoalition() == 1 ) then
		--Case 0111 Set Alpha To Aleppo And Patrol Minakh, We Are Trying To Recapture Minakh
		AlphaPrimaryAirbase = "Aleppo"
		AlphaDestinationAirbase = "Minakh"
	elseif ( Airbase.getByName("Minakh"):getCoalition() ~= 1 and Airbase.getByName("Aleppo"):getCoalition() ~= 1 and Airbase.getByName("Kuweires"):getCoalition() == 1 and Airbase.getByName("Jirah"):getCoalition() == 1 ) then
		--Case 0011 Set Alpha To Kuweires And Patrol Aleppo, We Are Trying To Recapture Aleppo
		AlphaPrimaryAirbase = "Kuweires"
		AlphaDestinationAirbase = "Aleppo"
	elseif ( Airbase.getByName("Minakh"):getCoalition() ~= 1 and Airbase.getByName("Aleppo"):getCoalition() ~= 1 and Airbase.getByName("Kuweires"):getCoalition() ~= 1 and Airbase.getByName("Jirah"):getCoalition() == 1 ) then
		--Case 0001 Set Alpha To Jirah And Patrol Kuweires, We Are Trying To Recapture Kuweires
		AlphaPrimaryAirbase = "Jirah"
		AlphaDestinationAirbase = "Kuweires"
	elseif ( Airbase.getByName("Minakh"):getCoalition() ~= 1 and Airbase.getByName("Aleppo"):getCoalition() ~= 1 and Airbase.getByName("Kuweires"):getCoalition() == 1 and Airbase.getByName("Jirah"):getCoalition() ~= 1 ) then
		--Case 0010: Set Alpha To Kuweires And Patrol Aleppo, Try To Recapture The Forward Line
		AlphaPrimaryAirbase = "Kuweires"
		AlphaDestinationAirbase = "Aleppo"
	elseif ( Airbase.getByName("Minakh"):getCoalition() ~= 1 and Airbase.getByName("Aleppo"):getCoalition() == 1 and Airbase.getByName("Kuweires"):getCoalition() ~= 1 and Airbase.getByName("Jirah"):getCoalition() ~= 1 ) then
		--Case 0100: Set Alpha To Aleppo And Patrol Minakh, Try To Recapture The Forward Line 
		AlphaPrimaryAirbase = "Aleppo"
		AlphaDestinationAirbase = "Minakh"
	elseif ( Airbase.getByName("Minakh"):getCoalition() ~= 1 and Airbase.getByName("Aleppo"):getCoalition() == 1 and Airbase.getByName("Kuweires"):getCoalition() ~= 1 and Airbase.getByName("Jirah"):getCoalition() == 1 ) then
		--Case 0101: Set Alpha To Aleppo And Patrol Minakh, We're trying to regain Minakh
		AlphaPrimaryAirbase = "Aleppo"
		AlphaDestinationAirbase = "Minakh"
	elseif ( Airbase.getByName("Minakh"):getCoalition() ~= 1 and Airbase.getByName("Aleppo"):getCoalition() == 1 and Airbase.getByName("Kuweires"):getCoalition() == 1 and Airbase.getByName("Jirah"):getCoalition() ~= 1 ) then
		--Case 0110: Set Alpha To Aleppo And Patrol Minakh, We're trying to regain Minakh
		AlphaPrimaryAirbase = "Aleppo"
		AlphaDestinationAirbase = "Minakh"
	elseif ( Airbase.getByName("Minakh"):getCoalition() == 1 and Airbase.getByName("Aleppo"):getCoalition() ~= 1 and Airbase.getByName("Kuweires"):getCoalition() ~= 1 and Airbase.getByName("Jirah"):getCoalition() ~= 1 ) then
		--Case 1000: Set Alpha To Minakh And Patrol Minakh, Hold The Forward Line
		AlphaPrimaryAirbase = "Minakh"
		AlphaDestinationAirbase = "Minakh"	
	elseif ( Airbase.getByName("Minakh"):getCoalition() == 1 and Airbase.getByName("Aleppo"):getCoalition() ~= 1 and Airbase.getByName("Kuweires"):getCoalition() ~= 1 and Airbase.getByName("Jirah"):getCoalition() == 1 ) then
		--Case 1001: Set Alpha To Minakh And Patrol Minakh, Hold The Forward Line
		AlphaPrimaryAirbase = "Minakh"
		AlphaDestinationAirbase = "Minakh"
	elseif ( Airbase.getByName("Minakh"):getCoalition() == 1 and Airbase.getByName("Aleppo"):getCoalition() ~= 1 and Airbase.getByName("Kuweires"):getCoalition() == 1 and Airbase.getByName("Jirah"):getCoalition() ~= 1 ) then
		--Case 1010: Set Alpha To Minakh And Patrol Minakh, Hold The Forward Line
		AlphaPrimaryAirbase = "Minakh"
		AlphaDestinationAirbase = "Minakh"
	elseif ( Airbase.getByName("Minakh"):getCoalition() == 1 and Airbase.getByName("Aleppo"):getCoalition() ~= 1 and Airbase.getByName("Kuweires"):getCoalition() == 1 and Airbase.getByName("Jirah"):getCoalition() == 1 ) then
		--Case 1011: Set Alpha To Minakh And Patrol Minakh, Hold The Forward Line
		AlphaPrimaryAirbase = "Minakh"
		AlphaDestinationAirbase = "Minakh"
	elseif ( Airbase.getByName("Minakh"):getCoalition() == 1 and Airbase.getByName("Aleppo"):getCoalition() == 1 and Airbase.getByName("Kuweires"):getCoalition() ~= 1 and Airbase.getByName("Jirah"):getCoalition() ~= 1 ) then
		--Case 1100: Set Alpha To Minakh And Patrol Minakh, Hold The Forward Line
		AlphaPrimaryAirbase = "Minakh"
		AlphaDestinationAirbase = "Minakh"
	elseif ( Airbase.getByName("Minakh"):getCoalition() == 1 and Airbase.getByName("Aleppo"):getCoalition() == 1 and Airbase.getByName("Kuweires"):getCoalition() ~= 1 and Airbase.getByName("Jirah"):getCoalition() == 1 ) then
		--Case 1101: Set Alpha To Minakh And Patrol Minakh, Hold The Forward Line
		AlphaPrimaryAirbase = "Minakh"
		AlphaDestinationAirbase = "Minakh"
	elseif ( Airbase.getByName("Minakh"):getCoalition() == 1 and Airbase.getByName("Aleppo"):getCoalition() == 1 and Airbase.getByName("Kuweires"):getCoalition() == 1 and Airbase.getByName("Jirah"):getCoalition() ~= 1 ) then
		--Case 1110: Set Alpha To Minakh And Patrol Minakh, Hold The Forward Line
		AlphaPrimaryAirbase = "Minakh"
		AlphaDestinationAirbase = "Minakh"
  elseif (Airbase.getByName("Tabqa"):getCoalition() == 1 and Airbase.getByName("Minakh"):getCoalition() ~= 1 and Airbase.getByName("Aleppo"):getCoalition() ~= 1 and Airbase.getByName("Kuweires"):getCoalition() ~= 1 and Airbase.getByName("Jirah"):getCoalition() ~= 1 ) then
		--Case 0000: Set Alpha To Tabqa And Patrol Jirah, We Are Trying To Recapture Jirah
		AlphaPrimaryAirbase = "Tabqa"
		AlphaDestinationAirbase = "Jirah"
	else
	   --Case 0000: Set Alpha To Palmyra And Patrol Tabqa, We Are Trying To Recapture Tabqa
    AlphaPrimaryAirbase = "Palmyra"
    AlphaDestinationAirbase = "Tabqa"
	end
	--END ALPHA			
end

function SEF_REDSQUADRON1_SPAWN(DepartureAirbaseName, DestinationAirbaseName)
	
	if ( GROUP:FindByName(REDSQUADRON1GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON1GROUPNAME):IsAlive() ) then
		--trigger.action.outText("Red Squadron 1 Is Currently Active, Not Spawning A Replacement Yet",15)	
	else
		REDSQUADRON1_DATA[1].Vec2 = nil
		REDSQUADRON1_DATA[1].TimeStamp = nil
		REDSQUADRON1_DATA[2].Vec2 = nil
		REDSQUADRON1_DATA[2].TimeStamp = nil
		
		local SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		local Randomiser = math.random(RedFlightLevelMin,RedFlightLevelMax)
		RS1_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local TargetZoneVec2 	= DestinationZone:GetVec2()
					
		local FlightDirection = math.random(1,100)
					
		if ( FlightDirection <= 50 ) then			
			--////Clockwise
			--Spawn Point
			RS1_WP0X = DepartureZoneVec2.x
			RS1_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS1_WP1X = DepartureZoneVec2.x + RedPatrolWaypointInitial
			RS1_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone North Point
			RS1_WP2X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS1_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS1_WP3X = TargetZoneVec2.x
			RS1_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone South Point
			RS1_WP4X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS1_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS1_WP5X = TargetZoneVec2.x
			RS1_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance								
		else			
			--////Anti-Clockwise
			--Spawn Point
			RS1_WP0X = DepartureZoneVec2.x
			RS1_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS1_WP1X = DepartureZoneVec2.x - RedPatrolWaypointInitial
			RS1_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone South Point
			RS1_WP2X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS1_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS1_WP3X = TargetZoneVec2.x
			RS1_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone North Point
			RS1_WP4X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS1_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS1_WP5X = TargetZoneVec2.x
			RS1_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance					
		end		
		
		REDSQUADRON1 = SPAWN:NewWithAlias("SyAAF MiG-29A", RedSquadronName1)
							:InitRandomizeTemplate(SyAAFAirForceCAP)								
						
		:OnSpawnGroup(
			function( SpawnGroup )						
				REDSQUADRON1GROUPNAME = SpawnGroup.GroupName
				REDSQUADRON1GROUP = GROUP:FindByName(SpawnGroup.GroupName)							
													
				--////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
				Mission = {
					["id"] = "Mission",
					["params"] = {		
						["route"] = 
						{                                    
							["points"] = 
							{
								[1] = 
								{
									["alt"] = RS1_FlightLevel/2,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
												[1] = 
												{
													["enabled"] = true,
													["auto"] = true,
													["id"] = "WrappedAction",
													["number"] = 1,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "EPLRS",
															["params"] = 
															{
																["value"] = true,
																["groupId"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
												[2] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 2,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["variantIndex"] = 1,
																["name"] = 5,
																["formationIndex"] = 6,
																["value"] = 393217,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [2]
												[3] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "EngageTargets",
													["number"] = 3,
													["params"] = 
													{
														["targetTypes"] = 
														{
															[1] = "Air",
														}, -- end of ["targetTypes"]
														["priority"] = 0,
														["value"] = "Air;",
														["noTargetTypes"] = 
														{
															[1] = "Cruise missiles",
															[2] = "Antiship Missiles",
															[3] = "AA Missiles",
															[4] = "AG Missiles",
															[5] = "SA Missiles",
														}, -- end of ["noTargetTypes"]
														["maxDistEnabled"] = true,
														["maxDist"] = EngagementDistance,
													}, -- end of ["params"]
												}, -- end of [3]
												[4] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 4,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = 3,
																["name"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [4]
												[5] = 
												{
													["number"] = 5,
													["auto"] = false,
													["id"] = "WrappedAction",
													["enabled"] = true,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = 264241152,
																["name"] = 10,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [5]
												[6] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 6,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 19,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [6]
												[7] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 7,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [7]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 0,
									["ETA_locked"] = true,
									["y"] = RS1_WP0Y,
									["x"] = RS1_WP0X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [1]
								[2] = 
								{
									["alt"] = RS1_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 127.32626754758,
									["ETA_locked"] = false,
									["y"] = RS1_WP1Y,
									["x"] = RS1_WP1X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [2]
								[3] = 
								{
									["alt"] = RS1_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 380.31328316984,
									["ETA_locked"] = false,
									["y"] = RS1_WP2Y,
									["x"] = RS1_WP2X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [3]
								[4] = 
								{
									["alt"] = RS1_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 832.92276094724,
									["ETA_locked"] = false,
									["y"] = RS1_WP3Y,
									["x"] = RS1_WP3X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [4]
								[5] = 
								{
									["alt"] = RS1_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1289.20366255,
									["ETA_locked"] = false,
									["y"] = RS1_WP4Y,
									["x"] = RS1_WP4X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [5]
								[6] = 
								{
									["alt"] = RS1_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
												[1] = 
												{
													["number"] = 1,
													["auto"] = false,
													["id"] = "WrappedAction",
													["enabled"] = true,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "SwitchWaypoint",
															["params"] = 
															{
																["goToWaypointIndex"] = 3,
																["fromWaypointIndex"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1744.9128539618,
									["ETA_locked"] = false,
									["y"] = RS1_WP5Y,
									["x"] = RS1_WP5X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [6]
							}, -- end of ["points"]
						}, -- end of ["route"]
					}, --end of ["params"]
				}--end of Mission				
				REDSQUADRON1GROUP:SetTask(Mission)				
			end
		)
		--:SpawnInZone( SpawnZone, false, RS1_FlightLevel, RS1_FlightLevel )
		:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
		--trigger.action.outText("Red Squadron 1 Is Launching Fighters", 15)	
	end
end

function SEF_REDSQUADRON2_SPAWN(DepartureAirbaseName, DestinationAirbaseName)
	
	if ( GROUP:FindByName(REDSQUADRON2GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON2GROUPNAME):IsAlive() ) then
		--trigger.action.outText("Red Squadron 2 Is Currently Active, Not Spawning A Replacement Yet",15)	
	else
		REDSQUADRON2_DATA[1].Vec2 = nil
		REDSQUADRON2_DATA[1].TimeStamp = nil
		REDSQUADRON2_DATA[2].Vec2 = nil
		REDSQUADRON2_DATA[2].TimeStamp = nil
		
		local SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		local Randomiser = math.random(RedFlightLevelMin,RedFlightLevelMax)
		RS2_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local TargetZoneVec2 	= DestinationZone:GetVec2()
					
		local FlightDirection = math.random(1,100)
					
		if ( FlightDirection <= 50 ) then			
			--////Clockwise
			--Spawn Point
			RS2_WP0X = DepartureZoneVec2.x
			RS2_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS2_WP1X = DepartureZoneVec2.x + RedPatrolWaypointInitial
			RS2_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone North Point
			RS2_WP2X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS2_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS2_WP3X = TargetZoneVec2.x
			RS2_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone South Point
			RS2_WP4X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS2_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS2_WP5X = TargetZoneVec2.x
			RS2_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance								
		else			
			--////Anti-Clockwise
			--Spawn Point
			RS2_WP0X = DepartureZoneVec2.x
			RS2_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS2_WP1X = DepartureZoneVec2.x - RedPatrolWaypointInitial
			RS2_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone South Point
			RS2_WP2X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS2_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS2_WP3X = TargetZoneVec2.x
			RS2_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone North Point
			RS2_WP4X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS2_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS2_WP5X = TargetZoneVec2.x
			RS2_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance					
		end		
		
		REDSQUADRON2 = SPAWN:NewWithAlias("SyAAF MiG-29A", RedSquadronName2)
							:InitRandomizeTemplate(CoastalCAP)										
								
		:OnSpawnGroup(
			function( SpawnGroup )						
				REDSQUADRON2GROUPNAME = SpawnGroup.GroupName
				REDSQUADRON2GROUP = GROUP:FindByName(SpawnGroup.GroupName)							
													
				--////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
				Mission = {
					["id"] = "Mission",
					["params"] = {		
						["route"] = 
						{                                    
							["points"] = 
							{
								[1] = 
								{
									["alt"] = RS2_FlightLevel/2,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
												[1] = 
												{
													["enabled"] = true,
													["auto"] = true,
													["id"] = "WrappedAction",
													["number"] = 1,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "EPLRS",
															["params"] = 
															{
																["value"] = true,
																["groupId"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
												[2] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 2,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["variantIndex"] = 1,
																["name"] = 5,
																["formationIndex"] = 6,
																["value"] = 393217,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [2]
												[3] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "EngageTargets",
													["number"] = 3,
													["params"] = 
													{
														["targetTypes"] = 
														{
															[1] = "Air",
														}, -- end of ["targetTypes"]
														["priority"] = 0,
														["value"] = "Air;",
														["noTargetTypes"] = 
														{
															[1] = "Cruise missiles",
															[2] = "Antiship Missiles",
															[3] = "AA Missiles",
															[4] = "AG Missiles",
															[5] = "SA Missiles",
														}, -- end of ["noTargetTypes"]
														["maxDistEnabled"] = true,
														["maxDist"] = EngagementDistance,
													}, -- end of ["params"]
												}, -- end of [3]
												[4] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 4,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = 3,
																["name"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [4]
												[5] = 
												{
													["number"] = 5,
													["auto"] = false,
													["id"] = "WrappedAction",
													["enabled"] = true,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = 264241152,
																["name"] = 10,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [5]
												[6] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 6,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 19,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [6]
												[7] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 7,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [7]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 0,
									["ETA_locked"] = true,
									["y"] = RS2_WP0Y,
									["x"] = RS2_WP0X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [1]
								[2] = 
								{
									["alt"] = RS2_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 127.32626754758,
									["ETA_locked"] = false,
									["y"] = RS2_WP1Y,
									["x"] = RS2_WP1X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [2]
								[3] = 
								{
									["alt"] = RS2_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 380.31328316984,
									["ETA_locked"] = false,
									["y"] = RS2_WP2Y,
									["x"] = RS2_WP2X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [3]
								[4] = 
								{
									["alt"] = RS2_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 832.92276094724,
									["ETA_locked"] = false,
									["y"] = RS2_WP3Y,
									["x"] = RS2_WP3X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [4]
								[5] = 
								{
									["alt"] = RS2_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1289.20366255,
									["ETA_locked"] = false,
									["y"] = RS2_WP4Y,
									["x"] = RS2_WP4X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [5]
								[6] = 
								{
									["alt"] = RS2_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
												[1] = 
												{
													["number"] = 1,
													["auto"] = false,
													["id"] = "WrappedAction",
													["enabled"] = true,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "SwitchWaypoint",
															["params"] = 
															{
																["goToWaypointIndex"] = 3,
																["fromWaypointIndex"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1744.9128539618,
									["ETA_locked"] = false,
									["y"] = RS2_WP5Y,
									["x"] = RS2_WP5X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [6]
							}, -- end of ["points"]
						}, -- end of ["route"]
					}, --end of ["params"]
				}--end of Mission				
				REDSQUADRON2GROUP:SetTask(Mission)				
			end
		)
		--:SpawnInZone( SpawnZone, false, RS2_FlightLevel, RS2_FlightLevel )
		:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
		--trigger.action.outText("Red Squadron 2 Is Launching Fighters", 15)	
	end
end

function SEF_REDSQUADRON3_SPAWN(DepartureAirbaseName, DestinationAirbaseName)
	
	if ( GROUP:FindByName(REDSQUADRON3GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON3GROUPNAME):IsAlive() ) then
		--trigger.action.outText("Red Squadron 3 Is Currently Active, Not Spawning A Replacement Yet",15)	
	else
		REDSQUADRON3_DATA[1].Vec2 = nil
		REDSQUADRON3_DATA[1].TimeStamp = nil
		REDSQUADRON3_DATA[2].Vec2 = nil
		REDSQUADRON3_DATA[2].TimeStamp = nil
		
		RS3_SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		local Randomiser = math.random(RedFlightLevelMin,RedFlightLevelMax)
		RS3_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2 = RS3_SpawnZone:GetVec2()
		local TargetZoneVec2 	= DestinationZone:GetVec2()
					
		local FlightDirection = math.random(1,100)
					
		if ( FlightDirection <= 50 ) then			
			--////Clockwise
			--Spawn Point
			RS3_WP0X = DepartureZoneVec2.x
			RS3_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS3_WP1X = DepartureZoneVec2.x + RedPatrolWaypointInitial
			RS3_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone North Point
			RS3_WP2X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS3_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS3_WP3X = TargetZoneVec2.x
			RS3_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone South Point
			RS3_WP4X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS3_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS3_WP5X = TargetZoneVec2.x
			RS3_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance								
		else			
			--////Anti-Clockwise
			--Spawn Point
			RS3_WP0X = DepartureZoneVec2.x
			RS3_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS3_WP1X = DepartureZoneVec2.x - RedPatrolWaypointInitial
			RS3_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone South Point
			RS3_WP2X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS3_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS3_WP3X = TargetZoneVec2.x
			RS3_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone North Point
			RS3_WP4X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS3_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS3_WP5X = TargetZoneVec2.x
			RS3_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance					
		end		
		
		REDSQUADRON3 = SPAWN:NewWithAlias("SyAAF MiG-29A", RedSquadronName3)
							:InitRandomizeTemplate(CoastalCAP)								
		
		:OnSpawnGroup(
			function( SpawnGroup )						
				REDSQUADRON3GROUPNAME = SpawnGroup.GroupName
				REDSQUADRON3GROUP = GROUP:FindByName(SpawnGroup.GroupName)							
													
				--////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
				Mission = {
					["id"] = "Mission",
					["params"] = {		
						["route"] = 
						{                                    
							["points"] = 
							{
								[1] = 
								{
									["alt"] = RS3_FlightLevel/2,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
												[1] = 
												{
													["enabled"] = true,
													["auto"] = true,
													["id"] = "WrappedAction",
													["number"] = 1,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "EPLRS",
															["params"] = 
															{
																["value"] = true,
																["groupId"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
												[2] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 2,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["variantIndex"] = 1,
																["name"] = 5,
																["formationIndex"] = 6,
																["value"] = 393217,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [2]
												[3] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "EngageTargets",
													["number"] = 3,
													["params"] = 
													{
														["targetTypes"] = 
														{
															[1] = "Air",
														}, -- end of ["targetTypes"]
														["priority"] = 0,
														["value"] = "Air;",
														["noTargetTypes"] = 
														{
															[1] = "Cruise missiles",
															[2] = "Antiship Missiles",
															[3] = "AA Missiles",
															[4] = "AG Missiles",
															[5] = "SA Missiles",
														}, -- end of ["noTargetTypes"]
														["maxDistEnabled"] = true,
														["maxDist"] = EngagementDistance,
													}, -- end of ["params"]
												}, -- end of [3]
												[4] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 4,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = 3,
																["name"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [4]
												[5] = 
												{
													["number"] = 5,
													["auto"] = false,
													["id"] = "WrappedAction",
													["enabled"] = true,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = 264241152,
																["name"] = 10,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [5]
												[6] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 6,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 19,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [6]
												[7] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 7,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [7]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 0,
									["ETA_locked"] = true,
									["y"] = RS3_WP0Y,
									["x"] = RS3_WP0X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [1]
								[2] = 
								{
									["alt"] = RS3_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 127.32626754758,
									["ETA_locked"] = false,
									["y"] = RS3_WP1Y,
									["x"] = RS3_WP1X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [2]
								[3] = 
								{
									["alt"] = RS3_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 380.31328316984,
									["ETA_locked"] = false,
									["y"] = RS3_WP2Y,
									["x"] = RS3_WP2X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [3]
								[4] = 
								{
									["alt"] = RS3_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 832.92276094724,
									["ETA_locked"] = false,
									["y"] = RS3_WP3Y,
									["x"] = RS3_WP3X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [4]
								[5] = 
								{
									["alt"] = RS3_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1289.20366255,
									["ETA_locked"] = false,
									["y"] = RS3_WP4Y,
									["x"] = RS3_WP4X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [5]
								[6] = 
								{
									["alt"] = RS3_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
												[1] = 
												{
													["number"] = 1,
													["auto"] = false,
													["id"] = "WrappedAction",
													["enabled"] = true,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "SwitchWaypoint",
															["params"] = 
															{
																["goToWaypointIndex"] = 3,
																["fromWaypointIndex"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1744.9128539618,
									["ETA_locked"] = false,
									["y"] = RS3_WP5Y,
									["x"] = RS3_WP5X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [6]
							}, -- end of ["points"]
						}, -- end of ["route"]
					}, --end of ["params"]
				}--end of Mission				
				REDSQUADRON3GROUP:SetTask(Mission)				
			end
		)		
		:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
		--trigger.action.outText("Red Squadron 3 Is Launching Fighters", 15)	
	end
end

function SEF_REDSQUADRON4_SPAWN(DepartureAirbaseName, DestinationAirbaseName)
	
	if ( GROUP:FindByName(REDSQUADRON4GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON4GROUPNAME):IsAlive() ) then
		--trigger.action.outText("Red Squadron 4 Is Currently Active, Not Spawning A Replacement Yet",15)	
	else
		REDSQUADRON4_DATA[1].Vec2 = nil
		REDSQUADRON4_DATA[1].TimeStamp = nil
		REDSQUADRON4_DATA[2].Vec2 = nil
		REDSQUADRON4_DATA[2].TimeStamp = nil
		
		local SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()	
		
		local Randomiser = math.random(RedFlightLevelMin,RedFlightLevelMax)
		RS4_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local TargetZoneVec2 	= DestinationZone:GetVec2()
					
		local FlightDirection = math.random(1,100)
					
		if ( FlightDirection <= 50 ) then			
			--////Clockwise
			--Spawn Point
			RS4_WP0X = DepartureZoneVec2.x
			RS4_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS4_WP1X = DepartureZoneVec2.x + RedPatrolWaypointInitial
			RS4_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone North Point
			RS4_WP2X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS4_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS4_WP3X = TargetZoneVec2.x
			RS4_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone South Point
			RS4_WP4X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS4_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS4_WP5X = TargetZoneVec2.x
			RS4_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance								
		else			
			--////Anti-Clockwise
			--Spawn Point
			RS4_WP0X = DepartureZoneVec2.x
			RS4_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS4_WP1X = DepartureZoneVec2.x - RedPatrolWaypointInitial
			RS4_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone South Point
			RS4_WP2X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS4_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS4_WP3X = TargetZoneVec2.x
			RS4_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone North Point
			RS4_WP4X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS4_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS4_WP5X = TargetZoneVec2.x
			RS4_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance					
		end		
		
		REDSQUADRON4 = SPAWN:NewWithAlias("SyAAF MiG-29A", RedSquadronName4)
							:InitRandomizeTemplate(SyAAFAirForceCAP)																
		
		:OnSpawnGroup(
			function( SpawnGroup )						
				REDSQUADRON4GROUPNAME = SpawnGroup.GroupName
				REDSQUADRON4GROUP = GROUP:FindByName(SpawnGroup.GroupName)							
													
				--////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
				Mission = {
					["id"] = "Mission",
					["params"] = {		
						["route"] = 
						{                                    
							["points"] = 
							{
								[1] = 
								{
									["alt"] = RS4_FlightLevel/2,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
												[1] = 
												{
													["enabled"] = true,
													["auto"] = true,
													["id"] = "WrappedAction",
													["number"] = 1,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "EPLRS",
															["params"] = 
															{
																["value"] = true,
																["groupId"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
												[2] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 2,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["variantIndex"] = 1,
																["name"] = 5,
																["formationIndex"] = 6,
																["value"] = 393217,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [2]
												[3] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "EngageTargets",
													["number"] = 3,
													["params"] = 
													{
														["targetTypes"] = 
														{
															[1] = "Air",
														}, -- end of ["targetTypes"]
														["priority"] = 0,
														["value"] = "Air;",
														["noTargetTypes"] = 
														{
															[1] = "Cruise missiles",
															[2] = "Antiship Missiles",
															[3] = "AA Missiles",
															[4] = "AG Missiles",
															[5] = "SA Missiles",
														}, -- end of ["noTargetTypes"]
														["maxDistEnabled"] = true,
														["maxDist"] = EngagementDistance,
													}, -- end of ["params"]
												}, -- end of [3]
												[4] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 4,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = 3,
																["name"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [4]
												[5] = 
												{
													["number"] = 5,
													["auto"] = false,
													["id"] = "WrappedAction",
													["enabled"] = true,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = 264241152,
																["name"] = 10,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [5]
												[6] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 6,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 19,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [6]
												[7] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 7,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [7]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 0,
									["ETA_locked"] = true,
									["y"] = RS4_WP0Y,
									["x"] = RS4_WP0X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [1]
								[2] = 
								{
									["alt"] = RS4_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 127.32626754758,
									["ETA_locked"] = false,
									["y"] = RS4_WP1Y,
									["x"] = RS4_WP1X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [2]
								[3] = 
								{
									["alt"] = RS4_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 380.31328316984,
									["ETA_locked"] = false,
									["y"] = RS4_WP2Y,
									["x"] = RS4_WP2X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [3]
								[4] = 
								{
									["alt"] = RS4_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 832.92276094724,
									["ETA_locked"] = false,
									["y"] = RS4_WP3Y,
									["x"] = RS4_WP3X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [4]
								[5] = 
								{
									["alt"] = RS4_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1289.20366255,
									["ETA_locked"] = false,
									["y"] = RS4_WP4Y,
									["x"] = RS4_WP4X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [5]
								[6] = 
								{
									["alt"] = RS4_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
												[1] = 
												{
													["number"] = 1,
													["auto"] = false,
													["id"] = "WrappedAction",
													["enabled"] = true,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "SwitchWaypoint",
															["params"] = 
															{
																["goToWaypointIndex"] = 3,
																["fromWaypointIndex"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1744.9128539618,
									["ETA_locked"] = false,
									["y"] = RS4_WP5Y,
									["x"] = RS4_WP5X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [6]
							}, -- end of ["points"]
						}, -- end of ["route"]
					}, --end of ["params"]
				}--end of Mission				
				REDSQUADRON4GROUP:SetTask(Mission)				
			end
		)
		--:SpawnInZone( SpawnZone, false, RS4_FlightLevel, RS4_FlightLevel )
		:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
		--trigger.action.outText("Red Squadron 4 Is Launching Fighters", 15)	
	end
end

function SEF_REDSQUADRON5_SPAWN(DepartureAirbaseName, DestinationAirbaseName)
	
	if ( GROUP:FindByName(REDSQUADRON5GROUPNAME) ~= nil and GROUP:FindByName(REDSQUADRON5GROUPNAME):IsAlive() ) then
		--trigger.action.outText("Red Squadron 5 Is Currently Active, Not Spawning A Replacement Yet",15)	
	else
		REDSQUADRON5_DATA[1].Vec2 = nil
		REDSQUADRON5_DATA[1].TimeStamp = nil
		REDSQUADRON5_DATA[2].Vec2 = nil
		REDSQUADRON5_DATA[2].TimeStamp = nil
		
		local SpawnZone = AIRBASE:FindByName(DepartureAirbaseName):GetZone()
		--local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()
		local DestinationZone = ZONE:FindByName("Tiyas")	
		
		local Randomiser = math.random(RedFlightLevelMin,RedFlightLevelMax)
		RS5_FlightLevel = Randomiser * 1000
				
		local DepartureZoneVec2 = SpawnZone:GetVec2()
		local TargetZoneVec2 	= DestinationZone:GetVec2()
					
		local FlightDirection = math.random(1,100)
					
		if ( FlightDirection <= 50 ) then			
			--////Clockwise
			--Spawn Point
			RS5_WP0X = DepartureZoneVec2.x
			RS5_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS5_WP1X = DepartureZoneVec2.x + RedPatrolWaypointInitial
			RS5_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone North Point
			RS5_WP2X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS5_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS5_WP3X = TargetZoneVec2.x
			RS5_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone South Point
			RS5_WP4X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS5_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS5_WP5X = TargetZoneVec2.x
			RS5_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance								
		else			
			--////Anti-Clockwise
			--Spawn Point
			RS5_WP0X = DepartureZoneVec2.x
			RS5_WP0Y = DepartureZoneVec2.y
			--Initial Waypoint
			RS5_WP1X = DepartureZoneVec2.x - RedPatrolWaypointInitial
			RS5_WP1Y = DepartureZoneVec2.y			
			--Perimeter Zone South Point
			RS5_WP2X = TargetZoneVec2.x - RedPatrolWaypointDistance
			RS5_WP2Y = TargetZoneVec2.y 						
			--Perimeter Zone East Point
			RS5_WP3X = TargetZoneVec2.x
			RS5_WP3Y = TargetZoneVec2.y + RedPatrolWaypointDistance						
			--Perimeter Zone North Point
			RS5_WP4X = TargetZoneVec2.x + RedPatrolWaypointDistance
			RS5_WP4Y = TargetZoneVec2.y						
			--Perimeter Zone West Point
			RS5_WP5X = TargetZoneVec2.x
			RS5_WP5Y = TargetZoneVec2.y - RedPatrolWaypointDistance					
		end		
		
		REDSQUADRON5 = SPAWN:NewWithAlias("SyAAF MiG-29A", RedSquadronName5)
							:InitRandomizeTemplate(PalmyraCAP)							
								
		:OnSpawnGroup(
			function( SpawnGroup )						
				REDSQUADRON5GROUPNAME = SpawnGroup.GroupName
				REDSQUADRON5GROUP = GROUP:FindByName(SpawnGroup.GroupName)							
													
				--////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
				Mission = {
					["id"] = "Mission",
					["params"] = {		
						["route"] = 
						{                                    
							["points"] = 
							{
								[1] = 
								{
									["alt"] = RS5_FlightLevel/2,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
												[1] = 
												{
													["enabled"] = true,
													["auto"] = true,
													["id"] = "WrappedAction",
													["number"] = 1,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "EPLRS",
															["params"] = 
															{
																["value"] = true,
																["groupId"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
												[2] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 2,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["variantIndex"] = 1,
																["name"] = 5,
																["formationIndex"] = 6,
																["value"] = 393217,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [2]
												[3] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "EngageTargets",
													["number"] = 3,
													["params"] = 
													{
														["targetTypes"] = 
														{
															[1] = "Air",
														}, -- end of ["targetTypes"]
														["priority"] = 0,
														["value"] = "Air;",
														["noTargetTypes"] = 
														{
															[1] = "Cruise missiles",
															[2] = "Antiship Missiles",
															[3] = "AA Missiles",
															[4] = "AG Missiles",
															[5] = "SA Missiles",
														}, -- end of ["noTargetTypes"]
														["maxDistEnabled"] = true,
														["maxDist"] = EngagementDistance,
													}, -- end of ["params"]
												}, -- end of [3]
												[4] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 4,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = 3,
																["name"] = 1,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [4]
												[5] = 
												{
													["number"] = 5,
													["auto"] = false,
													["id"] = "WrappedAction",
													["enabled"] = true,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = 264241152,
																["name"] = 10,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [5]
												[6] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 6,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 19,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [6]
												[7] = 
												{
													["enabled"] = true,
													["auto"] = false,
													["id"] = "WrappedAction",
													["number"] = 7,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "Option",
															["params"] = 
															{
																["value"] = true,
																["name"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [7]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 0,
									["ETA_locked"] = true,
									["y"] = RS5_WP0Y,
									["x"] = RS5_WP0X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [1]
								[2] = 
								{
									["alt"] = RS5_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 127.32626754758,
									["ETA_locked"] = false,
									["y"] = RS5_WP1Y,
									["x"] = RS5_WP1X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [2]
								[3] = 
								{
									["alt"] = RS5_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 380.31328316984,
									["ETA_locked"] = false,
									["y"] = RS5_WP2Y,
									["x"] = RS5_WP2X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [3]
								[4] = 
								{
									["alt"] = RS5_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 832.92276094724,
									["ETA_locked"] = false,
									["y"] = RS5_WP3Y,
									["x"] = RS5_WP3X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [4]
								[5] = 
								{
									["alt"] = RS5_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1289.20366255,
									["ETA_locked"] = false,
									["y"] = RS5_WP4Y,
									["x"] = RS5_WP4X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [5]
								[6] = 
								{
									["alt"] = RS5_FlightLevel,
									["action"] = "Turning Point",
									["alt_type"] = "BARO",
									["speed"] = 234.32754852983,
									["task"] = 
									{
										["id"] = "ComboTask",
										["params"] = 
										{
											["tasks"] = 
											{
												[1] = 
												{
													["number"] = 1,
													["auto"] = false,
													["id"] = "WrappedAction",
													["enabled"] = true,
													["params"] = 
													{
														["action"] = 
														{
															["id"] = "SwitchWaypoint",
															["params"] = 
															{
																["goToWaypointIndex"] = 3,
																["fromWaypointIndex"] = 6,
															}, -- end of ["params"]
														}, -- end of ["action"]
													}, -- end of ["params"]
												}, -- end of [1]
											}, -- end of ["tasks"]
										}, -- end of ["params"]
									}, -- end of ["task"]
									["type"] = "Turning Point",
									["ETA"] = 1744.9128539618,
									["ETA_locked"] = false,
									["y"] = RS5_WP5Y,
									["x"] = RS5_WP5X,
									["formation_template"] = "",
									["speed_locked"] = true,
								}, -- end of [6]
							}, -- end of ["points"]
						}, -- end of ["route"]
					}, --end of ["params"]
				}--end of Mission				
				REDSQUADRON5GROUP:SetTask(Mission)				
			end
		)
		--:SpawnInZone( SpawnZone, false, RS5_FlightLevel, RS5_FlightLevel )
		:SpawnAtAirbase( AIRBASE:FindByName( DepartureAirbaseName ), SPAWN.Takeoff.Hot, nil, AIRBASE.TerminalType.OpenBig ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold SPAWN.Takeoff.Runway
		--trigger.action.outText("Red Squadron 5 Is Launching Fighters", 15)	
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function SEF_REDSQUADRON2_INITIALISE()

	--Retrieve The Standard Deployment For The Squadron
	SEF_REDSQUADRON2_DEPLOYMENT()
	
	SET_AIRFIELDPERIMETERCLIENTS = SET_CLIENT:New():FilterCoalitions("blue"):FilterCategories( { "plane", "helicopter" } ):FilterActive():FilterOnce()
	
	BetaPrimaryPerimeterCount = 0			
			
	--BETA
	SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(BetaPrimaryAirbase.." Perimeter Zone"), function ( GroupObject )
		BetaPrimaryPerimeterCount = BetaPrimaryPerimeterCount + 1
		end
	)	
	
	--////BETA
	
	-- Beta    - Bassel Al-Assad -> Hama -> Al Qusayr -> Abu al-Duhur -> Tabqa	
		
	if ( BetaPrimaryPerimeterCount > 0 ) then		
		BetaStatus = BetaPrimaryAirbase.." - Beta Squadron\nAirspace Is Being Contested By The Allies\n"
		
		--////
		if ( BetaPrimaryAirbase == "Bassel Al-Assad" ) then
			
			HamaPerimeterCount 		= 0
			AlQusayrPerimeterCount 	= 0
			AbuDuhurPerimeterCount	= 0					
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Hama".." Perimeter Zone"), function ( GroupObject )
				HamaPerimeterCount = HamaPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al Qusayr".." Perimeter Zone"), function ( GroupObject )
				AlQusayrPerimeterCount = AlQusayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Abu al-Duhur".." Perimeter Zone"), function ( GroupObject )
				AbuDuhurPerimeterCount = AbuDuhurPerimeterCount + 1		
				end
			)				

			if ( Airbase.getByName("Hama"):getCoalition() == 1 and HamaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Hama", BetaDestinationAirbase)			
			elseif ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 and AlQusayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Al Qusayr", BetaDestinationAirbase)						
			elseif ( Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 and AbuDuhurPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Abu al-Duhur", BetaDestinationAirbase)							
      elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 ) then      
				SEF_REDSQUADRON2_SPAWN("Tabqa", BetaDestinationAirbase)			
			end		
		--////
		elseif ( BetaPrimaryAirbase == "Hama" ) then
		
			BasselPerimeterCount = 0
			AlQusayrPerimeterCount = 0
			AbuDuhurPerimeterCount = 0			
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Bassel Al-Assad".." Perimeter Zone"), function ( GroupObject )
				BasselPerimeterCount = BasselPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al Qusayr".." Perimeter Zone"), function ( GroupObject )
				AlQusayrPerimeterCount = AlQusayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Abu al-Duhur".." Perimeter Zone"), function ( GroupObject )
				AbuDuhurPerimeterCount = AbuDuhurPerimeterCount + 1		
				end
			)			

			if ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 and BasselPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Bassel Al-Assad", BetaDestinationAirbase)			
			elseif ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 and AlQusayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Al Qusayr", BetaDestinationAirbase)						
			elseif ( Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 and AbuDuhurPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Abu al-Duhur", BetaDestinationAirbase)				
      elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 ) then      
				SEF_REDSQUADRON2_SPAWN("Tabqa", BetaDestinationAirbase)			
			end		
		--////
		elseif ( BetaPrimaryAirbase == "Al Qusayr" ) then
		
			BasselPerimeterCount = 0
			HamaPerimeterCount = 0
			AbuDuhurPerimeterCount = 0			
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Bassel Al-Assad".." Perimeter Zone"), function ( GroupObject )
				BasselPerimeterCount = BasselPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Hama".." Perimeter Zone"), function ( GroupObject )
				HamaPerimeterCount = HamaPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Abu al-Duhur".." Perimeter Zone"), function ( GroupObject )
				AbuDuhurPerimeterCount = AbuDuhurPerimeterCount + 1		
				end
			)			

			if ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 and BasselPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Bassel Al-Assad", BetaDestinationAirbase)			
			elseif ( Airbase.getByName("Hama"):getCoalition() == 1 and HamaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Hama", BetaDestinationAirbase)						
			elseif ( Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 and AbuDuhurPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Abu al-Duhur", BetaDestinationAirbase)				
      elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 ) then      
				SEF_REDSQUADRON2_SPAWN("Tabqa", BetaDestinationAirbase)				
			end			
		--////
		elseif ( BetaPrimaryAirbase == "Abu al-Duhur" ) then
			
			BasselPerimeterCount = 0
			HamaPerimeterCount = 0
			AlQusayrPerimeterCount = 0			
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Bassel Al-Assad".." Perimeter Zone"), function ( GroupObject )
				BasselPerimeterCount = BasselPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Hama".." Perimeter Zone"), function ( GroupObject )
				HamaPerimeterCount = HamaPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al Qusayr".." Perimeter Zone"), function ( GroupObject )
				AlQusayrPerimeterCount = AlQusayrPerimeterCount + 1		
				end
			)			

			if ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 and BasselPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Bassel Al-Assad", BetaDestinationAirbase)			
			elseif ( Airbase.getByName("Hama"):getCoalition() == 1 and HamaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Hama", BetaDestinationAirbase)						
			elseif ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 and AlQusayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON2_SPAWN("Al Qusayr", BetaDestinationAirbase)				
      elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 ) then      
				SEF_REDSQUADRON2_SPAWN("Tabqa", BetaDestinationAirbase)					
			end
		--////		
		elseif ( BetaPrimaryAirbase == "Tabqa" and Airbase.getByName("Tabqa"):getCoalition() == 1 ) then
			SEF_REDSQUADRON2_SPAWN("Tabqa", BetaDestinationAirbase)
      elseif ( Airbase.getByName("Tabqa"):getCoalition() == 1 ) then      
			SEF_REDSQUADRON2_SPAWN("Tabqa", BetaDestinationAirbase)
		end		
	else
		BetaStatus = BetaPrimaryAirbase.." - Beta Squadron\nAirspace Is Controlled By Syria\n"
		SEF_REDSQUADRON2_SPAWN(BetaPrimaryAirbase, BetaDestinationAirbase)
	end	
end

function SEF_REDSQUADRON2_DEPLOYMENT()
	
	--BETA			
	if ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 and Airbase.getByName("Hama"):getCoalition() == 1 and Airbase.getByName("Al Qusayr"):getCoalition() == 1 and Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 ) then
		--Case 1111: Set Beta To Bassel and Patrol Bassel
		BetaPrimaryAirbase = "Bassel Al-Assad"
		BetaDestinationAirbase = "Bassel Al-Assad"	
	elseif ( Airbase.getByName("Bassel Al-Assad"):getCoalition() ~= 1 and Airbase.getByName("Hama"):getCoalition() == 1 and Airbase.getByName("Al Qusayr"):getCoalition() == 1 and Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 ) then
		--Case 0111: Set Beta To Hama And Patrol Bassel
		BetaPrimaryAirbase = "Hama"
		BetaDestinationAirbase = "Bassel Al-Assad"
	elseif ( Airbase.getByName("Bassel Al-Assad"):getCoalition() ~= 1 and Airbase.getByName("Hama"):getCoalition() ~= 1 and Airbase.getByName("Al Qusayr"):getCoalition() == 1 and Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 ) then
		--Case 0011: Set Beta To Al Qusayr And Patrol Hama, We Are Trying To Recapture Hama
		BetaPrimaryAirbase = "Al Qusayr"
		BetaDestinationAirbase = "Hama"
	elseif ( Airbase.getByName("Bassel Al-Assad"):getCoalition() ~= 1 and Airbase.getByName("Hama"):getCoalition() ~= 1 and Airbase.getByName("Al Qusayr"):getCoalition() ~= 1 and Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 ) then
		--Case 0001: Set Beta To Abu al-Duhur And Patrol Al Qusayr, We Are Trying To Recapture Al Qusayr
		BetaPrimaryAirbase = "Abu al-Duhur"
		BetaDestinationAirbase = "Al Qusayr"
	elseif ( Airbase.getByName("Bassel Al-Assad"):getCoalition() ~= 1 and Airbase.getByName("Hama"):getCoalition() ~= 1 and Airbase.getByName("Al Qusayr"):getCoalition() == 1 and Airbase.getByName("Abu al-Duhur"):getCoalition() ~= 1 ) then
		--Case 0010: Set Beta To Al Qusayr And Patrol Hama
		BetaPrimaryAirbase = "Al Qusayr"
		BetaDestinationAirbase = "Hama"
	elseif ( Airbase.getByName("Bassel Al-Assad"):getCoalition() ~= 1 and Airbase.getByName("Hama"):getCoalition() == 1 and Airbase.getByName("Al Qusayr"):getCoalition() ~= 1 and Airbase.getByName("Abu al-Duhur"):getCoalition() ~= 1 ) then
		--Case 0100: Set Beta To Hama And Patrol Bassel Al-Assad, Try To Recapture Bassel Al-Assad
		BetaPrimaryAirbase = "Hama"
		BetaDestinationAirbase = "Bassel Al-Assad"
	elseif ( Airbase.getByName("Bassel Al-Assad"):getCoalition() ~= 1 and Airbase.getByName("Hama"):getCoalition() == 1 and Airbase.getByName("Al Qusayr"):getCoalition() ~= 1 and Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 ) then
		--Case 0101: Set Beta To Hama And Patrol Bassel Al-Assad, Try To Recapture Bassel Al-Assad
		BetaPrimaryAirbase = "Hama"
		BetaDestinationAirbase = "Bassel Al-Assad"
	elseif ( Airbase.getByName("Bassel Al-Assad"):getCoalition() ~= 1 and Airbase.getByName("Hama"):getCoalition() == 1 and Airbase.getByName("Al Qusayr"):getCoalition() == 1 and Airbase.getByName("Abu al-Duhur"):getCoalition() ~= 1 ) then
		--Case 0110: Set Beta To Hama And Patrol Bassel Al-Assad, Try To Recapture Bassel Al-Assad
		BetaPrimaryAirbase = "Hama"
		BetaDestinationAirbase = "Bassel Al-Assad"
	elseif ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 and Airbase.getByName("Hama"):getCoalition() ~= 1 and Airbase.getByName("Al Qusayr"):getCoalition() ~= 1 and Airbase.getByName("Abu al-Duhur"):getCoalition() ~= 1 ) then
		--Case 1000: Set Beta To Bassel And Patrol Bassel Al-Assad, Try To Recapture Bassel Al-Assad
		BetaPrimaryAirbase = "Bassel Al-Assad"
		BetaDestinationAirbase = "Bassel Al-Assad"
	elseif ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 and Airbase.getByName("Hama"):getCoalition() ~= 1 and Airbase.getByName("Al Qusayr"):getCoalition() ~= 1 and Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 ) then
		--Case 1001: Set Beta To Bassel And Patrol Bassel Al-Assad, Try To Recapture Bassel Al-Assad
		BetaPrimaryAirbase = "Bassel Al-Assad"
		BetaDestinationAirbase = "Bassel Al-Assad"
	elseif ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 and Airbase.getByName("Hama"):getCoalition() ~= 1 and Airbase.getByName("Al Qusayr"):getCoalition() == 1 and Airbase.getByName("Abu al-Duhur"):getCoalition() ~= 1 ) then
		--Case 1010: Set Beta To Bassel And Patrol Bassel Al-Assad, Try To Recapture Bassel Al-Assad
		BetaPrimaryAirbase = "Bassel Al-Assad"
		BetaDestinationAirbase = "Bassel Al-Assad"
	elseif ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 and Airbase.getByName("Hama"):getCoalition() ~= 1 and Airbase.getByName("Al Qusayr"):getCoalition() == 1 and Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 ) then
		--Case 1011: Set Beta To Bassel And Patrol Bassel Al-Assad, Try To Recapture Bassel Al-Assad
		BetaPrimaryAirbase = "Bassel Al-Assad"
		BetaDestinationAirbase = "Bassel Al-Assad"
	elseif ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 and Airbase.getByName("Hama"):getCoalition() == 1 and Airbase.getByName("Al Qusayr"):getCoalition() ~= 1 and Airbase.getByName("Abu al-Duhur"):getCoalition() ~= 1 ) then
		--Case 1100: Set Beta To Bassel And Patrol Bassel Al-Assad, Try To Recapture Bassel Al-Assad
		BetaPrimaryAirbase = "Bassel Al-Assad"
		BetaDestinationAirbase = "Bassel Al-Assad"
	elseif ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 and Airbase.getByName("Hama"):getCoalition() == 1 and Airbase.getByName("Al Qusayr"):getCoalition() ~= 1 and Airbase.getByName("Abu al-Duhur"):getCoalition() == 1 ) then
		--Case 1101: Set Beta To Bassel And Patrol Bassel Al-Assad, Try To Recapture Bassel Al-Assad
		BetaPrimaryAirbase = "Bassel Al-Assad"
		BetaDestinationAirbase = "Bassel Al-Assad"
	elseif ( Airbase.getByName("Bassel Al-Assad"):getCoalition() == 1 and Airbase.getByName("Hama"):getCoalition() == 1 and Airbase.getByName("Al Qusayr"):getCoalition() == 1 and Airbase.getByName("Abu al-Duhur"):getCoalition() ~= 1 ) then
		--Case 1110: Set Beta To Bassel And Patrol Bassel Al-Assad, Try To Recapture Bassel Al-Assad
		BetaPrimaryAirbase = "Bassel Al-Assad"
		BetaDestinationAirbase = "Bassel Al-Assad"
	else
		--Case 0000: Set Beta To Tabqa And Patrol Abu al-Duhur As We Need That Link Back
		BetaPrimaryAirbase = "Palmyra"
		BetaDestinationAirbase = "Abu al-Duhur"
	end	
	--END BETA	
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function SEF_REDSQUADRON3_INITIALISE()

	--Retrieve The Standard Deployment For The Squadron
	SEF_REDSQUADRON3_DEPLOYMENT()
	
	SET_AIRFIELDPERIMETERCLIENTS = SET_CLIENT:New():FilterCoalitions("blue"):FilterCategories( { "plane", "helicopter" } ):FilterActive():FilterOnce()
	
	GammaPrimaryPerimeterCount = 0			
			
	--GAMMA
	SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(GammaPrimaryAirbase.." Perimeter Zone"), function ( GroupObject )
		GammaPrimaryPerimeterCount = GammaPrimaryPerimeterCount + 1
		end
	)	
		
	--////GAMMA
	if ( GammaPrimaryPerimeterCount > 0 ) then		
		GammaStatus = GammaPrimaryAirbase.." - Gamma Squadron\nAirspace Is Being Contested By The Allies\n"		
		
		-- Gamma - Rene Mouawad -> Al Qusayr -> Hama -> An Nasiriyah -> Palmyra
		
		--////
		if ( GammaPrimaryAirbase == "Rene Mouawad" ) then
			
			AlQusayrPerimeterCount = 0
			HamaPerimeterCount = 0
			AnNasiriyahPerimeterCount = 0			
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al Qusayr".." Perimeter Zone"), function ( GroupObject )
				AlQusayrPerimeterCount = AlQusayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Hama".." Perimeter Zone"), function ( GroupObject )
				HamaPerimeterCount = HamaPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("An Nasiriyah".." Perimeter Zone"), function ( GroupObject )
				AnNasiriyahPerimeterCount = AnNasiriyahPerimeterCount + 1		
				end
			)				

			if ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 and AlQusayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Al Qusayr", GammaDestinationAirbase)			
			elseif ( Airbase.getByName("Hama"):getCoalition() == 1 and HamaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Hama", GammaDestinationAirbase)								
			elseif ( Airbase.getByName("An Nasiriyah"):getCoalition() == 1 and AnNasiriyahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("An Nasiriyah", GammaDestinationAirbase)						
			else			
				SEF_REDSQUADRON3_SPAWN("Palmyra", GammaDestinationAirbase)					
			end			
		--////		
		elseif ( GammaPrimaryAirbase == "Al Qusayr" ) then
		
			RenePerimeterCount = 0
			HamaPerimeterCount = 0
			AnNasiriyahPerimeterCount = 0
						
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Rene Mouawad".." Perimeter Zone"), function ( GroupObject )
				RenePerimeterCount = RenePerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Hama".." Perimeter Zone"), function ( GroupObject )
				HamaPerimeterCount = HamaPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("An Nasiriyah".." Perimeter Zone"), function ( GroupObject )
				AnNasiriyahPerimeterCount = AnNasiriyahPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Rene Mouawad"):getCoalition() == 1 and RenePerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Rene Mouawad", GammaDestinationAirbase)									
			elseif ( Airbase.getByName("Hama"):getCoalition() == 1 and HamaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Hama", GammaDestinationAirbase)
			elseif ( Airbase.getByName("An Nasiriyah"):getCoalition() == 1 and AnNasiriyahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("An Nasiriyah", GammaDestinationAirbase)						
			else			
				SEF_REDSQUADRON3_SPAWN("Palmyra", GammaDestinationAirbase)					
			end
		--////		
		elseif ( GammaPrimaryAirbase == "Hama" ) then
		
			RenePerimeterCount = 0
			AlQusayrPerimeterCount = 0
			AnNasiriyahPerimeterCount = 0
						
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Rene Mouawad".." Perimeter Zone"), function ( GroupObject )
				RenePerimeterCount = RenePerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al Qusayr".." Perimeter Zone"), function ( GroupObject )
				AlQusayrPerimeterCount = AlQusayrPerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("An Nasiriyah".." Perimeter Zone"), function ( GroupObject )
				AnNasiriyahPerimeterCount = AnNasiriyahPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Rene Mouawad"):getCoalition() == 1 and RenePerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Rene Mouawad", GammaDestinationAirbase)									
			elseif ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 and AlQusayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Al Qusayr", GammaDestinationAirbase)			
			elseif ( Airbase.getByName("An Nasiriyah"):getCoalition() == 1 and AnNasiriyahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("An Nasiriyah", GammaDestinationAirbase)						
			else			
				SEF_REDSQUADRON3_SPAWN("Palmyra", GammaDestinationAirbase)					
			end		
		--////
		elseif ( GammaPrimaryAirbase == "An Nasiriyah" ) then
			
			RenePerimeterCount = 0
			AlQusayrPerimeterCount = 0
			HamaPerimeterCount = 0
			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Rene Mouawad".." Perimeter Zone"), function ( GroupObject )
				RenePerimeterCount = RenePerimeterCount + 1		
				end
			)			
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al Qusayr".." Perimeter Zone"), function ( GroupObject )
				AlQusayrPerimeterCount = AlQusayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Hama".." Perimeter Zone"), function ( GroupObject )
				HamaPerimeterCount = HamaPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Rene Mouawad"):getCoalition() == 1 and RenePerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Rene Mouawad", GammaDestinationAirbase)									
			elseif ( Airbase.getByName("Al Qusayr"):getCoalition() == 1 and AlQusayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Al Qusayr", GammaDestinationAirbase)
			elseif ( Airbase.getByName("Hama"):getCoalition() == 1 and HamaPerimeterCount == 0 ) then			
				SEF_REDSQUADRON3_SPAWN("Hama", GammaDestinationAirbase)										
			else			
				SEF_REDSQUADRON3_SPAWN("Palmyra", GammaDestinationAirbase)				
			end		
		--////		
		elseif ( GammaPrimaryAirbase == "Palmyra" ) then
			SEF_REDSQUADRON3_SPAWN("Palmyra", GammaDestinationAirbase)	
		else
			SEF_REDSQUADRON3_SPAWN("Palmyra", GammaDestinationAirbase)
		end	
	else
		GammaStatus = GammaPrimaryAirbase.." - Gamma Squadron\nAirspace Is Controlled By Syria\n"
		SEF_REDSQUADRON3_SPAWN(GammaPrimaryAirbase, GammaDestinationAirbase)	
	end	
end

function SEF_REDSQUADRON3_DEPLOYMENT()
	
	--GAMMA
	if ( Airbase.getByName("Rene Mouawad"):getCoalition() == 1 and Airbase.getByName("Al Qusayr"):getCoalition() == 1 and Airbase.getByName("Hama"):getCoalition() == 1 and Airbase.getByName("An Nasiriyah"):getCoalition() == 1 ) then
		--Case 1111: Set Gamma To Rene Mouawad and Patrol Rene Mouawad, Hold The Forward Line
		GammaPrimaryAirbase = "Rene Mouawad"
		GammaDestinationAirbase = "Rene Mouawad"
	elseif ( Airbase.getByName("Rene Mouawad"):getCoalition() == 1 and Airbase.getByName("Al Qusayr"):getCoalition() == 1 and Airbase.getByName("Hama"):getCoalition() == 1 and Airbase.getByName("An Nasiriyah"):getCoalition() ~= 1 ) then
		--Case 1110: Set Gamma To Rene Mouawad and Patrol Rene Mouawad, Hold The Forward Line
		GammaPrimaryAirbase = "Rene Mouawad"
		GammaDestinationAirbase = "Rene Mouawad"
	elseif ( Airbase.getByName("Rene Mouawad"):getCoalition() == 1 and Airbase.getByName("Al Qusayr"):getCoalition() == 1 and Airbase.getByName("Hama"):getCoalition() ~= 1 and Airbase.getByName("An Nasiriyah"):getCoalition() == 1 ) then
		--Case 1101: Set Gamma To Rene Mouawad and Patrol Rene Mouawad, Hold The Forward Line
		GammaPrimaryAirbase = "Rene Mouawad"
		GammaDestinationAirbase = "Rene Mouawad"
	elseif ( Airbase.getByName("Rene Mouawad"):getCoalition() == 1 and Airbase.getByName("Al Qusayr"):getCoalition() == 1 and Airbase.getByName("Hama"):getCoalition() ~= 1 and Airbase.getByName("An Nasiriyah"):getCoalition() ~= 1 ) then
		--Case 1100: Set Gamma To Rene Mouawad and Patrol Rene Mouawad, Hold The Forward Line
		GammaPrimaryAirbase = "Rene Mouawad"
		GammaDestinationAirbase = "Rene Mouawad"
	elseif ( Airbase.getByName("Rene Mouawad"):getCoalition() == 1 and Airbase.getByName("Al Qusayr"):getCoalition() ~= 1 and Airbase.getByName("Hama"):getCoalition() == 1 and Airbase.getByName("An Nasiriyah"):getCoalition() == 1 ) then
		--Case 1011: Set Gamma To Rene Mouawad and Patrol Rene Mouawad, Hold The Forward Line
		GammaPrimaryAirbase = "Rene Mouawad"
		GammaDestinationAirbase = "Rene Mouawad"
	elseif ( Airbase.getByName("Rene Mouawad"):getCoalition() == 1 and Airbase.getByName("Al Qusayr"):getCoalition() ~= 1 and Airbase.getByName("Hama"):getCoalition() == 1 and Airbase.getByName("An Nasiriyah"):getCoalition() ~= 1 ) then
		--Case 1010: Set Gamma To Rene Mouawad and Patrol Rene Mouawad, Hold The Forward Line
		GammaPrimaryAirbase = "Rene Mouawad"
		GammaDestinationAirbase = "Rene Mouawad"
	elseif ( Airbase.getByName("Rene Mouawad"):getCoalition() == 1 and Airbase.getByName("Al Qusayr"):getCoalition() ~= 1 and Airbase.getByName("Hama"):getCoalition() ~= 1 and Airbase.getByName("An Nasiriyah"):getCoalition() == 1 ) then
		--Case 1001: Set Gamma To Rene Mouawad and Patrol Rene Mouawad, Hold The Forward Line
		GammaPrimaryAirbase = "Rene Mouawad"
		GammaDestinationAirbase = "Rene Mouawad"
	elseif ( Airbase.getByName("Rene Mouawad"):getCoalition() == 1 and Airbase.getByName("Al Qusayr"):getCoalition() ~= 1 and Airbase.getByName("Hama"):getCoalition() ~= 1 and Airbase.getByName("An Nasiriyah"):getCoalition() ~= 1 ) then
		--Case 1000: Set Gamma To Rene Mouawad and Patrol Rene Mouawad, Hold The Forward Line
		GammaPrimaryAirbase = "Rene Mouawad"
		GammaDestinationAirbase = "Rene Mouawad"	
	elseif ( Airbase.getByName("Rene Mouawad"):getCoalition() ~= 1 and Airbase.getByName("Al Qusayr"):getCoalition() == 1 and Airbase.getByName("Hama"):getCoalition() == 1 and Airbase.getByName("An Nasiriyah"):getCoalition() == 1 ) then
		--Case 0111: Set Gamma To Al Qusayr and Patrol Rene Mouawad, Try To Recapture Rene Mouawad
		GammaPrimaryAirbase = "Al Qusayr"
		GammaDestinationAirbase = "Rene Mouawad"	
	elseif ( Airbase.getByName("Rene Mouawad"):getCoalition() ~= 1 and Airbase.getByName("Al Qusayr"):getCoalition() == 1 and Airbase.getByName("Hama"):getCoalition() == 1 and Airbase.getByName("An Nasiriyah"):getCoalition() ~= 1 ) then
		--Case 0110: Set Gamma To Al Qusayr and Patrol Rene Mouawad, Try To Recapture Rene Mouawad
		GammaPrimaryAirbase = "Al Qusayr"
		GammaDestinationAirbase = "Rene Mouawad"	
	elseif ( Airbase.getByName("Rene Mouawad"):getCoalition() ~= 1 and Airbase.getByName("Al Qusayr"):getCoalition() == 1 and Airbase.getByName("Hama"):getCoalition() ~= 1 and Airbase.getByName("An Nasiriyah"):getCoalition() == 1 ) then
		--Case 0101: Set Gamma To Al Qusayr and Patrol Rene Mouawad, Try To Recapture Rene Mouawad
		GammaPrimaryAirbase = "Al Qusayr"
		GammaDestinationAirbase = "Rene Mouawad"	
	elseif ( Airbase.getByName("Rene Mouawad"):getCoalition() ~= 1 and Airbase.getByName("Al Qusayr"):getCoalition() == 1 and Airbase.getByName("Hama"):getCoalition() ~= 1 and Airbase.getByName("An Nasiriyah"):getCoalition() ~= 1 ) then
		--Case 0100: Set Gamma To Al Qusayr and Patrol Rene Mouawad, Try To Recapture Rene Mouawad
		GammaPrimaryAirbase = "Al Qusayr"
		GammaDestinationAirbase = "Rene Mouawad"
	elseif ( Airbase.getByName("Rene Mouawad"):getCoalition() ~= 1 and Airbase.getByName("Al Qusayr"):getCoalition() ~= 1 and Airbase.getByName("Hama"):getCoalition() == 1 and Airbase.getByName("An Nasiriyah"):getCoalition() == 1 ) then
		--Case 0011: Set Gamma To Hama and Patrol Al Qusayr, Try To Recapture Al Qusayr
		GammaPrimaryAirbase = "Hama"
		GammaDestinationAirbase = "Al Qusayr"
	elseif ( Airbase.getByName("Rene Mouawad"):getCoalition() ~= 1 and Airbase.getByName("Al Qusayr"):getCoalition() ~= 1 and Airbase.getByName("Hama"):getCoalition() == 1 and Airbase.getByName("An Nasiriyah"):getCoalition() ~= 1 ) then
		--Case 0010: Set Gamma To Hama and Patrol Al Qusayr, Try To Recapture Al Qusayr
		GammaPrimaryAirbase = "Hama"
		GammaDestinationAirbase = "Al Qusayr"	
	elseif ( Airbase.getByName("Rene Mouawad"):getCoalition() ~= 1 and Airbase.getByName("Al Qusayr"):getCoalition() ~= 1 and Airbase.getByName("Hama"):getCoalition() ~= 1 and Airbase.getByName("An Nasiriyah"):getCoalition() == 1 ) then
		--Case 0001: Set Gamma To An Nasiriyah and Patrol Hama, Try To Recapture Hama
		GammaPrimaryAirbase = "An Nasiriyah"
		GammaDestinationAirbase = "Hama"
	else
		--Case 0000: Set Gamma To Palmyra And Patrol An Nasiriyah
		GammaPrimaryAirbase = "Palmyra"
		GammaDestinationAirbase = "An Nasiriyah"	
	end
	--END GAMMA	
end	

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function SEF_REDSQUADRON4_INITIALISE()

	--Retrieve The Standard Deployment For The Squadron
	SEF_REDSQUADRON4_DEPLOYMENT()
	
	SET_AIRFIELDPERIMETERCLIENTS = SET_CLIENT:New():FilterCoalitions("blue"):FilterCategories( { "plane", "helicopter" } ):FilterActive():FilterOnce()
	
	DeltaPrimaryPerimeterCount = 0			
			
	--DELTA
	SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(DeltaPrimaryAirbase.." Perimeter Zone"), function ( GroupObject )
		DeltaPrimaryPerimeterCount = DeltaPrimaryPerimeterCount + 1
		end
	)	
		
	--////DELTA
	if ( DeltaPrimaryPerimeterCount > 0 ) then		
		DeltaStatus = DeltaPrimaryAirbase.." - Delta Squadron\nAirspace Is Being Contested By The Allies\n"	
		
		--Delta   - Mezzeh -> Khalkhalah -> Al-Dumayr -> An Nasiriyah -> Palmyra	
		
		if ( DeltaPrimaryAirbase == "Mezzeh" ) then

			KhalkhalahPerimeterCount 	= 0
			AlDumayrPerimeterCount 		= 0
			AnNasiriyahPerimeterCount 	= 0
								
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Khalkhalah".." Perimeter Zone"), function ( GroupObject )
				KhalkhalahPerimeterCount = KhalkhalahPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al-Dumayr".." Perimeter Zone"), function ( GroupObject )
				AlDumayrPerimeterCount = AlDumayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("An Nasiriyah".." Perimeter Zone"), function ( GroupObject )
				AnNasiriyahPerimeterCount = AnNasiriyahPerimeterCount + 1		
				end
			)						

			if ( Airbase.getByName("Khalkhalah"):getCoalition() == 1 and KhalkhalahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Khalkhalah", DeltaDestinationAirbase)						
			elseif ( Airbase.getByName("Al-Dumayr"):getCoalition() == 1 and AlDumayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Al-Dumayr", DeltaDestinationAirbase)			
			elseif ( Airbase.getByName("An Nasiriyah"):getCoalition() == 1 and AnNasiriyahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("An Nasiriyah", DeltaDestinationAirbase)						
			else			
				SEF_REDSQUADRON4_SPAWN("Palmyra", DeltaDestinationAirbase)				
			end	
		--////
		elseif ( DeltaPrimaryAirbase == "Khalkhalah" ) then
			
			MezzehPerimeterCount 		= 0
			AlDumayrPerimeterCount 		= 0
			AnNasiriyahPerimeterCount 	= 0
								
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Mezzeh".." Perimeter Zone"), function ( GroupObject )
				MezzehPerimeterCount = MezzehPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al-Dumayr".." Perimeter Zone"), function ( GroupObject )
				AlDumayrPerimeterCount = AlDumayrPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("An Nasiriyah".." Perimeter Zone"), function ( GroupObject )
				AnNasiriyahPerimeterCount = AnNasiriyahPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Mezzeh"):getCoalition() == 1 and MezzehPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Mezzeh", DeltaDestinationAirbase)						
			elseif ( Airbase.getByName("Al-Dumayr"):getCoalition() == 1 and AlDumayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Al-Dumayr", DeltaDestinationAirbase)			
			elseif ( Airbase.getByName("An Nasiriyah"):getCoalition() == 1 and AnNasiriyahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("An Nasiriyah", DeltaDestinationAirbase)						
			else			
				SEF_REDSQUADRON4_SPAWN("Palmyra", DeltaDestinationAirbase)				
			end
		--////	
		elseif ( DeltaPrimaryAirbase == "Al-Dumayr" ) then
			
			MezzehPerimeterCount 		= 0
			KhalkhalahPerimeterCount 	= 0
			AnNasiriyahPerimeterCount 	= 0			
					
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Mezzeh".." Perimeter Zone"), function ( GroupObject )
				MezzehPerimeterCount = MezzehPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Khalkhalah".." Perimeter Zone"), function ( GroupObject )
				KhalkhalahPerimeterCount = KhalkhalahPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("An Nasiriyah".." Perimeter Zone"), function ( GroupObject )
				AnNasiriyahPerimeterCount = AnNasiriyahPerimeterCount + 1		
				end
			)						

			if ( Airbase.getByName("Mezzeh"):getCoalition() == 1 and MezzehPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Mezzeh", DeltaDestinationAirbase)						
			elseif ( Airbase.getByName("Khalkhalah"):getCoalition() == 1 and KhalkhalahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Khalkhalah", DeltaDestinationAirbase)			
			elseif ( Airbase.getByName("An Nasiriyah"):getCoalition() == 1 and AnNasiriyahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("An Nasiriyah", DeltaDestinationAirbase)						
			else			
				SEF_REDSQUADRON4_SPAWN("Palmyra", DeltaDestinationAirbase)				
			end
		--////	
		elseif ( DeltaPrimaryAirbase == "An Nasiriyah" ) then
			
			MezzehPerimeterCount 		= 0
			KhalkhalahPerimeterCount 	= 0
			AlDumayrPerimeterCount	 	= 0
								
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Mezzeh".." Perimeter Zone"), function ( GroupObject )
				MezzehPerimeterCount = MezzehPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Khalkhalah".." Perimeter Zone"), function ( GroupObject )
				KhalkhalahPerimeterCount = KhalkhalahPerimeterCount + 1		
				end
			)
			SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName("Al-Dumayr".." Perimeter Zone"), function ( GroupObject )
				AlDumayrPerimeterCount = AlDumayrPerimeterCount + 1		
				end
			)
			
			if ( Airbase.getByName("Mezzeh"):getCoalition() == 1 and MezzehPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Mezzeh", DeltaDestinationAirbase)						
			elseif ( Airbase.getByName("Khalkhalah"):getCoalition() == 1 and KhalkhalahPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Khalkhalah", DeltaDestinationAirbase)			
			elseif ( Airbase.getByName("Al-Dumayr"):getCoalition() == 1 and AlDumayrPerimeterCount == 0 ) then			
				SEF_REDSQUADRON4_SPAWN("Al-Dumayr", DeltaDestinationAirbase)						
			else			
				SEF_REDSQUADRON4_SPAWN("Palmyra", DeltaDestinationAirbase)			
			end		
		--////				
		elseif ( DeltaPrimaryAirbase == "Palmyra" ) then
			SEF_REDSQUADRON4_SPAWN("Palmyra", DeltaDestinationAirbase)	
		else
			SEF_REDSQUADRON4_SPAWN("Palmyra", DeltaDestinationAirbase)
		end
	else
		DeltaStatus = DeltaPrimaryAirbase.." - Delta Squadron\nAirspace Is Controlled By Syria\n"
		SEF_REDSQUADRON4_SPAWN(DeltaPrimaryAirbase, DeltaDestinationAirbase)	
	end		
end

function SEF_REDSQUADRON4_DEPLOYMENT()
	
	--DELTA
	if ( Airbase.getByName("Mezzeh"):getCoalition() == 1 and Airbase.getByName("Khalkhalah"):getCoalition() == 1 and Airbase.getByName("Al-Dumayr"):getCoalition() == 1 and Airbase.getByName("An Nasiriyah"):getCoalition() == 1 ) then
		--Case 1111: Set Delta To Mezzeh And Patrol Mezzeh
		DeltaPrimaryAirbase = "Mezzeh"
		DeltaDestinationAirbase = "Mezzeh"
	elseif ( Airbase.getByName("Mezzeh"):getCoalition() ~= 1 and Airbase.getByName("Khalkhalah"):getCoalition() == 1 and Airbase.getByName("Al-Dumayr"):getCoalition() == 1 and Airbase.getByName("An Nasiriyah"):getCoalition() == 1 ) then
		--Case 0111: Set Delta To Khalkhalah And Patrol Mezzeh, Try To Recapture Mezzeh
		DeltaPrimaryAirbase = "Khalkhalah"
		DeltaDestinationAirbase = "Mezzeh"
	elseif ( Airbase.getByName("Mezzeh"):getCoalition() ~= 1 and Airbase.getByName("Khalkhalah"):getCoalition() ~= 1 and Airbase.getByName("Al-Dumayr"):getCoalition() == 1 and Airbase.getByName("An Nasiriyah"):getCoalition() == 1 ) then
		--Case 0011: Set Delta To Al-Dumayr And Patrol Khalkhalah, Try To Recapture Khalkhalah
		DeltaPrimaryAirbase = "Al-Dumayr"
		DeltaDestinationAirbase = "Khalkhalah"
	elseif ( Airbase.getByName("Mezzeh"):getCoalition() ~= 1 and Airbase.getByName("Khalkhalah"):getCoalition() ~= 1 and Airbase.getByName("Al-Dumayr"):getCoalition() ~= 1 and Airbase.getByName("An Nasiriyah"):getCoalition() == 1 ) then
		--Case 0001: Set Delta To An Nasiriyah And Patrol Al-Dumayr, Try To Recapture Al-Dumayr
		DeltaPrimaryAirbase = "An Nasiriyah"
		DeltaDestinationAirbase = "Al-Dumayr"
	elseif ( Airbase.getByName("Mezzeh"):getCoalition() ~= 1 and Airbase.getByName("Khalkhalah"):getCoalition() ~= 1 and Airbase.getByName("Al-Dumayr"):getCoalition() == 1 and Airbase.getByName("An Nasiriyah"):getCoalition() ~= 1 ) then
		--Case 0010: Set Delta To Al-Dumayr And Patrol Khalkhalah, Try To Recapture Khalkhalah
		DeltaPrimaryAirbase = "Al-Dumayr"
		DeltaDestinationAirbase = "Khalkhalah"
	elseif ( Airbase.getByName("Mezzeh"):getCoalition() ~= 1 and Airbase.getByName("Khalkhalah"):getCoalition() == 1 and Airbase.getByName("Al-Dumayr"):getCoalition() ~= 1 and Airbase.getByName("An Nasiriyah"):getCoalition() ~= 1 ) then
		--Case 0100: Set Delta To Khalkhalah And Patrol Mezzeh, Try To Recapture Mezzeh
		DeltaPrimaryAirbase = "Khalkhalah"
		DeltaDestinationAirbase = "Mezzeh"
	elseif ( Airbase.getByName("Mezzeh"):getCoalition() ~= 1 and Airbase.getByName("Khalkhalah"):getCoalition() == 1 and Airbase.getByName("Al-Dumayr"):getCoalition() ~= 1 and Airbase.getByName("An Nasiriyah"):getCoalition() == 1 ) then
		--Case 0101: Set Delta To Khalkhalah And Patrol Mezzeh, Try To Recapture Mezzeh
		DeltaPrimaryAirbase = "Khalkhalah"
		DeltaDestinationAirbase = "Mezzeh"
	elseif ( Airbase.getByName("Mezzeh"):getCoalition() ~= 1 and Airbase.getByName("Khalkhalah"):getCoalition() == 1 and Airbase.getByName("Al-Dumayr"):getCoalition() == 1 and Airbase.getByName("An Nasiriyah"):getCoalition() ~= 1 ) then
		--Case 0110: Set Delta To Khalkhalah And Patrol Mezzeh, Try To Recapture Mezzeh
		DeltaPrimaryAirbase = "Khalkhalah"
		DeltaDestinationAirbase = "Mezzeh"
	elseif ( Airbase.getByName("Mezzeh"):getCoalition() == 1 and Airbase.getByName("Khalkhalah"):getCoalition() ~= 1 and Airbase.getByName("Al-Dumayr"):getCoalition() ~= 1 and Airbase.getByName("An Nasiriyah"):getCoalition() ~= 1 ) then
		--Case 1000: Set Delta To Mezzeh And Patrol Mezzeh, Hold The Forward Line
		DeltaPrimaryAirbase = "Mezzeh"
		DeltaDestinationAirbase = "Mezzeh"
	elseif ( Airbase.getByName("Mezzeh"):getCoalition() == 1 and Airbase.getByName("Khalkhalah"):getCoalition() ~= 1 and Airbase.getByName("Al-Dumayr"):getCoalition() ~= 1 and Airbase.getByName("An Nasiriyah"):getCoalition() == 1 ) then
		--Case 1001: Set Delta To Mezzeh And Patrol Mezzeh, Hold The Forward Line
		DeltaPrimaryAirbase = "Mezzeh"
		DeltaDestinationAirbase = "Mezzeh"
	elseif ( Airbase.getByName("Mezzeh"):getCoalition() == 1 and Airbase.getByName("Khalkhalah"):getCoalition() ~= 1 and Airbase.getByName("Al-Dumayr"):getCoalition() == 1 and Airbase.getByName("An Nasiriyah"):getCoalition() ~= 1 ) then
		--Case 1010: Set Delta To Mezzeh And Patrol Mezzeh, Hold The Forward Line
		DeltaPrimaryAirbase = "Mezzeh"
		DeltaDestinationAirbase = "Mezzeh"
	elseif ( Airbase.getByName("Mezzeh"):getCoalition() == 1 and Airbase.getByName("Khalkhalah"):getCoalition() ~= 1 and Airbase.getByName("Al-Dumayr"):getCoalition() == 1 and Airbase.getByName("An Nasiriyah"):getCoalition() == 1 ) then
		--Case 1011: Set Delta To Mezzeh And Patrol Mezzeh, Hold The Forward Line
		DeltaPrimaryAirbase = "Mezzeh"
		DeltaDestinationAirbase = "Mezzeh"
	elseif ( Airbase.getByName("Mezzeh"):getCoalition() == 1 and Airbase.getByName("Khalkhalah"):getCoalition() == 1 and Airbase.getByName("Al-Dumayr"):getCoalition() ~= 1 and Airbase.getByName("An Nasiriyah"):getCoalition() ~= 1 ) then
		--Case 1100: Set Delta To Mezzeh And Patrol Mezzeh, Hold The Forward Line
		DeltaPrimaryAirbase = "Mezzeh"
		DeltaDestinationAirbase = "Mezzeh"
	elseif ( Airbase.getByName("Mezzeh"):getCoalition() == 1 and Airbase.getByName("Khalkhalah"):getCoalition() == 1 and Airbase.getByName("Al-Dumayr"):getCoalition() ~= 1 and Airbase.getByName("An Nasiriyah"):getCoalition() == 1 ) then
		--Case 1101: Set Delta To Mezzeh And Patrol Mezzeh, Hold The Forward Line
		DeltaPrimaryAirbase = "Mezzeh"
		DeltaDestinationAirbase = "Mezzeh"
	elseif ( Airbase.getByName("Mezzeh"):getCoalition() == 1 and Airbase.getByName("Khalkhalah"):getCoalition() == 1 and Airbase.getByName("Al-Dumayr"):getCoalition() == 1 and Airbase.getByName("An Nasiriyah"):getCoalition() ~= 1 ) then
		--Case 1110: Set Delta To Mezzeh And Patrol Mezzeh, Hold The Forward Line
		DeltaPrimaryAirbase = "Mezzeh"
		DeltaDestinationAirbase = "Mezzeh"
	else
		--Case 0000: Set Delta To Palmyra And Patrol An Nasiriyah, Try To Recapture An Nasiriyah
		DeltaPrimaryAirbase = "Palmyra"
		DeltaDestinationAirbase = "An Nasiriyah"
	end	
	--END DELTA	
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function SEF_REDSQUADRON5_INITIALISE()

	--Retrieve The Standard Deployment For The Squadron
	SEF_REDSQUADRON5_DEPLOYMENT()
	
	SET_AIRFIELDPERIMETERCLIENTS = SET_CLIENT:New():FilterCoalitions("blue"):FilterCategories( { "plane", "helicopter" } ):FilterActive():FilterOnce()
	
	EpsilonPrimaryPerimeterCount = 0			
			
	--EPSILON	
	SET_AIRFIELDPERIMETERCLIENTS:ForEachClientInZone(ZONE:FindByName(EpsilonPrimaryAirbase.." Perimeter Zone"), function ( GroupObject )
		EpsilonPrimaryPerimeterCount = EpsilonPrimaryPerimeterCount + 1
		end
	)	
		
	--////EPSILON
	if ( EpsilonPrimaryPerimeterCount > 0 ) then		
		EpsilonStatus = EpsilonPrimaryAirbase.." - Epsilon Squadron\nAirspace Is Being Contested By The Allies\n"		
		SEF_REDSQUADRON5_SPAWN("Palmyra", EpsilonDestinationAirbase)	
	else
		EpsilonStatus = EpsilonPrimaryAirbase.." - Epsilon Squadron\nAirspace Is Controlled By Syria\n"
		SEF_REDSQUADRON5_SPAWN(EpsilonPrimaryAirbase, EpsilonDestinationAirbase)
	end		
end

function SEF_REDSQUADRON5_DEPLOYMENT()	
	
	--EPSILON
	if ( Airbase.getByName("Palmyra"):getCoalition() == 1 and ( Airbase.getByName("Hama"):getCoalition() == 1 or Airbase.getByName("An Nasiriyah"):getCoalition() == 1  ) ) then
		--Set Epsilon To Tiyas and patrol Tiyas, Hold The Forward Line
		EpsilonPrimaryAirbase = "Palmyra"
		EpsilonDestinationAirbase = "Palmyra"
	else
		--Set Epsilon To Palmyra and patrol Tiyas
		EpsilonPrimaryAirbase = "Palmyra"
		EpsilonDestinationAirbase = "Palmyra"
	end
	--END EPSILON	
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--////BLUE SQUADRONS

function SEF_BLUESQUADRON1_SCHEDULER()
    
	if ( BlueSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(BLUESQUADRON1GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON1GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_BLUESQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))			
		else
			SEF_BLUESQUADRON1_SPAWN()
			
			timer.scheduleFunction(SEF_BLUESQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_BLUESQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))		
	end	
end

function SEF_BLUESQUADRON2_SCHEDULER()
    
	if ( BlueSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(BLUESQUADRON2GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON2GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_BLUESQUADRON2_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))			
		else
			SEF_BLUESQUADRON2_SPAWN()
			
			timer.scheduleFunction(SEF_BLUESQUADRON2_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_BLUESQUADRON2_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))		
	end	
end

function SEF_BLUESQUADRON3_SCHEDULER()
    
	if ( BlueSquadronsEnabled == 1 ) then
		if ( GROUP:FindByName(BLUESQUADRON3GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON3GROUPNAME):IsAlive() ) then				
			timer.scheduleFunction(SEF_BLUESQUADRON3_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))			
		else
			SEF_BLUESQUADRON3_SPAWN()
			
			timer.scheduleFunction(SEF_BLUESQUADRON3_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))
		end
	else	
		timer.scheduleFunction(SEF_BLUESQUADRON3_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))		
	end	
end

function SEF_BLUESQUADRON4_SCHEDULER()
    
  if ( BlueSquadronsEnabled == 1 ) then
    if ( GROUP:FindByName(BLUESQUADRON4GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON4GROUPNAME):IsAlive() ) then        
      timer.scheduleFunction(SEF_BLUESQUADRON4_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))     
    else
    
      if (Airbase.getByName("Wujah Al Hajar"):getCoalition() == 2 
      and Airbase.getByName("Rene Mouawad"):getCoalition() ~= 1 
      and Airbase.getByName("Rayak"):getCoalition() == 2 
      and Airbase.getByName("Beirut-Rafic Hariri"):getCoalition() == 2 )
      then
      SEF_BLUESQUADRON4_SPAWN()
      timer.scheduleFunction(SEF_BLUESQUADRON4_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))
      else
        timer.scheduleFunction(SEF_BLUESQUADRON4_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))   
      end
    end
  else  
    timer.scheduleFunction(SEF_BLUESQUADRON4_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))   
  end 
end

function SEF_BLUESQUADRON5_SCHEDULER()
    
  if ( BlueSquadronsEnabled == 1 ) then
    if ( GROUP:FindByName(BLUESQUADRON5GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON5GROUPNAME):IsAlive() ) then        
      timer.scheduleFunction(SEF_BLUESQUADRON5_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))     
    else
    
      if (Airbase.getByName("Minakh"):getCoalition() == 2 
      and Airbase.getByName("Aleppo"):getCoalition() == 2 
      and Airbase.getByName("Kuweires"):getCoalition() == 2 
      and Airbase.getByName("Taftanaz"):getCoalition() == 2 
      and Airbase.getByName("Jirah"):getCoalition() == 2 )
      then
      SEF_BLUESQUADRON5_SPAWN()
      timer.scheduleFunction(SEF_BLUESQUADRON5_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))
      else
        timer.scheduleFunction(SEF_BLUESQUADRON5_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))   
      end
    end
  else  
    timer.scheduleFunction(SEF_BLUESQUADRON5_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerMin, BlueRespawnTimerMax))   
  end 
end

function SEF_BLUESQUADRON1_SPAWN()
  
  if ( GROUP:FindByName(BLUESQUADRON1GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON1GROUPNAME):IsAlive() ) then
    --trigger.action.outText("Blue Squadron 1 Is Currently Active, Not Spawning A Replacement Yet",15)  
  else
    BLUESQUADRON1_DATA[1].Vec2 = nil
    BLUESQUADRON1_DATA[1].TimeStamp = nil
    BLUESQUADRON1_DATA[2].Vec2 = nil
    BLUESQUADRON1_DATA[2].TimeStamp = nil
    
    --local SpawnZone = AIRBASE:FindByName("CVN-72 Abraham Lincoln"):GetZone()
    local SpawnZone = CAPZoneBlueCarrier
    --local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()  
    
    local Randomiser = math.random(BlueFlightLevelMin,BlueFlightLevelMax)
    BS1_FlightLevel = Randomiser * 1000
        
    local DepartureZoneVec2 = SpawnZone:GetVec2()
    --local TargetZoneVec2  = DestinationZone:GetVec2()
          
    local FlightDirection = math.random(1,100)
          
    if ( FlightDirection <= 50 ) then     
      --////Clockwise
      --Spawn Point
      BS1_WP0X = DepartureZoneVec2.x
      BS1_WP0Y = DepartureZoneVec2.y
      --Initial Waypoint
      BS1_WP1X = DepartureZoneVec2.x + BluePatrolWaypointInitial
      BS1_WP1Y = DepartureZoneVec2.y      
      --Perimeter Zone North Point
      BS1_WP2X = DepartureZoneVec2.x + BluePatrolWaypointDistance
      BS1_WP2Y = DepartureZoneVec2.y            
      --Perimeter Zone East Point
      BS1_WP3X = DepartureZoneVec2.x
      BS1_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance           
      --Perimeter Zone South Point
      BS1_WP4X = DepartureZoneVec2.x - BluePatrolWaypointDistance
      BS1_WP4Y = DepartureZoneVec2.y            
      --Perimeter Zone West Point
      BS1_WP5X = DepartureZoneVec2.x
      BS1_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance               
    else      
      --////Anti-Clockwise
      --Spawn Point
      BS1_WP0X = DepartureZoneVec2.x
      BS1_WP0Y = DepartureZoneVec2.y
      --Initial Waypoint
      BS1_WP1X = DepartureZoneVec2.x - BluePatrolWaypointInitial
      BS1_WP1Y = DepartureZoneVec2.y      
      --Perimeter Zone South Point
      BS1_WP2X = DepartureZoneVec2.x - BluePatrolWaypointDistance
      BS1_WP2Y = DepartureZoneVec2.y            
      --Perimeter Zone East Point
      BS1_WP3X = DepartureZoneVec2.x
      BS1_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance           
      --Perimeter Zone North Point
      BS1_WP4X = DepartureZoneVec2.x + BluePatrolWaypointDistance
      BS1_WP4Y = DepartureZoneVec2.y            
      --Perimeter Zone West Point
      BS1_WP5X = DepartureZoneVec2.x
      BS1_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance         
    end   
    
    BLUESQUADRON1 = SPAWN:NewWithAlias("USAF F-14B", BlueSquadronName1)
              :InitRandomizeTemplate( USNAirForceCAP )              
                      
    :OnSpawnGroup(
      function( SpawnGroup )            
        BLUESQUADRON1GROUPNAME = SpawnGroup.GroupName
        BLUESQUADRON1GROUP = GROUP:FindByName(SpawnGroup.GroupName)             
                          
        --////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
        Mission = {
          ["id"] = "Mission",
          ["params"] = {    
            ["route"] = 
            {                                    
              ["points"] = 
              {
                [1] = 
                {
                  ["alt"] = BS1_FlightLevel/2,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                        [1] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = true,
                          ["id"] = "WrappedAction",
                          ["number"] = 1,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "EPLRS",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["groupId"] = 1,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [1]
                        [2] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 2,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["variantIndex"] = 1,
                                ["name"] = 5,
                                ["formationIndex"] = 6,
                                ["value"] = 393217,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [2]
                        [3] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "EngageTargets",
                          ["number"] = 3,
                          ["params"] = 
                          {
                            ["targetTypes"] = 
                            {
                              [1] = "Air",
                            }, -- end of ["targetTypes"]
                            ["priority"] = 0,
                            ["value"] = "Air;",
                            ["noTargetTypes"] = 
                            {
                              [1] = "Cruise missiles",
                              [2] = "Antiship Missiles",
                              [3] = "AA Missiles",
                              [4] = "AG Missiles",
                              [5] = "SA Missiles",
                            }, -- end of ["noTargetTypes"]
                            ["maxDistEnabled"] = true,
                            ["maxDist"] = EngagementDistance,
                          }, -- end of ["params"]
                        }, -- end of [3]
                        [4] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 4,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = 2,
                                ["name"] = 1,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [4]
                        [5] = 
                        {
                          ["number"] = 5,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["enabled"] = true,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = 264241152,
                                ["name"] = 10,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [5]
                        [6] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 6,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["name"] = 19,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [6]
                        [7] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 7,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["name"] = 6,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [7]                        
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 0,
                  ["ETA_locked"] = true,
                  ["y"] = BS1_WP0Y,
                  ["x"] = BS1_WP0X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [1]
                [2] = 
                {
                  ["alt"] = BS1_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 127.32626754758,
                  ["ETA_locked"] = false,
                  ["y"] = BS1_WP1Y,
                  ["x"] = BS1_WP1X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [2]
                [3] = 
                {
                  ["alt"] = BS1_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 380.31328316984,
                  ["ETA_locked"] = false,
                  ["y"] = BS1_WP2Y,
                  ["x"] = BS1_WP2X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [3]
                [4] = 
                {
                  ["alt"] = BS1_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 832.92276094724,
                  ["ETA_locked"] = false,
                  ["y"] = BS1_WP3Y,
                  ["x"] = BS1_WP3X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [4]
                [5] = 
                {
                  ["alt"] = BS1_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 1289.20366255,
                  ["ETA_locked"] = false,
                  ["y"] = BS1_WP4Y,
                  ["x"] = BS1_WP4X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [5]
                [6] = 
                {
                  ["alt"] = BS1_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                        [1] = 
                        {
                          ["number"] = 1,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["enabled"] = true,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "SwitchWaypoint",
                              ["params"] = 
                              {
                                ["goToWaypointIndex"] = 3,
                                ["fromWaypointIndex"] = 6,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [1]
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 1744.9128539618,
                  ["ETA_locked"] = false,
                  ["y"] = BS1_WP5Y,
                  ["x"] = BS1_WP5X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [6]
              }, -- end of ["points"]
            }, -- end of ["route"]
          }, --end of ["params"]
        }--end of Mission       
        BLUESQUADRON1GROUP:SetTask(Mission)       
      end
    )
    --:SpawnInZone( SpawnZone, false, BS1_FlightLevel, BS1_FlightLevel )
    :SpawnAtAirbase( AIRBASE:FindByName( "CVN-71 Theodore Roosevelt" ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold
    --trigger.action.outText("Blue Squadron 1 Is Launching Fighters", 15) 
  end
end

function SEF_BLUESQUADRON2_SPAWN()
  
  if ( GROUP:FindByName(BLUESQUADRON2GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON2GROUPNAME):IsAlive() ) then
    --trigger.action.outText("Blue Squadron 2 Is Currently Active, Not Spawning A Replacement Yet",15)  
  else
    BLUESQUADRON2_DATA[1].Vec2 = nil
    BLUESQUADRON2_DATA[1].TimeStamp = nil
    BLUESQUADRON2_DATA[2].Vec2 = nil
    BLUESQUADRON2_DATA[2].TimeStamp = nil
    
    local SpawnZone = AIRBASE:FindByName("Incirlik"):GetZone()
    --local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()  
    
    local Randomiser = math.random(BlueFlightLevelMin,BlueFlightLevelMax)
    BS2_FlightLevel = Randomiser * 1000
        
    local DepartureZoneVec2 = SpawnZone:GetVec2()
    --local TargetZoneVec2  = DestinationZone:GetVec2()
          
    local FlightDirection = math.random(1,100)
          
    if ( FlightDirection <= 50 ) then     
      --////Clockwise
      --Spawn Point
      BS2_WP0X = DepartureZoneVec2.x
      BS2_WP0Y = DepartureZoneVec2.y
      --Initial Waypoint
      BS2_WP1X = DepartureZoneVec2.x + BluePatrolWaypointInitial
      BS2_WP1Y = DepartureZoneVec2.y      
      --Perimeter Zone North Point
      BS2_WP2X = DepartureZoneVec2.x + BluePatrolWaypointDistance
      BS2_WP2Y = DepartureZoneVec2.y            
      --Perimeter Zone East Point
      BS2_WP3X = DepartureZoneVec2.x
      BS2_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance           
      --Perimeter Zone South Point
      BS2_WP4X = DepartureZoneVec2.x - BluePatrolWaypointDistance
      BS2_WP4Y = DepartureZoneVec2.y            
      --Perimeter Zone West Point
      BS2_WP5X = DepartureZoneVec2.x
      BS2_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance               
    else      
      --////Anti-Clockwise
      --Spawn Point
      BS2_WP0X = DepartureZoneVec2.x
      BS2_WP0Y = DepartureZoneVec2.y
      --Initial Waypoint
      BS2_WP1X = DepartureZoneVec2.x - BluePatrolWaypointInitial
      BS2_WP1Y = DepartureZoneVec2.y      
      --Perimeter Zone South Point
      BS2_WP2X = DepartureZoneVec2.x - BluePatrolWaypointDistance
      BS2_WP2Y = DepartureZoneVec2.y            
      --Perimeter Zone East Point
      BS2_WP3X = DepartureZoneVec2.x
      BS2_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance           
      --Perimeter Zone North Point
      BS2_WP4X = DepartureZoneVec2.x + BluePatrolWaypointDistance
      BS2_WP4Y = DepartureZoneVec2.y            
      --Perimeter Zone West Point
      BS2_WP5X = DepartureZoneVec2.x
      BS2_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance         
    end   
    
    BLUESQUADRON2 = SPAWN:NewWithAlias("USAF F-15C", BlueSquadronName2)             
              :InitRandomizeTemplate( IncirlikAirForceCAP )                           
              
    :OnSpawnGroup(
      function( SpawnGroup )            
        BLUESQUADRON2GROUPNAME = SpawnGroup.GroupName
        BLUESQUADRON2GROUP = GROUP:FindByName(SpawnGroup.GroupName)             
                          
        --////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
        Mission = {
          ["id"] = "Mission",
          ["params"] = {    
            ["route"] = 
            {                                    
              ["points"] = 
              {
                [1] = 
                {
                  ["alt"] = BS2_FlightLevel/2,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                        [1] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = true,
                          ["id"] = "WrappedAction",
                          ["number"] = 1,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "EPLRS",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["groupId"] = 1,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [1]
                        [2] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 2,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["variantIndex"] = 1,
                                ["name"] = 5,
                                ["formationIndex"] = 6,
                                ["value"] = 393217,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [2]
                        [3] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "EngageTargets",
                          ["number"] = 3,
                          ["params"] = 
                          {
                            ["targetTypes"] = 
                            {
                              [1] = "Air",
                            }, -- end of ["targetTypes"]
                            ["priority"] = 0,
                            ["value"] = "Air;",
                            ["noTargetTypes"] = 
                            {
                              [1] = "Cruise missiles",
                              [2] = "Antiship Missiles",
                              [3] = "AA Missiles",
                              [4] = "AG Missiles",
                              [5] = "SA Missiles",
                            }, -- end of ["noTargetTypes"]
                            ["maxDistEnabled"] = true,
                            ["maxDist"] = EngagementDistance,
                          }, -- end of ["params"]
                        }, -- end of [3]
                        [4] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 4,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = 2,
                                ["name"] = 1,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [4]
                        [5] = 
                        {
                          ["number"] = 5,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["enabled"] = true,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = 264241152,
                                ["name"] = 10,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [5]
                        [6] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 6,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["name"] = 19,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [6]
                        [7] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 7,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["name"] = 6,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [7]
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 0,
                  ["ETA_locked"] = true,
                  ["y"] = BS2_WP0Y,
                  ["x"] = BS2_WP0X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [1]
                [2] = 
                {
                  ["alt"] = BS2_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 127.32626754758,
                  ["ETA_locked"] = false,
                  ["y"] = BS2_WP1Y,
                  ["x"] = BS2_WP1X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [2]
                [3] = 
                {
                  ["alt"] = BS2_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 380.31328316984,
                  ["ETA_locked"] = false,
                  ["y"] = BS2_WP2Y,
                  ["x"] = BS2_WP2X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [3]
                [4] = 
                {
                  ["alt"] = BS2_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 832.92276094724,
                  ["ETA_locked"] = false,
                  ["y"] = BS2_WP3Y,
                  ["x"] = BS2_WP3X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [4]
                [5] = 
                {
                  ["alt"] = BS2_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 1289.20366255,
                  ["ETA_locked"] = false,
                  ["y"] = BS2_WP4Y,
                  ["x"] = BS2_WP4X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [5]
                [6] = 
                {
                  ["alt"] = BS2_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                        [1] = 
                        {
                          ["number"] = 1,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["enabled"] = true,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "SwitchWaypoint",
                              ["params"] = 
                              {
                                ["goToWaypointIndex"] = 3,
                                ["fromWaypointIndex"] = 6,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [1]
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 1744.9128539618,
                  ["ETA_locked"] = false,
                  ["y"] = BS2_WP5Y,
                  ["x"] = BS2_WP5X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [6]
              }, -- end of ["points"]
            }, -- end of ["route"]
          }, --end of ["params"]
        }--end of Mission       
        BLUESQUADRON2GROUP:SetTask(Mission)       
      end
    )
    --:SpawnInZone( SpawnZone, false, BS2_FlightLevel, BS2_FlightLevel )
    :SpawnAtAirbase( AIRBASE:FindByName( "Incirlik" ), SPAWN.Takeoff.Hot ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold
    --trigger.action.outText("Blue Squadron 2 Is Launching Fighters", 15) 
  end
end

function SEF_BLUESQUADRON3_SPAWN()
  
  if ( GROUP:FindByName(BLUESQUADRON3GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON3GROUPNAME):IsAlive() ) then
    --trigger.action.outText("Blue Squadron 3 Is Currently Active, Not Spawning A Replacement Yet",15)  
  else
    BLUESQUADRON3_DATA[1].Vec2 = nil
    BLUESQUADRON3_DATA[1].TimeStamp = nil
    BLUESQUADRON3_DATA[2].Vec2 = nil
    BLUESQUADRON3_DATA[2].TimeStamp = nil
    
    local SpawnZone = AIRBASE:FindByName("Ramat David"):GetZone()
    --local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()  
    
    local Randomiser = math.random(BlueFlightLevelMin,BlueFlightLevelMax)
    BS3_FlightLevel = Randomiser * 1000
        
    local DepartureZoneVec2 = SpawnZone:GetVec2()
    --local TargetZoneVec2  = DestinationZone:GetVec2()
          
    local FlightDirection = math.random(1,100)
          
    if ( FlightDirection <= 50 ) then     
      --////Clockwise
      --Spawn Point
      BS3_WP0X = DepartureZoneVec2.x
      BS3_WP0Y = DepartureZoneVec2.y
      --Initial Waypoint
      BS3_WP1X = DepartureZoneVec2.x + BluePatrolWaypointInitial
      BS3_WP1Y = DepartureZoneVec2.y      
      --Perimeter Zone North Point
      BS3_WP2X = DepartureZoneVec2.x + BluePatrolWaypointDistance
      BS3_WP2Y = DepartureZoneVec2.y            
      --Perimeter Zone East Point
      BS3_WP3X = DepartureZoneVec2.x
      BS3_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance           
      --Perimeter Zone South Point
      BS3_WP4X = DepartureZoneVec2.x - BluePatrolWaypointDistance
      BS3_WP4Y = DepartureZoneVec2.y            
      --Perimeter Zone West Point
      BS3_WP5X = DepartureZoneVec2.x
      BS3_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance               
    else      
      --////Anti-Clockwise
      --Spawn Point
      BS3_WP0X = DepartureZoneVec2.x
      BS3_WP0Y = DepartureZoneVec2.y
      --Initial Waypoint
      BS3_WP1X = DepartureZoneVec2.x - BluePatrolWaypointInitial
      BS3_WP1Y = DepartureZoneVec2.y      
      --Perimeter Zone South Point
      BS3_WP2X = DepartureZoneVec2.x - BluePatrolWaypointDistance
      BS3_WP2Y = DepartureZoneVec2.y            
      --Perimeter Zone East Point
      BS3_WP3X = DepartureZoneVec2.x
      BS3_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance           
      --Perimeter Zone North Point
      BS3_WP4X = DepartureZoneVec2.x + BluePatrolWaypointDistance
      BS3_WP4Y = DepartureZoneVec2.y            
      --Perimeter Zone West Point
      BS3_WP5X = DepartureZoneVec2.x
      BS3_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance         
    end   
    
    BLUESQUADRON3 = SPAWN:NewWithAlias("IAF F-15C", BlueSquadronName3)              
              :InitRandomizeTemplate( IAFAirForceCAP )                            
              
    :OnSpawnGroup(
      function( SpawnGroup )            
        BLUESQUADRON3GROUPNAME = SpawnGroup.GroupName
        BLUESQUADRON3GROUP = GROUP:FindByName(SpawnGroup.GroupName)             
                          
        --////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
        Mission = {
          ["id"] = "Mission",
          ["params"] = {    
            ["route"] = 
            {                                    
              ["points"] = 
              {
                [1] = 
                {
                  ["alt"] = BS3_FlightLevel/2,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                        [1] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = true,
                          ["id"] = "WrappedAction",
                          ["number"] = 1,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "EPLRS",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["groupId"] = 1,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [1]
                        [2] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 2,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["variantIndex"] = 1,
                                ["name"] = 5,
                                ["formationIndex"] = 6,
                                ["value"] = 393217,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [2]
                        [3] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "EngageTargets",
                          ["number"] = 3,
                          ["params"] = 
                          {
                            ["targetTypes"] = 
                            {
                              [1] = "Air",
                            }, -- end of ["targetTypes"]
                            ["priority"] = 0,
                            ["value"] = "Air;",
                            ["noTargetTypes"] = 
                            {
                              [1] = "Cruise missiles",
                              [2] = "Antiship Missiles",
                              [3] = "AA Missiles",
                              [4] = "AG Missiles",
                              [5] = "SA Missiles",
                            }, -- end of ["noTargetTypes"]
                            ["maxDistEnabled"] = true,
                            ["maxDist"] = EngagementDistance,
                          }, -- end of ["params"]
                        }, -- end of [3]
                        [4] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 4,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = 2,
                                ["name"] = 1,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [4]
                        [5] = 
                        {
                          ["number"] = 5,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["enabled"] = true,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = 264241152,
                                ["name"] = 10,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [5]
                        [6] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 6,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["name"] = 19,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [6]
                        [7] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 7,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["name"] = 6,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [7]
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 0,
                  ["ETA_locked"] = true,
                  ["y"] = BS3_WP0Y,
                  ["x"] = BS3_WP0X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [1]
                [2] = 
                {
                  ["alt"] = BS3_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 127.32626754758,
                  ["ETA_locked"] = false,
                  ["y"] = BS3_WP1Y,
                  ["x"] = BS3_WP1X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [2]
                [3] = 
                {
                  ["alt"] = BS3_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 380.31328316984,
                  ["ETA_locked"] = false,
                  ["y"] = BS3_WP2Y,
                  ["x"] = BS3_WP2X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [3]
                [4] = 
                {
                  ["alt"] = BS3_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 832.92276094724,
                  ["ETA_locked"] = false,
                  ["y"] = BS3_WP3Y,
                  ["x"] = BS3_WP3X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [4]
                [5] = 
                {
                  ["alt"] = BS3_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 1289.20366255,
                  ["ETA_locked"] = false,
                  ["y"] = BS3_WP4Y,
                  ["x"] = BS3_WP4X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [5]
                [6] = 
                {
                  ["alt"] = BS3_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                        [1] = 
                        {
                          ["number"] = 1,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["enabled"] = true,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "SwitchWaypoint",
                              ["params"] = 
                              {
                                ["goToWaypointIndex"] = 3,
                                ["fromWaypointIndex"] = 6,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [1]
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 1744.9128539618,
                  ["ETA_locked"] = false,
                  ["y"] = BS3_WP5Y,
                  ["x"] = BS3_WP5X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [6]
              }, -- end of ["points"]
            }, -- end of ["route"]
          }, --end of ["params"]
        }--end of Mission       
        BLUESQUADRON3GROUP:SetTask(Mission)       
      end
    )
    --:SpawnInZone( SpawnZone, false, BS3_FlightLevel, BS3_FlightLevel )
    :SpawnAtAirbase( AIRBASE:FindByName( "Ramat David" ), SPAWN.Takeoff.Hot, nil, AIRBASE.TerminalType.OpenBig ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold / AIRBASE.TerminalType.OpenMed AIRBASE.TerminalType.OpenMedOrBig AIRBASE.TerminalType.Shelter AIRBASE.TerminalType.FighterAircraft
    --trigger.action.outText("Blue Squadron 3 Is Launching Fighters", 15) 
  end
end

function SEF_BLUESQUADRON4_SPAWN()
  
  if ( GROUP:FindByName(BLUESQUADRON4GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON4GROUPNAME):IsAlive() ) then
    --trigger.action.outText("Blue Squadron 3 Is Currently Active, Not Spawning A Replacement Yet",15)  
  else
    BLUESQUADRON4_DATA[1].Vec2 = nil
    BLUESQUADRON4_DATA[1].TimeStamp = nil
    BLUESQUADRON4_DATA[2].Vec2 = nil
    BLUESQUADRON4_DATA[2].TimeStamp = nil
    
    local SpawnZone = AIRBASE:FindByName("Wujah Al Hajar"):GetZone()
    --local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()  
    
    local Randomiser = math.random(BlueFlightLevelMin,BlueFlightLevelMax)
    BS4_FlightLevel = Randomiser * 1000
        
    local DepartureZoneVec2 = SpawnZone:GetVec2()
    --local TargetZoneVec2  = DestinationZone:GetVec2()
          
    local FlightDirection = math.random(1,100)
          
    if ( FlightDirection <= 50 ) then     
      --////Clockwise
      --Spawn Point
      BS4_WP0X = DepartureZoneVec2.x
      BS4_WP0Y = DepartureZoneVec2.y
      --Initial Waypoint
      BS4_WP1X = DepartureZoneVec2.x + BluePatrolWaypointInitial/2
      BS4_WP1Y = DepartureZoneVec2.y      
      --Perimeter Zone North Point
      BS4_WP2X = DepartureZoneVec2.x + BluePatrolWaypointDistance/2
      BS4_WP2Y = DepartureZoneVec2.y            
      --Perimeter Zone East Point
      BS4_WP3X = DepartureZoneVec2.x
      BS4_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance/3           
      --Perimeter Zone South Point
      BS4_WP4X = DepartureZoneVec2.x - BluePatrolWaypointDistance*1.5
      BS4_WP4Y = DepartureZoneVec2.y            
      --Perimeter Zone West Point
      BS4_WP5X = DepartureZoneVec2.x
      BS4_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance/2               
    else      
      --////Anti-Clockwise
      --Spawn Point
      BS4_WP0X = DepartureZoneVec2.x
      BS4_WP0Y = DepartureZoneVec2.y
      --Initial Waypoint
      BS4_WP1X = DepartureZoneVec2.x - BluePatrolWaypointInitial
      BS4_WP1Y = DepartureZoneVec2.y      
      --Perimeter Zone South Point
      BS4_WP2X = DepartureZoneVec2.x - BluePatrolWaypointDistance*1.5
      BS4_WP2Y = DepartureZoneVec2.y            
      --Perimeter Zone East Point
      BS4_WP3X = DepartureZoneVec2.x
      BS4_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance/3           
      --Perimeter Zone North Point
      BS4_WP4X = DepartureZoneVec2.x + BluePatrolWaypointDistance/2
      BS4_WP4Y = DepartureZoneVec2.y            
      --Perimeter Zone West Point
      BS4_WP5X = DepartureZoneVec2.x
      BS4_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance/2         
    end   
    
    BLUESQUADRON4 = SPAWN:NewWithAlias("USAF F-15C", BlueSquadronName4)              
              :InitRandomizeTemplate( IncirlikAirForceCAP )                            
              
    :OnSpawnGroup(
      function( SpawnGroup )            
        BLUESQUADRON4GROUPNAME = SpawnGroup.GroupName
        BLUESQUADRON4GROUP = GROUP:FindByName(SpawnGroup.GroupName)             
                          
        --////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
        Mission = {
          ["id"] = "Mission",
          ["params"] = {    
            ["route"] = 
            {                                    
              ["points"] = 
              {
                [1] = 
                {
                  ["alt"] = BS4_FlightLevel/2,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                        [1] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = true,
                          ["id"] = "WrappedAction",
                          ["number"] = 1,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "EPLRS",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["groupId"] = 1,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [1]
                        [2] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 2,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["variantIndex"] = 1,
                                ["name"] = 5,
                                ["formationIndex"] = 6,
                                ["value"] = 393217,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [2]
                        [3] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "EngageTargets",
                          ["number"] = 3,
                          ["params"] = 
                          {
                            ["targetTypes"] = 
                            {
                              [1] = "Air",
                            }, -- end of ["targetTypes"]
                            ["priority"] = 0,
                            ["value"] = "Air;",
                            ["noTargetTypes"] = 
                            {
                              [1] = "Cruise missiles",
                              [2] = "Antiship Missiles",
                              [3] = "AA Missiles",
                              [4] = "AG Missiles",
                              [5] = "SA Missiles",
                            }, -- end of ["noTargetTypes"]
                            ["maxDistEnabled"] = true,
                            ["maxDist"] = EngagementDistance/3,
                          }, -- end of ["params"]
                        }, -- end of [3]
                        [4] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 4,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = 2,
                                ["name"] = 1,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [4]
                        [5] = 
                        {
                          ["number"] = 5,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["enabled"] = true,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = 264241152,
                                ["name"] = 10,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [5]
                        [6] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 6,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["name"] = 19,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [6]
                        [7] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 7,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["name"] = 6,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [7]
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 0,
                  ["ETA_locked"] = true,
                  ["y"] = BS4_WP0Y,
                  ["x"] = BS4_WP0X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [1]
                [2] = 
                {
                  ["alt"] = BS4_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 127.32626754758,
                  ["ETA_locked"] = false,
                  ["y"] = BS4_WP1Y,
                  ["x"] = BS4_WP1X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [2]
                [3] = 
                {
                  ["alt"] = BS4_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 380.31328316984,
                  ["ETA_locked"] = false,
                  ["y"] = BS4_WP2Y,
                  ["x"] = BS4_WP2X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [3]
                [4] = 
                {
                  ["alt"] = BS4_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 832.92276094724,
                  ["ETA_locked"] = false,
                  ["y"] = BS4_WP3Y,
                  ["x"] = BS4_WP3X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [4]
                [5] = 
                {
                  ["alt"] = BS4_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 1289.20366255,
                  ["ETA_locked"] = false,
                  ["y"] = BS4_WP4Y,
                  ["x"] = BS4_WP4X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [5]
                [6] = 
                {
                  ["alt"] = BS4_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                        [1] = 
                        {
                          ["number"] = 1,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["enabled"] = true,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "SwitchWaypoint",
                              ["params"] = 
                              {
                                ["goToWaypointIndex"] = 3,
                                ["fromWaypointIndex"] = 6,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [1]
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 1744.9128539618,
                  ["ETA_locked"] = false,
                  ["y"] = BS4_WP5Y,
                  ["x"] = BS4_WP5X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [6]
              }, -- end of ["points"]
            }, -- end of ["route"]
          }, --end of ["params"]
        }--end of Mission       
        BLUESQUADRON4GROUP:SetTask(Mission)       
      end
    )
    --:SpawnInZone( SpawnZone, false, BS3_FlightLevel, BS3_FlightLevel )
    :SpawnAtAirbase( AIRBASE:FindByName( "Wujah Al Hajar" ), SPAWN.Takeoff.Hot, nil, AIRBASE.TerminalType.OpenBig ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold / AIRBASE.TerminalType.OpenMed AIRBASE.TerminalType.OpenMedOrBig AIRBASE.TerminalType.Shelter AIRBASE.TerminalType.FighterAircraft
    -- Beirut-Rafic Hariri
    --trigger.action.outText("Blue Squadron 3 Is Launching Fighters", 15) 
  end
end

function SEF_BLUESQUADRON5_SPAWN()
  
  if ( GROUP:FindByName(BLUESQUADRON5GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON5GROUPNAME):IsAlive() ) then
    --trigger.action.outText("Blue Squadron 3 Is Currently Active, Not Spawning A Replacement Yet",15)  
  else
    BLUESQUADRON5_DATA[1].Vec2 = nil
    BLUESQUADRON5_DATA[1].TimeStamp = nil
    BLUESQUADRON5_DATA[2].Vec2 = nil
    BLUESQUADRON5_DATA[2].TimeStamp = nil
    
    local SpawnZone = AIRBASE:FindByName("Aleppo"):GetZone()
    --local DestinationZone = AIRBASE:FindByName(DestinationAirbaseName):GetZone()  
    
    local Randomiser = math.random(BlueFlightLevelMin,BlueFlightLevelMax)
    BS5_FlightLevel = Randomiser * 1000
        
    local DepartureZoneVec2 = SpawnZone:GetVec2()
    --local TargetZoneVec2  = DestinationZone:GetVec2()
          
    local FlightDirection = math.random(1,100)
          
    if ( FlightDirection <= 50 ) then     
      --////Clockwise
      --Spawn Point
      BS5_WP0X = DepartureZoneVec2.x
      BS5_WP0Y = DepartureZoneVec2.y
      --Initial Waypoint
      BS5_WP1X = DepartureZoneVec2.x + BluePatrolWaypointInitial
      BS5_WP1Y = DepartureZoneVec2.y      
      --Perimeter Zone North Point
      BS5_WP2X = DepartureZoneVec2.x + BluePatrolWaypointDistance/2
      BS5_WP2Y = DepartureZoneVec2.y            
      --Perimeter Zone East Point
      BS5_WP3X = DepartureZoneVec2.x
      BS5_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance*2           
      --Perimeter Zone South Point
      BS5_WP4X = DepartureZoneVec2.x - BluePatrolWaypointDistance/2
      BS5_WP4Y = DepartureZoneVec2.y            
      --Perimeter Zone West Point
      BS5_WP5X = DepartureZoneVec2.x
      BS5_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance*2               
    else      
      --////Anti-Clockwise
      --Spawn Point
      BS5_WP0X = DepartureZoneVec2.x
      BS5_WP0Y = DepartureZoneVec2.y
      --Initial Waypoint
      BS5_WP1X = DepartureZoneVec2.x - BluePatrolWaypointInitial
      BS5_WP1Y = DepartureZoneVec2.y      
      --Perimeter Zone South Point
      BS5_WP2X = DepartureZoneVec2.x - BluePatrolWaypointDistance/2
      BS5_WP2Y = DepartureZoneVec2.y            
      --Perimeter Zone East Point
      BS5_WP3X = DepartureZoneVec2.x
      BS5_WP3Y = DepartureZoneVec2.y + BluePatrolWaypointDistance*2           
      --Perimeter Zone North Point
      BS5_WP4X = DepartureZoneVec2.x + BluePatrolWaypointDistance/2
      BS5_WP4Y = DepartureZoneVec2.y            
      --Perimeter Zone West Point
      BS5_WP5X = DepartureZoneVec2.x
      BS5_WP5Y = DepartureZoneVec2.y - BluePatrolWaypointDistance*2         
    end   
    
    BLUESQUADRON5 = SPAWN:NewWithAlias("USAF F-15C", BlueSquadronName5)              
              :InitRandomizeTemplate( IncirlikAirForceCAP )                            
              
    :OnSpawnGroup(
      function( SpawnGroup )            
        BLUESQUADRON5GROUPNAME = SpawnGroup.GroupName
        BLUESQUADRON5GROUP = GROUP:FindByName(SpawnGroup.GroupName)             
                          
        --////CAP Mission Profile, Engage Targets Along Route Unrestricted Distance, Switch Waypoint From WP5 to WP2, 0.7Mach, Randomised Flight Level From Above Parameters
        Mission = {
          ["id"] = "Mission",
          ["params"] = {    
            ["route"] = 
            {                                    
              ["points"] = 
              {
                [1] = 
                {
                  ["alt"] = BS5_FlightLevel/2,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                        [1] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = true,
                          ["id"] = "WrappedAction",
                          ["number"] = 1,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "EPLRS",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["groupId"] = 1,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [1]
                        [2] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 2,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["variantIndex"] = 1,
                                ["name"] = 5,
                                ["formationIndex"] = 6,
                                ["value"] = 393217,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [2]
                        [3] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "EngageTargets",
                          ["number"] = 3,
                          ["params"] = 
                          {
                            ["targetTypes"] = 
                            {
                              [1] = "Air",
                            }, -- end of ["targetTypes"]
                            ["priority"] = 0,
                            ["value"] = "Air;",
                            ["noTargetTypes"] = 
                            {
                              [1] = "Cruise missiles",
                              [2] = "Antiship Missiles",
                              [3] = "AA Missiles",
                              [4] = "AG Missiles",
                              [5] = "SA Missiles",
                            }, -- end of ["noTargetTypes"]
                            ["maxDistEnabled"] = true,
                            ["maxDist"] = EngagementDistance/2,
                          }, -- end of ["params"]
                        }, -- end of [3]
                        [4] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 4,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = 2,
                                ["name"] = 1,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [4]
                        [5] = 
                        {
                          ["number"] = 5,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["enabled"] = true,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = 264241152,
                                ["name"] = 10,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [5]
                        [6] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 6,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["name"] = 19,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [6]
                        [7] = 
                        {
                          ["enabled"] = true,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["number"] = 7,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "Option",
                              ["params"] = 
                              {
                                ["value"] = true,
                                ["name"] = 6,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [7]
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 0,
                  ["ETA_locked"] = true,
                  ["y"] = BS5_WP0Y,
                  ["x"] = BS5_WP0X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [1]
                [2] = 
                {
                  ["alt"] = BS5_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 127.32626754758,
                  ["ETA_locked"] = false,
                  ["y"] = BS5_WP1Y,
                  ["x"] = BS5_WP1X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [2]
                [3] = 
                {
                  ["alt"] = BS5_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 380.31328316984,
                  ["ETA_locked"] = false,
                  ["y"] = BS5_WP2Y,
                  ["x"] = BS5_WP2X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [3]
                [4] = 
                {
                  ["alt"] = BS5_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 832.92276094724,
                  ["ETA_locked"] = false,
                  ["y"] = BS5_WP3Y,
                  ["x"] = BS5_WP3X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [4]
                [5] = 
                {
                  ["alt"] = BS5_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 1289.20366255,
                  ["ETA_locked"] = false,
                  ["y"] = BS5_WP4Y,
                  ["x"] = BS5_WP4X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [5]
                [6] = 
                {
                  ["alt"] = BS5_FlightLevel,
                  ["action"] = "Turning Point",
                  ["alt_type"] = "BARO",
                  ["speed"] = 234.32754852983,
                  ["task"] = 
                  {
                    ["id"] = "ComboTask",
                    ["params"] = 
                    {
                      ["tasks"] = 
                      {
                        [1] = 
                        {
                          ["number"] = 1,
                          ["auto"] = false,
                          ["id"] = "WrappedAction",
                          ["enabled"] = true,
                          ["params"] = 
                          {
                            ["action"] = 
                            {
                              ["id"] = "SwitchWaypoint",
                              ["params"] = 
                              {
                                ["goToWaypointIndex"] = 3,
                                ["fromWaypointIndex"] = 6,
                              }, -- end of ["params"]
                            }, -- end of ["action"]
                          }, -- end of ["params"]
                        }, -- end of [1]
                      }, -- end of ["tasks"]
                    }, -- end of ["params"]
                  }, -- end of ["task"]
                  ["type"] = "Turning Point",
                  ["ETA"] = 1744.9128539618,
                  ["ETA_locked"] = false,
                  ["y"] = BS5_WP5Y,
                  ["x"] = BS5_WP5X,
                  ["formation_template"] = "",
                  ["speed_locked"] = true,
                }, -- end of [6]
              }, -- end of ["points"]
            }, -- end of ["route"]
          }, --end of ["params"]
        }--end of Mission       
        BLUESQUADRON5GROUP:SetTask(Mission)       
      end
    )
    --:SpawnInZone( SpawnZone, false, BS3_FlightLevel, BS3_FlightLevel )
    :SpawnAtAirbase( AIRBASE:FindByName( "Aleppo" ), SPAWN.Takeoff.Hot, nil, AIRBASE.TerminalType.OpenBig ) --SPAWN.Takeoff.Hot SPAWN.Takeoff.Cold / AIRBASE.TerminalType.OpenMed AIRBASE.TerminalType.OpenMedOrBig AIRBASE.TerminalType.Shelter AIRBASE.TerminalType.FighterAircraft
    --trigger.action.outText("Blue Squadron 5 Is Launching Fighters", 15) 
  end
end

function SEF_ClearAIFightersFromCarrierDeck()
  if ( GROUP:FindByName(BLUESQUADRON1GROUPNAME) ~= nil and GROUP:FindByName(BLUESQUADRON1GROUPNAME):IsAlive() ) then
    Group.getByName(BLUESQUADRON1GROUPNAME):destroy()
    trigger.action.outText("USN Fighter Squadron Has Been Cleared", 15)
  else
    trigger.action.outText("USN Fighter Squadron Is Not Currently Deployed", 15)
  end 
end

--------------------------------------------------------------------------------------------------------------------------------------------------------------------					
--////MAIN

--////RED CAP INITIALISE
timer.scheduleFunction(SEF_REDSQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerInitialMin, RedRespawnTimerInitialMax))
timer.scheduleFunction(SEF_REDSQUADRON2_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerInitialMin, RedRespawnTimerInitialMax))
timer.scheduleFunction(SEF_REDSQUADRON3_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerInitialMin, RedRespawnTimerInitialMax))
timer.scheduleFunction(SEF_REDSQUADRON4_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerInitialMin, RedRespawnTimerInitialMax))
timer.scheduleFunction(SEF_REDSQUADRON5_SCHEDULER, nil, timer.getTime() + math.random(RedRespawnTimerInitialMin, RedRespawnTimerInitialMax))

--////BLUE CAP INITIALISE
timer.scheduleFunction(SEF_BLUESQUADRON1_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerInitialMin, BlueRespawnTimerInitialMax))
timer.scheduleFunction(SEF_BLUESQUADRON2_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerInitialMin, BlueRespawnTimerInitialMax))
timer.scheduleFunction(SEF_BLUESQUADRON3_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerInitialMin, BlueRespawnTimerInitialMax))
timer.scheduleFunction(SEF_BLUESQUADRON4_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerInitialMin, BlueRespawnTimerInitialMax))
timer.scheduleFunction(SEF_BLUESQUADRON5_SCHEDULER, nil, timer.getTime() + math.random(BlueRespawnTimerInitialMin, BlueRespawnTimerInitialMax))

--------------------------------------------------------------------------------------------------------------------------------------------------------------------