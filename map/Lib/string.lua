-- 获取一个对象的id
string.char2id = function(idChar)
    if (idChar == nil or type(idChar) ~= "string") then
        print_stack()
        return
    end
    local len = string.len(idChar)
    local id = 0
    for i = 1, len, 1 do
        if (i == 1) then
            id = string.byte(idChar, i)
        else
            id = id * 256 + string.byte(idChar, i)
        end
    end
    return id
end

-- 获取一个对象的id字符串
string.id2char = function(id)
    if (id == nil or type(id) ~= "number") then
        print_stack()
        print(id)
        return
    end
    return string.char(id // 0x1000000) .. string.char(id // 0x10000 % 0x100) ..
               string.char(id // 0x100 % 0x100) .. string.char(id % 0x100)
end

-- 获取字符串真实长度
string.mb_len = function(inputstr)
    local lenInByte = #inputstr
    local width = 0
    local i = 1
    while (i <= lenInByte) do
        local curByte = string.byte(inputstr, i)
        local byteCount = 1
        if curByte > 0 and curByte <= 127 then
            byteCount = 1 -- 1字节字符
        elseif curByte >= 192 and curByte < 223 then
            byteCount = 2 -- 双字节字符
        elseif curByte >= 224 and curByte < 239 then
            byteCount = 3 -- 汉字
        elseif curByte >= 240 and curByte <= 247 then
            byteCount = 4 -- 4字节字符
        end
        local char = string.sub(inputstr, i, i + byteCount - 1)
        i = i + byteCount -- 重置下一字节的索引
        width = width + 1 -- 字符的个数（长度）
    end
    return width
end

-- 生成MD5
string.md5 = function(t)
    if (type(t) == "string") then
        return md5.sumhexa(t)
    elseif (type(t) == "table") then
        table.sort(t)
        return md5.sumhexa(json.stringify(t))
    end
    print_err("MD5 fail!")
    return
end

-- 根据值获取一个key
string.vkey = function(t)
    if (type(t) == "string") then
        return t
    elseif (type(t) == "table") then
        local j = ""
        if (#t > 0) then
            for _, v in ipairs(t) do
                if (type(v) == "table") then
                    v = "_T_"
                else
                    v = tostring(v)
                end
                j = j .. v
            end
        else
            j = "_"
        end
        return j
    end
end

-- 转义
string.addslashes = function(s)
    local in_char = {"\\", '"', "/", "\b", "\f", "\n", "\r", "\t"}
    local out_char = {"\\", '"', "/", "b", "f", "n", "r", "t"}
    for i, c in ipairs(in_char) do s = s:gsub(c, "\\" .. out_char[i]) end
    return s
end

-- 反转义
string.stripslashes = function(s)
    local in_char = {"\\", '"', "/", "b", "f", "n", "r", "t"}
    local out_char = {"\\", '"', "/", "\b", "\f", "\n", "\r", "\t"}

    for i, c in ipairs(in_char) do s = s:gsub("\\" .. c, out_char[i]) end
    return s
end

-- base64编码
string.base64Encode = function(source_str)
    local b64chars =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    local s64 = ""
    local str = source_str

    while #str > 0 do
        local bytes_num = 0
        local buf = 0

        for byte_cnt = 1, 3 do
            buf = (buf * 256)
            if #str > 0 then
                buf = buf + string.byte(str, 1, 1)
                str = string.sub(str, 2)
                bytes_num = bytes_num + 1
            end
        end

        for group_cnt = 1, (bytes_num + 1) do
            local b64char = math.fmod(math.floor(buf / 262144), 64) + 1
            s64 = s64 .. string.sub(b64chars, b64char, b64char)
            buf = buf * 64
        end

        for fill_cnt = 1, (3 - bytes_num) do s64 = s64 .. "=" end
    end

    return s64
end

-- base64解码
string.base64Decode = function(str64)
    local b64chars =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    local temp = {}
    for i = 1, 64 do temp[string.sub(b64chars, i, i)] = i end
    temp["="] = 0
    local str = ""
    for i = 1, #str64, 4 do
        if i > #str64 then break end
        local data = 0
        local str_count = 0
        for j = 0, 3 do
            local str1 = string.sub(str64, i + j, i + j)
            if not temp[str1] then return end
            if temp[str1] < 1 then
                data = data * 64
            else
                data = data * 64 + temp[str1] - 1
                str_count = str_count + 1
            end
        end
        for j = 16, 0, -8 do
            if str_count > 0 then
                str = str .. string.char(math.floor(data / math.pow(2, j)))
                data = math.mod(data, math.pow(2, j))
                str_count = str_count - 1
            end
        end
    end

    local last = tonumber(string.byte(str, string.len(str), string.len(str)))
    if last == 0 then str = string.sub(str, 1, string.len(str) - 1) end
    return str
end

-- 把字符串以分隔符打散为数组
string.explode = function(delimeter, str)
    local res = {}
    local start, start_pos, end_pos = 1, 1, 1
    while true do
        start_pos, end_pos = string.find(str, delimeter, start, true)
        if not start_pos then break end
        table.insert(res, string.sub(str, start, start_pos - 1))
        start = end_pos + 1
    end
    table.insert(res, string.sub(str, start))
    return res
end

-- 把数组以分隔符拼接回字符串
string.implode = function(delimeter, table)
    local str
    for _, v in ipairs(table) do
        if (str == nil) then
            str = v
        else
            str = str .. delimeter .. v
        end
    end
    return str
end

-- 统计某个子串出现的首位,不包含返回-1
string.strpos = function(str, pattern)
    if (str == nil or pattern == nil) then return end
    local s = string.find(str, pattern, 0)
    return s or -1
end

-- 统计某个子串出现的次数
string.findCount = function(str, pattern)
    if (str == nil or pattern == nil) then return end
    local s
    local e = 0
    local qty = 0
    while (true) do
        s, e = string.find(str, pattern, e + 1)
        if (s == nil) then break end
        qty = qty + 1
        if (e == nil) then break end
    end
    return qty
end
