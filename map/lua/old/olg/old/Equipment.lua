-- 装备类

Equipment = {Liliang = 0, ZhiHui = 0, MinJie = 0,GongJi = 0 ,HuJia = 0,YiDongSuDu = 0,
GongJiSuDu = 0, ShengMingShangXian = 0,ShengMingHuiFu = 0,MoFaShangXian = 0 ,MoFaHuiFu = 0, ZiDingYi = 0,MoFaKangXing = 0 ,Types = "物品",
PinZhi = "普通" , Name = "名称",TuBiao = "图标", Explain = "说明",ID = 0,ZHUANGBEIDENGJI = 1}

-- 派生类的方法 new
function Equipment:new (o,ll,zh,mj,gj,hj,yd,gs,smsx,smhf,mfsx,mfhf,mfkx,zdy,ty,pz,na,tb,ex)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  self.Liliang = ll or 0
  self.ZhiHui = zh or 0
  self.MinJie = mj or 0
  self.GongJi = gj or 0
  self.HuJia = hj or 0
  self.YiDongSuDu = yd or 0
  self.GongJiSuDu = gs or 0
  --self.ShengMing = sm or 0
  self.ShengMingShangXian = smsx or 0
  self.ShengMingHuiFu = smhf or 0
  --self.MoFa = mf or 0
  self.MoFaShangXian = mfsx or 0
  self.MoFaHuiFu = mfhf or 0
  self.MoFaKangXing  =mfkx or 0
  self.ZiDingYi = zdy or 0
  self.Types = ty or "物品"
  self.PinZhi = pz or "普通"
  self.Name = na or "名称"
  self.TuBiao = tb or "图标"
  self.Explain = ex or "说明"
  --self.ZHUANGBEIDENGJI = 1;
  return o
end
--定义元表的__index 的元方法  
--对任何找不到的键，都会返回'undefined'  
Equipment.__index=Equipment
function Equipment:SetValue (ll,zh,mj,gj,hj,yd,gs,smsx,smhf,mfsx,mfhf,mfkx,zdy,ty,pz,na,tb,ex)
  self.Liliang = ll or 0
  self.ZhiHui = zh or 0
  self.MinJie = mj or 0
  self.GongJi = gj or 0
  self.HuJia = hj or 0
  self.YiDongSuDu = yd or 0
  self.GongJiSuDu = gs or 0
  --self.ShengMing = sm or 0
  self.ShengMingShangXian = smsx or 0
  self.ShengMingHuiFu = smhf or 0
  --self.MoFa = mf or 0
  self.MoFaShangXian = mfsx or 0
  self.MoFaHuiFu = mfhf or 0
  self.MoFaKangXing  =mfkx or 0
  self.ZiDingYi = zdy or 0
  self.Types = ty or "物品"
  self.PinZhi = pz or "普通"
  self.Name = na or "名称"
  self.TuBiao = tb or "图标"
  self.Explain = ex or "说明"
  --self.ZHUANGBEIDENGJI = 1;

end
-- 基础类方法 printArea
function Equipment:printArea ()
  print(self.Type)
end

return Equipment
-- 创建对象
--myshape = Equipment:new(nil,0,0,0,0,0,0,0,0,0,0,0,0,0,"物品","普通","名称","图标","说明")

--myshape:printArea()