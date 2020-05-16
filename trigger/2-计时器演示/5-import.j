//TESH.scrollpos=0
//TESH.alwaysfold=0

// import(导入到地图内的路径)(要导入的内容)
// import(导入到地图内的路径)(要导入的文件的路径, true)


<?import("runtime_init.lua")  ("lua\\runtime_init.lua", true)?>
<?import("blizzard.lua")      ("lua\\blizzard.lua",     true)?>

//初始化部分
<?import("Initialization.lua")      ("Initialization.lua",     true)?>
<?import("Game.lua")      ("Game.lua",     true)?>
<?import("Global.lua")      ("Global.lua",     true)?>
//事件库
<?import("EventLib.lua")      ("Template\\EventLib.lua",     true)?>
<?import("EventTemplate.lua")      ("Template\\EventTemplate.lua",     true)?>


//系统
<?import("AnyDamagedSystem.lua")      ("War3\\AnyDamagedSystem.lua",     true)?>
<?import("DamagedSystemTrigger.lua")      ("War3\\DamagedSystemTrigger.lua",     true)?>
<?import("ChoiceHero.lua")      ("War3\\ChoiceHero.lua",     true)?>
//UI
<?import("UI.lua")      ("War3\\UI.lua",     true)?>