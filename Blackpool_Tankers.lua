--//////////////////////////////////////////////////////
-- Name: Operation Scarlet Dawn - Navy Module
-- Author: Surrexen    à¼¼ ã�¤ â—•_â—• à¼½ã�¤    (ã�¥ï½¡â—•â€¿â—•ï½¡)ã�¥ 
--//////////////////////////////////////////////////////
--////MAIN
-----------------
-- AWACS SPAWN --
-----------------
SPAWN:New('blueEWR_AWACS_MAGIC'):InitLimit(1,99):SpawnScheduled(60,1):InitRepeatOnLanding()
SPAWN:New('blueEWR_AWACS_DARKSTAR'):InitLimit(1,99):SpawnScheduled(60,1):InitRepeatOnLanding()
--SPAWN:New('AWACS_BEAR'):InitLimit(1,99):SpawnScheduled(60,1):InitRepeatOnEngineShutDown()


------------------
-- TANKER START --
------------------
local Tanker_KC135MPRS_Shell3 = SPAWN
   :New( "Tanker_KC135MPRS_Shell3" )
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(276.1)
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Shell3 )
     Shell3:CommandSetCallsign(3,3)
     end 
     )
     local Tanker_KC135_Texaco3 = SPAWN
   :New( "Tanker_KC135_Texaco3" )
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(276.15)
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Texaco3 )
     Texaco3:CommandSetCallsign(1,3)
     end 
     )
     local Tanker_C130_Arco3 = SPAWN
   :New( "Tanker_C130_Arco3" )
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(276.125)
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Arco3 )
     Arco3:CommandSetCallsign(2,3)
     end 
     )
     local Tanker_KC135MPRS_Shell2 = SPAWN
   :New( "Tanker_KC135MPRS_Shell2" )
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(317.775)
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Shell2 )
     Shell2:CommandSetCallsign(3,2)
     end 
     )
     local Tanker_KC135_Texaco2 = SPAWN
   :New( "Tanker_KC135_Texaco2" )
   --:InitRadioFrequency(317.725)
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(317.725)
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Texaco2 )
     Texaco2:CommandSetCallsign(1,2)
     end 
     )
     local Tanker_C130_Arco2 = SPAWN
   :New( "Tanker_C130_Arco2" )
   :InitLimit( 1, 99 )
   :InitRepeatOnLanding()
   :InitRadioFrequency(317.75)
   :SpawnScheduled( 15, 1 )
   :OnSpawnGroup(
     function( Arco2 )
     Arco2:CommandSetCallsign(2,2)
     end 
     )
     



