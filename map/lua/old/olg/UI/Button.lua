local jass=require 'jass.common'
local japi=require 'jass.japi'

local font=japi.CreateFont()
japi.SetFontHeight(font,20)
japi.SetFontWidth(font,20*0.6)
japi.SetFontWeight(font,500)
japi.SetFontFaceName(font,"宋体")

Button = {}

Button.path="UI\\Widgets\\EscMenu\\Human\\editbox-background.blp"
Button.path2="ReplaceableTextures\\WorldEditUI\\Editor-Random-Item.blp"
Button.path3="ReplaceableTextures\\WorldEditUI\\Editor-Random-Building.blp"

Button.Texture = japi.CreateTexture(path2,940,208,64,64,0xFFFFFFFF,1)
Button.t=japi.CreateTexture(path,640,258,300,250,0xFFFFFFFF,1)
japi.SetTextureShow(t,false)

function Button:ShowTip(str,x,y,width,height)
    local text={}
    local num=0
    str:gsub('([^\n]+)\n',function (line)
        text[num]=japi.CreateText(font,"",x,768-300-num*20,9999,0xFFFFFFFF)
        num=num+1
    end)
    local function ShowText(b)
        japi.SetTextureShow(t,b)
        num=0
        str:gsub('([^\n]+)\n',function (line)
            if (b==true) then
                japi.SetTextString(text[num],line)
            else
                japi.SetTextString(text[num],"")
            end
            num=num+1
        end)
    end
    japi.TextureAddEvent(button,0x200,function ()
        japi.SetTexture(button,path3)
        ShowText(true)
    end,function ()
        japi.SetTexture(button,path2)
        ShowText(false)
    end)
end

return Button
