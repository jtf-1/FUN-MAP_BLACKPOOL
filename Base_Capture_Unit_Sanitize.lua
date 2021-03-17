local BlueBasepc = 0
local RedBasepc = 0
local DownedPilotpc = 0

BlueBase=SET_GROUP:New():FilterPrefixes("US M1025 HMMWV"):FilterActive(true):FilterOnce()
RedBase=SET_GROUP:New():FilterPrefixes("Syrian APC Tigr 233036"):FilterActive(true):FilterOnce()
DownedPilot=SET_GROUP:New():FilterPrefixes("Downed Pilot"):FilterActive(true):FilterOnce()

All=SET_GROUP:New():FilterActive(true):FilterStart()

local BlueBasecount=BlueBase:Count()
local RedBasecount=RedBase:Count()
local DownedPilotcount=DownedPilot:Count()

local BlueBasetoKeep = UTILS.Round(BlueBasecount/100*BlueBasepc, 0)

--if EWRtoKeep>0 then
local BlueBasetoDestroy = BlueBasecount - BlueBasetoKeep
  for i = 1, BlueBasetoDestroy do
    local grpObj = BlueBase:GetRandom()
    --env.info(grpObj:GetName())
    grpObj:Destroy(true)

  end
--end 

local RedBasetoKeep = UTILS.Round(RedBasecount/100*RedBasepc, 0)

--if EWRtoKeep>0 then
local RedBasetoDestroy = RedBasecount - RedBasetoKeep
  for i = 1, RedBasetoDestroy do
    local grpObj = RedBase:GetRandom()
    --env.info(grpObj:GetName())
    grpObj:Destroy(true)

  end
--end 

local DownedPilottoKeep = UTILS.Round(DownedPilotcount/100*DownedPilotpc, 0)

--if EWRtoKeep>0 then
local DownedPilottoDestroy = DownedPilotcount - DownedPilottoKeep
  for i = 1, DownedPilottoDestroy do
    local grpObj = DownedPilot:GetRandom()
    --env.info(grpObj:GetName())
    grpObj:Destroy(true)

  end
--end 