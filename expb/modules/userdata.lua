local module = {}

currency = {}
function loads(mem)
if currency[mem.id] == nil then
	survive = false
	aa = io.open("expb/userdata/".. mem.id ..".lua" ,"r")
	if aa then
	for line in io.lines("expb/userdata/".. mem.id ..".lua") do if string.find(line, "return ret") then survive = true end end
end
	if aa and survive then
		currency[mem.id] = require("expb/userdata/".. mem.id)
		aa:close()
	else
		currency[mem.id] = {
		}
	end
end
end
function curfind(member) 
  load = false
  for i, k in pairs(currency) do
    if i == member.id then load = true end
    end
  if not load then loads(member) end
  end
function module.chat(message)
  if message.content == "expb.test" then
    end
  end

return module
