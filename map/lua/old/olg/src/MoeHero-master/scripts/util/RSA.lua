
local bignum = require "jass.bignum"

local rsa = {}

-- RSA公钥
rsa.e = "00010001"
rsa.n = "A6040BC5737510DFF2E4DF965D50338855E151AABF8DE41854B129F862438DB933427C7006210C6B73A4846C2422C490808A45E1119FC5DEE4F9B8AC9B0657D65CBB09BC1B3E71872F998A307542BF9F5D31C8559EB070128805D8C75E3D0F7604C9A3DD7B37A87A8746F7F92678198946A46F22ED60987B6110D4382EB4EB6D8B857216CD5CFBF5F396D6E19D2B4E140AAF850E3EDC0851E47B83F7678D1F706CE4A15B11205540811DE28EFA1426C2CB4F1A35C4256AB5AFEAA32FAB25675334530D8B8ACA71AD8AD3ED4B3B02895F4CEEA7F97B2E6E41655262147D5D5A7ED69E4E7D4A132691E1BD8728F648DE468787312A62DA4DFC5E3DC008F6A87CB1"

-- RSA私钥
local suc, key = pcall(require, '(ppk)')
rsa.d = suc and key

function rsa:init()
    if self.e then self.e_bn = bignum.new(bignum.bin(self.e)) end
    if self.n then self.n_bn = bignum.new(bignum.bin(self.n)) end
    if self.d then self.d_bn = bignum.new(bignum.bin(self.d)) end
end

function rsa:encrypt(c)
    local c_bn = bignum.new(c)
    local m_bn = c_bn:powmod(self.e_bn, self.n_bn)
    return tostring(m_bn)
end

function rsa:decrypt(m)
    local m_bn = bignum.new(m)
    local c_bn = m_bn:powmod(self.d_bn, self.n_bn)
    return tostring(c_bn)
end

rsa:init()

local sha1 = bignum.sha1

--生成签名
--	文本
function rsa:get_sign(content)
	return self:decrypt(sha1(content))
end

--验证签名
--	文本
--	签名
function rsa:check_sign(content, sign)
	return sha1(content) == self:encrypt(sign)
end

return rsa
