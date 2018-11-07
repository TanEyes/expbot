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
				for c, v in pairs(k) do if c < #k then str = str .. string.format("%.5f",v) .."," else str = str .. string.format("%.5f",v) end end
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
	curfind(message.author)
	for i=1, #currency[message.author.id].weight do
		print(currency[message.author.id].weight[i])
		while currency[message.author.id].weight[i] >= 100000000000000000000000000000000000000000000000000000000000 do if currency[message.author.id].weight[i] >= 100000000000000000000000000000000000000000000000000000000000 then
			if currency[message.author.id].weight[i+1] then
				currency[message.author.id].weight[i+1] = currency[message.author.id].weight[i+1] + 1
				currency[message.author.id].weight[i] = currency[message.author.id].weight[i] - 100000000000000000000000000000000000000000000000000000000000
				else currency[message.author.id].weight[i+1] = 1
				currency[message.author.id].weight[i] = currency[message.author.id].weight[i] - 100000000000000000000000000000000000000000000000000000000000
				end
			end
		end end
	for i=1, #currency[message.author.id].eatCount do
		while currency[message.author.id].eatCount[i] >= 100000000000000000000000000000000000000000000000000000000000 do
		if currency[message.author.id].eatCount[i] >= 100000000000000000000000000000000000000000000000000000000000 then
			if currency[message.author.id].eatCount[i+1] then
				currency[message.author.id].eatCount[i+1] = currency[message.author.id].eatCount[i+1] + 1
				currency[message.author.id].eatCount[i] = currency[message.author.id].eatCount[i] - 100000000000000000000000000000000000000000000000000000000000
				else currency[message.author.id].prestige[i+1] = 1
				currency[message.author.id].eatCount[i] = currency[message.author.id].eatCount[i] - 100000000000000000000000000000000000000000000000000000000000
				end
			end
		end end
	for i=1, #currency[message.author.id].prestige do
		while currency[message.author.id].prestige[i] >= 100000000000000000000000000000000000000000000000000000000000 do
			if currency[message.author.id].prestige[i] >= 100000000000000000000000000000000000000000000000000000000000 then
			if currency[message.author.id].prestige[i+1] then
				currency[message.author.id].prestige[i+1] = currency[message.author.id].prestige[i+1] + 1
				currency[message.author.id].prestige[i] = currency[message.author.id].prestige[i] - 100000000000000000000000000000000000000000000000000000000000
				else currency[message.author.id].prestige[i+1] = 1
				currency[message.author.id].prestige[i] = currency[message.author.id].prestige[i] - 100000000000000000000000000000000000000000000000000000000000
				end
			end
		end end
	save(message.author)
  end

function module.getCurrency(member)
	return curfind(member)
	end

function module.nUpdate(member, table, id, value)
	currency[member.id][table][id] = value
	save(member)
	end

return module
