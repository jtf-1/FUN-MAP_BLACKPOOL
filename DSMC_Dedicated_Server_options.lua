-- Dynamic Sequential Mission Campaign -- Dedicated server option file

-- Server auto-save options
-- Choosing this option require desanitization of MissionScripting.lua. 
-- If you didn't already done that, DSMC will do that for you!
DSMC_AutosaveProcess		= true		-- true / false. 
DSMC_AutosaveProcess_min	= 5			-- minutes, number, from 2 to 480

-- those variables are the same you find in options menù. They are checked by the loader.lua only
-- after options menù! So if you're running with graphics, those options will be used. If you're
-- running dedicated server, it will use the variables below.

-- Save scenery enhancement
DSMC_MapPersistence 		= true		-- true / false
DSMC_StaticDeadUnits 		= false		-- true / false
DSMC_UpdateStartTime		= true 		-- true / false
DSMC_UpdateStartTime_mode	= 1 		-- Ignored if UpdateStartTime is false. 1 = keep continous scenery. 2 = start the next day, random hour
DSMC_TrackWarehouses		= false	 	-- true / false
DSMC_TrackSpawnedUnits		= true	 	-- true / false
DSMC_WeatherUpdate          = false      -- true / false
DSMC_ExportDocuments        = true      -- true / false
DSMC_CreateClientSlot       = true      -- true / false

-- CTLD setup stuff
DSMC_automated_CTLD			= true	 	-- true / false
DSMC_CTLD_RealSlingload		= false	 	-- true / false


-- Debug. Leave on only for bugtracking!!!
DSMC_DebugMode				= false		-- true / false

-- Server-side only options
DSMC_WarehouseAutoSetup     = true      -- true / false If true, at each mission end the supply net will be automatically rebuilt. Check manual!
DSMC_DisableF10save			= true      -- true / false F10 menù save option disable switch
DSMC_AutosaveExit_hours		= 24        -- hours of simulation after with DCS closes, from 0 to 24 (higher values won't be accepted). If clients are online, it will delay 5 minutes and so on till nobody is online.





-- ##################################################################
-- ADVANCED SERVER CUSTOMIZATION  ## TOUCH THIS AT YOUR OWN RISKS! ##
-- ##################################################################

-- warehouse fix base quantity
DSMC_baseQuantity                   = 0         -- number, from 0 to 1000, which is the quantity used when fixing warehouses

-- CTLD advanced setup
DSMC_CTLD_JTACenable                = true      -- true / false. If set false, you won't be able to spawn JTACs
DSMC_CTLD_AllowCrates               = true      -- true / false
DSMC_CTLD_AllowPlatoon		        = false	 	-- true / false     BEWARE: using platoons mode will require you to set up some factories around. Check manual!
DSMC_CTLD_crateReductionFactor      = 1.5       -- number, from 1 to 4 with fraction allowed. This is the required crate reduction factor number for platoons. 1 means about 8-12 crates/platoon, 1.5 means 5-8 crates/platoon, 2 means 2-6 crates/platoon, and so on.
DSMC_CTLD_UseYearFilter             = true      -- true / false  
DSMC_CTLD_UnitNumLimits             = false      -- true / false
DSMC_CTLD_Limit_APC                 = 200       -- number
DSMC_CTLD_Limit_IFV                 = 150       -- number
DSMC_CTLD_Limit_Tanks               = 80        -- number
DSMC_CTLD_Limit_ads                 = 50        -- number
DSMC_CTLD_Limit_Arty                = 60        -- number

-- Save scenery enhancement
DSMC_BuilderToolsBeta 		        = false		-- true / false -- Leave FALSE ALWAYS