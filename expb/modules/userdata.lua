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
				weight = {0}, eatCount = {1}, prestige = {0}
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
	if type(k) == "table" then str = ""
				for c, v in pairs(k) do if c < #k then str = str .. v .."," else str = str .. v end end
		ee = ee .."ret.".. i .." = {".. str .."}\n"
		else
		ee = ee .."ret.".. i .." = ".. k .."\n"
		end
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
	return currency[member.id]
  end
function module.chat(message)
	curfind(message.member)
	for i=1, #currency[message.member.id].weight do
		if currency[message.member.id].weight[i] >= 1000000000000000000000000000000 then
			if currency[message.member.id].weight[i+1] then
				currency[message.member.id].weight[i+1] = currency[message.member.id].weight[i+1] + 1
				currency[message.member.id].weight[i] = currency[message.member.id].weight[i] - 1000000000000000000000000000000
				else currency[message.member.id].weight[i+1] = 1
				currency[message.member.id].weight[i] = currency[message.member.id].weight[i] - 1000000000000000000000000000000
				end
			end
		end
	for i=1, #currency[message.member.id].eatCount do
		if currency[message.member.id].eatCount[i] >= 1000000000000000000000000000000 then
			if currency[message.member.id].eatCount[i+1] then
				currency[message.member.id].eatCount[i+1] = currency[message.member.id].eatCount[i+1] + 1
				currency[message.member.id].eatCount[i] = currency[message.member.id].eatCount[i] - 1000000000000000000000000000000
				else currency[message.member.id].prestige[i+1] = 1
				currency[message.member.id].eatCount[i] = currency[message.member.id].eatCount[i] - 1000000000000000000000000000000
				end
			end
		end
	for i=1, #currency[message.member.id].prestige do
		if currency[message.member.id].prestige[i] >= 1000000000000000000000000000000 then
			if currency[message.member.id].prestige[i+1] then
				currency[message.member.id].prestige[i+1] = currency[message.member.id].prestige[i+1] + 1
				currency[message.member.id].prestige[i] = currency[message.member.id].prestige[i] - 1000000000000000000000000000000
				else currency[message.member.id].prestige[i+1] = 1
				currency[message.member.id].prestige[i] = currency[message.member.id].prestige[i] - 1000000000000000000000000000000
				end
			end
		end
	save(message.member)
  end

return module
