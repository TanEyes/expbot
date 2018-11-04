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
function save(member)
	if type(currency[member.id]) == "table" then
aa = io.open("expb/userdata/".. member.id ..".lua", "w")
io.output(aa)
ee= ""
for i, k in pairs(currency[member.id]) do
ee = ee .."ret.".. i .." = ".. k .."\n"
end
io.write("ret = {} ".. ee .."\nreturn ret")
io.close()
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
	curfind(message.member)
	save(message.member)
  end

return module
