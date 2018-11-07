local module = {}
local vars = {}
function module.init(mods)
    vars.mods = mods
    end
function module.chat(m)
    local cur = vars.mods.userdata.getCurrency(m.member)
    vars.mods.userdata.nUpdate(m.member, "weight", 1, cur.weight[1] * 100)
    print("multiply 100")
    if m.content == "expb.weigh" then
        weigh = vars.mods.userdata.getCurrency(m.member)
        if weigh.weight[#weigh.weight-1] then str = weigh.weight[#weigh.weight-1]
            while string.len(str) < string.len("1000000000000000000000000000000000000000000000000000000000000000000000000000000000") do
                str = "0" .. str end str = "." ..str 
        else str = "" end
        m:reply(weigh.weight[#weigh.weight] .. str)
        end
end

return module
