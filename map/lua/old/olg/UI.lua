
local str=[=[
内置japi1.34更新内容:    
 1修复了 获取图像像素高 错误的bug
 2修复了 设置图像Y轴 后鼠标移动事件无效的bug
 3修复了 腾讯平台 小退后再次玩图崩溃的bug
 4修复了 错误的图片路径创建对象 导致崩溃的bug
 5修复了 设置伤害函数,伤害类型函数有几率崩溃的bug
 6修复了 获取文字字符串错误的bug
 7修复了 cj编译器崩溃的问题
 8新增 jass崩溃跟踪器
 9新增 异步掉线跟踪器 (ps:包括掉线包括跟踪lua引擎) 
 10兼容了openGL模式 不崩溃 d3d效果无效而已
 ]=]
 

    local path="UI\\Widgets\\EscMenu\\Human\\editbox-background.blp"
    local path2="ReplaceableTextures\\WorldEditUI\\Editor-Random-Item.blp"
    local path3="ReplaceableTextures\\WorldEditUI\\Editor-Random-Building.blp"
    
    local jass=require 'jass.common'
    local japi=require 'jass.japi'
    local font=japi.CreateFont()
    
    japi.SetFontHeight(font,20)
    japi.SetFontWidth(font,20*0.6)
    japi.SetFontWeight(font,500)
    japi.SetFontFaceName(font,"宋体")
    
    button=japi.CreateTexture(path2,940,208,64,64,0xFFFFFFFF,1)
    t=japi.CreateTexture(path,640,258,300,250,0xFFFFFFFF,1)
    japi.SetTextureShow(t,false)
    function ShowTip(str,x,y,width,height)
        local text={}
        local num=0 --行数
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
    ShowTip(str,640,258)

