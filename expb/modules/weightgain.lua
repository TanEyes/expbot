local module = {}
local vars = {}
function module.init(mods)
    vars.mods = mods
    end
function module.chat(m)
    local cur = vars.mods.userdata.getCurrency(m.member)
    vars.mods.userdata.nUpdate(m.member, "weight", 1, cur.weight[1] ^ 2)
    print("power 2")
    if m.content == "expb.weigh" then
        m:reply(vars.mods.userdata.getCurrency(m.member).weight[1])
        end
end

return module
