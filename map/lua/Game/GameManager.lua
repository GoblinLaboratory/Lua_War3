local CJ = require "jass.common"
local BJ = require "blizzard"
local japi = require "jass.japi"
require "Player"

GameManager = { 
    Players ={},
 }

function GameManager:new(o)  
    o = o or {}  
    setmetatable(o,self)  
    self.__index = self  
    ----------
    --setmetatable(self.["玩家1"],Player) 
    
    ----------
    return o  
end  
GameManager.__index=GameManager
--单件模式
function GameManager:Instance()  
    if self.instance == nil then  
        self.instance = self:new()  
    end  
    return self.instance  
end 
--初始化
function GameManager:Initialization()  
    for i= 1 ,12 do
        self.Players[i] = {}
        --setmetatable(self.Players[i],Player) 
        self.Players[i] =  Player:new()  
        self.Players[i].PlayerID = i
    end
    CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "主系统加载完毕。")
end
--添加玩家
function  GameManager:AddPlayer(id)
    --setmetatable(self.["玩家1"],Player) 
    --self.Players[id].PlayerID = id
    CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, "玩家"..tostring(id).."选择了英雄。")
    --CJ.DisplayTextToPlayer( CJ.Player(0), 0, 0, mj ) 
end




return GameManager

