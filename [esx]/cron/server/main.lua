local Jobs     = {}
local LastTime = nil

function RunAt(h, m, cb)

	table.insert(Jobs, {
		h  = h,
		m  = m,
		cb = cb
	})

end

function GetTime()

	local timestamp = os.time()
	local d         = os.date('*t', timestamp).wday
	local h         = tonumber(os.date('%H', timestamp))
	local m         = tonumber(os.date('%M', timestamp))

	return {d = d, h = h, m = m}

end

function OnTime(d, h, m)

	for i=1, #Jobs, 1 do
		if Jobs[i].h == h and Jobs[i].m == m then
			Jobs[i].cb(d, h, m)
		end
	end

end

function Tick()

	local time = GetTime()

	if time.h ~= LastTime.h or time.m ~= LastTime.m then
		OnTime(time.d, time.h, time.m)
		LastTime = time
	end

	SetTimeout(60000, Tick)
end

LastTime = GetTime()

Tick()

AddEventHandler('cron:runAt', function(h, m, cb)
	RunAt(h, m, cb)
end)

--ANWB Open
function anwbo(d, h, m)
	TriggerClientEvent('chat:addMessage', -1, { 
		template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 126, 0, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
		args = { "🔧 ANWB Wegenwacht", 'Wij zijn open voor het tunen van uw voertuig.' }, color = { 255, 255, 255 } -- 128, 128, 128
	})
  end
  
  TriggerEvent('cron:runAt', 14, 00, anwbo)
  TriggerEvent('cron:runAt', 20, 00, anwbo)

  --ANWB dicht
  function anwbd(d, h, m)
	TriggerClientEvent('chat:addMessage', -1, { 
		template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(255, 126, 0, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>', --{0}:<br> {1}</div>
		args = { "🔧 ANWB Wegenwacht", 'Momenteel zijn wij gesloten voor het tunen van uw voertuig.' }, color = { 255, 255, 255 } -- 128, 128, 128
	})
  end
  
  TriggerEvent('cron:runAt', 16, 00, anwbd)
  TriggerEvent('cron:runAt', 22, 00, anwbd)
