#ifndef XgAutoGetAttrIncluded
#define XgAutoGetAttrIncluded
library XgAutoAttrSystem
globals
hashtable XgAutoAttrSystem_htb = InitHashtable()
endglobals
<? local slk = require "slk"
bak_tostring = tostring
function tostring(s)
 if type(s) == "nil" then
   s = ""
 end
 return bak_tostring(s)
end
bak_tonumber = tonumber
tonumber=function (s)
 if type(s) == "nil" then
   s = 0
 end
 return bak_tonumber(s)
end
xg_item_attr = {
["num"]=0,
["class"]="",
['Item']={},
['AttrVal']={},
['Attr']={}
}
function string.change(str,start,ed,new)
    return str:sub(1,start-1)..new..str:sub(ed,str:len())
end
function string.split(str,f)
    local p,arr,s,q,ls,le = 1,{},""
    f = tostring(f)
    if (f=='') then return false end
    str=tostring(str)..f
    while true do
        ls,le=str:find(f,p,true)
        if ls==nil then break end
        s=str:sub(p,ls-1)
        q,_ = s:find("|c")
        s = s:gsub( " ", "")
        s = s:gsub( "|r", "")
        if q then
          s = s:gsub(
            "|c([a-z0-9A-z]+)",
            function(w) 
                return w:sub(9,w:len())
            end
          )
        end
        table.insert(arr,s)
        p=le+1
    end
    return arr
end
function XG_IsSit(id,str) --存在属性
    str,_ = str:gsub("\n","|n")
    local s = string.split(str,'|n')
    local retn,r,j,i,f = false,0
    local Ls,Le
	local result = ""
    i=1
--xg_item_attr[1]["name"] = "物理吸血%+([0-9]+)(%%)"
    while i<=#s do
        j=1
        while j<=xg_item_attr["num"] do
		
            rsz,r = s[ i ]:gsub( xg_item_attr[j]["name"],function(w)
				return w
			end)

			--
            if r>0 then
                if type(xg_item_attr[id])~="table" then
                    xg_item_attr[id]={}
                end

                rsz = rsz:match("[0-9]+%.?[0-9]*") --获取值
                if xg_item_attr[j]['code'] ~= '' then
                    Gn=xg_item_attr[j]['code']:gsub("#1",tostring(rsz))
                    f = load("return tostring( "..tostring(Gn).." )" )
					rsz = f()
                end
                rsz = tonumber(rsz) +tonumber( xg_item_attr[id][ xg_item_attr[j]["int"] ] )
                xg_item_attr[id][ xg_item_attr[j]["int"] ] = rsz
                if #xg_item_attr['Attr'] == 0 then
                        table.insert(xg_item_attr['Attr'], xg_item_attr[j]["int"])
                        table.insert(xg_item_attr['AttrVal'], rsz)
                else
                    for n=1,#xg_item_attr['Attr'] do
                        if xg_item_attr['Attr'][n] == xg_item_attr[j]["int"] then
                            xg_item_attr['AttrVal'][n] = rsz
                            break
                        elseif n>=#xg_item_attr['Attr'] then
                            table.insert(xg_item_attr['Attr'], xg_item_attr[j]["int"])
                            table.insert(xg_item_attr['AttrVal'], rsz)
                            break
                        end
                    end--for n
                end
                retn = true
              j=2^20
              if i>#s then break end
            end --if r>0
            j=j+1
        end
        i=i+1
    end
    
        if r >0 then
             result = result.."call SaveInteger(XgAutoAttrSystem_htb,'"..tostring(id).."',0,"..tostring(#xg_item_attr['Attr'])..")\r\n"
		end
		for i=1,#xg_item_attr['Attr'] do
				result = result.."call SaveInteger(XgAutoAttrSystem_htb,'"..tostring(id).."',"..tostring(i)..","..tostring(xg_item_attr['Attr'][i])..")\r\n"..
				"call SaveReal(XgAutoAttrSystem_htb,'"..tostring(id).."',"..tostring(xg_item_attr['Attr'][i])..","..tostring(xg_item_attr['AttrVal'][i])..")\r\n"
		end
    xg_item_attr['Attr']={}
    xg_item_attr['AttrVal']={}
    return result
end
    function XG_AutoAttr_Start_Lua()
		local result = ""
        for id, obj in pairs(slk.item) do
                if  obj.class == xg_item_attr["class"] or xg_item_attr["class"]==''  then
					result = result..XG_IsSit(id,obj.Ubertip)
                end
            end

        return 'DoNothing()\r\n'..result
    end
    function XG_AutoAttr_SetClass_Lua(str)
        xg_item_attr["class"] = str
        return 'DoNothing()'
    end
    function XG_AutoAttr_AddAttr_Lua(s,a,v,c)
        local n = xg_item_attr["num"]+1
        xg_item_attr["num"] = n
        xg_item_attr[n]=
            {
                ["name"] =  s,
                ["int"] = a,
                ['code'] = c
            }
            return 'XG_AutoAttr_AddAttr('..a..',"'..v..'")'
    end
 ?>
 function XG_AutoAttr_AddAttr takes integer a,string v returns nothing
    local integer i = LoadInteger(XgAutoAttrSystem_htb,0,0)+1
    call SaveInteger(XgAutoAttrSystem_htb,0,i,a)
    call SaveStr(XgAutoAttrSystem_htb,0,i,v)
    call SaveInteger(XgAutoAttrSystem_htb,0,0,i)
 endfunction
 function XG_AutoAttr_GetAttrNum takes integer i returns integer
    return LoadInteger(XgAutoAttrSystem_htb, i, 0)
 endfunction
  function XG_AutoAttr_GetAttrKey takes integer i,integer a returns integer
    return LoadInteger(XgAutoAttrSystem_htb, i, a)
 endfunction
  function XG_AutoAttr_GetAttrVal takes integer i,integer a returns real
    return LoadReal(XgAutoAttrSystem_htb, i, a)
 endfunction

endlibrary
#endif

