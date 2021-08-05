env.info("CSAR Loading", false)

-- Instantiate and start a CSAR for the blue side, with template "Downed Pilot" and alias "Luftrettung"
   local blackpool_csar = CSAR:New(coalition.side.BLUE,"Downed Pilot","Downed Pilot")
   -- options
   blackpool_csar.allowDownedPilotCAcontrol = false -- Set to false if you don\'t want to allow control by Combined Arms.
   blackpool_csar.allowFARPRescue = true -- allows pilots to be rescued by landing at a FARP or Airbase. Else MASH only!
   blackpool_csar.autosmoke = true -- automatically smoke a downed pilot\'s location when a heli is near.
   blackpool_csar.autosmokedistance = 1000 -- distance for autosmoke
   blackpool_csar.coordtype = 1 -- Use Lat/Long DDM (0), Lat/Long DMS (1), MGRS (2), Bullseye imperial (3) or Bullseye metric (4) for coordinates.
   blackpool_csar.csarOncrash = true -- (WIP) If set to true, will generate a downed pilot when a plane crashes as well.
   blackpool_csar.enableForAI = false -- set to false to disable AI pilots from being rescued.
   blackpool_csar.pilotRuntoExtractPoint = true -- Downed pilot will run to the rescue helicopter up to blackpool_csar.extractDistance in meters. 
   blackpool_csar.extractDistance = 500 -- Distance the downed pilot will start to run to the rescue helicopter.
   blackpool_csar.immortalcrew = true -- Set to true to make wounded crew immortal.
   blackpool_csar.invisiblecrew = false -- Set to true to make wounded crew insvisible.
   blackpool_csar.loadDistance = 75 -- configure distance for pilots to get into helicopter in meters.
   blackpool_csar.mashprefix = {"MASH"} -- prefixes of #GROUP objects used as MASHes.
   blackpool_csar.max_units = 6 -- max number of pilots that can be carried if #CSAR.AircraftType is undefined.
   blackpool_csar.messageTime = 15 -- Time to show messages for in seconds. Doubled for long messages.
   blackpool_csar.radioSound = "beacon.ogg" -- the name of the sound file to use for the pilots\' radio beacons. 
   blackpool_csar.smokecolor = 4 -- Color of smokemarker, 0 is green, 1 is red, 2 is white, 3 is orange and 4 is blue.
   blackpool_csar.useprefix = true  -- Requires CSAR helicopter #GROUP names to have the prefix(es) defined below.
   blackpool_csar.csarPrefix = { "helicargo", "MEDEVAC", "zz"} -- #GROUP name prefixes used for useprefix=true - DO NOT use # in helicopter names in the Mission Editor! 
   blackpool_csar.verbose = 0 -- set to > 1 for stats output for debugging.
   -- (added 0.1.4) limit amount of downed pilots spawned by **ejection** events
   blackpool_csar.limitmaxdownedpilots = true
   blackpool_csar.maxdownedpilots = 10 
   -- (added 0.1.8) - allow to set far/near distance for approach and optionally pilot must open doors
   blackpool_csar.approachdist_far = 5000 -- switch do 10 sec interval approach mode, meters
   blackpool_csar.approachdist_near = 3000 -- switch to 5 sec interval approach mode, meters
   blackpool_csar.pilotmustopendoors = false -- switch to true to enable check of open doors
   -- start the FSM
   blackpool_csar:__Start(5)

env.info("CSAR Complete", false)