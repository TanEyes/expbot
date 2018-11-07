local module = {}
local vars = {}
function module.init(mods)
    vars.mods = mods
    end
function module.chat(m)
    local cur = vars.mods.userdata.getCurrency(m)
    vars.mods.userdata.nUpdate(m, "weight", 1, cur.weight[1] + 10)
    print("up 10")
    if m.content == "expb.weigh" then
        m:reply(vars.mods.userdata.getCurrency(m).weight[1])
        end
end

return module
