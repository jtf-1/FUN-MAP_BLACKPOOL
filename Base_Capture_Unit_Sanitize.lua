BlueBase=SET_GROUP:New():FilterPrefixes("US M1025 HMMWV"):FilterActive(true):FilterOnce()
RedBase=SET_GROUP:New():FilterPrefixes("Syrian APC Tigr 233036"):FilterActive(true):FilterOnce()
DownedPilot=SET_GROUP:New():FilterPrefixes("Downed Pilot"):FilterActive(true):FilterOnce()
Crates=SET_GROUP:New():FilterPrefixes("Cargo Static Group"):FilterActive(true):FilterOnce()


All=SET_GROUP:New():FilterActive(true):FilterStart()

--=====================================================================================

local BlueBasecount=BlueBase:Count()
local BlueBasetoDestroy = BlueBasecount
  for i = 1, BlueBasetoDestroy do
    local grpObj = BlueBase:GetRandom()
    --env.info(grpObj:GetName())
    grpObj:Destroy(true)
  end
--end 

local RedBasecount=RedBase:Count()
local RedBasetoDestroy = RedBasecount
  for i = 1, RedBasetoDestroy do
    local grpObj = RedBase:GetRandom()
    --env.info(grpObj:GetName())
    grpObj:Destroy(true)
  end
--end 

local DownedPilotcount=DownedPilot:Count()
local DownedPilottoDestroy = DownedPilotcount
  for i = 1, DownedPilottoDestroy do
    local grpObj = DownedPilot:GetRandom()
    --env.info(grpObj:GetName())
    grpObj:Destroy(true)
  end
--end 

local Cratescount=Crates:Count()
local CratestoDestroy = Cratescount
  for i = 1, CratestoDestroy do
    local grpObj = Crates:GetRandom()
    --env.info(grpObj:GetName())
    grpObj:Destroy(true)
  end
--end 
