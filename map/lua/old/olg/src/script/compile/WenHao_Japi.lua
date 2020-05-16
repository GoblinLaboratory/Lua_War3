require "sys"
require "filesystem"
require "util"
require "mpq_util"
--local storm = require 'ffi.storm'

WenHao_Japi={}
function WenHao_Japi . Update_Plugin(self,map_path,mpq)
	--local stormlib = require 'ffi.stormlib'
	local plgpath = fs.ydwe_path() / "share" / "script" / "compile" / "WenHao_Japi_Plugin"
	--local mpq = stormlib.open(map_path)
		local result_cb = mpq:add_file("callback",  plgpath / "callback")
		local result_plg = mpq:add_file("wenhao_plugin.tga",  plgpath / "wenhao_plugin.tga")
		--mpq:close()
	log.trace("File Add Finish")	
end
