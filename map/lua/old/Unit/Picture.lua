
Picture = {TuBiao = {}}

function Picture:new(o)  
    o = o or {}  
    setmetatable(o,self)  
    self.__index = self  

    self:Int() 

    return o  
end  
Picture.__index=Picture
function Picture:Instance()  
    if self.instance == nil then  
        self.instance = self:new()  
    end  
    return self.instance  
end 

--初始化
function Picture:Int() 
    self.TuBiao["宝石"] = {}
    for i= 1 ,61 do
        self.TuBiao["宝石"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNbaoshi"..tostring(i)..".blp"
    end
    
    self.TuBiao["匕首"] = {}
    for i= 1 ,28 do
        self.TuBiao["匕首"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNbishou"..tostring(i)..".blp"
    end

    self.TuBiao["锤"] = {}
    for i= 1 ,79 do
        self.TuBiao["锤"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNchui"..tostring(i)..".blp"
    end

    self.TuBiao["盾"] = {}
    for i= 1 ,47 do
        self.TuBiao["盾"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNdun"..tostring(i)..".blp"
    end

    self.TuBiao["法杖"] = {}
    for i= 1 ,70 do
        self.TuBiao["法杖"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNfazhan"..tostring(i)..".blp"
    end

    self.TuBiao["符文"] = {}
    for i= 1 ,65 do
        self.TuBiao["符文"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNfuwen"..tostring(i)..".blp"
    end

    self.TuBiao["斧子"] = {}
    for i= 1 ,87 do
        self.TuBiao["斧子"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNfuzi"..tostring(i)..".blp"
    end

    self.TuBiao["弓"] = {}
    for i= 1 ,32 do
        self.TuBiao["弓"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNgong"..tostring(i)..".blp"
    end

    self.TuBiao["骨头"] = {}
    for i= 1 ,20 do
        self.TuBiao["骨头"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNgutou"..tostring(i)..".blp"
    end

    self.TuBiao["火枪"] = {}
    for i= 1 ,12 do
        self.TuBiao["火枪"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNhuoqiang"..tostring(i)..".blp"
    end

    self.TuBiao["剑"] = {}
    for i= 1 ,209 do
        self.TuBiao["剑"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNjian"..tostring(i)..".blp"
    end

    self.TuBiao["箭袋"] = {}
    for i= 1 ,10 do
        self.TuBiao["箭袋"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNjiandai"..tostring(i)..".blp"
    end

    self.TuBiao["戒指"] = {}
    for i= 1 ,70 do
        self.TuBiao["戒指"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNjiezhi"..tostring(i)..".blp"
    end

    self.TuBiao["铠甲"] = {}
    for i= 1 ,113 do
        self.TuBiao["铠甲"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNkaijia"..tostring(i)..".blp"
    end
    
    self.TuBiao["面具"] = {}
    for i= 1 ,30 do
        self.TuBiao["面具"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNmianju"..tostring(i)..".blp"
    end

    self.TuBiao["披风"] = {}
    for i= 1 ,25 do
        self.TuBiao["披风"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNpifeng"..tostring(i)..".blp"
    end

    self.TuBiao["饰品"] = {}
    for i= 1 ,51 do
        self.TuBiao["饰品"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNshipin"..tostring(i)..".blp"
    end

    self.TuBiao["书"] = {}
    for i= 1 ,16 do
        self.TuBiao["书"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNshu"..tostring(i)..".blp"
    end

    self.TuBiao["头盔"] = {}
    for i= 1 ,118 do
        self.TuBiao["头盔"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNtoukui"..tostring(i)..".blp"
    end

    self.TuBiao["项链"] = {}
    for i= 1 ,44 do
        self.TuBiao["项链"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNxianglian"..tostring(i)..".blp"
    end

    self.TuBiao["鞋"] = {}
    for i= 1 ,62 do
        self.TuBiao["鞋"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNxie"..tostring(i)..".blp"
    end

    self.TuBiao["药"] = {}
    for i= 1 ,70 do
        self.TuBiao["药"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNyao"..tostring(i)..".blp"
    end

    self.TuBiao["手套"] = {}
    for i= 1 ,47 do
        self.TuBiao["手套"][i] = "ReplaceableTextures\\CommandButtons\\CMDBTNzhua"..tostring(i)..".blp"
    end
end

return Picture