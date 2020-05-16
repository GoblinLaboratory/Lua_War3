require "Lib\\table"
Picture = {TuBiao = {}, I = {}}
function Picture:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self

    self:Int()

    return o
end
Picture.__index = Picture
function Picture:Instance()
    if self.instance == nil then self.instance = self:new() end
    return self.instance
end

function Picture:Int()
    self.TuBiao["宝石"] = {}
    self.I["宝石"] = {S = 86}
    for i = 1, 86 do
        self.TuBiao["宝石"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNbaoShi" .. tostring(i) ..
                ".blp"
    end
    -- 武器
    self.TuBiao["剑"] = {}
    self.I["剑"] = {S = 144}
    for i = 1, 144 do
        self.TuBiao["剑"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNJian" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["匕首"] = {}
    self.I["匕首"] = {S = 74}
    for i = 1, 74 do
        self.TuBiao["匕首"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNBiShou" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["斧"] = {}
    self.I["斧"] = {S = 115}
    for i = 1, 115 do
        self.TuBiao["斧"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNFu" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["锤"] = {}
    self.I["锤"] = {S = 92}
    for i = 1, 92 do
        self.TuBiao["锤"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNChui" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["弓"] = {}
    self.I["弓"] = {S = 45}
    for i = 1, 45 do
        self.TuBiao["弓"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNGong" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["法杖"] = {}
    self.I["法杖"] = {S = 75}
    for i = 1, 75 do
        self.TuBiao["法杖"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNFaZhang" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["盾"] = {}
    self.I["盾"] = {S = 37}
    for i = 1, 37 do
        self.TuBiao["盾"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNDun" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["骨头"] = {}
    self.I["骨头"] = {S = 15}
    for i = 1, 15 do
        self.TuBiao["骨头"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNGuTou" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["书籍"] = {}
    self.I["书籍"] = {S = 15}
    for i = 1, 15 do
        self.TuBiao["书籍"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNShuJi" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["箭袋"] = {}
    self.I["箭袋"] = {S = 10}
    for i = 1, 10 do
        self.TuBiao["箭袋"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNJianDai" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["头部布甲"] = {}
    self.I["头部布甲"] = {S = 68}
    for i = 1, 68 do
        self.TuBiao["头部布甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNTouBu" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["头部皮甲"] = {}
    self.I["头部皮甲"] = {S = 20}
    for i = 1, 20 do
        self.TuBiao["头部皮甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNTouPi" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["头部板甲"] = {}
    self.I["头部板甲"] = {S = 40}
    for i = 1, 40 do
        self.TuBiao["头部板甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNTouBan" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["胸部板甲"] = {}
    self.I["胸部板甲"] = {S = 97}
    for i = 1, 97 do
        self.TuBiao["胸部板甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNXiongbBan" ..
                tostring(i) .. ".blp"
    end
    self.TuBiao["胸部皮甲"] = {}
    self.I["胸部皮甲"] = {S = 49}
    for i = 1, 49 do
        self.TuBiao["胸部皮甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNXiongbPi" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["胸部布甲"] = {}
    self.I["胸部布甲"] = {S = 86}
    for i = 1, 86 do
        self.TuBiao["胸部布甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNXiongbBu" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["腰部布甲"] = {}
    self.I["腰部布甲"] = {S = 23}
    for i = 1, 23 do
        self.TuBiao["腰部布甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNYaoBu" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["腰部皮甲"] = {}
    self.I["腰部皮甲"] = {S = 21}
    for i = 1, 21 do
        self.TuBiao["腰部皮甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNYaoPi" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["腰部板甲"] = {}
    self.I["腰部板甲"] = {S = 30}
    for i = 1, 30 do
        self.TuBiao["腰部板甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNYaoBan" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["腿部布甲"] = {}
    self.I["腿部布甲"] = {S = 47}
    for i = 1, 47 do
        self.TuBiao["腿部布甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNTuiBu" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["腿部皮甲"] = {}
    self.I["腿部皮甲"] = {S = 35}
    for i = 1, 35 do
        self.TuBiao["腿部皮甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNTuiPi" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["腿部板甲"] = {}
    self.I["腿部板甲"] = {S = 54}
    for i = 1, 54 do
        self.TuBiao["腿部板甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNTuiBan" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["手部布甲"] = {}
    self.I["手部布甲"] = {S = 90}
    for i = 1, 90 do
        self.TuBiao["手部布甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNCouBu" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["手部皮甲"] = {}
    self.I["手部皮甲"] = {S = 90}
    for i = 1, 90 do
        self.TuBiao["手部皮甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNCouBu" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["手部板甲"] = {}
    self.I["手部板甲"] = {S = 90}
    for i = 1, 90 do
        self.TuBiao["手部板甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNCouBu" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["脚部布甲"] = {}
    self.I["脚部布甲"] = {S = 27}
    for i = 1, 27 do
        self.TuBiao["脚部布甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNXieBu" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["脚部皮甲"] = {}
    self.I["脚部皮甲"] = {S = 60}
    for i = 1, 60 do
        self.TuBiao["脚部皮甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNXiePi" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["脚部板甲"] = {}
    self.I["脚部板甲"] = {S = 20}
    for i = 1, 20 do
        self.TuBiao["脚部板甲"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNXieBan" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["项链"] = {}
    self.I["项链"] = {S = 71}
    for i = 1, 71 do
        self.TuBiao["项链"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNXiangLian" ..
                tostring(i) .. ".blp"
    end
    self.TuBiao["戒指"] = {}
    self.I["戒指"] = {S = 73}
    for i = 1, 73 do
        self.TuBiao["戒指"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNJieZhi" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["披风"] = {}
    self.I["披风"] = {S = 24}
    for i = 1, 24 do
        self.TuBiao["披风"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNPiFeng" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["植物"] = {}
    self.I["植物"] = {S = 50}
    for i = 1, 50 do
        self.TuBiao["植物"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNCaoYao" .. tostring(i) ..
                ".blp"
    end
    self.TuBiao["药水"] = {}
    self.I["药水"] = {S = 156}
    for i = 1, 156 do
        self.TuBiao["药水"][i] =
            "ReplaceableTextures\\CommandButtons\\CMDBTNYaoShui" .. tostring(i) ..
                ".blp"
    end
end
function Picture:getIcon(id)
    -- -- print(table.getn(self.TuBiao[id]))
    -- local len = 0
    -- for _, _ in pairs(self.TuBiao[id]) do len = len + 1 end
    -- print(table.getn(len))
    local i = math.random(1, self.I[id].S)
    return self.TuBiao[id][i]
end
return Picture
