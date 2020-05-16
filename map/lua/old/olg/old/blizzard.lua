local _mt_number = { __index = function() return 0 end }
local _mt_boolean = { __index = function() return false end }
local _mt_string = { __index = function() return "" end }

local function ExecuteFunc(s)
    if _G[s] and type(_G[s]) == 'function' then
        pcall(_G[s])
    else
	    jass.ExecuteFunc(s)
    end
end










bj_PI = 3.14159
bj_E = 2.71828
bj_CELLWIDTH = 128.0
bj_CLIFFHEIGHT = 128.0
bj_UNIT_FACING = 270.0
bj_RADTODEG = 180.0 / bj_PI
bj_DEGTORAD = bj_PI / 180.0
bj_TEXT_DELAY_QUEST = 20.00
bj_TEXT_DELAY_QUESTUPDATE = 20.00
bj_TEXT_DELAY_QUESTDONE = 20.00
bj_TEXT_DELAY_QUESTFAILED = 20.00
bj_TEXT_DELAY_QUESTREQUIREMENT = 20.00
bj_TEXT_DELAY_MISSIONFAILED = 20.00
bj_TEXT_DELAY_ALWAYSHINT = 12.00
bj_TEXT_DELAY_HINT = 12.00
bj_TEXT_DELAY_SECRET = 10.00
bj_TEXT_DELAY_UNITACQUIRED = 15.00
bj_TEXT_DELAY_UNITAVAILABLE = 10.00
bj_TEXT_DELAY_ITEMACQUIRED = 10.00
bj_TEXT_DELAY_WARNING = 12.00
bj_QUEUE_DELAY_QUEST = 5.00
bj_QUEUE_DELAY_HINT = 5.00
bj_QUEUE_DELAY_SECRET = 3.00
bj_HANDICAP_EASY = 60.00
bj_GAME_STARTED_THRESHOLD = 0.01
bj_WAIT_FOR_COND_MIN_INTERVAL = 0.10
bj_POLLED_WAIT_INTERVAL = 0.10
bj_POLLED_WAIT_SKIP_THRESHOLD = 2.00

bj_MAX_INVENTORY = 6
bj_MAX_PLAYERS = 12
bj_PLAYER_NEUTRAL_VICTIM = 13
bj_PLAYER_NEUTRAL_EXTRA = 14
bj_MAX_PLAYER_SLOTS = 16
bj_MAX_SKELETONS = 25
bj_MAX_STOCK_ITEM_SLOTS = 11
bj_MAX_STOCK_UNIT_SLOTS = 11
bj_MAX_ITEM_LEVEL = 10


bj_TOD_DAWN = 6.00
bj_TOD_DUSK = 18.00









bj_MELEE_STARTING_TOD = 8.00
bj_MELEE_STARTING_GOLD_V0 = 750
bj_MELEE_STARTING_GOLD_V1 = 500
bj_MELEE_STARTING_LUMBER_V0 = 200
bj_MELEE_STARTING_LUMBER_V1 = 150
bj_MELEE_STARTING_HERO_TOKENS = 1
bj_MELEE_HERO_LIMIT = 3
bj_MELEE_HERO_TYPE_LIMIT = 1
bj_MELEE_MINE_SEARCH_RADIUS = 2000
bj_MELEE_CLEAR_UNITS_RADIUS = 1500
bj_MELEE_CRIPPLE_TIMEOUT = 120.00
bj_MELEE_CRIPPLE_MSG_DURATION = 20.00
bj_MELEE_MAX_TWINKED_HEROES_V0 = 3
bj_MELEE_MAX_TWINKED_HEROES_V1 = 1

bj_CREEP_ITEM_DELAY = 0.50

bj_STOCK_RESTOCK_INITIAL_DELAY = 120
bj_STOCK_RESTOCK_INTERVAL = 30
bj_STOCK_MAX_ITERATIONS = 20

bj_MAX_DEST_IN_REGION_EVENTS = 64

bj_CAMERA_MIN_FARZ = 100
bj_CAMERA_DEFAULT_DISTANCE = 1650
bj_CAMERA_DEFAULT_FARZ = 5000
bj_CAMERA_DEFAULT_AOA = 304
bj_CAMERA_DEFAULT_FOV = 70
bj_CAMERA_DEFAULT_ROLL = 0
bj_CAMERA_DEFAULT_ROTATION = 90

bj_RESCUE_PING_TIME = 2.00

bj_NOTHING_SOUND_DURATION = 5.00
bj_TRANSMISSION_PING_TIME = 1.00
bj_TRANSMISSION_IND_RED = 255
bj_TRANSMISSION_IND_BLUE = 255
bj_TRANSMISSION_IND_GREEN = 255
bj_TRANSMISSION_IND_ALPHA = 255
bj_TRANSMISSION_PORT_HANGTIME = 1.50

bj_CINEMODE_INTERFACEFADE = 0.50
bj_CINEMODE_GAMESPEED = MAP_SPEED_NORMAL

bj_CINEMODE_VOLUME_UNITMOVEMENT = 0.40
bj_CINEMODE_VOLUME_UNITSOUNDS = 0.00
bj_CINEMODE_VOLUME_COMBAT = 0.40
bj_CINEMODE_VOLUME_SPELLS = 0.40
bj_CINEMODE_VOLUME_UI = 0.00
bj_CINEMODE_VOLUME_MUSIC = 0.55
bj_CINEMODE_VOLUME_AMBIENTSOUNDS = 1.00
bj_CINEMODE_VOLUME_FIRE = 0.60

bj_SPEECH_VOLUME_UNITMOVEMENT = 0.25
bj_SPEECH_VOLUME_UNITSOUNDS = 0.00
bj_SPEECH_VOLUME_COMBAT = 0.25
bj_SPEECH_VOLUME_SPELLS = 0.25
bj_SPEECH_VOLUME_UI = 0.00
bj_SPEECH_VOLUME_MUSIC = 0.55
bj_SPEECH_VOLUME_AMBIENTSOUNDS = 1.00
bj_SPEECH_VOLUME_FIRE = 0.60

bj_SMARTPAN_TRESHOLD_PAN = 500
bj_SMARTPAN_TRESHOLD_SNAP = 3500

bj_MAX_QUEUED_TRIGGERS = 100
bj_QUEUED_TRIGGER_TIMEOUT = 180.00

bj_CAMPAIGN_INDEX_T = 0
bj_CAMPAIGN_INDEX_H = 1
bj_CAMPAIGN_INDEX_U = 2
bj_CAMPAIGN_INDEX_O = 3
bj_CAMPAIGN_INDEX_N = 4
bj_CAMPAIGN_INDEX_XN = 5
bj_CAMPAIGN_INDEX_XH = 6
bj_CAMPAIGN_INDEX_XU = 7
bj_CAMPAIGN_INDEX_XO = 8

bj_CAMPAIGN_OFFSET_T = 0
bj_CAMPAIGN_OFFSET_H = 1
bj_CAMPAIGN_OFFSET_U = 2
bj_CAMPAIGN_OFFSET_O = 3
bj_CAMPAIGN_OFFSET_N = 4
bj_CAMPAIGN_OFFSET_XN = 0
bj_CAMPAIGN_OFFSET_XH = 1
bj_CAMPAIGN_OFFSET_XU = 2
bj_CAMPAIGN_OFFSET_XO = 3


bj_MISSION_INDEX_T00 = bj_CAMPAIGN_OFFSET_T * 1000 + 0
bj_MISSION_INDEX_T01 = bj_CAMPAIGN_OFFSET_T * 1000 + 1

bj_MISSION_INDEX_H00 = bj_CAMPAIGN_OFFSET_H * 1000 + 0
bj_MISSION_INDEX_H01 = bj_CAMPAIGN_OFFSET_H * 1000 + 1
bj_MISSION_INDEX_H02 = bj_CAMPAIGN_OFFSET_H * 1000 + 2
bj_MISSION_INDEX_H03 = bj_CAMPAIGN_OFFSET_H * 1000 + 3
bj_MISSION_INDEX_H04 = bj_CAMPAIGN_OFFSET_H * 1000 + 4
bj_MISSION_INDEX_H05 = bj_CAMPAIGN_OFFSET_H * 1000 + 5
bj_MISSION_INDEX_H06 = bj_CAMPAIGN_OFFSET_H * 1000 + 6
bj_MISSION_INDEX_H07 = bj_CAMPAIGN_OFFSET_H * 1000 + 7
bj_MISSION_INDEX_H08 = bj_CAMPAIGN_OFFSET_H * 1000 + 8
bj_MISSION_INDEX_H09 = bj_CAMPAIGN_OFFSET_H * 1000 + 9
bj_MISSION_INDEX_H10 = bj_CAMPAIGN_OFFSET_H * 1000 + 10
bj_MISSION_INDEX_H11 = bj_CAMPAIGN_OFFSET_H * 1000 + 11

bj_MISSION_INDEX_U00 = bj_CAMPAIGN_OFFSET_U * 1000 + 0
bj_MISSION_INDEX_U01 = bj_CAMPAIGN_OFFSET_U * 1000 + 1
bj_MISSION_INDEX_U02 = bj_CAMPAIGN_OFFSET_U * 1000 + 2
bj_MISSION_INDEX_U03 = bj_CAMPAIGN_OFFSET_U * 1000 + 3
bj_MISSION_INDEX_U05 = bj_CAMPAIGN_OFFSET_U * 1000 + 4
bj_MISSION_INDEX_U07 = bj_CAMPAIGN_OFFSET_U * 1000 + 5
bj_MISSION_INDEX_U08 = bj_CAMPAIGN_OFFSET_U * 1000 + 6
bj_MISSION_INDEX_U09 = bj_CAMPAIGN_OFFSET_U * 1000 + 7
bj_MISSION_INDEX_U10 = bj_CAMPAIGN_OFFSET_U * 1000 + 8
bj_MISSION_INDEX_U11 = bj_CAMPAIGN_OFFSET_U * 1000 + 9

bj_MISSION_INDEX_O00 = bj_CAMPAIGN_OFFSET_O * 1000 + 0
bj_MISSION_INDEX_O01 = bj_CAMPAIGN_OFFSET_O * 1000 + 1
bj_MISSION_INDEX_O02 = bj_CAMPAIGN_OFFSET_O * 1000 + 2
bj_MISSION_INDEX_O03 = bj_CAMPAIGN_OFFSET_O * 1000 + 3
bj_MISSION_INDEX_O04 = bj_CAMPAIGN_OFFSET_O * 1000 + 4
bj_MISSION_INDEX_O05 = bj_CAMPAIGN_OFFSET_O * 1000 + 5
bj_MISSION_INDEX_O06 = bj_CAMPAIGN_OFFSET_O * 1000 + 6
bj_MISSION_INDEX_O07 = bj_CAMPAIGN_OFFSET_O * 1000 + 7
bj_MISSION_INDEX_O08 = bj_CAMPAIGN_OFFSET_O * 1000 + 8
bj_MISSION_INDEX_O09 = bj_CAMPAIGN_OFFSET_O * 1000 + 9
bj_MISSION_INDEX_O10 = bj_CAMPAIGN_OFFSET_O * 1000 + 10

bj_MISSION_INDEX_N00 = bj_CAMPAIGN_OFFSET_N * 1000 + 0
bj_MISSION_INDEX_N01 = bj_CAMPAIGN_OFFSET_N * 1000 + 1
bj_MISSION_INDEX_N02 = bj_CAMPAIGN_OFFSET_N * 1000 + 2
bj_MISSION_INDEX_N03 = bj_CAMPAIGN_OFFSET_N * 1000 + 3
bj_MISSION_INDEX_N04 = bj_CAMPAIGN_OFFSET_N * 1000 + 4
bj_MISSION_INDEX_N05 = bj_CAMPAIGN_OFFSET_N * 1000 + 5
bj_MISSION_INDEX_N06 = bj_CAMPAIGN_OFFSET_N * 1000 + 6
bj_MISSION_INDEX_N07 = bj_CAMPAIGN_OFFSET_N * 1000 + 7
bj_MISSION_INDEX_N08 = bj_CAMPAIGN_OFFSET_N * 1000 + 8
bj_MISSION_INDEX_N09 = bj_CAMPAIGN_OFFSET_N * 1000 + 9

bj_MISSION_INDEX_XN00 = bj_CAMPAIGN_OFFSET_XN * 1000 + 0
bj_MISSION_INDEX_XN01 = bj_CAMPAIGN_OFFSET_XN * 1000 + 1
bj_MISSION_INDEX_XN02 = bj_CAMPAIGN_OFFSET_XN * 1000 + 2
bj_MISSION_INDEX_XN03 = bj_CAMPAIGN_OFFSET_XN * 1000 + 3
bj_MISSION_INDEX_XN04 = bj_CAMPAIGN_OFFSET_XN * 1000 + 4
bj_MISSION_INDEX_XN05 = bj_CAMPAIGN_OFFSET_XN * 1000 + 5
bj_MISSION_INDEX_XN06 = bj_CAMPAIGN_OFFSET_XN * 1000 + 6
bj_MISSION_INDEX_XN07 = bj_CAMPAIGN_OFFSET_XN * 1000 + 7
bj_MISSION_INDEX_XN08 = bj_CAMPAIGN_OFFSET_XN * 1000 + 8
bj_MISSION_INDEX_XN09 = bj_CAMPAIGN_OFFSET_XN * 1000 + 9
bj_MISSION_INDEX_XN10 = bj_CAMPAIGN_OFFSET_XN * 1000 + 10

bj_MISSION_INDEX_XH00 = bj_CAMPAIGN_OFFSET_XH * 1000 + 0
bj_MISSION_INDEX_XH01 = bj_CAMPAIGN_OFFSET_XH * 1000 + 1
bj_MISSION_INDEX_XH02 = bj_CAMPAIGN_OFFSET_XH * 1000 + 2
bj_MISSION_INDEX_XH03 = bj_CAMPAIGN_OFFSET_XH * 1000 + 3
bj_MISSION_INDEX_XH04 = bj_CAMPAIGN_OFFSET_XH * 1000 + 4
bj_MISSION_INDEX_XH05 = bj_CAMPAIGN_OFFSET_XH * 1000 + 5
bj_MISSION_INDEX_XH06 = bj_CAMPAIGN_OFFSET_XH * 1000 + 6
bj_MISSION_INDEX_XH07 = bj_CAMPAIGN_OFFSET_XH * 1000 + 7
bj_MISSION_INDEX_XH08 = bj_CAMPAIGN_OFFSET_XH * 1000 + 8
bj_MISSION_INDEX_XH09 = bj_CAMPAIGN_OFFSET_XH * 1000 + 9

bj_MISSION_INDEX_XU00 = bj_CAMPAIGN_OFFSET_XU * 1000 + 0
bj_MISSION_INDEX_XU01 = bj_CAMPAIGN_OFFSET_XU * 1000 + 1
bj_MISSION_INDEX_XU02 = bj_CAMPAIGN_OFFSET_XU * 1000 + 2
bj_MISSION_INDEX_XU03 = bj_CAMPAIGN_OFFSET_XU * 1000 + 3
bj_MISSION_INDEX_XU04 = bj_CAMPAIGN_OFFSET_XU * 1000 + 4
bj_MISSION_INDEX_XU05 = bj_CAMPAIGN_OFFSET_XU * 1000 + 5
bj_MISSION_INDEX_XU06 = bj_CAMPAIGN_OFFSET_XU * 1000 + 6
bj_MISSION_INDEX_XU07 = bj_CAMPAIGN_OFFSET_XU * 1000 + 7
bj_MISSION_INDEX_XU08 = bj_CAMPAIGN_OFFSET_XU * 1000 + 8
bj_MISSION_INDEX_XU09 = bj_CAMPAIGN_OFFSET_XU * 1000 + 9
bj_MISSION_INDEX_XU10 = bj_CAMPAIGN_OFFSET_XU * 1000 + 10
bj_MISSION_INDEX_XU11 = bj_CAMPAIGN_OFFSET_XU * 1000 + 11
bj_MISSION_INDEX_XU12 = bj_CAMPAIGN_OFFSET_XU * 1000 + 12
bj_MISSION_INDEX_XU13 = bj_CAMPAIGN_OFFSET_XU * 1000 + 13

bj_MISSION_INDEX_XO00 = bj_CAMPAIGN_OFFSET_XO * 1000 + 0

bj_CINEMATICINDEX_TOP = 0
bj_CINEMATICINDEX_HOP = 1
bj_CINEMATICINDEX_HED = 2
bj_CINEMATICINDEX_OOP = 3
bj_CINEMATICINDEX_OED = 4
bj_CINEMATICINDEX_UOP = 5
bj_CINEMATICINDEX_UED = 6
bj_CINEMATICINDEX_NOP = 7
bj_CINEMATICINDEX_NED = 8
bj_CINEMATICINDEX_XOP = 9
bj_CINEMATICINDEX_XED = 10

bj_ALLIANCE_UNALLIED = 0
bj_ALLIANCE_UNALLIED_VISION = 1
bj_ALLIANCE_ALLIED = 2
bj_ALLIANCE_ALLIED_VISION = 3
bj_ALLIANCE_ALLIED_UNITS = 4
bj_ALLIANCE_ALLIED_ADVUNITS = 5
bj_ALLIANCE_NEUTRAL = 6
bj_ALLIANCE_NEUTRAL_VISION = 7

bj_KEYEVENTTYPE_DEPRESS = 0
bj_KEYEVENTTYPE_RELEASE = 1

bj_KEYEVENTKEY_LEFT = 0
bj_KEYEVENTKEY_RIGHT = 1
bj_KEYEVENTKEY_DOWN = 2
bj_KEYEVENTKEY_UP = 3

bj_TIMETYPE_ADD = 0
bj_TIMETYPE_SET = 1
bj_TIMETYPE_SUB = 2

bj_CAMERABOUNDS_ADJUST_ADD = 0
bj_CAMERABOUNDS_ADJUST_SUB = 1

bj_QUESTTYPE_REQ_DISCOVERED = 0
bj_QUESTTYPE_REQ_UNDISCOVERED = 1
bj_QUESTTYPE_OPT_DISCOVERED = 2
bj_QUESTTYPE_OPT_UNDISCOVERED = 3

bj_QUESTMESSAGE_DISCOVERED = 0
bj_QUESTMESSAGE_UPDATED = 1
bj_QUESTMESSAGE_COMPLETED = 2
bj_QUESTMESSAGE_FAILED = 3
bj_QUESTMESSAGE_REQUIREMENT = 4
bj_QUESTMESSAGE_MISSIONFAILED = 5
bj_QUESTMESSAGE_ALWAYSHINT = 6
bj_QUESTMESSAGE_HINT = 7
bj_QUESTMESSAGE_SECRET = 8
bj_QUESTMESSAGE_UNITACQUIRED = 9
bj_QUESTMESSAGE_UNITAVAILABLE = 10
bj_QUESTMESSAGE_ITEMACQUIRED = 11
bj_QUESTMESSAGE_WARNING = 12

bj_SORTTYPE_SORTBYVALUE = 0
bj_SORTTYPE_SORTBYPLAYER = 1
bj_SORTTYPE_SORTBYLABEL = 2

bj_CINEFADETYPE_FADEIN = 0
bj_CINEFADETYPE_FADEOUT = 1
bj_CINEFADETYPE_FADEOUTIN = 2

bj_REMOVEBUFFS_POSITIVE = 0
bj_REMOVEBUFFS_NEGATIVE = 1
bj_REMOVEBUFFS_ALL = 2
bj_REMOVEBUFFS_NONTLIFE = 3

bj_BUFF_POLARITY_POSITIVE = 0
bj_BUFF_POLARITY_NEGATIVE = 1
bj_BUFF_POLARITY_EITHER = 2

bj_BUFF_RESIST_MAGIC = 0
bj_BUFF_RESIST_PHYSICAL = 1
bj_BUFF_RESIST_EITHER = 2
bj_BUFF_RESIST_BOTH = 3

bj_HEROSTAT_STR = 0
bj_HEROSTAT_AGI = 1
bj_HEROSTAT_INT = 2

bj_MODIFYMETHOD_ADD = 0
bj_MODIFYMETHOD_SUB = 1
bj_MODIFYMETHOD_SET = 2

bj_UNIT_STATE_METHOD_ABSOLUTE = 0
bj_UNIT_STATE_METHOD_RELATIVE = 1
bj_UNIT_STATE_METHOD_DEFAULTS = 2
bj_UNIT_STATE_METHOD_MAXIMUM = 3

bj_GATEOPERATION_CLOSE = 0
bj_GATEOPERATION_OPEN = 1
bj_GATEOPERATION_DESTROY = 2

bj_GAMECACHE_BOOLEAN = 0
bj_GAMECACHE_INTEGER = 1
bj_GAMECACHE_REAL = 2
bj_GAMECACHE_UNIT = 3
bj_GAMECACHE_STRING = 4


bj_HASHTABLE_BOOLEAN = 0
bj_HASHTABLE_INTEGER = 1
bj_HASHTABLE_REAL = 2
bj_HASHTABLE_STRING = 3
bj_HASHTABLE_HANDLE = 4

bj_ITEM_STATUS_HIDDEN = 0
bj_ITEM_STATUS_OWNED = 1
bj_ITEM_STATUS_INVULNERABLE = 2
bj_ITEM_STATUS_POWERUP = 3
bj_ITEM_STATUS_SELLABLE = 4
bj_ITEM_STATUS_PAWNABLE = 5

bj_ITEMCODE_STATUS_POWERUP = 0
bj_ITEMCODE_STATUS_SELLABLE = 1
bj_ITEMCODE_STATUS_PAWNABLE = 2

bj_MINIMAPPINGSTYLE_SIMPLE = 0
bj_MINIMAPPINGSTYLE_FLASHY = 1
bj_MINIMAPPINGSTYLE_ATTACK = 2

bj_CORPSE_MAX_DEATH_TIME = 8.00

bj_CORPSETYPE_FLESH = 0
bj_CORPSETYPE_BONE = 1

bj_ELEVATOR_BLOCKER_CODE = 1146381680
bj_ELEVATOR_CODE01 = 1146384998
bj_ELEVATOR_CODE02 = 1146385016

bj_ELEVATOR_WALL_TYPE_ALL = 0
bj_ELEVATOR_WALL_TYPE_EAST = 1
bj_ELEVATOR_WALL_TYPE_NORTH = 2
bj_ELEVATOR_WALL_TYPE_SOUTH = 3
bj_ELEVATOR_WALL_TYPE_WEST = 4




bj_FORCE_ALL_PLAYERS = nil
bj_FORCE_PLAYER = {}
bj_MELEE_MAX_TWINKED_HEROES = 0

bj_mapInitialPlayableArea = nil
bj_mapInitialCameraBounds = nil

bj_forLoopAIndex = 0
bj_forLoopBIndex = 0
bj_forLoopAIndexEnd = 0
bj_forLoopBIndexEnd = 0
bj_slotControlReady = false
bj_slotControlUsed = setmetatable({}, _mt_boolean)
bj_slotControl = {}

bj_gameStartedTimer = nil
bj_gameStarted = false
bj_volumeGroupsTimer = CreateTimer ( )

bj_isSinglePlayer = false

bj_dncSoundsDay = nil
bj_dncSoundsNight = nil
bj_dayAmbientSound = nil
bj_nightAmbientSound = nil
bj_dncSoundsDawn = nil
bj_dncSoundsDusk = nil
bj_dawnSound = nil
bj_duskSound = nil
bj_useDawnDuskSounds = true
bj_dncIsDaytime = false


bj_rescueSound = nil
bj_questDiscoveredSound = nil
bj_questUpdatedSound = nil
bj_questCompletedSound = nil
bj_questFailedSound = nil
bj_questHintSound = nil
bj_questSecretSound = nil
bj_questItemAcquiredSound = nil
bj_questWarningSound = nil
bj_victoryDialogSound = nil
bj_defeatDialogSound = nil

bj_stockItemPurchased = nil
bj_stockUpdateTimer = nil
bj_stockAllowedPermanent = setmetatable({}, _mt_boolean)
bj_stockAllowedCharged = setmetatable({}, _mt_boolean)
bj_stockAllowedArtifact = setmetatable({}, _mt_boolean)
bj_stockPickedItemLevel = 0

bj_meleeVisibilityTrained = nil
bj_meleeVisibilityIsDay = true
bj_meleeGrantHeroItems = false
bj_meleeNearestMineToLoc = nil
bj_meleeNearestMine = nil
bj_meleeNearestMineDist = 0.00
bj_meleeGameOver = false
bj_meleeDefeated = setmetatable({}, _mt_boolean)
bj_meleeVictoried = setmetatable({}, _mt_boolean)
bj_ghoul = {}
bj_crippledTimer = {}
bj_crippledTimerWindows = {}
bj_playerIsCrippled = setmetatable({}, _mt_boolean)
bj_playerIsExposed = setmetatable({}, _mt_boolean)
bj_finishSoonAllExposed = false
bj_finishSoonTimerDialog = nil
bj_meleeTwinkedHeroes = setmetatable({}, _mt_number)

bj_rescueUnitBehavior = nil
bj_rescueChangeColorUnit = true
bj_rescueChangeColorBldg = true

bj_cineSceneEndingTimer = nil
bj_cineSceneLastSound = nil
bj_cineSceneBeingSkipped = nil

bj_cineModePriorSpeed = MAP_SPEED_NORMAL
bj_cineModePriorFogSetting = false
bj_cineModePriorMaskSetting = false
bj_cineModeAlreadyIn = false
bj_cineModePriorDawnDusk = false
bj_cineModeSavedSeed = 0

bj_cineFadeFinishTimer = nil
bj_cineFadeContinueTimer = nil
bj_cineFadeContinueRed = 0
bj_cineFadeContinueGreen = 0
bj_cineFadeContinueBlue = 0
bj_cineFadeContinueTrans = 0
bj_cineFadeContinueDuration = 0
bj_cineFadeContinueTex = ""

bj_queuedExecTotal = 0
bj_queuedExecTriggers = {}
bj_queuedExecUseConds = setmetatable({}, _mt_boolean)
bj_queuedExecTimeoutTimer = CreateTimer ( )
bj_queuedExecTimeout = nil

bj_destInRegionDiesCount = 0
bj_destInRegionDiesTrig = nil
bj_groupCountUnits = 0
bj_forceCountPlayers = 0
bj_groupEnumTypeId = 0
bj_groupEnumOwningPlayer = nil
bj_groupAddGroupDest = nil
bj_groupRemoveGroupDest = nil
bj_groupRandomConsidered = 0
bj_groupRandomCurrentPick = nil
bj_groupLastCreatedDest = nil
bj_randomSubGroupGroup = nil
bj_randomSubGroupWant = 0
bj_randomSubGroupTotal = 0
bj_randomSubGroupChance = 0
bj_destRandomConsidered = 0
bj_destRandomCurrentPick = nil
bj_elevatorWallBlocker = nil
bj_elevatorNeighbor = nil
bj_itemRandomConsidered = 0
bj_itemRandomCurrentPick = nil
bj_forceRandomConsidered = 0
bj_forceRandomCurrentPick = nil
bj_makeUnitRescuableUnit = nil
bj_makeUnitRescuableFlag = true
bj_pauseAllUnitsFlag = true
bj_enumDestructableCenter = nil
bj_enumDestructableRadius = 0
bj_setPlayerTargetColor = nil
bj_isUnitGroupDeadResult = true
bj_isUnitGroupEmptyResult = true
bj_isUnitGroupInRectResult = true
bj_isUnitGroupInRectRect = nil
bj_changeLevelShowScores = false
bj_changeLevelMapName = nil
bj_suspendDecayFleshGroup = CreateGroup ( )
bj_suspendDecayBoneGroup = CreateGroup ( )
bj_delayedSuspendDecayTimer = CreateTimer ( )
bj_delayedSuspendDecayTrig = nil
bj_livingPlayerUnitsTypeId = 0
bj_lastDyingWidget = nil

bj_randDistCount = 0
bj_randDistID = setmetatable({}, _mt_number)
bj_randDistChance = setmetatable({}, _mt_number)

bj_lastCreatedUnit = nil
bj_lastCreatedItem = nil
bj_lastRemovedItem = nil
bj_lastHauntedGoldMine = nil
bj_lastCreatedDestructable = nil
bj_lastCreatedGroup = CreateGroup ( )
bj_lastCreatedFogModifier = nil
bj_lastCreatedEffect = nil
bj_lastCreatedWeatherEffect = nil
bj_lastCreatedTerrainDeformation = nil
bj_lastCreatedQuest = nil
bj_lastCreatedQuestItem = nil
bj_lastCreatedDefeatCondition = nil
bj_lastStartedTimer = CreateTimer ( )
bj_lastCreatedTimerDialog = nil
bj_lastCreatedLeaderboard = nil
bj_lastCreatedMultiboard = nil
bj_lastPlayedSound = nil
bj_lastPlayedMusic = ""
bj_lastTransmissionDuration = 0
bj_lastCreatedGameCache = nil
bj_lastCreatedHashtable = nil
bj_lastLoadedUnit = nil
bj_lastCreatedButton = nil
bj_lastReplacedUnit = nil
bj_lastCreatedTextTag = nil
bj_lastCreatedLightning = nil
bj_lastCreatedImage = nil
bj_lastCreatedUbersplat = nil

filterIssueHauntOrderAtLocBJ = nil
filterEnumDestructablesInCircleBJ = nil
filterGetUnitsInRectOfPlayer = nil
filterGetUnitsOfTypeIdAll = nil
filterGetUnitsOfPlayerAndTypeId = nil
filterMeleeTrainedUnitIsHeroBJ = nil
filterLivingPlayerUnitsOfTypeId = nil

bj_wantDestroyGroup = false






BJDebugMsg  = function ( msg )
local i = 0
for _i = 1, 10000 do
DisplayTimedTextToPlayer ( Player ( i ) , 0 , 0 , 60 , msg )
i = i + 1
if i == bj_MAX_PLAYERS then break end
end
end






RMinBJ  = function ( a , b )
if ( a < b ) then
do return a end
else
do return b end
end
end

RMaxBJ  = function ( a , b )
if ( a < b ) then
do return b end
else
do return a end
end
end

RAbsBJ  = function ( a )
if ( a >= 0 ) then
do return a end
else
do return - a end
end
end

RSignBJ  = function ( a )
if ( a >= 0.0 ) then
do return 1.0 end
else
do return - 1.0 end
end
end

IMinBJ  = function ( a , b )
if ( a < b ) then
do return a end
else
do return b end
end
end

IMaxBJ  = function ( a , b )
if ( a < b ) then
do return b end
else
do return a end
end
end

IAbsBJ  = function ( a )
if ( a >= 0 ) then
do return a end
else
do return - a end
end
end

ISignBJ  = function ( a )
if ( a >= 0 ) then
do return 1 end
else
do return - 1 end
end
end

SinBJ  = function ( degrees )
do return Sin ( degrees * bj_DEGTORAD ) end
end

CosBJ  = function ( degrees )
do return Cos ( degrees * bj_DEGTORAD ) end
end

TanBJ  = function ( degrees )
do return Tan ( degrees * bj_DEGTORAD ) end
end

AsinBJ  = function ( degrees )
do return Asin ( degrees ) * bj_RADTODEG end
end

AcosBJ  = function ( degrees )
do return Acos ( degrees ) * bj_RADTODEG end
end

AtanBJ  = function ( degrees )
do return Atan ( degrees ) * bj_RADTODEG end
end

Atan2BJ  = function ( y , x )
do return Atan2 ( y , x ) * bj_RADTODEG end
end

AngleBetweenPoints  = function ( locA , locB )
do return bj_RADTODEG * Atan2 ( GetLocationY ( locB ) - GetLocationY ( locA ) , GetLocationX ( locB ) - GetLocationX ( locA ) ) end
end

DistanceBetweenPoints  = function ( locA , locB )
local dx = GetLocationX ( locB ) - GetLocationX ( locA )
local dy = GetLocationY ( locB ) - GetLocationY ( locA )
do return SquareRoot ( dx * dx + dy * dy ) end
end

PolarProjectionBJ  = function ( source , dist , angle )
local x = GetLocationX ( source ) + dist * Cos ( angle * bj_DEGTORAD )
local y = GetLocationY ( source ) + dist * Sin ( angle * bj_DEGTORAD )
do return Location ( x , y ) end
end

GetRandomDirectionDeg  = function ( )
do return GetRandomReal ( 0 , 360 ) end
end

GetRandomPercentageBJ  = function ( )
do return GetRandomReal ( 0 , 100 ) end
end

GetRandomLocInRect  = function ( whichRect )
do return Location ( GetRandomReal ( GetRectMinX ( whichRect ) , GetRectMaxX ( whichRect ) ) , GetRandomReal ( GetRectMinY ( whichRect ) , GetRectMaxY ( whichRect ) ) ) end
end




ModuloInteger  = function ( dividend , divisor )
local modulus = dividend - ( math.modf ( dividend / divisor ) ) * divisor



if ( modulus < 0 ) then
modulus = modulus + divisor
end
do return modulus end
end




ModuloReal  = function ( dividend , divisor )
local modulus = dividend - I2R ( R2I ( dividend / divisor ) ) * divisor



if ( modulus < 0 ) then
modulus = modulus + divisor
end
do return modulus end
end

OffsetLocation  = function ( loc , dx , dy )
do return Location ( GetLocationX ( loc ) + dx , GetLocationY ( loc ) + dy ) end
end

OffsetRectBJ  = function ( r , dx , dy )
do return Rect ( GetRectMinX ( r ) + dx , GetRectMinY ( r ) + dy , GetRectMaxX ( r ) + dx , GetRectMaxY ( r ) + dy ) end
end

RectFromCenterSizeBJ  = function ( center , width , height )
local x = GetLocationX ( center )
local y = GetLocationY ( center )
do return Rect ( x - width * 0.5 , y - height * 0.5 , x + width * 0.5 , y + height * 0.5 ) end
end

RectContainsCoords  = function ( r , x , y )
do return ( GetRectMinX ( r ) <= x ) and ( x <= GetRectMaxX ( r ) ) and ( GetRectMinY ( r ) <= y ) and ( y <= GetRectMaxY ( r ) ) end
end

RectContainsLoc  = function ( r , loc )
do return RectContainsCoords ( r , GetLocationX ( loc ) , GetLocationY ( loc ) ) end
end

RectContainsUnit  = function ( r , whichUnit )
do return RectContainsCoords ( r , GetUnitX ( whichUnit ) , GetUnitY ( whichUnit ) ) end
end

RectContainsItem  = function ( whichItem , r )
if ( whichItem == nil ) then
do return false end
end
if ( IsItemOwned ( whichItem ) ) then
do return false end
end
do return RectContainsCoords ( r , GetItemX ( whichItem ) , GetItemY ( whichItem ) ) end
end








ConditionalTriggerExecute  = function ( trig )
if TriggerEvaluate ( trig ) then
TriggerExecute ( trig )
end
end



TriggerExecuteBJ  = function ( trig , checkConditions )
if checkConditions then
if not ( TriggerEvaluate ( trig ) ) then
do return false end
end
end
TriggerExecute ( trig )
do return true end
end





PostTriggerExecuteBJ  = function ( trig , checkConditions )
if checkConditions then
if not ( TriggerEvaluate ( trig ) ) then
do return false end
end
end
TriggerRegisterTimerEvent ( trig , 0 , false )
do return true end
end



QueuedTriggerCheck  = function ( )
local s = "TrigQueue Check "
local i
i = 0
for _i = 1, 10000 do
if i >= bj_queuedExecTotal then break end
s = s .. "q[" .. I2S ( i ) .. "]="
if ( bj_queuedExecTriggers [ i ] == nil ) then
s = s .. "null "
else
s = s .. "x "
end
i = i + 1
end
s = s .. "(" .. I2S ( bj_queuedExecTotal ) .. " total)"
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , 600 , s )
end




QueuedTriggerGetIndex  = function ( trig )

local index = 0
for _i = 1, 10000 do
if index >= bj_queuedExecTotal then break end
if ( bj_queuedExecTriggers [ index ] == trig ) then
do return index end
end
index = index + 1
end
do return - 1 end
end





QueuedTriggerRemoveByIndex  = function ( trigIndex )
local index

if ( trigIndex >= bj_queuedExecTotal ) then
do return false end
end

bj_queuedExecTotal = bj_queuedExecTotal - 1
index = trigIndex
for _i = 1, 10000 do
if index >= bj_queuedExecTotal then break end
bj_queuedExecTriggers [ index ] = bj_queuedExecTriggers [ index + 1 ]
bj_queuedExecUseConds [ index ] = bj_queuedExecUseConds [ index + 1 ]
index = index + 1
end
do return true end
end





QueuedTriggerAttemptExec  = function ( )
for _i = 1, 10000 do
if bj_queuedExecTotal == 0 then break end
if TriggerExecuteBJ ( bj_queuedExecTriggers [ 0 ] , bj_queuedExecUseConds [ 0 ] ) then

TimerStart ( bj_queuedExecTimeoutTimer , bj_QUEUED_TRIGGER_TIMEOUT , false , nil )
do return true end
end
QueuedTriggerRemoveByIndex ( 0 )
end
do return false end
end




QueuedTriggerAddBJ  = function ( trig , checkConditions )

if ( bj_queuedExecTotal >= bj_MAX_QUEUED_TRIGGERS ) then
do return false end
end

bj_queuedExecTriggers [ bj_queuedExecTotal ] = trig
bj_queuedExecUseConds [ bj_queuedExecTotal ] = checkConditions
bj_queuedExecTotal = bj_queuedExecTotal + 1

if ( bj_queuedExecTotal == 1 ) then
QueuedTriggerAttemptExec ( )
end
do return true end
end




QueuedTriggerRemoveBJ  = function ( trig )
local index
local trigIndex
local trigExecuted

trigIndex = QueuedTriggerGetIndex ( trig )
if ( trigIndex == - 1 ) then
do return end
end

QueuedTriggerRemoveByIndex ( trigIndex )

if ( trigIndex == 0 ) then
PauseTimer ( bj_queuedExecTimeoutTimer )
QueuedTriggerAttemptExec ( )
end
end




QueuedTriggerDoneBJ  = function ( )
local index

if ( bj_queuedExecTotal <= 0 ) then
do return end
end

QueuedTriggerRemoveByIndex ( 0 )

PauseTimer ( bj_queuedExecTimeoutTimer )
QueuedTriggerAttemptExec ( )
end



QueuedTriggerClearBJ  = function ( )
PauseTimer ( bj_queuedExecTimeoutTimer )
bj_queuedExecTotal = 0
end



QueuedTriggerClearInactiveBJ  = function ( )
bj_queuedExecTotal = IMinBJ ( bj_queuedExecTotal , 1 )
end

QueuedTriggerCountBJ  = function ( )
do return bj_queuedExecTotal end
end

IsTriggerQueueEmptyBJ  = function ( )
do return bj_queuedExecTotal <= 0 end
end

IsTriggerQueuedBJ  = function ( trig )
do return QueuedTriggerGetIndex ( trig ) ~= - 1 end
end

GetForLoopIndexA  = function ( )
do return bj_forLoopAIndex end
end

SetForLoopIndexA  = function ( newIndex )
bj_forLoopAIndex = newIndex
end

GetForLoopIndexB  = function ( )
do return bj_forLoopBIndex end
end

SetForLoopIndexB  = function ( newIndex )
bj_forLoopBIndex = newIndex
end



PolledWait  = function ( duration )
local t
local timeRemaining
if ( duration > 0 ) then
t = CreateTimer ( )
TimerStart ( t , duration , false , nil )
for _i = 1, 10000 do
timeRemaining = TimerGetRemaining ( t )
if timeRemaining <= 0 then break end



if ( timeRemaining > bj_POLLED_WAIT_SKIP_THRESHOLD ) then
TriggerSleepAction ( 0.1 * timeRemaining )
else
TriggerSleepAction ( bj_POLLED_WAIT_INTERVAL )
end
end
DestroyTimer ( t )
end
end

IntegerTertiaryOp  = function ( flag , valueA , valueB )
if flag then
do return valueA end
else
do return valueB end
end
end








DoNothing  = function ( )
end





CommentString  = function ( commentString )
end



StringIdentity  = function ( theString )
do return GetLocalizedString ( theString ) end
end

GetBooleanAnd  = function ( valueA , valueB )
do return valueA and valueB end
end

GetBooleanOr  = function ( valueA , valueB )
do return valueA or valueB end
end




PercentToInt  = function ( percentage , max )
local result = R2I ( percentage * I2R ( max ) * 0.01 )
if ( result < 0 ) then
result = 0
elseif ( result > max ) then
result = max
end
do return result end
end

PercentTo255  = function ( percentage )
do return PercentToInt ( percentage , 255 ) end
end

GetTimeOfDay  = function ( )
do return GetFloatGameState ( GAME_STATE_TIME_OF_DAY ) end
end

SetTimeOfDay  = function ( whatTime )
SetFloatGameState ( GAME_STATE_TIME_OF_DAY , whatTime )
end

SetTimeOfDayScalePercentBJ  = function ( scalePercent )
SetTimeOfDayScale ( scalePercent * 0.01 )
end

GetTimeOfDayScalePercentBJ  = function ( )
do return GetTimeOfDayScale ( ) * 100 end
end

PlaySound  = function ( soundName )
local soundHandle = CreateSound ( soundName , false , false , true , 12700 , 12700 , "" )
StartSound ( soundHandle )
KillSoundWhenDone ( soundHandle )
end

CompareLocationsBJ  = function ( A , B )
do return GetLocationX ( A ) == GetLocationX ( B ) and GetLocationY ( A ) == GetLocationY ( B ) end
end

CompareRectsBJ  = function ( A , B )
do return GetRectMinX ( A ) == GetRectMinX ( B ) and GetRectMinY ( A ) == GetRectMinY ( B ) and GetRectMaxX ( A ) == GetRectMaxX ( B ) and GetRectMaxY ( A ) == GetRectMaxY ( B ) end
end



GetRectFromCircleBJ  = function ( center , radius )
local centerX = GetLocationX ( center )
local centerY = GetLocationY ( center )
do return Rect ( centerX - radius , centerY - radius , centerX + radius , centerY + radius ) end
end






GetCurrentCameraSetup  = function ( )
local theCam = CreateCameraSetup ( )
local duration = 0
CameraSetupSetField ( theCam , CAMERA_FIELD_TARGET_DISTANCE , GetCameraField ( CAMERA_FIELD_TARGET_DISTANCE ) , duration )
CameraSetupSetField ( theCam , CAMERA_FIELD_FARZ , GetCameraField ( CAMERA_FIELD_FARZ ) , duration )
CameraSetupSetField ( theCam , CAMERA_FIELD_ZOFFSET , GetCameraField ( CAMERA_FIELD_ZOFFSET ) , duration )
CameraSetupSetField ( theCam , CAMERA_FIELD_ANGLE_OF_ATTACK , bj_RADTODEG * GetCameraField ( CAMERA_FIELD_ANGLE_OF_ATTACK ) , duration )
CameraSetupSetField ( theCam , CAMERA_FIELD_FIELD_OF_VIEW , bj_RADTODEG * GetCameraField ( CAMERA_FIELD_FIELD_OF_VIEW ) , duration )
CameraSetupSetField ( theCam , CAMERA_FIELD_ROLL , bj_RADTODEG * GetCameraField ( CAMERA_FIELD_ROLL ) , duration )
CameraSetupSetField ( theCam , CAMERA_FIELD_ROTATION , bj_RADTODEG * GetCameraField ( CAMERA_FIELD_ROTATION ) , duration )
CameraSetupSetDestPosition ( theCam , GetCameraTargetPositionX ( ) , GetCameraTargetPositionY ( ) , duration )
do return theCam end
end

CameraSetupApplyForPlayer  = function ( doPan , whichSetup , whichPlayer , duration )
if ( GetLocalPlayer ( ) == whichPlayer ) then

CameraSetupApplyForceDuration ( whichSetup , doPan , duration )
end
end

CameraSetupGetFieldSwap  = function ( whichField , whichSetup )
do return CameraSetupGetField ( whichSetup , whichField ) end
end

SetCameraFieldForPlayer  = function ( whichPlayer , whichField , value , duration )
if ( GetLocalPlayer ( ) == whichPlayer ) then

SetCameraField ( whichField , value , duration )
end
end

SetCameraTargetControllerNoZForPlayer  = function ( whichPlayer , whichUnit , xoffset , yoffset , inheritOrientation )
if ( GetLocalPlayer ( ) == whichPlayer ) then

SetCameraTargetController ( whichUnit , xoffset , yoffset , inheritOrientation )
end
end

SetCameraPositionForPlayer  = function ( whichPlayer , x , y )
if ( GetLocalPlayer ( ) == whichPlayer ) then

SetCameraPosition ( x , y )
end
end

SetCameraPositionLocForPlayer  = function ( whichPlayer , loc )
if ( GetLocalPlayer ( ) == whichPlayer ) then

SetCameraPosition ( GetLocationX ( loc ) , GetLocationY ( loc ) )
end
end

RotateCameraAroundLocBJ  = function ( degrees , loc , whichPlayer , duration )
if ( GetLocalPlayer ( ) == whichPlayer ) then

SetCameraRotateMode ( GetLocationX ( loc ) , GetLocationY ( loc ) , bj_DEGTORAD * degrees , duration )
end
end

PanCameraToForPlayer  = function ( whichPlayer , x , y )
if ( GetLocalPlayer ( ) == whichPlayer ) then

PanCameraTo ( x , y )
end
end

PanCameraToLocForPlayer  = function ( whichPlayer , loc )
if ( GetLocalPlayer ( ) == whichPlayer ) then

PanCameraTo ( GetLocationX ( loc ) , GetLocationY ( loc ) )
end
end

PanCameraToTimedForPlayer  = function ( whichPlayer , x , y , duration )
if ( GetLocalPlayer ( ) == whichPlayer ) then

PanCameraToTimed ( x , y , duration )
end
end

PanCameraToTimedLocForPlayer  = function ( whichPlayer , loc , duration )
if ( GetLocalPlayer ( ) == whichPlayer ) then

PanCameraToTimed ( GetLocationX ( loc ) , GetLocationY ( loc ) , duration )
end
end

PanCameraToTimedLocWithZForPlayer  = function ( whichPlayer , loc , zOffset , duration )
if ( GetLocalPlayer ( ) == whichPlayer ) then

PanCameraToTimedWithZ ( GetLocationX ( loc ) , GetLocationY ( loc ) , zOffset , duration )
end
end

SmartCameraPanBJ  = function ( whichPlayer , loc , duration )
local dist
if ( GetLocalPlayer ( ) == whichPlayer ) then

dist = DistanceBetweenPoints ( loc , GetCameraTargetPositionLoc ( ) )
if ( dist >= bj_SMARTPAN_TRESHOLD_SNAP ) then

PanCameraToTimed ( GetLocationX ( loc ) , GetLocationY ( loc ) , 0 )
elseif ( dist >= bj_SMARTPAN_TRESHOLD_PAN ) then

PanCameraToTimed ( GetLocationX ( loc ) , GetLocationY ( loc ) , duration )
else

end
end
end

SetCinematicCameraForPlayer  = function ( whichPlayer , cameraModelFile )
if ( GetLocalPlayer ( ) == whichPlayer ) then

SetCinematicCamera ( cameraModelFile )
end
end

ResetToGameCameraForPlayer  = function ( whichPlayer , duration )
if ( GetLocalPlayer ( ) == whichPlayer ) then

ResetToGameCamera ( duration )
end
end

CameraSetSourceNoiseForPlayer  = function ( whichPlayer , magnitude , velocity )
if ( GetLocalPlayer ( ) == whichPlayer ) then

CameraSetSourceNoise ( magnitude , velocity )
end
end

CameraSetTargetNoiseForPlayer  = function ( whichPlayer , magnitude , velocity )
if ( GetLocalPlayer ( ) == whichPlayer ) then

CameraSetTargetNoise ( magnitude , velocity )
end
end

CameraSetEQNoiseForPlayer  = function ( whichPlayer , magnitude )
local richter = magnitude
if ( richter > 5.0 ) then
richter = 5.0
end
if ( richter < 2.0 ) then
richter = 2.0
end
if ( GetLocalPlayer ( ) == whichPlayer ) then

CameraSetTargetNoiseEx ( magnitude * 2.0 , magnitude * Pow ( 10 , richter ) , true )
CameraSetSourceNoiseEx ( magnitude * 2.0 , magnitude * Pow ( 10 , richter ) , true )
end
end

CameraClearNoiseForPlayer  = function ( whichPlayer )
if ( GetLocalPlayer ( ) == whichPlayer ) then

CameraSetSourceNoise ( 0 , 0 )
CameraSetTargetNoise ( 0 , 0 )
end
end



GetCurrentCameraBoundsMapRectBJ  = function ( )
do return Rect ( GetCameraBoundMinX ( ) , GetCameraBoundMinY ( ) , GetCameraBoundMaxX ( ) , GetCameraBoundMaxY ( ) ) end
end



GetCameraBoundsMapRect  = function ( )
do return bj_mapInitialCameraBounds end
end



GetPlayableMapRect  = function ( )
do return bj_mapInitialPlayableArea end
end



GetEntireMapRect  = function ( )
do return GetWorldBounds ( ) end
end

SetCameraBoundsToRect  = function ( r )
local minX = GetRectMinX ( r )
local minY = GetRectMinY ( r )
local maxX = GetRectMaxX ( r )
local maxY = GetRectMaxY ( r )
SetCameraBounds ( minX , minY , minX , maxY , maxX , maxY , maxX , minY )
end

SetCameraBoundsToRectForPlayerBJ  = function ( whichPlayer , r )
if ( GetLocalPlayer ( ) == whichPlayer ) then

SetCameraBoundsToRect ( r )
end
end

AdjustCameraBoundsBJ  = function ( adjustMethod , dxWest , dxEast , dyNorth , dySouth )
local minX = 0
local minY = 0
local maxX = 0
local maxY = 0
local scale = 0
if ( adjustMethod == bj_CAMERABOUNDS_ADJUST_ADD ) then
scale = 1
elseif ( adjustMethod == bj_CAMERABOUNDS_ADJUST_SUB ) then
scale = - 1
else

do return end
end

minX = GetCameraBoundMinX ( ) - scale * dxWest
maxX = GetCameraBoundMaxX ( ) + scale * dxEast
minY = GetCameraBoundMinY ( ) - scale * dySouth
maxY = GetCameraBoundMaxY ( ) + scale * dyNorth

if ( maxX < minX ) then
minX = ( minX + maxX ) * 0.5
maxX = minX
end
if ( maxY < minY ) then
minY = ( minY + maxY ) * 0.5
maxY = minY
end

SetCameraBounds ( minX , minY , minX , maxY , maxX , maxY , maxX , minY )
end

AdjustCameraBoundsForPlayerBJ  = function ( adjustMethod , whichPlayer , dxWest , dxEast , dyNorth , dySouth )
if ( GetLocalPlayer ( ) == whichPlayer ) then

AdjustCameraBoundsBJ ( adjustMethod , dxWest , dxEast , dyNorth , dySouth )
end
end

SetCameraQuickPositionForPlayer  = function ( whichPlayer , x , y )
if ( GetLocalPlayer ( ) == whichPlayer ) then

SetCameraQuickPosition ( x , y )
end
end

SetCameraQuickPositionLocForPlayer  = function ( whichPlayer , loc )
if ( GetLocalPlayer ( ) == whichPlayer ) then

SetCameraQuickPosition ( GetLocationX ( loc ) , GetLocationY ( loc ) )
end
end

SetCameraQuickPositionLoc  = function ( loc )
SetCameraQuickPosition ( GetLocationX ( loc ) , GetLocationY ( loc ) )
end

StopCameraForPlayerBJ  = function ( whichPlayer )
if ( GetLocalPlayer ( ) == whichPlayer ) then

StopCamera ( )
end
end

SetCameraOrientControllerForPlayerBJ  = function ( whichPlayer , whichUnit , xoffset , yoffset )
if ( GetLocalPlayer ( ) == whichPlayer ) then

SetCameraOrientController ( whichUnit , xoffset , yoffset )
end
end

CameraSetSmoothingFactorBJ  = function ( factor )
CameraSetSmoothingFactor ( factor )
end

CameraResetSmoothingFactorBJ  = function ( )
CameraSetSmoothingFactor ( 0 )
end






DisplayTextToForce  = function ( toForce , message )
if ( IsPlayerInForce ( GetLocalPlayer ( ) , toForce ) ) then

DisplayTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , message )
end
end

DisplayTimedTextToForce  = function ( toForce , duration , message )
if ( IsPlayerInForce ( GetLocalPlayer ( ) , toForce ) ) then

DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , duration , message )
end
end

ClearTextMessagesBJ  = function ( toForce )
if ( IsPlayerInForce ( GetLocalPlayer ( ) , toForce ) ) then

ClearTextMessages ( )
end
end




SubStringBJ  = function ( source , start , _end )
do return SubString ( source , start - 1 , _end ) end
end

GetHandleIdBJ  = function ( h )
do return GetHandleId ( h ) end
end
StringHashBJ  = function ( s )
do return StringHash ( s ) end
end






TriggerRegisterTimerEventPeriodic  = function ( trig , timeout )
do return TriggerRegisterTimerEvent ( trig , timeout , true ) end
end

TriggerRegisterTimerEventSingle  = function ( trig , timeout )
do return TriggerRegisterTimerEvent ( trig , timeout , false ) end
end

TriggerRegisterTimerExpireEventBJ  = function ( trig , t )
do return TriggerRegisterTimerExpireEvent ( trig , t ) end
end

TriggerRegisterPlayerUnitEventSimple  = function ( trig , whichPlayer , whichEvent )
do return TriggerRegisterPlayerUnitEvent ( trig , whichPlayer , whichEvent , nil ) end
end

TriggerRegisterAnyUnitEventBJ  = function ( trig , whichEvent )
local index
index = 0
for _i = 1, 10000 do
TriggerRegisterPlayerUnitEvent ( trig , Player ( index ) , whichEvent , nil )
index = index + 1
if index == bj_MAX_PLAYER_SLOTS then break end
end
end

TriggerRegisterPlayerSelectionEventBJ  = function ( trig , whichPlayer , selected )
if selected then
do return TriggerRegisterPlayerUnitEvent ( trig , whichPlayer , EVENT_PLAYER_UNIT_SELECTED , nil ) end
else
do return TriggerRegisterPlayerUnitEvent ( trig , whichPlayer , EVENT_PLAYER_UNIT_DESELECTED , nil ) end
end
end

TriggerRegisterPlayerKeyEventBJ  = function ( trig , whichPlayer , keType , keKey )
if ( keType == bj_KEYEVENTTYPE_DEPRESS ) then

if ( keKey == bj_KEYEVENTKEY_LEFT ) then
do return TriggerRegisterPlayerEvent ( trig , whichPlayer , EVENT_PLAYER_ARROW_LEFT_DOWN ) end
elseif ( keKey == bj_KEYEVENTKEY_RIGHT ) then
do return TriggerRegisterPlayerEvent ( trig , whichPlayer , EVENT_PLAYER_ARROW_RIGHT_DOWN ) end
elseif ( keKey == bj_KEYEVENTKEY_DOWN ) then
do return TriggerRegisterPlayerEvent ( trig , whichPlayer , EVENT_PLAYER_ARROW_DOWN_DOWN ) end
elseif ( keKey == bj_KEYEVENTKEY_UP ) then
do return TriggerRegisterPlayerEvent ( trig , whichPlayer , EVENT_PLAYER_ARROW_UP_DOWN ) end
else

do return nil end
end
elseif ( keType == bj_KEYEVENTTYPE_RELEASE ) then

if ( keKey == bj_KEYEVENTKEY_LEFT ) then
do return TriggerRegisterPlayerEvent ( trig , whichPlayer , EVENT_PLAYER_ARROW_LEFT_UP ) end
elseif ( keKey == bj_KEYEVENTKEY_RIGHT ) then
do return TriggerRegisterPlayerEvent ( trig , whichPlayer , EVENT_PLAYER_ARROW_RIGHT_UP ) end
elseif ( keKey == bj_KEYEVENTKEY_DOWN ) then
do return TriggerRegisterPlayerEvent ( trig , whichPlayer , EVENT_PLAYER_ARROW_DOWN_UP ) end
elseif ( keKey == bj_KEYEVENTKEY_UP ) then
do return TriggerRegisterPlayerEvent ( trig , whichPlayer , EVENT_PLAYER_ARROW_UP_UP ) end
else

do return nil end
end
else

do return nil end
end
end

TriggerRegisterPlayerEventVictory  = function ( trig , whichPlayer )
do return TriggerRegisterPlayerEvent ( trig , whichPlayer , EVENT_PLAYER_VICTORY ) end
end

TriggerRegisterPlayerEventDefeat  = function ( trig , whichPlayer )
do return TriggerRegisterPlayerEvent ( trig , whichPlayer , EVENT_PLAYER_DEFEAT ) end
end

TriggerRegisterPlayerEventLeave  = function ( trig , whichPlayer )
do return TriggerRegisterPlayerEvent ( trig , whichPlayer , EVENT_PLAYER_LEAVE ) end
end

TriggerRegisterPlayerEventAllianceChanged  = function ( trig , whichPlayer )
do return TriggerRegisterPlayerEvent ( trig , whichPlayer , EVENT_PLAYER_ALLIANCE_CHANGED ) end
end

TriggerRegisterPlayerEventEndCinematic  = function ( trig , whichPlayer )
do return TriggerRegisterPlayerEvent ( trig , whichPlayer , EVENT_PLAYER_END_CINEMATIC ) end
end

TriggerRegisterGameStateEventTimeOfDay  = function ( trig , opcode , limitval )
do return TriggerRegisterGameStateEvent ( trig , GAME_STATE_TIME_OF_DAY , opcode , limitval ) end
end

TriggerRegisterEnterRegionSimple  = function ( trig , whichRegion )
do return TriggerRegisterEnterRegion ( trig , whichRegion , nil ) end
end

TriggerRegisterLeaveRegionSimple  = function ( trig , whichRegion )
do return TriggerRegisterLeaveRegion ( trig , whichRegion , nil ) end
end

TriggerRegisterEnterRectSimple  = function ( trig , r )
local rectRegion = CreateRegion ( )
RegionAddRect ( rectRegion , r )
do return TriggerRegisterEnterRegion ( trig , rectRegion , nil ) end
end

TriggerRegisterLeaveRectSimple  = function ( trig , r )
local rectRegion = CreateRegion ( )
RegionAddRect ( rectRegion , r )
do return TriggerRegisterLeaveRegion ( trig , rectRegion , nil ) end
end

TriggerRegisterDistanceBetweenUnits  = function ( trig , whichUnit , condition , range )
do return TriggerRegisterUnitInRange ( trig , whichUnit , range , condition ) end
end

TriggerRegisterUnitInRangeSimple  = function ( trig , range , whichUnit )
do return TriggerRegisterUnitInRange ( trig , whichUnit , range , nil ) end
end

TriggerRegisterUnitLifeEvent  = function ( trig , whichUnit , opcode , limitval )
do return TriggerRegisterUnitStateEvent ( trig , whichUnit , UNIT_STATE_LIFE , opcode , limitval ) end
end

TriggerRegisterUnitManaEvent  = function ( trig , whichUnit , opcode , limitval )
do return TriggerRegisterUnitStateEvent ( trig , whichUnit , UNIT_STATE_MANA , opcode , limitval ) end
end

TriggerRegisterDialogEventBJ  = function ( trig , whichDialog )
do return TriggerRegisterDialogEvent ( trig , whichDialog ) end
end

TriggerRegisterShowSkillEventBJ  = function ( trig )
do return TriggerRegisterGameEvent ( trig , EVENT_GAME_SHOW_SKILL ) end
end

TriggerRegisterBuildSubmenuEventBJ  = function ( trig )
do return TriggerRegisterGameEvent ( trig , EVENT_GAME_BUILD_SUBMENU ) end
end

TriggerRegisterGameLoadedEventBJ  = function ( trig )
do return TriggerRegisterGameEvent ( trig , EVENT_GAME_LOADED ) end
end

TriggerRegisterGameSavedEventBJ  = function ( trig )
do return TriggerRegisterGameEvent ( trig , EVENT_GAME_SAVE ) end
end

RegisterDestDeathInRegionEnum  = function ( )
bj_destInRegionDiesCount = bj_destInRegionDiesCount + 1
if ( bj_destInRegionDiesCount <= bj_MAX_DEST_IN_REGION_EVENTS ) then
TriggerRegisterDeathEvent ( bj_destInRegionDiesTrig , GetEnumDestructable ( ) )
end
end

TriggerRegisterDestDeathInRegionEvent  = function ( trig , r )
bj_destInRegionDiesTrig = trig
bj_destInRegionDiesCount = 0
EnumDestructablesInRect ( r , nil , RegisterDestDeathInRegionEnum )
end






AddWeatherEffectSaveLast  = function ( where , effectID )
bj_lastCreatedWeatherEffect = AddWeatherEffect ( where , effectID )
do return bj_lastCreatedWeatherEffect end
end

GetLastCreatedWeatherEffect  = function ( )
do return bj_lastCreatedWeatherEffect end
end

RemoveWeatherEffectBJ  = function ( whichWeatherEffect )
RemoveWeatherEffect ( whichWeatherEffect )
end

TerrainDeformationCraterBJ  = function ( duration , permanent , where , radius , depth )
bj_lastCreatedTerrainDeformation = TerrainDeformCrater ( GetLocationX ( where ) , GetLocationY ( where ) , radius , depth , R2I ( duration * 1000 ) , permanent )
do return bj_lastCreatedTerrainDeformation end
end

TerrainDeformationRippleBJ  = function ( duration , limitNeg , where , startRadius , endRadius , depth , wavePeriod , waveWidth )
local spaceWave
local timeWave
local radiusRatio
if ( endRadius <= 0 or waveWidth <= 0 or wavePeriod <= 0 ) then
do return nil end
end
timeWave = 2.0 * duration / wavePeriod
spaceWave = 2.0 * endRadius / waveWidth
radiusRatio = startRadius / endRadius
bj_lastCreatedTerrainDeformation = TerrainDeformRipple ( GetLocationX ( where ) , GetLocationY ( where ) , endRadius , depth , R2I ( duration * 1000 ) , 1 , spaceWave , timeWave , radiusRatio , limitNeg )
do return bj_lastCreatedTerrainDeformation end
end

TerrainDeformationWaveBJ  = function ( duration , source , target , radius , depth , trailDelay )
local distance
local dirX
local dirY
local speed
distance = DistanceBetweenPoints ( source , target )
if ( distance == 0 or duration <= 0 ) then
do return nil end
end
dirX = ( GetLocationX ( target ) - GetLocationX ( source ) ) / distance
dirY = ( GetLocationY ( target ) - GetLocationY ( source ) ) / distance
speed = distance / duration
bj_lastCreatedTerrainDeformation = TerrainDeformWave ( GetLocationX ( source ) , GetLocationY ( source ) , dirX , dirY , distance , speed , radius , depth , R2I ( trailDelay * 1000 ) , 1 )
do return bj_lastCreatedTerrainDeformation end
end

TerrainDeformationRandomBJ  = function ( duration , where , radius , minDelta , maxDelta , updateInterval )
bj_lastCreatedTerrainDeformation = TerrainDeformRandom ( GetLocationX ( where ) , GetLocationY ( where ) , radius , minDelta , maxDelta , R2I ( duration * 1000 ) , R2I ( updateInterval * 1000 ) )
do return bj_lastCreatedTerrainDeformation end
end

TerrainDeformationStopBJ  = function ( deformation , duration )
TerrainDeformStop ( deformation , R2I ( duration * 1000 ) )
end

GetLastCreatedTerrainDeformation  = function ( )
do return bj_lastCreatedTerrainDeformation end
end

AddLightningLoc  = function ( codeName , where1 , where2 )
bj_lastCreatedLightning = AddLightningEx ( codeName , true , GetLocationX ( where1 ) , GetLocationY ( where1 ) , GetLocationZ ( where1 ) , GetLocationX ( where2 ) , GetLocationY ( where2 ) , GetLocationZ ( where2 ) )
do return bj_lastCreatedLightning end
end

DestroyLightningBJ  = function ( whichBolt )
do return DestroyLightning ( whichBolt ) end
end

MoveLightningLoc  = function ( whichBolt , where1 , where2 )
do return MoveLightningEx ( whichBolt , true , GetLocationX ( where1 ) , GetLocationY ( where1 ) , GetLocationZ ( where1 ) , GetLocationX ( where2 ) , GetLocationY ( where2 ) , GetLocationZ ( where2 ) ) end
end

GetLightningColorABJ  = function ( whichBolt )
do return GetLightningColorA ( whichBolt ) end
end

GetLightningColorRBJ  = function ( whichBolt )
do return GetLightningColorR ( whichBolt ) end
end

GetLightningColorGBJ  = function ( whichBolt )
do return GetLightningColorG ( whichBolt ) end
end

GetLightningColorBBJ  = function ( whichBolt )
do return GetLightningColorB ( whichBolt ) end
end

SetLightningColorBJ  = function ( whichBolt , r , g , b , a )
do return SetLightningColor ( whichBolt , r , g , b , a ) end
end

GetLastCreatedLightningBJ  = function ( )
do return bj_lastCreatedLightning end
end

GetAbilityEffectBJ  = function ( abilcode , t , index )
do return GetAbilityEffectById ( abilcode , t , index ) end
end

GetAbilitySoundBJ  = function ( abilcode , t )
do return GetAbilitySoundById ( abilcode , t ) end
end

GetTerrainCliffLevelBJ  = function ( where )
do return GetTerrainCliffLevel ( GetLocationX ( where ) , GetLocationY ( where ) ) end
end

GetTerrainTypeBJ  = function ( where )
do return GetTerrainType ( GetLocationX ( where ) , GetLocationY ( where ) ) end
end

GetTerrainVarianceBJ  = function ( where )
do return GetTerrainVariance ( GetLocationX ( where ) , GetLocationY ( where ) ) end
end

SetTerrainTypeBJ  = function ( where , terrainType , variation , area , shape )
SetTerrainType ( GetLocationX ( where ) , GetLocationY ( where ) , terrainType , variation , area , shape )
end

IsTerrainPathableBJ  = function ( where , t )
do return IsTerrainPathable ( GetLocationX ( where ) , GetLocationY ( where ) , t ) end
end

SetTerrainPathableBJ  = function ( where , t , flag )
SetTerrainPathable ( GetLocationX ( where ) , GetLocationY ( where ) , t , flag )
end

SetWaterBaseColorBJ  = function ( red , green , blue , transparency )
SetWaterBaseColor ( PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100.0 - transparency ) )
end

CreateFogModifierRectSimple  = function ( whichPlayer , whichFogState , r , afterUnits )
bj_lastCreatedFogModifier = CreateFogModifierRect ( whichPlayer , whichFogState , r , true , afterUnits )
do return bj_lastCreatedFogModifier end
end

CreateFogModifierRadiusLocSimple  = function ( whichPlayer , whichFogState , center , radius , afterUnits )
bj_lastCreatedFogModifier = CreateFogModifierRadiusLoc ( whichPlayer , whichFogState , center , radius , true , afterUnits )
do return bj_lastCreatedFogModifier end
end





CreateFogModifierRectBJ  = function ( enabled , whichPlayer , whichFogState , r )
bj_lastCreatedFogModifier = CreateFogModifierRect ( whichPlayer , whichFogState , r , true , false )
if enabled then
FogModifierStart ( bj_lastCreatedFogModifier )
end
do return bj_lastCreatedFogModifier end
end





CreateFogModifierRadiusLocBJ  = function ( enabled , whichPlayer , whichFogState , center , radius )
bj_lastCreatedFogModifier = CreateFogModifierRadiusLoc ( whichPlayer , whichFogState , center , radius , true , false )
if enabled then
FogModifierStart ( bj_lastCreatedFogModifier )
end
do return bj_lastCreatedFogModifier end
end

GetLastCreatedFogModifier  = function ( )
do return bj_lastCreatedFogModifier end
end

FogEnableOn  = function ( )
FogEnable ( true )
end

FogEnableOff  = function ( )
FogEnable ( false )
end

FogMaskEnableOn  = function ( )
FogMaskEnable ( true )
end

FogMaskEnableOff  = function ( )
FogMaskEnable ( false )
end

UseTimeOfDayBJ  = function ( flag )
SuspendTimeOfDay ( not flag )
end

SetTerrainFogExBJ  = function ( style , zstart , zend , density , red , green , blue )
SetTerrainFogEx ( style , zstart , zend , density , red * 0.01 , green * 0.01 , blue * 0.01 )
end

ResetTerrainFogBJ  = function ( )
ResetTerrainFog ( )
end

SetDoodadAnimationBJ  = function ( animName , doodadID , radius , center )
SetDoodadAnimation ( GetLocationX ( center ) , GetLocationY ( center ) , radius , doodadID , false , animName , false )
end

SetDoodadAnimationRectBJ  = function ( animName , doodadID , r )
SetDoodadAnimationRect ( r , doodadID , animName , false )
end

AddUnitAnimationPropertiesBJ  = function ( add , animProperties , whichUnit )
AddUnitAnimationProperties ( whichUnit , animProperties , add )
end

CreateImageBJ  = function ( file , size , where , zOffset , imageType )
bj_lastCreatedImage = CreateImage ( file , size , size , size , GetLocationX ( where ) , GetLocationY ( where ) , zOffset , 0 , 0 , 0 , imageType )
do return bj_lastCreatedImage end
end

ShowImageBJ  = function ( flag , whichImage )
ShowImage ( whichImage , flag )
end

SetImagePositionBJ  = function ( whichImage , where , zOffset )
SetImagePosition ( whichImage , GetLocationX ( where ) , GetLocationY ( where ) , zOffset )
end

SetImageColorBJ  = function ( whichImage , red , green , blue , alpha )
SetImageColor ( whichImage , PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100.0 - alpha ) )
end

GetLastCreatedImage  = function ( )
do return bj_lastCreatedImage end
end

CreateUbersplatBJ  = function ( where , name , red , green , blue , alpha , forcePaused , noBirthTime )
bj_lastCreatedUbersplat = CreateUbersplat ( GetLocationX ( where ) , GetLocationY ( where ) , name , PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100.0 - alpha ) , forcePaused , noBirthTime )
do return bj_lastCreatedUbersplat end
end

ShowUbersplatBJ  = function ( flag , whichSplat )
ShowUbersplat ( whichSplat , flag )
end

GetLastCreatedUbersplat  = function ( )
do return bj_lastCreatedUbersplat end
end






PlaySoundBJ  = function ( soundHandle )
bj_lastPlayedSound = soundHandle
if ( soundHandle ~= nil ) then
StartSound ( soundHandle )
end
end

StopSoundBJ  = function ( soundHandle , fadeOut )
StopSound ( soundHandle , false , fadeOut )
end

SetSoundVolumeBJ  = function ( soundHandle , volumePercent )
SetSoundVolume ( soundHandle , PercentToInt ( volumePercent , 127 ) )
end

SetSoundOffsetBJ  = function ( newOffset , soundHandle )
SetSoundPlayPosition ( soundHandle , R2I ( newOffset * 1000 ) )
end

SetSoundDistanceCutoffBJ  = function ( soundHandle , cutoff )
SetSoundDistanceCutoff ( soundHandle , cutoff )
end

SetSoundPitchBJ  = function ( soundHandle , pitch )
SetSoundPitch ( soundHandle , pitch )
end

SetSoundPositionLocBJ  = function ( soundHandle , loc , z )
SetSoundPosition ( soundHandle , GetLocationX ( loc ) , GetLocationY ( loc ) , z )
end

AttachSoundToUnitBJ  = function ( soundHandle , whichUnit )
AttachSoundToUnit ( soundHandle , whichUnit )
end

SetSoundConeAnglesBJ  = function ( soundHandle , inside , outside , outsideVolumePercent )
SetSoundConeAngles ( soundHandle , inside , outside , PercentToInt ( outsideVolumePercent , 127 ) )
end

KillSoundWhenDoneBJ  = function ( soundHandle )
KillSoundWhenDone ( soundHandle )
end

PlaySoundAtPointBJ  = function ( soundHandle , volumePercent , loc , z )
SetSoundPositionLocBJ ( soundHandle , loc , z )
SetSoundVolumeBJ ( soundHandle , volumePercent )
PlaySoundBJ ( soundHandle )
end

PlaySoundOnUnitBJ  = function ( soundHandle , volumePercent , whichUnit )
AttachSoundToUnitBJ ( soundHandle , whichUnit )
SetSoundVolumeBJ ( soundHandle , volumePercent )
PlaySoundBJ ( soundHandle )
end

PlaySoundFromOffsetBJ  = function ( soundHandle , volumePercent , startingOffset )
SetSoundVolumeBJ ( soundHandle , volumePercent )
PlaySoundBJ ( soundHandle )
SetSoundOffsetBJ ( startingOffset , soundHandle )
end

PlayMusicBJ  = function ( musicFileName )
bj_lastPlayedMusic = musicFileName
PlayMusic ( musicFileName )
end

PlayMusicExBJ  = function ( musicFileName , startingOffset , fadeInTime )
bj_lastPlayedMusic = musicFileName
PlayMusicEx ( musicFileName , R2I ( startingOffset * 1000 ) , R2I ( fadeInTime * 1000 ) )
end

SetMusicOffsetBJ  = function ( newOffset )
SetMusicPlayPosition ( R2I ( newOffset * 1000 ) )
end

PlayThematicMusicBJ  = function ( musicName )
PlayThematicMusic ( musicName )
end

PlayThematicMusicExBJ  = function ( musicName , startingOffset )
PlayThematicMusicEx ( musicName , R2I ( startingOffset * 1000 ) )
end

SetThematicMusicOffsetBJ  = function ( newOffset )
SetThematicMusicPlayPosition ( R2I ( newOffset * 1000 ) )
end

EndThematicMusicBJ  = function ( )
EndThematicMusic ( )
end

StopMusicBJ  = function ( fadeOut )
StopMusic ( fadeOut )
end

ResumeMusicBJ  = function ( )
ResumeMusic ( )
end

SetMusicVolumeBJ  = function ( volumePercent )
SetMusicVolume ( PercentToInt ( volumePercent , 127 ) )
end

GetSoundDurationBJ  = function ( soundHandle )
if ( soundHandle == nil ) then
do return bj_NOTHING_SOUND_DURATION end
else
do return I2R ( GetSoundDuration ( soundHandle ) ) * 0.001 end
end
end

GetSoundFileDurationBJ  = function ( musicFileName )
do return I2R ( GetSoundFileDuration ( musicFileName ) ) * 0.001 end
end

GetLastPlayedSound  = function ( )
do return bj_lastPlayedSound end
end

GetLastPlayedMusic  = function ( )
do return bj_lastPlayedMusic end
end

VolumeGroupSetVolumeBJ  = function ( vgroup , percent )
VolumeGroupSetVolume ( vgroup , percent * 0.01 )
end

SetCineModeVolumeGroupsImmediateBJ  = function ( )
VolumeGroupSetVolume ( SOUND_VOLUMEGROUP_UNITMOVEMENT , bj_CINEMODE_VOLUME_UNITMOVEMENT )
VolumeGroupSetVolume ( SOUND_VOLUMEGROUP_UNITSOUNDS , bj_CINEMODE_VOLUME_UNITSOUNDS )
VolumeGroupSetVolume ( SOUND_VOLUMEGROUP_COMBAT , bj_CINEMODE_VOLUME_COMBAT )
VolumeGroupSetVolume ( SOUND_VOLUMEGROUP_SPELLS , bj_CINEMODE_VOLUME_SPELLS )
VolumeGroupSetVolume ( SOUND_VOLUMEGROUP_UI , bj_CINEMODE_VOLUME_UI )
VolumeGroupSetVolume ( SOUND_VOLUMEGROUP_MUSIC , bj_CINEMODE_VOLUME_MUSIC )
VolumeGroupSetVolume ( SOUND_VOLUMEGROUP_AMBIENTSOUNDS , bj_CINEMODE_VOLUME_AMBIENTSOUNDS )
VolumeGroupSetVolume ( SOUND_VOLUMEGROUP_FIRE , bj_CINEMODE_VOLUME_FIRE )
end

SetCineModeVolumeGroupsBJ  = function ( )

if bj_gameStarted then
SetCineModeVolumeGroupsImmediateBJ ( )
else
TimerStart ( bj_volumeGroupsTimer , bj_GAME_STARTED_THRESHOLD , false , SetCineModeVolumeGroupsImmediateBJ )
end
end

SetSpeechVolumeGroupsImmediateBJ  = function ( )
VolumeGroupSetVolume ( SOUND_VOLUMEGROUP_UNITMOVEMENT , bj_SPEECH_VOLUME_UNITMOVEMENT )
VolumeGroupSetVolume ( SOUND_VOLUMEGROUP_UNITSOUNDS , bj_SPEECH_VOLUME_UNITSOUNDS )
VolumeGroupSetVolume ( SOUND_VOLUMEGROUP_COMBAT , bj_SPEECH_VOLUME_COMBAT )
VolumeGroupSetVolume ( SOUND_VOLUMEGROUP_SPELLS , bj_SPEECH_VOLUME_SPELLS )
VolumeGroupSetVolume ( SOUND_VOLUMEGROUP_UI , bj_SPEECH_VOLUME_UI )
VolumeGroupSetVolume ( SOUND_VOLUMEGROUP_MUSIC , bj_SPEECH_VOLUME_MUSIC )
VolumeGroupSetVolume ( SOUND_VOLUMEGROUP_AMBIENTSOUNDS , bj_SPEECH_VOLUME_AMBIENTSOUNDS )
VolumeGroupSetVolume ( SOUND_VOLUMEGROUP_FIRE , bj_SPEECH_VOLUME_FIRE )
end

SetSpeechVolumeGroupsBJ  = function ( )

if bj_gameStarted then
SetSpeechVolumeGroupsImmediateBJ ( )
else
TimerStart ( bj_volumeGroupsTimer , bj_GAME_STARTED_THRESHOLD , false , SetSpeechVolumeGroupsImmediateBJ )
end
end

VolumeGroupResetImmediateBJ  = function ( )
VolumeGroupReset ( )
end

VolumeGroupResetBJ  = function ( )

if bj_gameStarted then
VolumeGroupResetImmediateBJ ( )
else
TimerStart ( bj_volumeGroupsTimer , bj_GAME_STARTED_THRESHOLD , false , VolumeGroupResetImmediateBJ )
end
end

GetSoundIsPlayingBJ  = function ( soundHandle )
do return GetSoundIsLoading ( soundHandle ) or GetSoundIsPlaying ( soundHandle ) end
end

WaitForSoundBJ  = function ( soundHandle , offset )
TriggerWaitForSound ( soundHandle , offset )
end

SetMapMusicIndexedBJ  = function ( musicName , index )
SetMapMusic ( musicName , false , index )
end

SetMapMusicRandomBJ  = function ( musicName )
SetMapMusic ( musicName , true , 0 )
end

ClearMapMusicBJ  = function ( )
ClearMapMusic ( )
end

SetStackedSoundBJ  = function ( add , soundHandle , r )
local width = GetRectMaxX ( r ) - GetRectMinX ( r )
local height = GetRectMaxY ( r ) - GetRectMinY ( r )
SetSoundPosition ( soundHandle , GetRectCenterX ( r ) , GetRectCenterY ( r ) , 0 )
if add then
RegisterStackedSound ( soundHandle , true , width , height )
else
UnregisterStackedSound ( soundHandle , true , width , height )
end
end

StartSoundForPlayerBJ  = function ( whichPlayer , soundHandle )
if ( whichPlayer == GetLocalPlayer ( ) ) then
StartSound ( soundHandle )
end
end

VolumeGroupSetVolumeForPlayerBJ  = function ( whichPlayer , vgroup , scale )
if ( GetLocalPlayer ( ) == whichPlayer ) then
VolumeGroupSetVolume ( vgroup , scale )
end
end

EnableDawnDusk  = function ( flag )
bj_useDawnDuskSounds = flag
end

IsDawnDuskEnabled  = function ( )
do return bj_useDawnDuskSounds end
end






SetAmbientDaySound  = function ( inLabel )
local ToD

if ( bj_dayAmbientSound ~= nil ) then
StopSound ( bj_dayAmbientSound , true , true )
end

bj_dayAmbientSound = CreateMIDISound ( inLabel , 20 , 20 )

ToD = GetTimeOfDay ( )
if ( ToD >= bj_TOD_DAWN and ToD < bj_TOD_DUSK ) then
StartSound ( bj_dayAmbientSound )
end
end

SetAmbientNightSound  = function ( inLabel )
local ToD

if ( bj_nightAmbientSound ~= nil ) then
StopSound ( bj_nightAmbientSound , true , true )
end

bj_nightAmbientSound = CreateMIDISound ( inLabel , 20 , 20 )

ToD = GetTimeOfDay ( )
if ( ToD < bj_TOD_DAWN or ToD >= bj_TOD_DUSK ) then
StartSound ( bj_nightAmbientSound )
end
end






AddSpecialEffectLocBJ  = function ( where , modelName )
bj_lastCreatedEffect = AddSpecialEffectLoc ( modelName , where )
do return bj_lastCreatedEffect end
end

AddSpecialEffectTargetUnitBJ  = function ( attachPointName , targetWidget , modelName )
bj_lastCreatedEffect = AddSpecialEffectTarget ( modelName , targetWidget , attachPointName )
do return bj_lastCreatedEffect end
end



















DestroyEffectBJ  = function ( whichEffect )
DestroyEffect ( whichEffect )
end

GetLastCreatedEffectBJ  = function ( )
do return bj_lastCreatedEffect end
end






GetItemLoc  = function ( whichItem )
do return Location ( GetItemX ( whichItem ) , GetItemY ( whichItem ) ) end
end

GetItemLifeBJ  = function ( whichWidget )
do return GetWidgetLife ( whichWidget ) end
end

SetItemLifeBJ  = function ( whichWidget , life )
SetWidgetLife ( whichWidget , life )
end

AddHeroXPSwapped  = function ( xpToAdd , whichHero , showEyeCandy )
AddHeroXP ( whichHero , xpToAdd , showEyeCandy )
end

SetHeroLevelBJ  = function ( whichHero , newLevel , showEyeCandy )
local oldLevel = GetHeroLevel ( whichHero )
if ( newLevel > oldLevel ) then
SetHeroLevel ( whichHero , newLevel , showEyeCandy )
elseif ( newLevel < oldLevel ) then
UnitStripHeroLevel ( whichHero , oldLevel - newLevel )
else

end
end

DecUnitAbilityLevelSwapped  = function ( abilcode , whichUnit )
do return DecUnitAbilityLevel ( whichUnit , abilcode ) end
end

IncUnitAbilityLevelSwapped  = function ( abilcode , whichUnit )
do return IncUnitAbilityLevel ( whichUnit , abilcode ) end
end

SetUnitAbilityLevelSwapped  = function ( abilcode , whichUnit , level )
do return SetUnitAbilityLevel ( whichUnit , abilcode , level ) end
end

GetUnitAbilityLevelSwapped  = function ( abilcode , whichUnit )
do return GetUnitAbilityLevel ( whichUnit , abilcode ) end
end

UnitHasBuffBJ  = function ( whichUnit , buffcode )
do return ( GetUnitAbilityLevel ( whichUnit , buffcode ) > 0 ) end
end

UnitRemoveBuffBJ  = function ( buffcode , whichUnit )
do return UnitRemoveAbility ( whichUnit , buffcode ) end
end

UnitAddItemSwapped  = function ( whichItem , whichHero )
do return UnitAddItem ( whichHero , whichItem ) end
end

UnitAddItemByIdSwapped  = function ( itemId , whichHero )



bj_lastCreatedItem = CreateItem ( itemId , GetUnitX ( whichHero ) , GetUnitY ( whichHero ) )
UnitAddItem ( whichHero , bj_lastCreatedItem )
do return bj_lastCreatedItem end
end

UnitRemoveItemSwapped  = function ( whichItem , whichHero )
bj_lastRemovedItem = whichItem
UnitRemoveItem ( whichHero , whichItem )
end



UnitRemoveItemFromSlotSwapped  = function ( itemSlot , whichHero )
bj_lastRemovedItem = UnitRemoveItemFromSlot ( whichHero , itemSlot - 1 )
do return bj_lastRemovedItem end
end

CreateItemLoc  = function ( itemId , loc )
bj_lastCreatedItem = CreateItem ( itemId , GetLocationX ( loc ) , GetLocationY ( loc ) )
do return bj_lastCreatedItem end
end

GetLastCreatedItem  = function ( )
do return bj_lastCreatedItem end
end

GetLastRemovedItem  = function ( )
do return bj_lastRemovedItem end
end

SetItemPositionLoc  = function ( whichItem , loc )
SetItemPosition ( whichItem , GetLocationX ( loc ) , GetLocationY ( loc ) )
end

GetLearnedSkillBJ  = function ( )
do return GetLearnedSkill ( ) end
end

SuspendHeroXPBJ  = function ( flag , whichHero )
SuspendHeroXP ( whichHero , not flag )
end

SetPlayerHandicapXPBJ  = function ( whichPlayer , handicapPercent )
SetPlayerHandicapXP ( whichPlayer , handicapPercent * 0.01 )
end

GetPlayerHandicapXPBJ  = function ( whichPlayer )
do return GetPlayerHandicapXP ( whichPlayer ) * 100 end
end

SetPlayerHandicapBJ  = function ( whichPlayer , handicapPercent )
SetPlayerHandicap ( whichPlayer , handicapPercent * 0.01 )
end

GetPlayerHandicapBJ  = function ( whichPlayer )
do return GetPlayerHandicap ( whichPlayer ) * 100 end
end

GetHeroStatBJ  = function ( whichStat , whichHero , includeBonuses )
if ( whichStat == bj_HEROSTAT_STR ) then
do return GetHeroStr ( whichHero , includeBonuses ) end
elseif ( whichStat == bj_HEROSTAT_AGI ) then
do return GetHeroAgi ( whichHero , includeBonuses ) end
elseif ( whichStat == bj_HEROSTAT_INT ) then
do return GetHeroInt ( whichHero , includeBonuses ) end
else

do return 0 end
end
end

SetHeroStat  = function ( whichHero , whichStat , value )

if ( value <= 0 ) then
do return end
end
if ( whichStat == bj_HEROSTAT_STR ) then
SetHeroStr ( whichHero , value , true )
elseif ( whichStat == bj_HEROSTAT_AGI ) then
SetHeroAgi ( whichHero , value , true )
elseif ( whichStat == bj_HEROSTAT_INT ) then
SetHeroInt ( whichHero , value , true )
else

end
end

ModifyHeroStat  = function ( whichStat , whichHero , modifyMethod , value )
if ( modifyMethod == bj_MODIFYMETHOD_ADD ) then
SetHeroStat ( whichHero , whichStat , GetHeroStatBJ ( whichStat , whichHero , false ) + value )
elseif ( modifyMethod == bj_MODIFYMETHOD_SUB ) then
SetHeroStat ( whichHero , whichStat , GetHeroStatBJ ( whichStat , whichHero , false ) - value )
elseif ( modifyMethod == bj_MODIFYMETHOD_SET ) then
SetHeroStat ( whichHero , whichStat , value )
else

end
end

ModifyHeroSkillPoints  = function ( whichHero , modifyMethod , value )
if ( modifyMethod == bj_MODIFYMETHOD_ADD ) then
do return UnitModifySkillPoints ( whichHero , value ) end
elseif ( modifyMethod == bj_MODIFYMETHOD_SUB ) then
do return UnitModifySkillPoints ( whichHero , - value ) end
elseif ( modifyMethod == bj_MODIFYMETHOD_SET ) then
do return UnitModifySkillPoints ( whichHero , value - GetHeroSkillPoints ( whichHero ) ) end
else

do return false end
end
end

UnitDropItemPointBJ  = function ( whichUnit , whichItem , x , y )
do return UnitDropItemPoint ( whichUnit , whichItem , x , y ) end
end

UnitDropItemPointLoc  = function ( whichUnit , whichItem , loc )
do return UnitDropItemPoint ( whichUnit , whichItem , GetLocationX ( loc ) , GetLocationY ( loc ) ) end
end

UnitDropItemSlotBJ  = function ( whichUnit , whichItem , slot )
do return UnitDropItemSlot ( whichUnit , whichItem , slot - 1 ) end
end

UnitDropItemTargetBJ  = function ( whichUnit , whichItem , target )
do return UnitDropItemTarget ( whichUnit , whichItem , target ) end
end




UnitUseItemDestructable  = function ( whichUnit , whichItem , target )
do return UnitUseItemTarget ( whichUnit , whichItem , target ) end
end

UnitUseItemPointLoc  = function ( whichUnit , whichItem , loc )
do return UnitUseItemPoint ( whichUnit , whichItem , GetLocationX ( loc ) , GetLocationY ( loc ) ) end
end



UnitItemInSlotBJ  = function ( whichUnit , itemSlot )
do return UnitItemInSlot ( whichUnit , itemSlot - 1 ) end
end



GetInventoryIndexOfItemTypeBJ  = function ( whichUnit , itemId )
local index
local indexItem
index = 0
for _i = 1, 10000 do
indexItem = UnitItemInSlot ( whichUnit , index )
if ( indexItem ~= nil ) and ( GetItemTypeId ( indexItem ) == itemId ) then
do return index + 1 end
end
index = index + 1
if index >= bj_MAX_INVENTORY then break end
end
do return 0 end
end

GetItemOfTypeFromUnitBJ  = function ( whichUnit , itemId )
local index = GetInventoryIndexOfItemTypeBJ ( whichUnit , itemId )
if ( index == 0 ) then
do return nil end
else
do return UnitItemInSlot ( whichUnit , index - 1 ) end
end
end

UnitHasItemOfTypeBJ  = function ( whichUnit , itemId )
do return GetInventoryIndexOfItemTypeBJ ( whichUnit , itemId ) > 0 end
end

UnitInventoryCount  = function ( whichUnit )
local index = 0
local count = 0
for _i = 1, 10000 do
if ( UnitItemInSlot ( whichUnit , index ) ~= nil ) then
count = count + 1
end
index = index + 1
if index >= bj_MAX_INVENTORY then break end
end
do return count end
end

UnitInventorySizeBJ  = function ( whichUnit )
do return UnitInventorySize ( whichUnit ) end
end

SetItemInvulnerableBJ  = function ( whichItem , flag )
SetItemInvulnerable ( whichItem , flag )
end

SetItemDropOnDeathBJ  = function ( whichItem , flag )
SetItemDropOnDeath ( whichItem , flag )
end

SetItemDroppableBJ  = function ( whichItem , flag )
SetItemDroppable ( whichItem , flag )
end

SetItemPlayerBJ  = function ( whichItem , whichPlayer , changeColor )
SetItemPlayer ( whichItem , whichPlayer , changeColor )
end

SetItemVisibleBJ  = function ( show , whichItem )
SetItemVisible ( whichItem , show )
end

IsItemHiddenBJ  = function ( whichItem )
do return not IsItemVisible ( whichItem ) end
end

ChooseRandomItemBJ  = function ( level )
do return ChooseRandomItem ( level ) end
end

ChooseRandomItemExBJ  = function ( level , whichType )
do return ChooseRandomItemEx ( whichType , level ) end
end

ChooseRandomNPBuildingBJ  = function ( )
do return ChooseRandomNPBuilding ( ) end
end

ChooseRandomCreepBJ  = function ( level )
do return ChooseRandomCreep ( level ) end
end

EnumItemsInRectBJ  = function ( r , actionFunc )
EnumItemsInRect ( r , nil , actionFunc )
end



RandomItemInRectBJEnum  = function ( )
bj_itemRandomConsidered = bj_itemRandomConsidered + 1
if ( GetRandomInt ( 1 , bj_itemRandomConsidered ) == 1 ) then
bj_itemRandomCurrentPick = GetEnumItem ( )
end
end



RandomItemInRectBJ  = function ( r , filter )
bj_itemRandomConsidered = 0
bj_itemRandomCurrentPick = nil
EnumItemsInRect ( r , filter , RandomItemInRectBJEnum )
DestroyBoolExpr ( filter )
do return bj_itemRandomCurrentPick end
end



RandomItemInRectSimpleBJ  = function ( r )
do return RandomItemInRectBJ ( r , nil ) end
end

CheckItemStatus  = function ( whichItem , status )
if ( status == bj_ITEM_STATUS_HIDDEN ) then
do return not IsItemVisible ( whichItem ) end
elseif ( status == bj_ITEM_STATUS_OWNED ) then
do return IsItemOwned ( whichItem ) end
elseif ( status == bj_ITEM_STATUS_INVULNERABLE ) then
do return IsItemInvulnerable ( whichItem ) end
elseif ( status == bj_ITEM_STATUS_POWERUP ) then
do return IsItemPowerup ( whichItem ) end
elseif ( status == bj_ITEM_STATUS_SELLABLE ) then
do return IsItemSellable ( whichItem ) end
elseif ( status == bj_ITEM_STATUS_PAWNABLE ) then
do return IsItemPawnable ( whichItem ) end
else

do return false end
end
end

CheckItemcodeStatus  = function ( itemId , status )
if ( status == bj_ITEMCODE_STATUS_POWERUP ) then
do return IsItemIdPowerup ( itemId ) end
elseif ( status == bj_ITEMCODE_STATUS_SELLABLE ) then
do return IsItemIdSellable ( itemId ) end
elseif ( status == bj_ITEMCODE_STATUS_PAWNABLE ) then
do return IsItemIdPawnable ( itemId ) end
else

do return false end
end
end






UnitId2OrderIdBJ  = function ( unitId )
do return unitId end
end

String2UnitIdBJ  = function ( unitIdString )
do return UnitId ( unitIdString ) end
end

UnitId2StringBJ  = function ( unitId )
local unitString = UnitId2String ( unitId )
if ( unitString ~= nil ) then
do return unitString end
end

do return "" end
end

String2OrderIdBJ  = function ( orderIdString )
local orderId


orderId = OrderId ( orderIdString )
if ( orderId ~= 0 ) then
do return orderId end
end

orderId = UnitId ( orderIdString )
if ( orderId ~= 0 ) then
do return orderId end
end

do return 0 end
end

OrderId2StringBJ  = function ( orderId )
local orderString

orderString = OrderId2String ( orderId )
if ( orderString ~= nil ) then
do return orderString end
end

orderString = UnitId2String ( orderId )
if ( orderString ~= nil ) then
do return orderString end
end

do return "" end
end

GetIssuedOrderIdBJ  = function ( )
do return GetIssuedOrderId ( ) end
end

GetKillingUnitBJ  = function ( )
do return GetKillingUnit ( ) end
end

CreateUnitAtLocSaveLast  = function ( id , unitid , loc , face )
if ( unitid == 1969713004 ) then
bj_lastCreatedUnit = CreateBlightedGoldmine ( id , GetLocationX ( loc ) , GetLocationY ( loc ) , face )
else
bj_lastCreatedUnit = CreateUnitAtLoc ( id , unitid , loc , face )
end
do return bj_lastCreatedUnit end
end

GetLastCreatedUnit  = function ( )
do return bj_lastCreatedUnit end
end

CreateNUnitsAtLoc  = function ( count , unitId , whichPlayer , loc , face )
GroupClear ( bj_lastCreatedGroup )
for _i = 1, 10000 do
count = count - 1
if count < 0 then break end
CreateUnitAtLocSaveLast ( whichPlayer , unitId , loc , face )
GroupAddUnit ( bj_lastCreatedGroup , bj_lastCreatedUnit )
end
do return bj_lastCreatedGroup end
end

CreateNUnitsAtLocFacingLocBJ  = function ( count , unitId , whichPlayer , loc , lookAt )
do return CreateNUnitsAtLoc ( count , unitId , whichPlayer , loc , AngleBetweenPoints ( loc , lookAt ) ) end
end

GetLastCreatedGroupEnum  = function ( )
GroupAddUnit ( bj_groupLastCreatedDest , GetEnumUnit ( ) )
end

GetLastCreatedGroup  = function ( )
bj_groupLastCreatedDest = CreateGroup ( )
ForGroup ( bj_lastCreatedGroup , GetLastCreatedGroupEnum )
do return bj_groupLastCreatedDest end
end

CreateCorpseLocBJ  = function ( unitid , whichPlayer , loc )
bj_lastCreatedUnit = CreateCorpse ( whichPlayer , unitid , GetLocationX ( loc ) , GetLocationY ( loc ) , GetRandomReal ( 0 , 360 ) )
do return bj_lastCreatedUnit end
end

UnitSuspendDecayBJ  = function ( suspend , whichUnit )
UnitSuspendDecay ( whichUnit , suspend )
end

DelayedSuspendDecayStopAnimEnum  = function ( )
local enumUnit = GetEnumUnit ( )
if ( GetUnitState ( enumUnit , UNIT_STATE_LIFE ) <= 0 ) then
SetUnitTimeScale ( enumUnit , 0.0001 )
end
end

DelayedSuspendDecayBoneEnum  = function ( )
local enumUnit = GetEnumUnit ( )
if ( GetUnitState ( enumUnit , UNIT_STATE_LIFE ) <= 0 ) then
UnitSuspendDecay ( enumUnit , true )
SetUnitTimeScale ( enumUnit , 0.0001 )
end
end





DelayedSuspendDecayFleshEnum  = function ( )
local enumUnit = GetEnumUnit ( )
if ( GetUnitState ( enumUnit , UNIT_STATE_LIFE ) <= 0 ) then
UnitSuspendDecay ( enumUnit , true )
SetUnitTimeScale ( enumUnit , 10.0 )
SetUnitAnimation ( enumUnit , "decay flesh" )
end
end




DelayedSuspendDecay  = function ( )
local boneGroup
local fleshGroup



boneGroup = bj_suspendDecayBoneGroup
fleshGroup = bj_suspendDecayFleshGroup
bj_suspendDecayBoneGroup = CreateGroup ( )
bj_suspendDecayFleshGroup = CreateGroup ( )
ForGroup ( fleshGroup , DelayedSuspendDecayStopAnimEnum )
ForGroup ( boneGroup , DelayedSuspendDecayStopAnimEnum )
TriggerSleepAction ( bj_CORPSE_MAX_DEATH_TIME )
ForGroup ( fleshGroup , DelayedSuspendDecayFleshEnum )
ForGroup ( boneGroup , DelayedSuspendDecayBoneEnum )
TriggerSleepAction ( 0.05 )
ForGroup ( fleshGroup , DelayedSuspendDecayStopAnimEnum )
DestroyGroup ( boneGroup )
DestroyGroup ( fleshGroup )
end

DelayedSuspendDecayCreate  = function ( )
bj_delayedSuspendDecayTrig = CreateTrigger ( )
TriggerRegisterTimerExpireEvent ( bj_delayedSuspendDecayTrig , bj_delayedSuspendDecayTimer )
TriggerAddAction ( bj_delayedSuspendDecayTrig , DelayedSuspendDecay )
end

CreatePermanentCorpseLocBJ  = function ( style , unitid , whichPlayer , loc , facing )
bj_lastCreatedUnit = CreateCorpse ( whichPlayer , unitid , GetLocationX ( loc ) , GetLocationY ( loc ) , facing )
SetUnitBlendTime ( bj_lastCreatedUnit , 0 )
if ( style == bj_CORPSETYPE_FLESH ) then
SetUnitAnimation ( bj_lastCreatedUnit , "decay flesh" )
GroupAddUnit ( bj_suspendDecayFleshGroup , bj_lastCreatedUnit )
elseif ( style == bj_CORPSETYPE_BONE ) then
SetUnitAnimation ( bj_lastCreatedUnit , "decay bone" )
GroupAddUnit ( bj_suspendDecayBoneGroup , bj_lastCreatedUnit )
else

SetUnitAnimation ( bj_lastCreatedUnit , "decay bone" )
GroupAddUnit ( bj_suspendDecayBoneGroup , bj_lastCreatedUnit )
end
TimerStart ( bj_delayedSuspendDecayTimer , 0.05 , false , nil )
do return bj_lastCreatedUnit end
end

GetUnitStateSwap  = function ( whichState , whichUnit )
do return GetUnitState ( whichUnit , whichState ) end
end

GetUnitStatePercent  = function ( whichUnit , whichState , whichMaxState )
local value = GetUnitState ( whichUnit , whichState )
local maxValue = GetUnitState ( whichUnit , whichMaxState )

if ( whichUnit == nil ) or ( maxValue == 0 ) then
do return 0.0 end
end
do return value / maxValue * 100.0 end
end

GetUnitLifePercent  = function ( whichUnit )
do return GetUnitStatePercent ( whichUnit , UNIT_STATE_LIFE , UNIT_STATE_MAX_LIFE ) end
end

GetUnitManaPercent  = function ( whichUnit )
do return GetUnitStatePercent ( whichUnit , UNIT_STATE_MANA , UNIT_STATE_MAX_MANA ) end
end

SelectUnitSingle  = function ( whichUnit )
ClearSelection ( )
SelectUnit ( whichUnit , true )
end

SelectGroupBJEnum  = function ( )
SelectUnit ( GetEnumUnit ( ) , true )
end

SelectGroupBJ  = function ( g )
ClearSelection ( )
ForGroup ( g , SelectGroupBJEnum )
end

SelectUnitAdd  = function ( whichUnit )
SelectUnit ( whichUnit , true )
end

SelectUnitRemove  = function ( whichUnit )
SelectUnit ( whichUnit , false )
end

ClearSelectionForPlayer  = function ( whichPlayer )
if ( GetLocalPlayer ( ) == whichPlayer ) then

ClearSelection ( )
end
end

SelectUnitForPlayerSingle  = function ( whichUnit , whichPlayer )
if ( GetLocalPlayer ( ) == whichPlayer ) then

ClearSelection ( )
SelectUnit ( whichUnit , true )
end
end

SelectGroupForPlayerBJ  = function ( g , whichPlayer )
if ( GetLocalPlayer ( ) == whichPlayer ) then

ClearSelection ( )
ForGroup ( g , SelectGroupBJEnum )
end
end

SelectUnitAddForPlayer  = function ( whichUnit , whichPlayer )
if ( GetLocalPlayer ( ) == whichPlayer ) then

SelectUnit ( whichUnit , true )
end
end

SelectUnitRemoveForPlayer  = function ( whichUnit , whichPlayer )
if ( GetLocalPlayer ( ) == whichPlayer ) then

SelectUnit ( whichUnit , false )
end
end

SetUnitLifeBJ  = function ( whichUnit , newValue )
SetUnitState ( whichUnit , UNIT_STATE_LIFE , RMaxBJ ( 0 , newValue ) )
end

SetUnitManaBJ  = function ( whichUnit , newValue )
SetUnitState ( whichUnit , UNIT_STATE_MANA , RMaxBJ ( 0 , newValue ) )
end

SetUnitLifePercentBJ  = function ( whichUnit , percent )
SetUnitState ( whichUnit , UNIT_STATE_LIFE , GetUnitState ( whichUnit , UNIT_STATE_MAX_LIFE ) * RMaxBJ ( 0 , percent ) * 0.01 )
end

SetUnitManaPercentBJ  = function ( whichUnit , percent )
SetUnitState ( whichUnit , UNIT_STATE_MANA , GetUnitState ( whichUnit , UNIT_STATE_MAX_MANA ) * RMaxBJ ( 0 , percent ) * 0.01 )
end

IsUnitDeadBJ  = function ( whichUnit )
do return GetUnitState ( whichUnit , UNIT_STATE_LIFE ) <= 0 end
end

IsUnitAliveBJ  = function ( whichUnit )
do return not IsUnitDeadBJ ( whichUnit ) end
end

IsUnitGroupDeadBJEnum  = function ( )
if not IsUnitDeadBJ ( GetEnumUnit ( ) ) then
bj_isUnitGroupDeadResult = false
end
end



IsUnitGroupDeadBJ  = function ( g )


local wantDestroy = bj_wantDestroyGroup
bj_wantDestroyGroup = false
bj_isUnitGroupDeadResult = true
ForGroup ( g , IsUnitGroupDeadBJEnum )

if ( wantDestroy ) then
DestroyGroup ( g )
end
do return bj_isUnitGroupDeadResult end
end

IsUnitGroupEmptyBJEnum  = function ( )
bj_isUnitGroupEmptyResult = false
end



IsUnitGroupEmptyBJ  = function ( g )


local wantDestroy = bj_wantDestroyGroup
bj_wantDestroyGroup = false
bj_isUnitGroupEmptyResult = true
ForGroup ( g , IsUnitGroupEmptyBJEnum )

if ( wantDestroy ) then
DestroyGroup ( g )
end
do return bj_isUnitGroupEmptyResult end
end

IsUnitGroupInRectBJEnum  = function ( )
if not RectContainsUnit ( bj_isUnitGroupInRectRect , GetEnumUnit ( ) ) then
bj_isUnitGroupInRectResult = false
end
end



IsUnitGroupInRectBJ  = function ( g , r )
bj_isUnitGroupInRectResult = true
bj_isUnitGroupInRectRect = r
ForGroup ( g , IsUnitGroupInRectBJEnum )
do return bj_isUnitGroupInRectResult end
end

IsUnitHiddenBJ  = function ( whichUnit )
do return IsUnitHidden ( whichUnit ) end
end

ShowUnitHide  = function ( whichUnit )
ShowUnit ( whichUnit , false )
end

ShowUnitShow  = function ( whichUnit )

if ( IsUnitType ( whichUnit , UNIT_TYPE_HERO ) and IsUnitDeadBJ ( whichUnit ) ) then
do return end
end
ShowUnit ( whichUnit , true )
end

IssueHauntOrderAtLocBJFilter  = function ( )
do return GetUnitTypeId ( GetFilterUnit ( ) ) == 1852272492 end
end

IssueHauntOrderAtLocBJ  = function ( whichPeon , loc )
local g = nil
local goldMine = nil

g = CreateGroup ( )
GroupEnumUnitsInRangeOfLoc ( g , loc , 2 * bj_CELLWIDTH , filterIssueHauntOrderAtLocBJ )
goldMine = FirstOfGroup ( g )
DestroyGroup ( g )

if ( goldMine == nil ) then
do return false end
end

do return IssueTargetOrderById ( whichPeon , 1969713004 , goldMine ) end
end

IssueBuildOrderByIdLocBJ  = function ( whichPeon , unitId , loc )
if ( unitId == 1969713004 ) then
do return IssueHauntOrderAtLocBJ ( whichPeon , loc ) end
else
do return IssueBuildOrderById ( whichPeon , unitId , GetLocationX ( loc ) , GetLocationY ( loc ) ) end
end
end

IssueTrainOrderByIdBJ  = function ( whichUnit , unitId )
do return IssueImmediateOrderById ( whichUnit , unitId ) end
end

GroupTrainOrderByIdBJ  = function ( g , unitId )
do return GroupImmediateOrderById ( g , unitId ) end
end

IssueUpgradeOrderByIdBJ  = function ( whichUnit , techId )
do return IssueImmediateOrderById ( whichUnit , techId ) end
end

GetAttackedUnitBJ  = function ( )
do return GetTriggerUnit ( ) end
end

SetUnitFlyHeightBJ  = function ( whichUnit , newHeight , rate )
SetUnitFlyHeight ( whichUnit , newHeight , rate )
end

SetUnitTurnSpeedBJ  = function ( whichUnit , turnSpeed )
SetUnitTurnSpeed ( whichUnit , turnSpeed )
end

SetUnitPropWindowBJ  = function ( whichUnit , propWindow )
local angle = propWindow
if ( angle <= 0 ) then
angle = 1
elseif ( angle >= 360 ) then
angle = 359
end
angle = angle * bj_DEGTORAD
SetUnitPropWindow ( whichUnit , angle )
end

GetUnitPropWindowBJ  = function ( whichUnit )
do return GetUnitPropWindow ( whichUnit ) * bj_RADTODEG end
end

GetUnitDefaultPropWindowBJ  = function ( whichUnit )
do return GetUnitDefaultPropWindow ( whichUnit ) end
end

SetUnitBlendTimeBJ  = function ( whichUnit , blendTime )
SetUnitBlendTime ( whichUnit , blendTime )
end

SetUnitAcquireRangeBJ  = function ( whichUnit , acquireRange )
SetUnitAcquireRange ( whichUnit , acquireRange )
end

UnitSetCanSleepBJ  = function ( whichUnit , canSleep )
UnitAddSleep ( whichUnit , canSleep )
end

UnitCanSleepBJ  = function ( whichUnit )
do return UnitCanSleep ( whichUnit ) end
end

UnitWakeUpBJ  = function ( whichUnit )
UnitWakeUp ( whichUnit )
end

UnitIsSleepingBJ  = function ( whichUnit )
do return UnitIsSleeping ( whichUnit ) end
end

WakePlayerUnitsEnum  = function ( )
UnitWakeUp ( GetEnumUnit ( ) )
end

WakePlayerUnits  = function ( whichPlayer )
local g = CreateGroup ( )
GroupEnumUnitsOfPlayer ( g , whichPlayer , nil )
ForGroup ( g , WakePlayerUnitsEnum )
DestroyGroup ( g )
end

EnableCreepSleepBJ  = function ( enable )
SetPlayerState ( Player ( PLAYER_NEUTRAL_AGGRESSIVE ) , PLAYER_STATE_NO_CREEP_SLEEP , IntegerTertiaryOp ( enable , 0 , 1 ) )

if ( not enable ) then
WakePlayerUnits ( Player ( PLAYER_NEUTRAL_AGGRESSIVE ) )
end
end

UnitGenerateAlarms  = function ( whichUnit , generate )
do return UnitIgnoreAlarm ( whichUnit , not generate ) end
end

DoesUnitGenerateAlarms  = function ( whichUnit )
do return not UnitIgnoreAlarmToggled ( whichUnit ) end
end

PauseAllUnitsBJEnum  = function ( )
PauseUnit ( GetEnumUnit ( ) , bj_pauseAllUnitsFlag )
end


PauseAllUnitsBJ  = function ( pause )
local index
local indexPlayer
local g
bj_pauseAllUnitsFlag = pause
g = CreateGroup ( )
index = 0
for _i = 1, 10000 do
indexPlayer = Player ( index )

if ( GetPlayerController ( indexPlayer ) == MAP_CONTROL_COMPUTER ) then
PauseCompAI ( indexPlayer , pause )
end

GroupEnumUnitsOfPlayer ( g , indexPlayer , nil )
ForGroup ( g , PauseAllUnitsBJEnum )
GroupClear ( g )
index = index + 1
if index == bj_MAX_PLAYER_SLOTS then break end
end
DestroyGroup ( g )
end

PauseUnitBJ  = function ( pause , whichUnit )
PauseUnit ( whichUnit , pause )
end

IsUnitPausedBJ  = function ( whichUnit )
do return IsUnitPaused ( whichUnit ) end
end

UnitPauseTimedLifeBJ  = function ( flag , whichUnit )
UnitPauseTimedLife ( whichUnit , flag )
end

UnitApplyTimedLifeBJ  = function ( duration , buffId , whichUnit )
UnitApplyTimedLife ( whichUnit , buffId , duration )
end

UnitShareVisionBJ  = function ( share , whichUnit , whichPlayer )
UnitShareVision ( whichUnit , whichPlayer , share )
end

UnitRemoveBuffsBJ  = function ( buffType , whichUnit )
if ( buffType == bj_REMOVEBUFFS_POSITIVE ) then
UnitRemoveBuffs ( whichUnit , true , false )
elseif ( buffType == bj_REMOVEBUFFS_NEGATIVE ) then
UnitRemoveBuffs ( whichUnit , false , true )
elseif ( buffType == bj_REMOVEBUFFS_ALL ) then
UnitRemoveBuffs ( whichUnit , true , true )
elseif ( buffType == bj_REMOVEBUFFS_NONTLIFE ) then
UnitRemoveBuffsEx ( whichUnit , true , true , false , false , false , true , false )
else

end
end

UnitRemoveBuffsExBJ  = function ( polarity , resist , whichUnit , bTLife , bAura )
local bPos = ( polarity == bj_BUFF_POLARITY_EITHER ) or ( polarity == bj_BUFF_POLARITY_POSITIVE )
local bNeg = ( polarity == bj_BUFF_POLARITY_EITHER ) or ( polarity == bj_BUFF_POLARITY_NEGATIVE )
local bMagic = ( resist == bj_BUFF_RESIST_BOTH ) or ( resist == bj_BUFF_RESIST_MAGIC )
local bPhys = ( resist == bj_BUFF_RESIST_BOTH ) or ( resist == bj_BUFF_RESIST_PHYSICAL )
UnitRemoveBuffsEx ( whichUnit , bPos , bNeg , bMagic , bPhys , bTLife , bAura , false )
end

UnitCountBuffsExBJ  = function ( polarity , resist , whichUnit , bTLife , bAura )
local bPos = ( polarity == bj_BUFF_POLARITY_EITHER ) or ( polarity == bj_BUFF_POLARITY_POSITIVE )
local bNeg = ( polarity == bj_BUFF_POLARITY_EITHER ) or ( polarity == bj_BUFF_POLARITY_NEGATIVE )
local bMagic = ( resist == bj_BUFF_RESIST_BOTH ) or ( resist == bj_BUFF_RESIST_MAGIC )
local bPhys = ( resist == bj_BUFF_RESIST_BOTH ) or ( resist == bj_BUFF_RESIST_PHYSICAL )
do return UnitCountBuffsEx ( whichUnit , bPos , bNeg , bMagic , bPhys , bTLife , bAura , false ) end
end

UnitRemoveAbilityBJ  = function ( abilityId , whichUnit )
do return UnitRemoveAbility ( whichUnit , abilityId ) end
end

UnitAddAbilityBJ  = function ( abilityId , whichUnit )
do return UnitAddAbility ( whichUnit , abilityId ) end
end

UnitRemoveTypeBJ  = function ( whichType , whichUnit )
do return UnitRemoveType ( whichUnit , whichType ) end
end

UnitAddTypeBJ  = function ( whichType , whichUnit )
do return UnitAddType ( whichUnit , whichType ) end
end

UnitMakeAbilityPermanentBJ  = function ( permanent , abilityId , whichUnit )
do return UnitMakeAbilityPermanent ( whichUnit , permanent , abilityId ) end
end

SetUnitExplodedBJ  = function ( whichUnit , exploded )
SetUnitExploded ( whichUnit , exploded )
end

ExplodeUnitBJ  = function ( whichUnit )
SetUnitExploded ( whichUnit , true )
KillUnit ( whichUnit )
end

GetTransportUnitBJ  = function ( )
do return GetTransportUnit ( ) end
end

GetLoadedUnitBJ  = function ( )
do return GetLoadedUnit ( ) end
end

IsUnitInTransportBJ  = function ( whichUnit , whichTransport )
do return IsUnitInTransport ( whichUnit , whichTransport ) end
end

IsUnitLoadedBJ  = function ( whichUnit )
do return IsUnitLoaded ( whichUnit ) end
end

IsUnitIllusionBJ  = function ( whichUnit )
do return IsUnitIllusion ( whichUnit ) end
end




ReplaceUnitBJ  = function ( whichUnit , newUnitId , unitStateMethod )
local oldUnit = whichUnit
local newUnit
local wasHidden
local index
local indexItem
local oldRatio

if ( oldUnit == nil ) then
bj_lastReplacedUnit = oldUnit
do return oldUnit end
end

wasHidden = IsUnitHidden ( oldUnit )
ShowUnit ( oldUnit , false )

if ( newUnitId == 1969713004 ) then
newUnit = CreateBlightedGoldmine ( GetOwningPlayer ( oldUnit ) , GetUnitX ( oldUnit ) , GetUnitY ( oldUnit ) , GetUnitFacing ( oldUnit ) )
else
newUnit = CreateUnit ( GetOwningPlayer ( oldUnit ) , newUnitId , GetUnitX ( oldUnit ) , GetUnitY ( oldUnit ) , GetUnitFacing ( oldUnit ) )
end

if ( unitStateMethod == bj_UNIT_STATE_METHOD_RELATIVE ) then


if ( GetUnitState ( oldUnit , UNIT_STATE_MAX_LIFE ) > 0 ) then
oldRatio = GetUnitState ( oldUnit , UNIT_STATE_LIFE ) / GetUnitState ( oldUnit , UNIT_STATE_MAX_LIFE )
SetUnitState ( newUnit , UNIT_STATE_LIFE , oldRatio * GetUnitState ( newUnit , UNIT_STATE_MAX_LIFE ) )
end
if ( GetUnitState ( oldUnit , UNIT_STATE_MAX_MANA ) > 0 ) and ( GetUnitState ( newUnit , UNIT_STATE_MAX_MANA ) > 0 ) then
oldRatio = GetUnitState ( oldUnit , UNIT_STATE_MANA ) / GetUnitState ( oldUnit , UNIT_STATE_MAX_MANA )
SetUnitState ( newUnit , UNIT_STATE_MANA , oldRatio * GetUnitState ( newUnit , UNIT_STATE_MAX_MANA ) )
end
elseif ( unitStateMethod == bj_UNIT_STATE_METHOD_ABSOLUTE ) then


SetUnitState ( newUnit , UNIT_STATE_LIFE , GetUnitState ( oldUnit , UNIT_STATE_LIFE ) )
if ( GetUnitState ( newUnit , UNIT_STATE_MAX_MANA ) > 0 ) then
SetUnitState ( newUnit , UNIT_STATE_MANA , GetUnitState ( oldUnit , UNIT_STATE_MANA ) )
end
elseif ( unitStateMethod == bj_UNIT_STATE_METHOD_DEFAULTS ) then

elseif ( unitStateMethod == bj_UNIT_STATE_METHOD_MAXIMUM ) then

SetUnitState ( newUnit , UNIT_STATE_LIFE , GetUnitState ( newUnit , UNIT_STATE_MAX_LIFE ) )
SetUnitState ( newUnit , UNIT_STATE_MANA , GetUnitState ( newUnit , UNIT_STATE_MAX_MANA ) )
else

end


SetResourceAmount ( newUnit , GetResourceAmount ( oldUnit ) )

if ( IsUnitType ( oldUnit , UNIT_TYPE_HERO ) and IsUnitType ( newUnit , UNIT_TYPE_HERO ) ) then
SetHeroXP ( newUnit , GetHeroXP ( oldUnit ) , false )
index = 0
for _i = 1, 10000 do
indexItem = UnitItemInSlot ( oldUnit , index )
if ( indexItem ~= nil ) then
UnitRemoveItem ( oldUnit , indexItem )
UnitAddItem ( newUnit , indexItem )
end
index = index + 1
if index >= bj_MAX_INVENTORY then break end
end
end


if wasHidden then
KillUnit ( oldUnit )
RemoveUnit ( oldUnit )
else
RemoveUnit ( oldUnit )
end
bj_lastReplacedUnit = newUnit
do return newUnit end
end

GetLastReplacedUnitBJ  = function ( )
do return bj_lastReplacedUnit end
end

SetUnitPositionLocFacingBJ  = function ( whichUnit , loc , facing )
SetUnitPositionLoc ( whichUnit , loc )
SetUnitFacing ( whichUnit , facing )
end

SetUnitPositionLocFacingLocBJ  = function ( whichUnit , loc , lookAt )
SetUnitPositionLoc ( whichUnit , loc )
SetUnitFacing ( whichUnit , AngleBetweenPoints ( loc , lookAt ) )
end

AddItemToStockBJ  = function ( itemId , whichUnit , currentStock , stockMax )
AddItemToStock ( whichUnit , itemId , currentStock , stockMax )
end

AddUnitToStockBJ  = function ( unitId , whichUnit , currentStock , stockMax )
AddUnitToStock ( whichUnit , unitId , currentStock , stockMax )
end

RemoveItemFromStockBJ  = function ( itemId , whichUnit )
RemoveItemFromStock ( whichUnit , itemId )
end

RemoveUnitFromStockBJ  = function ( unitId , whichUnit )
RemoveUnitFromStock ( whichUnit , unitId )
end

SetUnitUseFoodBJ  = function ( enable , whichUnit )
SetUnitUseFood ( whichUnit , enable )
end

UnitDamagePointLoc  = function ( whichUnit , delay , radius , loc , amount , whichAttack , whichDamage )
do return UnitDamagePoint ( whichUnit , delay , radius , GetLocationX ( loc ) , GetLocationY ( loc ) , amount , true , false , whichAttack , whichDamage , WEAPON_TYPE_WHOKNOWS ) end
end

UnitDamageTargetBJ  = function ( whichUnit , target , amount , whichAttack , whichDamage )
do return UnitDamageTarget ( whichUnit , target , amount , true , false , whichAttack , whichDamage , WEAPON_TYPE_WHOKNOWS ) end
end






CreateDestructableLoc  = function ( objectid , loc , facing , scale , variation )
bj_lastCreatedDestructable = CreateDestructable ( objectid , GetLocationX ( loc ) , GetLocationY ( loc ) , facing , scale , variation )
do return bj_lastCreatedDestructable end
end

CreateDeadDestructableLocBJ  = function ( objectid , loc , facing , scale , variation )
bj_lastCreatedDestructable = CreateDeadDestructable ( objectid , GetLocationX ( loc ) , GetLocationY ( loc ) , facing , scale , variation )
do return bj_lastCreatedDestructable end
end

GetLastCreatedDestructable  = function ( )
do return bj_lastCreatedDestructable end
end

ShowDestructableBJ  = function ( flag , d )
ShowDestructable ( d , flag )
end

SetDestructableInvulnerableBJ  = function ( d , flag )
SetDestructableInvulnerable ( d , flag )
end

IsDestructableInvulnerableBJ  = function ( d )
do return IsDestructableInvulnerable ( d ) end
end

GetDestructableLoc  = function ( whichDestructable )
do return Location ( GetDestructableX ( whichDestructable ) , GetDestructableY ( whichDestructable ) ) end
end

EnumDestructablesInRectAll  = function ( r , actionFunc )
EnumDestructablesInRect ( r , nil , actionFunc )
end

EnumDestructablesInCircleBJFilter  = function ( )
local destLoc = GetDestructableLoc ( GetFilterDestructable ( ) )
local result
result = DistanceBetweenPoints ( destLoc , bj_enumDestructableCenter ) <= bj_enumDestructableRadius
RemoveLocation ( destLoc )
do return result end
end

IsDestructableDeadBJ  = function ( d )
do return GetDestructableLife ( d ) <= 0 end
end

IsDestructableAliveBJ  = function ( d )
do return not IsDestructableDeadBJ ( d ) end
end



RandomDestructableInRectBJEnum  = function ( )
bj_destRandomConsidered = bj_destRandomConsidered + 1
if ( GetRandomInt ( 1 , bj_destRandomConsidered ) == 1 ) then
bj_destRandomCurrentPick = GetEnumDestructable ( )
end
end



RandomDestructableInRectBJ  = function ( r , filter )
bj_destRandomConsidered = 0
bj_destRandomCurrentPick = nil
EnumDestructablesInRect ( r , filter , RandomDestructableInRectBJEnum )
DestroyBoolExpr ( filter )
do return bj_destRandomCurrentPick end
end



RandomDestructableInRectSimpleBJ  = function ( r )
do return RandomDestructableInRectBJ ( r , nil ) end
end




EnumDestructablesInCircleBJ  = function ( radius , loc , actionFunc )
local r
if ( radius >= 0 ) then
bj_enumDestructableCenter = loc
bj_enumDestructableRadius = radius
r = GetRectFromCircleBJ ( loc , radius )
EnumDestructablesInRect ( r , filterEnumDestructablesInCircleBJ , actionFunc )
RemoveRect ( r )
end
end

SetDestructableLifePercentBJ  = function ( d , percent )
SetDestructableLife ( d , GetDestructableMaxLife ( d ) * percent * 0.01 )
end

SetDestructableMaxLifeBJ  = function ( d , max )
SetDestructableMaxLife ( d , max )
end

ModifyGateBJ  = function ( gateOperation , d )
if ( gateOperation == bj_GATEOPERATION_CLOSE ) then
if ( GetDestructableLife ( d ) <= 0 ) then
DestructableRestoreLife ( d , GetDestructableMaxLife ( d ) , true )
end
SetDestructableAnimation ( d , "stand" )
elseif ( gateOperation == bj_GATEOPERATION_OPEN ) then
if ( GetDestructableLife ( d ) > 0 ) then
KillDestructable ( d )
end
SetDestructableAnimation ( d , "death alternate" )
elseif ( gateOperation == bj_GATEOPERATION_DESTROY ) then
if ( GetDestructableLife ( d ) > 0 ) then
KillDestructable ( d )
end
SetDestructableAnimation ( d , "death" )
else

end
end



GetElevatorHeight  = function ( d )
local height
height = 1 + R2I ( GetDestructableOccluderHeight ( d ) / bj_CLIFFHEIGHT )
if ( height < 1 ) or ( height > 3 ) then
height = 1
end
do return height end
end






ChangeElevatorHeight  = function ( d , newHeight )
local oldHeight

newHeight = IMaxBJ ( 1 , newHeight )
newHeight = IMinBJ ( 3 , newHeight )

oldHeight = GetElevatorHeight ( d )

SetDestructableOccluderHeight ( d , bj_CLIFFHEIGHT * ( newHeight - 1 ) )
if ( newHeight == 1 ) then
if ( oldHeight == 2 ) then
SetDestructableAnimation ( d , "birth" )
QueueDestructableAnimation ( d , "stand" )
elseif ( oldHeight == 3 ) then
SetDestructableAnimation ( d , "birth third" )
QueueDestructableAnimation ( d , "stand" )
else

SetDestructableAnimation ( d , "stand" )
end
elseif ( newHeight == 2 ) then
if ( oldHeight == 1 ) then
SetDestructableAnimation ( d , "death" )
QueueDestructableAnimation ( d , "stand second" )
elseif ( oldHeight == 3 ) then
SetDestructableAnimation ( d , "birth second" )
QueueDestructableAnimation ( d , "stand second" )
else

SetDestructableAnimation ( d , "stand second" )
end
elseif ( newHeight == 3 ) then
if ( oldHeight == 1 ) then
SetDestructableAnimation ( d , "death third" )
QueueDestructableAnimation ( d , "stand third" )
elseif ( oldHeight == 2 ) then
SetDestructableAnimation ( d , "death second" )
QueueDestructableAnimation ( d , "stand third" )
else

SetDestructableAnimation ( d , "stand third" )
end
else

end
end




NudgeUnitsInRectEnum  = function ( )
local nudgee = GetEnumUnit ( )
SetUnitPosition ( nudgee , GetUnitX ( nudgee ) , GetUnitY ( nudgee ) )
end

NudgeItemsInRectEnum  = function ( )
local nudgee = GetEnumItem ( )
SetItemPosition ( nudgee , GetItemX ( nudgee ) , GetItemY ( nudgee ) )
end





NudgeObjectsInRect  = function ( nudgeArea )
local g
g = CreateGroup ( )
GroupEnumUnitsInRect ( g , nudgeArea , nil )
ForGroup ( g , NudgeUnitsInRectEnum )
DestroyGroup ( g )
EnumItemsInRect ( nudgeArea , nil , NudgeItemsInRectEnum )
end

NearbyElevatorExistsEnum  = function ( )
local d = GetEnumDestructable ( )
local dType = GetDestructableTypeId ( d )
if ( dType == bj_ELEVATOR_CODE01 ) or ( dType == bj_ELEVATOR_CODE02 ) then
bj_elevatorNeighbor = d
end
end

NearbyElevatorExists  = function ( x , y )
local findThreshold = 32
local r

r = Rect ( x - findThreshold , y - findThreshold , x + findThreshold , y + findThreshold )
bj_elevatorNeighbor = nil
EnumDestructablesInRect ( r , nil , NearbyElevatorExistsEnum )
RemoveRect ( r )
do return bj_elevatorNeighbor ~= nil end
end

FindElevatorWallBlockerEnum  = function ( )
bj_elevatorWallBlocker = GetEnumDestructable ( )
end





ChangeElevatorWallBlocker  = function ( x , y , facing , open )
local blocker = nil
local findThreshold = 32
local nudgeLength = 4.25 * bj_CELLWIDTH
local nudgeWidth = 1.25 * bj_CELLWIDTH
local r

r = Rect ( x - findThreshold , y - findThreshold , x + findThreshold , y + findThreshold )
bj_elevatorWallBlocker = nil
EnumDestructablesInRect ( r , nil , FindElevatorWallBlockerEnum )
RemoveRect ( r )
blocker = bj_elevatorWallBlocker

if ( blocker == nil ) then
blocker = CreateDeadDestructable ( bj_ELEVATOR_BLOCKER_CODE , x , y , facing , 1 , 0 )
elseif ( GetDestructableTypeId ( blocker ) ~= bj_ELEVATOR_BLOCKER_CODE ) then



do return end
end
if ( open ) then

if ( GetDestructableLife ( blocker ) > 0 ) then
KillDestructable ( blocker )
end
else

if ( GetDestructableLife ( blocker ) <= 0 ) then
DestructableRestoreLife ( blocker , GetDestructableMaxLife ( blocker ) , false )
end

if ( facing == 0 ) then
r = Rect ( x - nudgeWidth / 2 , y - nudgeLength / 2 , x + nudgeWidth / 2 , y + nudgeLength / 2 )
NudgeObjectsInRect ( r )
RemoveRect ( r )
elseif ( facing == 90 ) then
r = Rect ( x - nudgeLength / 2 , y - nudgeWidth / 2 , x + nudgeLength / 2 , y + nudgeWidth / 2 )
NudgeObjectsInRect ( r )
RemoveRect ( r )
else

end
end
end

ChangeElevatorWalls  = function ( open , walls , d )
local x = GetDestructableX ( d )
local y = GetDestructableY ( d )
local distToBlocker = 192
local distToNeighbor = 256
if ( walls == bj_ELEVATOR_WALL_TYPE_ALL ) or ( walls == bj_ELEVATOR_WALL_TYPE_EAST ) then
if ( not NearbyElevatorExists ( x + distToNeighbor , y ) ) then
ChangeElevatorWallBlocker ( x + distToBlocker , y , 0 , open )
end
end
if ( walls == bj_ELEVATOR_WALL_TYPE_ALL ) or ( walls == bj_ELEVATOR_WALL_TYPE_NORTH ) then
if ( not NearbyElevatorExists ( x , y + distToNeighbor ) ) then
ChangeElevatorWallBlocker ( x , y + distToBlocker , 90 , open )
end
end
if ( walls == bj_ELEVATOR_WALL_TYPE_ALL ) or ( walls == bj_ELEVATOR_WALL_TYPE_SOUTH ) then
if ( not NearbyElevatorExists ( x , y - distToNeighbor ) ) then
ChangeElevatorWallBlocker ( x , y - distToBlocker , 90 , open )
end
end
if ( walls == bj_ELEVATOR_WALL_TYPE_ALL ) or ( walls == bj_ELEVATOR_WALL_TYPE_WEST ) then
if ( not NearbyElevatorExists ( x - distToNeighbor , y ) ) then
ChangeElevatorWallBlocker ( x - distToBlocker , y , 0 , open )
end
end
end






WaygateActivateBJ  = function ( activate , waygate )
WaygateActivate ( waygate , activate )
end

WaygateIsActiveBJ  = function ( waygate )
do return WaygateIsActive ( waygate ) end
end

WaygateSetDestinationLocBJ  = function ( waygate , loc )
WaygateSetDestination ( waygate , GetLocationX ( loc ) , GetLocationY ( loc ) )
end

WaygateGetDestinationLocBJ  = function ( waygate )
do return Location ( WaygateGetDestinationX ( waygate ) , WaygateGetDestinationY ( waygate ) ) end
end

UnitSetUsesAltIconBJ  = function ( flag , whichUnit )
UnitSetUsesAltIcon ( whichUnit , flag )
end






ForceUIKeyBJ  = function ( whichPlayer , key )
if ( GetLocalPlayer ( ) == whichPlayer ) then

ForceUIKey ( key )
end
end

ForceUICancelBJ  = function ( whichPlayer )
if ( GetLocalPlayer ( ) == whichPlayer ) then

ForceUICancel ( )
end
end






ForGroupBJ  = function ( whichGroup , callback )


local wantDestroy = bj_wantDestroyGroup
bj_wantDestroyGroup = false
ForGroup ( whichGroup , callback )

if ( wantDestroy ) then
DestroyGroup ( whichGroup )
end
end

GroupAddUnitSimple  = function ( whichUnit , whichGroup )
GroupAddUnit ( whichGroup , whichUnit )
end

GroupRemoveUnitSimple  = function ( whichUnit , whichGroup )
GroupRemoveUnit ( whichGroup , whichUnit )
end

GroupAddGroupEnum  = function ( )
GroupAddUnit ( bj_groupAddGroupDest , GetEnumUnit ( ) )
end

GroupAddGroup  = function ( sourceGroup , destGroup )


local wantDestroy = bj_wantDestroyGroup
bj_wantDestroyGroup = false
bj_groupAddGroupDest = destGroup
ForGroup ( sourceGroup , GroupAddGroupEnum )

if ( wantDestroy ) then
DestroyGroup ( sourceGroup )
end
end

GroupRemoveGroupEnum  = function ( )
GroupRemoveUnit ( bj_groupRemoveGroupDest , GetEnumUnit ( ) )
end

GroupRemoveGroup  = function ( sourceGroup , destGroup )


local wantDestroy = bj_wantDestroyGroup
bj_wantDestroyGroup = false
bj_groupRemoveGroupDest = destGroup
ForGroup ( sourceGroup , GroupRemoveGroupEnum )

if ( wantDestroy ) then
DestroyGroup ( sourceGroup )
end
end

ForceAddPlayerSimple  = function ( whichPlayer , whichForce )
ForceAddPlayer ( whichForce , whichPlayer )
end

ForceRemovePlayerSimple  = function ( whichPlayer , whichForce )
ForceRemovePlayer ( whichForce , whichPlayer )
end







GroupPickRandomUnitEnum  = function ( )
bj_groupRandomConsidered = bj_groupRandomConsidered + 1
if ( GetRandomInt ( 1 , bj_groupRandomConsidered ) == 1 ) then
bj_groupRandomCurrentPick = GetEnumUnit ( )
end
end



GroupPickRandomUnit  = function ( whichGroup )


local wantDestroy = bj_wantDestroyGroup
bj_wantDestroyGroup = false
bj_groupRandomConsidered = 0
bj_groupRandomCurrentPick = nil
ForGroup ( whichGroup , GroupPickRandomUnitEnum )

if ( wantDestroy ) then
DestroyGroup ( whichGroup )
end
do return bj_groupRandomCurrentPick end
end



ForcePickRandomPlayerEnum  = function ( )
bj_forceRandomConsidered = bj_forceRandomConsidered + 1
if ( GetRandomInt ( 1 , bj_forceRandomConsidered ) == 1 ) then
bj_forceRandomCurrentPick = GetEnumPlayer ( )
end
end



ForcePickRandomPlayer  = function ( whichForce )
bj_forceRandomConsidered = 0
bj_forceRandomCurrentPick = nil
ForForce ( whichForce , ForcePickRandomPlayerEnum )
do return bj_forceRandomCurrentPick end
end

EnumUnitsSelected  = function ( whichPlayer , enumFilter , enumAction )
local g = CreateGroup ( )
SyncSelections ( )
GroupEnumUnitsSelected ( g , whichPlayer , enumFilter )
DestroyBoolExpr ( enumFilter )
ForGroup ( g , enumAction )
DestroyGroup ( g )
end

GetUnitsInRectMatching  = function ( r , filter )
local g = CreateGroup ( )
GroupEnumUnitsInRect ( g , r , filter )
DestroyBoolExpr ( filter )
do return g end
end

GetUnitsInRectAll  = function ( r )
do return GetUnitsInRectMatching ( r , nil ) end
end

GetUnitsInRectOfPlayerFilter  = function ( )
do return GetOwningPlayer ( GetFilterUnit ( ) ) == bj_groupEnumOwningPlayer end
end

GetUnitsInRectOfPlayer  = function ( r , whichPlayer )
local g = CreateGroup ( )
bj_groupEnumOwningPlayer = whichPlayer
GroupEnumUnitsInRect ( g , r , filterGetUnitsInRectOfPlayer )
do return g end
end

GetUnitsInRangeOfLocMatching  = function ( radius , whichLocation , filter )
local g = CreateGroup ( )
GroupEnumUnitsInRangeOfLoc ( g , whichLocation , radius , filter )
DestroyBoolExpr ( filter )
do return g end
end

GetUnitsInRangeOfLocAll  = function ( radius , whichLocation )
do return GetUnitsInRangeOfLocMatching ( radius , whichLocation , nil ) end
end

GetUnitsOfTypeIdAllFilter  = function ( )
do return GetUnitTypeId ( GetFilterUnit ( ) ) == bj_groupEnumTypeId end
end

GetUnitsOfTypeIdAll  = function ( unitid )
local result = CreateGroup ( )
local g = CreateGroup ( )
local index
index = 0
for _i = 1, 10000 do
bj_groupEnumTypeId = unitid
GroupClear ( g )
GroupEnumUnitsOfPlayer ( g , Player ( index ) , filterGetUnitsOfTypeIdAll )
GroupAddGroup ( g , result )
index = index + 1
if index == bj_MAX_PLAYER_SLOTS then break end
end
DestroyGroup ( g )
do return result end
end

GetUnitsOfPlayerMatching  = function ( whichPlayer , filter )
local g = CreateGroup ( )
GroupEnumUnitsOfPlayer ( g , whichPlayer , filter )
DestroyBoolExpr ( filter )
do return g end
end

GetUnitsOfPlayerAll  = function ( whichPlayer )
do return GetUnitsOfPlayerMatching ( whichPlayer , nil ) end
end

GetUnitsOfPlayerAndTypeIdFilter  = function ( )
do return GetUnitTypeId ( GetFilterUnit ( ) ) == bj_groupEnumTypeId end
end

GetUnitsOfPlayerAndTypeId  = function ( whichPlayer , unitid )
local g = CreateGroup ( )
bj_groupEnumTypeId = unitid
GroupEnumUnitsOfPlayer ( g , whichPlayer , filterGetUnitsOfPlayerAndTypeId )
do return g end
end

GetUnitsSelectedAll  = function ( whichPlayer )
local g = CreateGroup ( )
SyncSelections ( )
GroupEnumUnitsSelected ( g , whichPlayer , nil )
do return g end
end

GetForceOfPlayer  = function ( whichPlayer )
local f = CreateForce ( )
ForceAddPlayer ( f , whichPlayer )
do return f end
end

GetPlayersAll  = function ( )
do return bj_FORCE_ALL_PLAYERS end
end

GetPlayersByMapControl  = function ( whichControl )
local f = CreateForce ( )
local playerIndex
local indexPlayer
playerIndex = 0
for _i = 1, 10000 do
indexPlayer = Player ( playerIndex )
if GetPlayerController ( indexPlayer ) == whichControl then
ForceAddPlayer ( f , indexPlayer )
end
playerIndex = playerIndex + 1
if playerIndex == bj_MAX_PLAYER_SLOTS then break end
end
do return f end
end

GetPlayersAllies  = function ( whichPlayer )
local f = CreateForce ( )
ForceEnumAllies ( f , whichPlayer , nil )
do return f end
end

GetPlayersEnemies  = function ( whichPlayer )
local f = CreateForce ( )
ForceEnumEnemies ( f , whichPlayer , nil )
do return f end
end

GetPlayersMatching  = function ( filter )
local f = CreateForce ( )
ForceEnumPlayers ( f , filter )
DestroyBoolExpr ( filter )
do return f end
end

CountUnitsInGroupEnum  = function ( )
bj_groupCountUnits = bj_groupCountUnits + 1
end

CountUnitsInGroup  = function ( g )


local wantDestroy = bj_wantDestroyGroup
bj_wantDestroyGroup = false
bj_groupCountUnits = 0
ForGroup ( g , CountUnitsInGroupEnum )

if ( wantDestroy ) then
DestroyGroup ( g )
end
do return bj_groupCountUnits end
end

CountPlayersInForceEnum  = function ( )
bj_forceCountPlayers = bj_forceCountPlayers + 1
end

CountPlayersInForceBJ  = function ( f )
bj_forceCountPlayers = 0
ForForce ( f , CountPlayersInForceEnum )
do return bj_forceCountPlayers end
end

GetRandomSubGroupEnum  = function ( )
if ( bj_randomSubGroupWant > 0 ) then
if ( bj_randomSubGroupWant >= bj_randomSubGroupTotal ) or ( GetRandomReal ( 0 , 1 ) < bj_randomSubGroupChance ) then

GroupAddUnit ( bj_randomSubGroupGroup , GetEnumUnit ( ) )
bj_randomSubGroupWant = bj_randomSubGroupWant - 1
end
end
bj_randomSubGroupTotal = bj_randomSubGroupTotal - 1
end

GetRandomSubGroup  = function ( count , sourceGroup )
local g = CreateGroup ( )
bj_randomSubGroupGroup = g
bj_randomSubGroupWant = count
bj_randomSubGroupTotal = CountUnitsInGroup ( sourceGroup )
if ( bj_randomSubGroupWant <= 0 or bj_randomSubGroupTotal <= 0 ) then
do return g end
end
bj_randomSubGroupChance = I2R ( bj_randomSubGroupWant ) / I2R ( bj_randomSubGroupTotal )
ForGroup ( sourceGroup , GetRandomSubGroupEnum )
do return g end
end

LivingPlayerUnitsOfTypeIdFilter  = function ( )
local filterUnit = GetFilterUnit ( )
do return IsUnitAliveBJ ( filterUnit ) and GetUnitTypeId ( filterUnit ) == bj_livingPlayerUnitsTypeId end
end

CountLivingPlayerUnitsOfTypeId  = function ( unitId , whichPlayer )
local g
local matchedCount
g = CreateGroup ( )
bj_livingPlayerUnitsTypeId = unitId
GroupEnumUnitsOfPlayer ( g , whichPlayer , filterLivingPlayerUnitsOfTypeId )
matchedCount = CountUnitsInGroup ( g )
DestroyGroup ( g )
do return matchedCount end
end






ResetUnitAnimation  = function ( whichUnit )
SetUnitAnimation ( whichUnit , "stand" )
end

SetUnitTimeScalePercent  = function ( whichUnit , percentScale )
SetUnitTimeScale ( whichUnit , percentScale * 0.01 )
end

SetUnitScalePercent  = function ( whichUnit , percentScaleX , percentScaleY , percentScaleZ )
SetUnitScale ( whichUnit , percentScaleX * 0.01 , percentScaleY * 0.01 , percentScaleZ * 0.01 )
end





SetUnitVertexColorBJ  = function ( whichUnit , red , green , blue , transparency )
SetUnitVertexColor ( whichUnit , PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100.0 - transparency ) )
end

UnitAddIndicatorBJ  = function ( whichUnit , red , green , blue , transparency )
AddIndicator ( whichUnit , PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100.0 - transparency ) )
end

DestructableAddIndicatorBJ  = function ( whichDestructable , red , green , blue , transparency )
AddIndicator ( whichDestructable , PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100.0 - transparency ) )
end

ItemAddIndicatorBJ  = function ( whichItem , red , green , blue , transparency )
AddIndicator ( whichItem , PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100.0 - transparency ) )
end



SetUnitFacingToFaceLocTimed  = function ( whichUnit , target , duration )
local unitLoc = GetUnitLoc ( whichUnit )
SetUnitFacingTimed ( whichUnit , AngleBetweenPoints ( unitLoc , target ) , duration )
RemoveLocation ( unitLoc )
end



SetUnitFacingToFaceUnitTimed  = function ( whichUnit , target , duration )
local unitLoc = GetUnitLoc ( target )
SetUnitFacingToFaceLocTimed ( whichUnit , unitLoc , duration )
RemoveLocation ( unitLoc )
end

QueueUnitAnimationBJ  = function ( whichUnit , whichAnimation )
QueueUnitAnimation ( whichUnit , whichAnimation )
end

SetDestructableAnimationBJ  = function ( d , whichAnimation )
SetDestructableAnimation ( d , whichAnimation )
end

QueueDestructableAnimationBJ  = function ( d , whichAnimation )
QueueDestructableAnimation ( d , whichAnimation )
end

SetDestAnimationSpeedPercent  = function ( d , percentScale )
SetDestructableAnimationSpeed ( d , percentScale * 0.01 )
end






DialogDisplayBJ  = function ( flag , whichDialog , whichPlayer )
DialogDisplay ( whichPlayer , whichDialog , flag )
end

DialogSetMessageBJ  = function ( whichDialog , message )
DialogSetMessage ( whichDialog , message )
end

DialogAddButtonBJ  = function ( whichDialog , buttonText )
bj_lastCreatedButton = DialogAddButton ( whichDialog , buttonText , 0 )
do return bj_lastCreatedButton end
end

DialogAddButtonWithHotkeyBJ  = function ( whichDialog , buttonText , hotkey )
bj_lastCreatedButton = DialogAddButton ( whichDialog , buttonText , hotkey )
do return bj_lastCreatedButton end
end

DialogClearBJ  = function ( whichDialog )
DialogClear ( whichDialog )
end

GetLastCreatedButtonBJ  = function ( )
do return bj_lastCreatedButton end
end

GetClickedButtonBJ  = function ( )
do return GetClickedButton ( ) end
end

GetClickedDialogBJ  = function ( )
do return GetClickedDialog ( ) end
end






SetPlayerAllianceBJ  = function ( sourcePlayer , whichAllianceSetting , value , otherPlayer )

if ( sourcePlayer == otherPlayer ) then
do return end
end
SetPlayerAlliance ( sourcePlayer , otherPlayer , whichAllianceSetting , value )
end



SetPlayerAllianceStateAllyBJ  = function ( sourcePlayer , otherPlayer , flag )
SetPlayerAlliance ( sourcePlayer , otherPlayer , ALLIANCE_PASSIVE , flag )
SetPlayerAlliance ( sourcePlayer , otherPlayer , ALLIANCE_HELP_REQUEST , flag )
SetPlayerAlliance ( sourcePlayer , otherPlayer , ALLIANCE_HELP_RESPONSE , flag )
SetPlayerAlliance ( sourcePlayer , otherPlayer , ALLIANCE_SHARED_XP , flag )
SetPlayerAlliance ( sourcePlayer , otherPlayer , ALLIANCE_SHARED_SPELLS , flag )
end



SetPlayerAllianceStateVisionBJ  = function ( sourcePlayer , otherPlayer , flag )
SetPlayerAlliance ( sourcePlayer , otherPlayer , ALLIANCE_SHARED_VISION , flag )
end



SetPlayerAllianceStateControlBJ  = function ( sourcePlayer , otherPlayer , flag )
SetPlayerAlliance ( sourcePlayer , otherPlayer , ALLIANCE_SHARED_CONTROL , flag )
end




SetPlayerAllianceStateFullControlBJ  = function ( sourcePlayer , otherPlayer , flag )
SetPlayerAlliance ( sourcePlayer , otherPlayer , ALLIANCE_SHARED_ADVANCED_CONTROL , flag )
end

SetPlayerAllianceStateBJ  = function ( sourcePlayer , otherPlayer , allianceState )

if ( sourcePlayer == otherPlayer ) then
do return end
end
if allianceState == bj_ALLIANCE_UNALLIED then
SetPlayerAllianceStateAllyBJ ( sourcePlayer , otherPlayer , false )
SetPlayerAllianceStateVisionBJ ( sourcePlayer , otherPlayer , false )
SetPlayerAllianceStateControlBJ ( sourcePlayer , otherPlayer , false )
SetPlayerAllianceStateFullControlBJ ( sourcePlayer , otherPlayer , false )
elseif allianceState == bj_ALLIANCE_UNALLIED_VISION then
SetPlayerAllianceStateAllyBJ ( sourcePlayer , otherPlayer , false )
SetPlayerAllianceStateVisionBJ ( sourcePlayer , otherPlayer , true )
SetPlayerAllianceStateControlBJ ( sourcePlayer , otherPlayer , false )
SetPlayerAllianceStateFullControlBJ ( sourcePlayer , otherPlayer , false )
elseif allianceState == bj_ALLIANCE_ALLIED then
SetPlayerAllianceStateAllyBJ ( sourcePlayer , otherPlayer , true )
SetPlayerAllianceStateVisionBJ ( sourcePlayer , otherPlayer , false )
SetPlayerAllianceStateControlBJ ( sourcePlayer , otherPlayer , false )
SetPlayerAllianceStateFullControlBJ ( sourcePlayer , otherPlayer , false )
elseif allianceState == bj_ALLIANCE_ALLIED_VISION then
SetPlayerAllianceStateAllyBJ ( sourcePlayer , otherPlayer , true )
SetPlayerAllianceStateVisionBJ ( sourcePlayer , otherPlayer , true )
SetPlayerAllianceStateControlBJ ( sourcePlayer , otherPlayer , false )
SetPlayerAllianceStateFullControlBJ ( sourcePlayer , otherPlayer , false )
elseif allianceState == bj_ALLIANCE_ALLIED_UNITS then
SetPlayerAllianceStateAllyBJ ( sourcePlayer , otherPlayer , true )
SetPlayerAllianceStateVisionBJ ( sourcePlayer , otherPlayer , true )
SetPlayerAllianceStateControlBJ ( sourcePlayer , otherPlayer , true )
SetPlayerAllianceStateFullControlBJ ( sourcePlayer , otherPlayer , false )
elseif allianceState == bj_ALLIANCE_ALLIED_ADVUNITS then
SetPlayerAllianceStateAllyBJ ( sourcePlayer , otherPlayer , true )
SetPlayerAllianceStateVisionBJ ( sourcePlayer , otherPlayer , true )
SetPlayerAllianceStateControlBJ ( sourcePlayer , otherPlayer , true )
SetPlayerAllianceStateFullControlBJ ( sourcePlayer , otherPlayer , true )
elseif allianceState == bj_ALLIANCE_NEUTRAL then
SetPlayerAllianceStateAllyBJ ( sourcePlayer , otherPlayer , false )
SetPlayerAllianceStateVisionBJ ( sourcePlayer , otherPlayer , false )
SetPlayerAllianceStateControlBJ ( sourcePlayer , otherPlayer , false )
SetPlayerAllianceStateFullControlBJ ( sourcePlayer , otherPlayer , false )
SetPlayerAlliance ( sourcePlayer , otherPlayer , ALLIANCE_PASSIVE , true )
elseif allianceState == bj_ALLIANCE_NEUTRAL_VISION then
SetPlayerAllianceStateAllyBJ ( sourcePlayer , otherPlayer , false )
SetPlayerAllianceStateVisionBJ ( sourcePlayer , otherPlayer , true )
SetPlayerAllianceStateControlBJ ( sourcePlayer , otherPlayer , false )
SetPlayerAllianceStateFullControlBJ ( sourcePlayer , otherPlayer , false )
SetPlayerAlliance ( sourcePlayer , otherPlayer , ALLIANCE_PASSIVE , true )
else

end
end



SetForceAllianceStateBJ  = function ( sourceForce , targetForce , allianceState )
local sourceIndex
local targetIndex
sourceIndex = 0
for _i = 1, 10000 do
if ( sourceForce == bj_FORCE_ALL_PLAYERS or IsPlayerInForce ( Player ( sourceIndex ) , sourceForce ) ) then
targetIndex = 0
for _i = 1, 10000 do
if ( targetForce == bj_FORCE_ALL_PLAYERS or IsPlayerInForce ( Player ( targetIndex ) , targetForce ) ) then
SetPlayerAllianceStateBJ ( Player ( sourceIndex ) , Player ( targetIndex ) , allianceState )
end
targetIndex = targetIndex + 1
if targetIndex == bj_MAX_PLAYER_SLOTS then break end
end
end
sourceIndex = sourceIndex + 1
if sourceIndex == bj_MAX_PLAYER_SLOTS then break end
end
end



PlayersAreCoAllied  = function ( playerA , playerB )

if ( playerA == playerB ) then
do return true end
end

if GetPlayerAlliance ( playerA , playerB , ALLIANCE_PASSIVE ) then
if GetPlayerAlliance ( playerB , playerA , ALLIANCE_PASSIVE ) then
do return true end
end
end
do return false end
end




ShareEverythingWithTeamAI  = function ( whichPlayer )
local playerIndex
local indexPlayer
playerIndex = 0
for _i = 1, 10000 do
indexPlayer = Player ( playerIndex )
if ( PlayersAreCoAllied ( whichPlayer , indexPlayer ) and whichPlayer ~= indexPlayer ) then
if ( GetPlayerController ( indexPlayer ) == MAP_CONTROL_COMPUTER ) then
SetPlayerAlliance ( whichPlayer , indexPlayer , ALLIANCE_SHARED_VISION , true )
SetPlayerAlliance ( whichPlayer , indexPlayer , ALLIANCE_SHARED_CONTROL , true )
SetPlayerAlliance ( whichPlayer , indexPlayer , ALLIANCE_SHARED_ADVANCED_CONTROL , true )
end
end
playerIndex = playerIndex + 1
if playerIndex == bj_MAX_PLAYERS then break end
end
end



ShareEverythingWithTeam  = function ( whichPlayer )
local playerIndex
local indexPlayer
playerIndex = 0
for _i = 1, 10000 do
indexPlayer = Player ( playerIndex )
if ( PlayersAreCoAllied ( whichPlayer , indexPlayer ) and whichPlayer ~= indexPlayer ) then
SetPlayerAlliance ( whichPlayer , indexPlayer , ALLIANCE_SHARED_VISION , true )
SetPlayerAlliance ( whichPlayer , indexPlayer , ALLIANCE_SHARED_CONTROL , true )
SetPlayerAlliance ( indexPlayer , whichPlayer , ALLIANCE_SHARED_CONTROL , true )
SetPlayerAlliance ( whichPlayer , indexPlayer , ALLIANCE_SHARED_ADVANCED_CONTROL , true )
end
playerIndex = playerIndex + 1
if playerIndex == bj_MAX_PLAYERS then break end
end
end




ConfigureNeutralVictim  = function ( )
local index
local indexPlayer
local neutralVictim = Player ( bj_PLAYER_NEUTRAL_VICTIM )
index = 0
for _i = 1, 10000 do
indexPlayer = Player ( index )
SetPlayerAlliance ( neutralVictim , indexPlayer , ALLIANCE_PASSIVE , true )
SetPlayerAlliance ( indexPlayer , neutralVictim , ALLIANCE_PASSIVE , false )
index = index + 1
if index == bj_MAX_PLAYERS then break end
end

indexPlayer = Player ( PLAYER_NEUTRAL_AGGRESSIVE )
SetPlayerAlliance ( neutralVictim , indexPlayer , ALLIANCE_PASSIVE , true )
SetPlayerAlliance ( indexPlayer , neutralVictim , ALLIANCE_PASSIVE , true )

SetPlayerState ( neutralVictim , PLAYER_STATE_GIVES_BOUNTY , 0 )
end

MakeUnitsPassiveForPlayerEnum  = function ( )
SetUnitOwner ( GetEnumUnit ( ) , Player ( bj_PLAYER_NEUTRAL_VICTIM ) , false )
end



MakeUnitsPassiveForPlayer  = function ( whichPlayer )
local playerUnits = CreateGroup ( )
CachePlayerHeroData ( whichPlayer )
GroupEnumUnitsOfPlayer ( playerUnits , whichPlayer , nil )
ForGroup ( playerUnits , MakeUnitsPassiveForPlayerEnum )
DestroyGroup ( playerUnits )
end



MakeUnitsPassiveForTeam  = function ( whichPlayer )
local playerIndex
local indexPlayer
playerIndex = 0
for _i = 1, 10000 do
indexPlayer = Player ( playerIndex )
if PlayersAreCoAllied ( whichPlayer , indexPlayer ) then
MakeUnitsPassiveForPlayer ( indexPlayer )
end
playerIndex = playerIndex + 1
if playerIndex == bj_MAX_PLAYERS then break end
end
end



AllowVictoryDefeat  = function ( gameResult )
if ( gameResult == PLAYER_GAME_RESULT_VICTORY ) then
do return not IsNoVictoryCheat ( ) end
end
if ( gameResult == PLAYER_GAME_RESULT_DEFEAT ) then
do return not IsNoDefeatCheat ( ) end
end
if ( gameResult == PLAYER_GAME_RESULT_NEUTRAL ) then
do return ( not IsNoVictoryCheat ( ) ) and ( not IsNoDefeatCheat ( ) ) end
end
do return true end
end

EndGameBJ  = function ( )
EndGame ( true )
end

MeleeVictoryDialogBJ  = function ( whichPlayer , leftGame )
local t = CreateTrigger ( )
local d = DialogCreate ( )
local formatString

if ( leftGame ) then
formatString = GetLocalizedString ( "PLAYER_LEFT_GAME" )
else
formatString = GetLocalizedString ( "PLAYER_VICTORIOUS" )
end
DisplayTimedTextFromPlayer ( whichPlayer , 0 , 0 , 60 , formatString )
DialogSetMessage ( d , GetLocalizedString ( "GAMEOVER_VICTORY_MSG" ) )
DialogAddButton ( d , GetLocalizedString ( "GAMEOVER_CONTINUE_GAME" ) , GetLocalizedHotkey ( "GAMEOVER_CONTINUE_GAME" ) )
t = CreateTrigger ( )
TriggerRegisterDialogButtonEvent ( t , DialogAddQuitButton ( d , true , GetLocalizedString ( "GAMEOVER_QUIT_GAME" ) , GetLocalizedHotkey ( "GAMEOVER_QUIT_GAME" ) ) )
DialogDisplay ( whichPlayer , d , true )
StartSoundForPlayerBJ ( whichPlayer , bj_victoryDialogSound )
end

MeleeDefeatDialogBJ  = function ( whichPlayer , leftGame )
local t = CreateTrigger ( )
local d = DialogCreate ( )
local formatString

if ( leftGame ) then
formatString = GetLocalizedString ( "PLAYER_LEFT_GAME" )
else
formatString = GetLocalizedString ( "PLAYER_DEFEATED" )
end
DisplayTimedTextFromPlayer ( whichPlayer , 0 , 0 , 60 , formatString )
DialogSetMessage ( d , GetLocalizedString ( "GAMEOVER_DEFEAT_MSG" ) )

if ( not bj_meleeGameOver and IsMapFlagSet ( MAP_OBSERVERS_ON_DEATH ) ) then
DialogAddButton ( d , GetLocalizedString ( "GAMEOVER_CONTINUE_OBSERVING" ) , GetLocalizedHotkey ( "GAMEOVER_CONTINUE_OBSERVING" ) )
end
t = CreateTrigger ( )
TriggerRegisterDialogButtonEvent ( t , DialogAddQuitButton ( d , true , GetLocalizedString ( "GAMEOVER_QUIT_GAME" ) , GetLocalizedHotkey ( "GAMEOVER_QUIT_GAME" ) ) )
DialogDisplay ( whichPlayer , d , true )
StartSoundForPlayerBJ ( whichPlayer , bj_defeatDialogSound )
end

GameOverDialogBJ  = function ( whichPlayer , leftGame )
local t = CreateTrigger ( )
local d = DialogCreate ( )
local s

DisplayTimedTextFromPlayer ( whichPlayer , 0 , 0 , 60 , GetLocalizedString ( "PLAYER_LEFT_GAME" ) )
if ( GetIntegerGameState ( GAME_STATE_DISCONNECTED ) ~= 0 ) then
s = GetLocalizedString ( "GAMEOVER_DISCONNECTED" )
else
s = GetLocalizedString ( "GAMEOVER_GAME_OVER" )
end
DialogSetMessage ( d , s )
t = CreateTrigger ( )
TriggerRegisterDialogButtonEvent ( t , DialogAddQuitButton ( d , true , GetLocalizedString ( "GAMEOVER_OK" ) , GetLocalizedHotkey ( "GAMEOVER_OK" ) ) )
DialogDisplay ( whichPlayer , d , true )
StartSoundForPlayerBJ ( whichPlayer , bj_defeatDialogSound )
end

RemovePlayerPreserveUnitsBJ  = function ( whichPlayer , gameResult , leftGame )
if AllowVictoryDefeat ( gameResult ) then
RemovePlayer ( whichPlayer , gameResult )
if ( gameResult == PLAYER_GAME_RESULT_VICTORY ) then
MeleeVictoryDialogBJ ( whichPlayer , leftGame )
do return end
elseif ( gameResult == PLAYER_GAME_RESULT_DEFEAT ) then
MeleeDefeatDialogBJ ( whichPlayer , leftGame )
else
GameOverDialogBJ ( whichPlayer , leftGame )
end
end
end

CustomVictoryOkBJ  = function ( )
if bj_isSinglePlayer then
PauseGame ( false )

SetGameDifficulty ( GetDefaultDifficulty ( ) )
end
if ( bj_changeLevelMapName == nil ) then
EndGame ( bj_changeLevelShowScores )
else
ChangeLevel ( bj_changeLevelMapName , bj_changeLevelShowScores )
end
end

CustomVictoryQuitBJ  = function ( )
if bj_isSinglePlayer then
PauseGame ( false )

SetGameDifficulty ( GetDefaultDifficulty ( ) )
end
EndGame ( bj_changeLevelShowScores )
end

CustomVictoryDialogBJ  = function ( whichPlayer )
local t = CreateTrigger ( )
local d = DialogCreate ( )
DialogSetMessage ( d , GetLocalizedString ( "GAMEOVER_VICTORY_MSG" ) )
t = CreateTrigger ( )
TriggerRegisterDialogButtonEvent ( t , DialogAddButton ( d , GetLocalizedString ( "GAMEOVER_CONTINUE" ) , GetLocalizedHotkey ( "GAMEOVER_CONTINUE" ) ) )
TriggerAddAction ( t , CustomVictoryOkBJ )
t = CreateTrigger ( )
TriggerRegisterDialogButtonEvent ( t , DialogAddButton ( d , GetLocalizedString ( "GAMEOVER_QUIT_MISSION" ) , GetLocalizedHotkey ( "GAMEOVER_QUIT_MISSION" ) ) )
TriggerAddAction ( t , CustomVictoryQuitBJ )
if ( GetLocalPlayer ( ) == whichPlayer ) then
EnableUserControl ( true )
if bj_isSinglePlayer then
PauseGame ( true )
end
EnableUserUI ( false )
end
DialogDisplay ( whichPlayer , d , true )
VolumeGroupSetVolumeForPlayerBJ ( whichPlayer , SOUND_VOLUMEGROUP_UI , 1.0 )
StartSoundForPlayerBJ ( whichPlayer , bj_victoryDialogSound )
end

CustomVictorySkipBJ  = function ( whichPlayer )
if ( GetLocalPlayer ( ) == whichPlayer ) then
if bj_isSinglePlayer then

SetGameDifficulty ( GetDefaultDifficulty ( ) )
end
if ( bj_changeLevelMapName == nil ) then
EndGame ( bj_changeLevelShowScores )
else
ChangeLevel ( bj_changeLevelMapName , bj_changeLevelShowScores )
end
end
end

CustomVictoryBJ  = function ( whichPlayer , showDialog , showScores )
if AllowVictoryDefeat ( PLAYER_GAME_RESULT_VICTORY ) then
RemovePlayer ( whichPlayer , PLAYER_GAME_RESULT_VICTORY )
if not bj_isSinglePlayer then
DisplayTimedTextFromPlayer ( whichPlayer , 0 , 0 , 60 , GetLocalizedString ( "PLAYER_VICTORIOUS" ) )
end

if ( GetPlayerController ( whichPlayer ) == MAP_CONTROL_USER ) then
bj_changeLevelShowScores = showScores
if showDialog then
CustomVictoryDialogBJ ( whichPlayer )
else
CustomVictorySkipBJ ( whichPlayer )
end
end
end
end

CustomDefeatRestartBJ  = function ( )
PauseGame ( false )
RestartGame ( true )
end

CustomDefeatReduceDifficultyBJ  = function ( )
local diff = GetGameDifficulty ( )
PauseGame ( false )

if ( diff == MAP_DIFFICULTY_EASY ) then

elseif ( diff == MAP_DIFFICULTY_NORMAL ) then
SetGameDifficulty ( MAP_DIFFICULTY_EASY )
elseif ( diff == MAP_DIFFICULTY_HARD ) then
SetGameDifficulty ( MAP_DIFFICULTY_NORMAL )
else

end
RestartGame ( true )
end

CustomDefeatLoadBJ  = function ( )
PauseGame ( false )
DisplayLoadDialog ( )
end

CustomDefeatQuitBJ  = function ( )
if bj_isSinglePlayer then
PauseGame ( false )
end

SetGameDifficulty ( GetDefaultDifficulty ( ) )
EndGame ( true )
end

CustomDefeatDialogBJ  = function ( whichPlayer , message )
local t = CreateTrigger ( )
local d = DialogCreate ( )
DialogSetMessage ( d , message )
if bj_isSinglePlayer then
t = CreateTrigger ( )
TriggerRegisterDialogButtonEvent ( t , DialogAddButton ( d , GetLocalizedString ( "GAMEOVER_RESTART" ) , GetLocalizedHotkey ( "GAMEOVER_RESTART" ) ) )
TriggerAddAction ( t , CustomDefeatRestartBJ )
if ( GetGameDifficulty ( ) ~= MAP_DIFFICULTY_EASY ) then
t = CreateTrigger ( )
TriggerRegisterDialogButtonEvent ( t , DialogAddButton ( d , GetLocalizedString ( "GAMEOVER_REDUCE_DIFFICULTY" ) , GetLocalizedHotkey ( "GAMEOVER_REDUCE_DIFFICULTY" ) ) )
TriggerAddAction ( t , CustomDefeatReduceDifficultyBJ )
end
t = CreateTrigger ( )
TriggerRegisterDialogButtonEvent ( t , DialogAddButton ( d , GetLocalizedString ( "GAMEOVER_LOAD" ) , GetLocalizedHotkey ( "GAMEOVER_LOAD" ) ) )
TriggerAddAction ( t , CustomDefeatLoadBJ )
end
t = CreateTrigger ( )
TriggerRegisterDialogButtonEvent ( t , DialogAddButton ( d , GetLocalizedString ( "GAMEOVER_QUIT_MISSION" ) , GetLocalizedHotkey ( "GAMEOVER_QUIT_MISSION" ) ) )
TriggerAddAction ( t , CustomDefeatQuitBJ )
if ( GetLocalPlayer ( ) == whichPlayer ) then
EnableUserControl ( true )
if bj_isSinglePlayer then
PauseGame ( true )
end
EnableUserUI ( false )
end
DialogDisplay ( whichPlayer , d , true )
VolumeGroupSetVolumeForPlayerBJ ( whichPlayer , SOUND_VOLUMEGROUP_UI , 1.0 )
StartSoundForPlayerBJ ( whichPlayer , bj_defeatDialogSound )
end

CustomDefeatBJ  = function ( whichPlayer , message )
if AllowVictoryDefeat ( PLAYER_GAME_RESULT_DEFEAT ) then
RemovePlayer ( whichPlayer , PLAYER_GAME_RESULT_DEFEAT )
if not bj_isSinglePlayer then
DisplayTimedTextFromPlayer ( whichPlayer , 0 , 0 , 60 , GetLocalizedString ( "PLAYER_DEFEATED" ) )
end

if ( GetPlayerController ( whichPlayer ) == MAP_CONTROL_USER ) then
CustomDefeatDialogBJ ( whichPlayer , message )
end
end
end

SetNextLevelBJ  = function ( nextLevel )
if ( nextLevel == "" ) then
bj_changeLevelMapName = nil
else
bj_changeLevelMapName = nextLevel
end
end

SetPlayerOnScoreScreenBJ  = function ( flag , whichPlayer )
SetPlayerOnScoreScreen ( whichPlayer , flag )
end






CreateQuestBJ  = function ( questType , title , description , iconPath )
local required = ( questType == bj_QUESTTYPE_REQ_DISCOVERED ) or ( questType == bj_QUESTTYPE_REQ_UNDISCOVERED )
local discovered = ( questType == bj_QUESTTYPE_REQ_DISCOVERED ) or ( questType == bj_QUESTTYPE_OPT_DISCOVERED )
bj_lastCreatedQuest = CreateQuest ( )
QuestSetTitle ( bj_lastCreatedQuest , title )
QuestSetDescription ( bj_lastCreatedQuest , description )
QuestSetIconPath ( bj_lastCreatedQuest , iconPath )
QuestSetRequired ( bj_lastCreatedQuest , required )
QuestSetDiscovered ( bj_lastCreatedQuest , discovered )
QuestSetCompleted ( bj_lastCreatedQuest , false )
do return bj_lastCreatedQuest end
end

DestroyQuestBJ  = function ( whichQuest )
DestroyQuest ( whichQuest )
end

QuestSetEnabledBJ  = function ( enabled , whichQuest )
QuestSetEnabled ( whichQuest , enabled )
end

QuestSetTitleBJ  = function ( whichQuest , title )
QuestSetTitle ( whichQuest , title )
end

QuestSetDescriptionBJ  = function ( whichQuest , description )
QuestSetDescription ( whichQuest , description )
end

QuestSetCompletedBJ  = function ( whichQuest , completed )
QuestSetCompleted ( whichQuest , completed )
end

QuestSetFailedBJ  = function ( whichQuest , failed )
QuestSetFailed ( whichQuest , failed )
end

QuestSetDiscoveredBJ  = function ( whichQuest , discovered )
QuestSetDiscovered ( whichQuest , discovered )
end

GetLastCreatedQuestBJ  = function ( )
do return bj_lastCreatedQuest end
end

CreateQuestItemBJ  = function ( whichQuest , description )
bj_lastCreatedQuestItem = QuestCreateItem ( whichQuest )
QuestItemSetDescription ( bj_lastCreatedQuestItem , description )
QuestItemSetCompleted ( bj_lastCreatedQuestItem , false )
do return bj_lastCreatedQuestItem end
end

QuestItemSetDescriptionBJ  = function ( whichQuestItem , description )
QuestItemSetDescription ( whichQuestItem , description )
end

QuestItemSetCompletedBJ  = function ( whichQuestItem , completed )
QuestItemSetCompleted ( whichQuestItem , completed )
end

GetLastCreatedQuestItemBJ  = function ( )
do return bj_lastCreatedQuestItem end
end

CreateDefeatConditionBJ  = function ( description )
bj_lastCreatedDefeatCondition = CreateDefeatCondition ( )
DefeatConditionSetDescription ( bj_lastCreatedDefeatCondition , description )
do return bj_lastCreatedDefeatCondition end
end

DestroyDefeatConditionBJ  = function ( whichCondition )
DestroyDefeatCondition ( whichCondition )
end

DefeatConditionSetDescriptionBJ  = function ( whichCondition , description )
DefeatConditionSetDescription ( whichCondition , description )
end

GetLastCreatedDefeatConditionBJ  = function ( )
do return bj_lastCreatedDefeatCondition end
end

FlashQuestDialogButtonBJ  = function ( )
FlashQuestDialogButton ( )
end

QuestMessageBJ  = function ( f , messageType , message )
if ( IsPlayerInForce ( GetLocalPlayer ( ) , f ) ) then

if ( messageType == bj_QUESTMESSAGE_DISCOVERED ) then
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_QUEST , " " )
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_QUEST , message )
StartSound ( bj_questDiscoveredSound )
FlashQuestDialogButton ( )
elseif ( messageType == bj_QUESTMESSAGE_UPDATED ) then
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_QUESTUPDATE , " " )
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_QUESTUPDATE , message )
StartSound ( bj_questUpdatedSound )
FlashQuestDialogButton ( )
elseif ( messageType == bj_QUESTMESSAGE_COMPLETED ) then
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_QUESTDONE , " " )
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_QUESTDONE , message )
StartSound ( bj_questCompletedSound )
FlashQuestDialogButton ( )
elseif ( messageType == bj_QUESTMESSAGE_FAILED ) then
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_QUESTFAILED , " " )
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_QUESTFAILED , message )
StartSound ( bj_questFailedSound )
FlashQuestDialogButton ( )
elseif ( messageType == bj_QUESTMESSAGE_REQUIREMENT ) then
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_QUESTREQUIREMENT , message )
elseif ( messageType == bj_QUESTMESSAGE_MISSIONFAILED ) then
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_MISSIONFAILED , " " )
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_MISSIONFAILED , message )
StartSound ( bj_questFailedSound )
elseif ( messageType == bj_QUESTMESSAGE_HINT ) then
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_HINT , " " )
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_HINT , message )
StartSound ( bj_questHintSound )
elseif ( messageType == bj_QUESTMESSAGE_ALWAYSHINT ) then
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_ALWAYSHINT , " " )
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_ALWAYSHINT , message )
StartSound ( bj_questHintSound )
elseif ( messageType == bj_QUESTMESSAGE_SECRET ) then
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_SECRET , " " )
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_SECRET , message )
StartSound ( bj_questSecretSound )
elseif ( messageType == bj_QUESTMESSAGE_UNITACQUIRED ) then
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_UNITACQUIRED , " " )
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_UNITACQUIRED , message )
StartSound ( bj_questHintSound )
elseif ( messageType == bj_QUESTMESSAGE_UNITAVAILABLE ) then
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_UNITAVAILABLE , " " )
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_UNITAVAILABLE , message )
StartSound ( bj_questHintSound )
elseif ( messageType == bj_QUESTMESSAGE_ITEMACQUIRED ) then
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_ITEMACQUIRED , " " )
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_ITEMACQUIRED , message )
StartSound ( bj_questItemAcquiredSound )
elseif ( messageType == bj_QUESTMESSAGE_WARNING ) then
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_WARNING , " " )
DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_TEXT_DELAY_WARNING , message )
StartSound ( bj_questWarningSound )
else

end
end
end






StartTimerBJ  = function ( t , periodic , timeout )
bj_lastStartedTimer = t
TimerStart ( t , timeout , periodic , nil )
do return bj_lastStartedTimer end
end

CreateTimerBJ  = function ( periodic , timeout )
bj_lastStartedTimer = CreateTimer ( )
TimerStart ( bj_lastStartedTimer , timeout , periodic , nil )
do return bj_lastStartedTimer end
end

DestroyTimerBJ  = function ( whichTimer )
DestroyTimer ( whichTimer )
end

PauseTimerBJ  = function ( pause , whichTimer )
if pause then
PauseTimer ( whichTimer )
else
ResumeTimer ( whichTimer )
end
end

GetLastCreatedTimerBJ  = function ( )
do return bj_lastStartedTimer end
end

CreateTimerDialogBJ  = function ( t , title )
bj_lastCreatedTimerDialog = CreateTimerDialog ( t )
TimerDialogSetTitle ( bj_lastCreatedTimerDialog , title )
TimerDialogDisplay ( bj_lastCreatedTimerDialog , true )
do return bj_lastCreatedTimerDialog end
end

DestroyTimerDialogBJ  = function ( td )
DestroyTimerDialog ( td )
end

TimerDialogSetTitleBJ  = function ( td , title )
TimerDialogSetTitle ( td , title )
end

TimerDialogSetTitleColorBJ  = function ( td , red , green , blue , transparency )
TimerDialogSetTitleColor ( td , PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100.0 - transparency ) )
end

TimerDialogSetTimeColorBJ  = function ( td , red , green , blue , transparency )
TimerDialogSetTimeColor ( td , PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100.0 - transparency ) )
end

TimerDialogSetSpeedBJ  = function ( td , speedMultFactor )
TimerDialogSetSpeed ( td , speedMultFactor )
end

TimerDialogDisplayForPlayerBJ  = function ( show , td , whichPlayer )
if ( GetLocalPlayer ( ) == whichPlayer ) then

TimerDialogDisplay ( td , show )
end
end

TimerDialogDisplayBJ  = function ( show , td )
TimerDialogDisplay ( td , show )
end

GetLastCreatedTimerDialogBJ  = function ( )
do return bj_lastCreatedTimerDialog end
end






LeaderboardResizeBJ  = function ( lb )
local size = LeaderboardGetItemCount ( lb )
if ( LeaderboardGetLabelText ( lb ) == "" ) then
size = size - 1
end
LeaderboardSetSizeByItemCount ( lb , size )
end

LeaderboardSetPlayerItemValueBJ  = function ( whichPlayer , lb , val )
LeaderboardSetItemValue ( lb , LeaderboardGetPlayerIndex ( lb , whichPlayer ) , val )
end

LeaderboardSetPlayerItemLabelBJ  = function ( whichPlayer , lb , val )
LeaderboardSetItemLabel ( lb , LeaderboardGetPlayerIndex ( lb , whichPlayer ) , val )
end

LeaderboardSetPlayerItemStyleBJ  = function ( whichPlayer , lb , showLabel , showValue , showIcon )
LeaderboardSetItemStyle ( lb , LeaderboardGetPlayerIndex ( lb , whichPlayer ) , showLabel , showValue , showIcon )
end

LeaderboardSetPlayerItemLabelColorBJ  = function ( whichPlayer , lb , red , green , blue , transparency )
LeaderboardSetItemLabelColor ( lb , LeaderboardGetPlayerIndex ( lb , whichPlayer ) , PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100.0 - transparency ) )
end

LeaderboardSetPlayerItemValueColorBJ  = function ( whichPlayer , lb , red , green , blue , transparency )
LeaderboardSetItemValueColor ( lb , LeaderboardGetPlayerIndex ( lb , whichPlayer ) , PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100.0 - transparency ) )
end

LeaderboardSetLabelColorBJ  = function ( lb , red , green , blue , transparency )
LeaderboardSetLabelColor ( lb , PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100.0 - transparency ) )
end

LeaderboardSetValueColorBJ  = function ( lb , red , green , blue , transparency )
LeaderboardSetValueColor ( lb , PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100.0 - transparency ) )
end

LeaderboardSetLabelBJ  = function ( lb , label )
LeaderboardSetLabel ( lb , label )
LeaderboardResizeBJ ( lb )
end

LeaderboardSetStyleBJ  = function ( lb , showLabel , showNames , showValues , showIcons )
LeaderboardSetStyle ( lb , showLabel , showNames , showValues , showIcons )
end

LeaderboardGetItemCountBJ  = function ( lb )
do return LeaderboardGetItemCount ( lb ) end
end

LeaderboardHasPlayerItemBJ  = function ( lb , whichPlayer )
do return LeaderboardHasPlayerItem ( lb , whichPlayer ) end
end

ForceSetLeaderboardBJ  = function ( lb , toForce )
local index
local indexPlayer
index = 0
for _i = 1, 10000 do
indexPlayer = Player ( index )
if IsPlayerInForce ( indexPlayer , toForce ) then
PlayerSetLeaderboard ( indexPlayer , lb )
end
index = index + 1
if index == bj_MAX_PLAYERS then break end
end
end

CreateLeaderboardBJ  = function ( toForce , label )
bj_lastCreatedLeaderboard = CreateLeaderboard ( )
LeaderboardSetLabel ( bj_lastCreatedLeaderboard , label )
ForceSetLeaderboardBJ ( bj_lastCreatedLeaderboard , toForce )
LeaderboardDisplay ( bj_lastCreatedLeaderboard , true )
do return bj_lastCreatedLeaderboard end
end

DestroyLeaderboardBJ  = function ( lb )
DestroyLeaderboard ( lb )
end

LeaderboardDisplayBJ  = function ( show , lb )
LeaderboardDisplay ( lb , show )
end

LeaderboardAddItemBJ  = function ( whichPlayer , lb , label , value )
if ( LeaderboardHasPlayerItem ( lb , whichPlayer ) ) then
LeaderboardRemovePlayerItem ( lb , whichPlayer )
end
LeaderboardAddItem ( lb , label , value , whichPlayer )
LeaderboardResizeBJ ( lb )

end

LeaderboardRemovePlayerItemBJ  = function ( whichPlayer , lb )
LeaderboardRemovePlayerItem ( lb , whichPlayer )
LeaderboardResizeBJ ( lb )
end

LeaderboardSortItemsBJ  = function ( lb , sortType , ascending )
if ( sortType == bj_SORTTYPE_SORTBYVALUE ) then
LeaderboardSortItemsByValue ( lb , ascending )
elseif ( sortType == bj_SORTTYPE_SORTBYPLAYER ) then
LeaderboardSortItemsByPlayer ( lb , ascending )
elseif ( sortType == bj_SORTTYPE_SORTBYLABEL ) then
LeaderboardSortItemsByLabel ( lb , ascending )
else

end
end

LeaderboardSortItemsByPlayerBJ  = function ( lb , ascending )
LeaderboardSortItemsByPlayer ( lb , ascending )
end

LeaderboardSortItemsByLabelBJ  = function ( lb , ascending )
LeaderboardSortItemsByLabel ( lb , ascending )
end

LeaderboardGetPlayerIndexBJ  = function ( whichPlayer , lb )
do return LeaderboardGetPlayerIndex ( lb , whichPlayer ) + 1 end
end




LeaderboardGetIndexedPlayerBJ  = function ( position , lb )
local index
local indexPlayer
index = 0
for _i = 1, 10000 do
indexPlayer = Player ( index )
if ( LeaderboardGetPlayerIndex ( lb , indexPlayer ) == position - 1 ) then
do return indexPlayer end
end
index = index + 1
if index == bj_MAX_PLAYERS then break end
end
do return Player ( PLAYER_NEUTRAL_PASSIVE ) end
end

PlayerGetLeaderboardBJ  = function ( whichPlayer )
do return PlayerGetLeaderboard ( whichPlayer ) end
end

GetLastCreatedLeaderboard  = function ( )
do return bj_lastCreatedLeaderboard end
end






CreateMultiboardBJ  = function ( cols , rows , title )
bj_lastCreatedMultiboard = CreateMultiboard ( )
MultiboardSetRowCount ( bj_lastCreatedMultiboard , rows )
MultiboardSetColumnCount ( bj_lastCreatedMultiboard , cols )
MultiboardSetTitleText ( bj_lastCreatedMultiboard , title )
MultiboardDisplay ( bj_lastCreatedMultiboard , true )
do return bj_lastCreatedMultiboard end
end

DestroyMultiboardBJ  = function ( mb )
DestroyMultiboard ( mb )
end

GetLastCreatedMultiboard  = function ( )
do return bj_lastCreatedMultiboard end
end

MultiboardDisplayBJ  = function ( show , mb )
MultiboardDisplay ( mb , show )
end

MultiboardMinimizeBJ  = function ( minimize , mb )
MultiboardMinimize ( mb , minimize )
end

MultiboardSetTitleTextColorBJ  = function ( mb , red , green , blue , transparency )
MultiboardSetTitleTextColor ( mb , PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100.0 - transparency ) )
end

MultiboardAllowDisplayBJ  = function ( flag )
MultiboardSuppressDisplay ( not flag )
end

MultiboardSetItemStyleBJ  = function ( mb , col , row , showValue , showIcon )
local curRow = 0
local curCol = 0
local numRows = MultiboardGetRowCount ( mb )
local numCols = MultiboardGetColumnCount ( mb )
local mbitem = nil

for _i = 1, 10000 do
curRow = curRow + 1
if curRow > numRows then break end

if ( row == 0 or row == curRow ) then

curCol = 0
for _i = 1, 10000 do
curCol = curCol + 1
if curCol > numCols then break end

if ( col == 0 or col == curCol ) then
mbitem = MultiboardGetItem ( mb , curRow - 1 , curCol - 1 )
MultiboardSetItemStyle ( mbitem , showValue , showIcon )
MultiboardReleaseItem ( mbitem )
end
end
end
end
end

MultiboardSetItemValueBJ  = function ( mb , col , row , val )
local curRow = 0
local curCol = 0
local numRows = MultiboardGetRowCount ( mb )
local numCols = MultiboardGetColumnCount ( mb )
local mbitem = nil

for _i = 1, 10000 do
curRow = curRow + 1
if curRow > numRows then break end

if ( row == 0 or row == curRow ) then

curCol = 0
for _i = 1, 10000 do
curCol = curCol + 1
if curCol > numCols then break end

if ( col == 0 or col == curCol ) then
mbitem = MultiboardGetItem ( mb , curRow - 1 , curCol - 1 )
MultiboardSetItemValue ( mbitem , val )
MultiboardReleaseItem ( mbitem )
end
end
end
end
end

MultiboardSetItemColorBJ  = function ( mb , col , row , red , green , blue , transparency )
local curRow = 0
local curCol = 0
local numRows = MultiboardGetRowCount ( mb )
local numCols = MultiboardGetColumnCount ( mb )
local mbitem = nil

for _i = 1, 10000 do
curRow = curRow + 1
if curRow > numRows then break end

if ( row == 0 or row == curRow ) then

curCol = 0
for _i = 1, 10000 do
curCol = curCol + 1
if curCol > numCols then break end

if ( col == 0 or col == curCol ) then
mbitem = MultiboardGetItem ( mb , curRow - 1 , curCol - 1 )
MultiboardSetItemValueColor ( mbitem , PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100.0 - transparency ) )
MultiboardReleaseItem ( mbitem )
end
end
end
end
end

MultiboardSetItemWidthBJ  = function ( mb , col , row , width )
local curRow = 0
local curCol = 0
local numRows = MultiboardGetRowCount ( mb )
local numCols = MultiboardGetColumnCount ( mb )
local mbitem = nil

for _i = 1, 10000 do
curRow = curRow + 1
if curRow > numRows then break end

if ( row == 0 or row == curRow ) then

curCol = 0
for _i = 1, 10000 do
curCol = curCol + 1
if curCol > numCols then break end

if ( col == 0 or col == curCol ) then
mbitem = MultiboardGetItem ( mb , curRow - 1 , curCol - 1 )
MultiboardSetItemWidth ( mbitem , width / 100.0 )
MultiboardReleaseItem ( mbitem )
end
end
end
end
end

MultiboardSetItemIconBJ  = function ( mb , col , row , iconFileName )
local curRow = 0
local curCol = 0
local numRows = MultiboardGetRowCount ( mb )
local numCols = MultiboardGetColumnCount ( mb )
local mbitem = nil

for _i = 1, 10000 do
curRow = curRow + 1
if curRow > numRows then break end

if ( row == 0 or row == curRow ) then

curCol = 0
for _i = 1, 10000 do
curCol = curCol + 1
if curCol > numCols then break end

if ( col == 0 or col == curCol ) then
mbitem = MultiboardGetItem ( mb , curRow - 1 , curCol - 1 )
MultiboardSetItemIcon ( mbitem , iconFileName )
MultiboardReleaseItem ( mbitem )
end
end
end
end
end









TextTagSize2Height  = function ( size )
do return size * 0.023 / 10 end
end




TextTagSpeed2Velocity  = function ( speed )
do return speed * 0.071 / 128 end
end

SetTextTagColorBJ  = function ( tt , red , green , blue , transparency )
SetTextTagColor ( tt , PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100.0 - transparency ) )
end

SetTextTagVelocityBJ  = function ( tt , speed , angle )
local vel = TextTagSpeed2Velocity ( speed )
local xvel = vel * Cos ( angle * bj_DEGTORAD )
local yvel = vel * Sin ( angle * bj_DEGTORAD )
SetTextTagVelocity ( tt , xvel , yvel )
end

SetTextTagTextBJ  = function ( tt , s , size )
local textHeight = TextTagSize2Height ( size )
SetTextTagText ( tt , s , textHeight )
end

SetTextTagPosBJ  = function ( tt , loc , zOffset )
SetTextTagPos ( tt , GetLocationX ( loc ) , GetLocationY ( loc ) , zOffset )
end

SetTextTagPosUnitBJ  = function ( tt , whichUnit , zOffset )
SetTextTagPosUnit ( tt , whichUnit , zOffset )
end

SetTextTagSuspendedBJ  = function ( tt , flag )
SetTextTagSuspended ( tt , flag )
end

SetTextTagPermanentBJ  = function ( tt , flag )
SetTextTagPermanent ( tt , flag )
end

SetTextTagAgeBJ  = function ( tt , age )
SetTextTagAge ( tt , age )
end

SetTextTagLifespanBJ  = function ( tt , lifespan )
SetTextTagLifespan ( tt , lifespan )
end

SetTextTagFadepointBJ  = function ( tt , fadepoint )
SetTextTagFadepoint ( tt , fadepoint )
end

CreateTextTagLocBJ  = function ( s , loc , zOffset , size , red , green , blue , transparency )
bj_lastCreatedTextTag = CreateTextTag ( )
SetTextTagTextBJ ( bj_lastCreatedTextTag , s , size )
SetTextTagPosBJ ( bj_lastCreatedTextTag , loc , zOffset )
SetTextTagColorBJ ( bj_lastCreatedTextTag , red , green , blue , transparency )
do return bj_lastCreatedTextTag end
end

CreateTextTagUnitBJ  = function ( s , whichUnit , zOffset , size , red , green , blue , transparency )
bj_lastCreatedTextTag = CreateTextTag ( )
SetTextTagTextBJ ( bj_lastCreatedTextTag , s , size )
SetTextTagPosUnitBJ ( bj_lastCreatedTextTag , whichUnit , zOffset )
SetTextTagColorBJ ( bj_lastCreatedTextTag , red , green , blue , transparency )
do return bj_lastCreatedTextTag end
end

DestroyTextTagBJ  = function ( tt )
DestroyTextTag ( tt )
end

ShowTextTagForceBJ  = function ( show , tt , whichForce )
if ( IsPlayerInForce ( GetLocalPlayer ( ) , whichForce ) ) then

SetTextTagVisibility ( tt , show )
end
end

GetLastCreatedTextTag  = function ( )
do return bj_lastCreatedTextTag end
end






PauseGameOn  = function ( )
PauseGame ( true )
end

PauseGameOff  = function ( )
PauseGame ( false )
end

SetUserControlForceOn  = function ( whichForce )
if ( IsPlayerInForce ( GetLocalPlayer ( ) , whichForce ) ) then

EnableUserControl ( true )
end
end

SetUserControlForceOff  = function ( whichForce )
if ( IsPlayerInForce ( GetLocalPlayer ( ) , whichForce ) ) then

EnableUserControl ( false )
end
end

ShowInterfaceForceOn  = function ( whichForce , fadeDuration )
if ( IsPlayerInForce ( GetLocalPlayer ( ) , whichForce ) ) then

ShowInterface ( true , fadeDuration )
end
end

ShowInterfaceForceOff  = function ( whichForce , fadeDuration )
if ( IsPlayerInForce ( GetLocalPlayer ( ) , whichForce ) ) then

ShowInterface ( false , fadeDuration )
end
end

PingMinimapForForce  = function ( whichForce , x , y , duration )
if ( IsPlayerInForce ( GetLocalPlayer ( ) , whichForce ) ) then

PingMinimap ( x , y , duration )

end
end

PingMinimapLocForForce  = function ( whichForce , loc , duration )
PingMinimapForForce ( whichForce , GetLocationX ( loc ) , GetLocationY ( loc ) , duration )
end

PingMinimapForPlayer  = function ( whichPlayer , x , y , duration )
if ( GetLocalPlayer ( ) == whichPlayer ) then

PingMinimap ( x , y , duration )

end
end

PingMinimapLocForPlayer  = function ( whichPlayer , loc , duration )
PingMinimapForPlayer ( whichPlayer , GetLocationX ( loc ) , GetLocationY ( loc ) , duration )
end

PingMinimapForForceEx  = function ( whichForce , x , y , duration , style , red , green , blue )
local red255 = PercentTo255 ( red )
local green255 = PercentTo255 ( green )
local blue255 = PercentTo255 ( blue )
if ( IsPlayerInForce ( GetLocalPlayer ( ) , whichForce ) ) then


if ( red255 == 255 ) and ( green255 == 0 ) and ( blue255 == 0 ) then
red255 = 254
end
if ( style == bj_MINIMAPPINGSTYLE_SIMPLE ) then
PingMinimapEx ( x , y , duration , red255 , green255 , blue255 , false )
elseif ( style == bj_MINIMAPPINGSTYLE_FLASHY ) then
PingMinimapEx ( x , y , duration , red255 , green255 , blue255 , true )
elseif ( style == bj_MINIMAPPINGSTYLE_ATTACK ) then
PingMinimapEx ( x , y , duration , 255 , 0 , 0 , false )
else

end


end
end

PingMinimapLocForForceEx  = function ( whichForce , loc , duration , style , red , green , blue )
PingMinimapForForceEx ( whichForce , GetLocationX ( loc ) , GetLocationY ( loc ) , duration , style , red , green , blue )
end

EnableWorldFogBoundaryBJ  = function ( enable , f )
if ( IsPlayerInForce ( GetLocalPlayer ( ) , f ) ) then

EnableWorldFogBoundary ( enable )
end
end

EnableOcclusionBJ  = function ( enable , f )
if ( IsPlayerInForce ( GetLocalPlayer ( ) , f ) ) then

EnableOcclusion ( enable )
end
end








CancelCineSceneBJ  = function ( )
StopSoundBJ ( bj_cineSceneLastSound , true )
EndCinematicScene ( )
end






TryInitCinematicBehaviorBJ  = function ( )
local index
if ( bj_cineSceneBeingSkipped == nil ) then
bj_cineSceneBeingSkipped = CreateTrigger ( )
index = 0
for _i = 1, 10000 do
TriggerRegisterPlayerEvent ( bj_cineSceneBeingSkipped , Player ( index ) , EVENT_PLAYER_END_CINEMATIC )
index = index + 1
if index == bj_MAX_PLAYERS then break end
end
TriggerAddAction ( bj_cineSceneBeingSkipped , CancelCineSceneBJ )
end
end

SetCinematicSceneBJ  = function ( soundHandle , portraitUnitId , color , speakerTitle , text , sceneDuration , voiceoverDuration )
bj_cineSceneLastSound = soundHandle
PlaySoundBJ ( soundHandle )
SetCinematicScene ( portraitUnitId , color , speakerTitle , text , sceneDuration , voiceoverDuration )
end

GetTransmissionDuration  = function ( soundHandle , timeType , timeVal )
local duration
if ( timeType == bj_TIMETYPE_ADD ) then
duration = GetSoundDurationBJ ( soundHandle ) + timeVal
elseif ( timeType == bj_TIMETYPE_SET ) then
duration = timeVal
elseif ( timeType == bj_TIMETYPE_SUB ) then
duration = GetSoundDurationBJ ( soundHandle ) - timeVal
else

duration = GetSoundDurationBJ ( soundHandle )
end

if ( duration < 0 ) then
duration = 0
end
do return duration end
end

WaitTransmissionDuration  = function ( soundHandle , timeType , timeVal )
if ( timeType == bj_TIMETYPE_SET ) then

TriggerSleepAction ( timeVal )
elseif ( soundHandle == nil ) then

TriggerSleepAction ( bj_NOTHING_SOUND_DURATION )
elseif ( timeType == bj_TIMETYPE_SUB ) then


WaitForSoundBJ ( soundHandle , timeVal )
elseif ( timeType == bj_TIMETYPE_ADD ) then


WaitForSoundBJ ( soundHandle , 0 )
TriggerSleepAction ( timeVal )
else

end
end

DoTransmissionBasicsXYBJ  = function ( unitId , color , x , y , soundHandle , unitName , message , duration )
SetCinematicSceneBJ ( soundHandle , unitId , color , unitName , message , duration + bj_TRANSMISSION_PORT_HANGTIME , duration )
if ( unitId ~= 0 ) then
PingMinimap ( x , y , bj_TRANSMISSION_PING_TIME )

end
end










TransmissionFromUnitWithNameBJ  = function ( toForce , whichUnit , unitName , soundHandle , message , timeType , timeVal , wait )
TryInitCinematicBehaviorBJ ( )

timeVal = RMaxBJ ( timeVal , 0 )
bj_lastTransmissionDuration = GetTransmissionDuration ( soundHandle , timeType , timeVal )
bj_lastPlayedSound = soundHandle
if ( IsPlayerInForce ( GetLocalPlayer ( ) , toForce ) ) then

if ( whichUnit == nil ) then

DoTransmissionBasicsXYBJ ( 0 , PLAYER_COLOR_RED , 0 , 0 , soundHandle , unitName , message , bj_lastTransmissionDuration )
else
DoTransmissionBasicsXYBJ ( GetUnitTypeId ( whichUnit ) , GetPlayerColor ( GetOwningPlayer ( whichUnit ) ) , GetUnitX ( whichUnit ) , GetUnitY ( whichUnit ) , soundHandle , unitName , message , bj_lastTransmissionDuration )
if ( not IsUnitHidden ( whichUnit ) ) then
UnitAddIndicator ( whichUnit , bj_TRANSMISSION_IND_RED , bj_TRANSMISSION_IND_BLUE , bj_TRANSMISSION_IND_GREEN , bj_TRANSMISSION_IND_ALPHA )
end
end
end
if wait and ( bj_lastTransmissionDuration > 0 ) then

WaitTransmissionDuration ( soundHandle , timeType , timeVal )
end
end




TransmissionFromUnitTypeWithNameBJ  = function ( toForce , fromPlayer , unitId , unitName , loc , soundHandle , message , timeType , timeVal , wait )
TryInitCinematicBehaviorBJ ( )

timeVal = RMaxBJ ( timeVal , 0 )
bj_lastTransmissionDuration = GetTransmissionDuration ( soundHandle , timeType , timeVal )
bj_lastPlayedSound = soundHandle
if ( IsPlayerInForce ( GetLocalPlayer ( ) , toForce ) ) then

DoTransmissionBasicsXYBJ ( unitId , GetPlayerColor ( fromPlayer ) , GetLocationX ( loc ) , GetLocationY ( loc ) , soundHandle , unitName , message , bj_lastTransmissionDuration )
end
if wait and ( bj_lastTransmissionDuration > 0 ) then

WaitTransmissionDuration ( soundHandle , timeType , timeVal )
end
end

GetLastTransmissionDurationBJ  = function ( )
do return bj_lastTransmissionDuration end
end

ForceCinematicSubtitlesBJ  = function ( flag )
ForceCinematicSubtitles ( flag )
end
























CinematicModeExBJ  = function ( cineMode , forForce , interfaceFadeTime )

if ( not bj_gameStarted ) then
interfaceFadeTime = 0
end
if ( cineMode ) then

if ( not bj_cineModeAlreadyIn ) then
bj_cineModeAlreadyIn = true
bj_cineModePriorSpeed = GetGameSpeed ( )
bj_cineModePriorFogSetting = IsFogEnabled ( )
bj_cineModePriorMaskSetting = IsFogMaskEnabled ( )
bj_cineModePriorDawnDusk = IsDawnDuskEnabled ( )
bj_cineModeSavedSeed = GetRandomInt ( 0 , 1000000 )
end

if ( IsPlayerInForce ( GetLocalPlayer ( ) , forForce ) ) then

ClearTextMessages ( )
ShowInterface ( false , interfaceFadeTime )
EnableUserControl ( false )
EnableOcclusion ( false )
SetCineModeVolumeGroupsBJ ( )
end

SetGameSpeed ( bj_CINEMODE_GAMESPEED )
SetMapFlag ( MAP_LOCK_SPEED , true )
FogMaskEnable ( false )
FogEnable ( false )
EnableWorldFogBoundary ( false )
EnableDawnDusk ( false )

SetRandomSeed ( 0 )
else
bj_cineModeAlreadyIn = false

if ( IsPlayerInForce ( GetLocalPlayer ( ) , forForce ) ) then

ShowInterface ( true , interfaceFadeTime )
EnableUserControl ( true )
EnableOcclusion ( true )
VolumeGroupReset ( )
EndThematicMusic ( )
CameraResetSmoothingFactorBJ ( )
end

SetMapFlag ( MAP_LOCK_SPEED , false )
SetGameSpeed ( bj_cineModePriorSpeed )
FogMaskEnable ( bj_cineModePriorMaskSetting )
FogEnable ( bj_cineModePriorFogSetting )
EnableWorldFogBoundary ( true )
EnableDawnDusk ( bj_cineModePriorDawnDusk )
SetRandomSeed ( bj_cineModeSavedSeed )
end
end

CinematicModeBJ  = function ( cineMode , forForce )
CinematicModeExBJ ( cineMode , forForce , bj_CINEMODE_INTERFACEFADE )
end






DisplayCineFilterBJ  = function ( flag )
DisplayCineFilter ( flag )
end

CinematicFadeCommonBJ  = function ( red , green , blue , duration , tex , startTrans , endTrans )
if ( duration == 0 ) then


startTrans = endTrans
end
EnableUserUI ( false )
SetCineFilterTexture ( tex )
SetCineFilterBlendMode ( BLEND_MODE_BLEND )
SetCineFilterTexMapFlags ( TEXMAP_FLAG_NONE )
SetCineFilterStartUV ( 0 , 0 , 1 , 1 )
SetCineFilterEndUV ( 0 , 0 , 1 , 1 )
SetCineFilterStartColor ( PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100 - startTrans ) )
SetCineFilterEndColor ( PercentTo255 ( red ) , PercentTo255 ( green ) , PercentTo255 ( blue ) , PercentTo255 ( 100 - endTrans ) )
SetCineFilterDuration ( duration )
DisplayCineFilter ( true )
end

FinishCinematicFadeBJ  = function ( )
DestroyTimer ( bj_cineFadeFinishTimer )
bj_cineFadeFinishTimer = nil
DisplayCineFilter ( false )
EnableUserUI ( true )
end

FinishCinematicFadeAfterBJ  = function ( duration )

bj_cineFadeFinishTimer = CreateTimer ( )
TimerStart ( bj_cineFadeFinishTimer , duration , false , FinishCinematicFadeBJ )
end

ContinueCinematicFadeBJ  = function ( )
DestroyTimer ( bj_cineFadeContinueTimer )
bj_cineFadeContinueTimer = nil
CinematicFadeCommonBJ ( bj_cineFadeContinueRed , bj_cineFadeContinueGreen , bj_cineFadeContinueBlue , bj_cineFadeContinueDuration , bj_cineFadeContinueTex , bj_cineFadeContinueTrans , 100 )
end

ContinueCinematicFadeAfterBJ  = function ( duration , red , green , blue , trans , tex )
bj_cineFadeContinueRed = red
bj_cineFadeContinueGreen = green
bj_cineFadeContinueBlue = blue
bj_cineFadeContinueTrans = trans
bj_cineFadeContinueDuration = duration
bj_cineFadeContinueTex = tex

bj_cineFadeContinueTimer = CreateTimer ( )
TimerStart ( bj_cineFadeContinueTimer , duration , false , ContinueCinematicFadeBJ )
end

AbortCinematicFadeBJ  = function ( )
if ( bj_cineFadeContinueTimer ~= nil ) then
DestroyTimer ( bj_cineFadeContinueTimer )
end
if ( bj_cineFadeFinishTimer ~= nil ) then
DestroyTimer ( bj_cineFadeFinishTimer )
end
end

CinematicFadeBJ  = function ( fadetype , duration , tex , red , green , blue , trans )
if ( fadetype == bj_CINEFADETYPE_FADEOUT ) then

AbortCinematicFadeBJ ( )
CinematicFadeCommonBJ ( red , green , blue , duration , tex , 100 , trans )
elseif ( fadetype == bj_CINEFADETYPE_FADEIN ) then

AbortCinematicFadeBJ ( )
CinematicFadeCommonBJ ( red , green , blue , duration , tex , trans , 100 )
FinishCinematicFadeAfterBJ ( duration )
elseif ( fadetype == bj_CINEFADETYPE_FADEOUTIN ) then

if ( duration > 0 ) then
AbortCinematicFadeBJ ( )
CinematicFadeCommonBJ ( red , green , blue , duration * 0.5 , tex , 100 , trans )
ContinueCinematicFadeAfterBJ ( duration * 0.5 , red , green , blue , trans , tex )
FinishCinematicFadeAfterBJ ( duration )
end
else

end
end

CinematicFilterGenericBJ  = function ( duration , bmode , tex , red0 , green0 , blue0 , trans0 , red1 , green1 , blue1 , trans1 )
AbortCinematicFadeBJ ( )
SetCineFilterTexture ( tex )
SetCineFilterBlendMode ( bmode )
SetCineFilterTexMapFlags ( TEXMAP_FLAG_NONE )
SetCineFilterStartUV ( 0 , 0 , 1 , 1 )
SetCineFilterEndUV ( 0 , 0 , 1 , 1 )
SetCineFilterStartColor ( PercentTo255 ( red0 ) , PercentTo255 ( green0 ) , PercentTo255 ( blue0 ) , PercentTo255 ( 100 - trans0 ) )
SetCineFilterEndColor ( PercentTo255 ( red1 ) , PercentTo255 ( green1 ) , PercentTo255 ( blue1 ) , PercentTo255 ( 100 - trans1 ) )
SetCineFilterDuration ( duration )
DisplayCineFilter ( true )
end










RescueUnitBJ  = function ( whichUnit , rescuer , changeColor )
if IsUnitDeadBJ ( whichUnit ) or ( GetOwningPlayer ( whichUnit ) == rescuer ) then
do return end
end
StartSound ( bj_rescueSound )
SetUnitOwner ( whichUnit , rescuer , changeColor )
UnitAddIndicator ( whichUnit , 0 , 255 , 0 , 255 )
PingMinimapForPlayer ( rescuer , GetUnitX ( whichUnit ) , GetUnitY ( whichUnit ) , bj_RESCUE_PING_TIME )
end

TriggerActionUnitRescuedBJ  = function ( )
local theUnit = GetTriggerUnit ( )
if IsUnitType ( theUnit , UNIT_TYPE_STRUCTURE ) then
RescueUnitBJ ( theUnit , GetOwningPlayer ( GetRescuer ( ) ) , bj_rescueChangeColorBldg )
else
RescueUnitBJ ( theUnit , GetOwningPlayer ( GetRescuer ( ) ) , bj_rescueChangeColorUnit )
end
end





TryInitRescuableTriggersBJ  = function ( )
local index
if ( bj_rescueUnitBehavior == nil ) then
bj_rescueUnitBehavior = CreateTrigger ( )
index = 0
for _i = 1, 10000 do
TriggerRegisterPlayerUnitEvent ( bj_rescueUnitBehavior , Player ( index ) , EVENT_PLAYER_UNIT_RESCUED , nil )
index = index + 1
if index == bj_MAX_PLAYER_SLOTS then break end
end
TriggerAddAction ( bj_rescueUnitBehavior , TriggerActionUnitRescuedBJ )
end
end




SetRescueUnitColorChangeBJ  = function ( changeColor )
bj_rescueChangeColorUnit = changeColor
end




SetRescueBuildingColorChangeBJ  = function ( changeColor )
bj_rescueChangeColorBldg = changeColor
end

MakeUnitRescuableToForceBJEnum  = function ( )
TryInitRescuableTriggersBJ ( )
SetUnitRescuable ( bj_makeUnitRescuableUnit , GetEnumPlayer ( ) , bj_makeUnitRescuableFlag )
end

MakeUnitRescuableToForceBJ  = function ( whichUnit , isRescuable , whichForce )

bj_makeUnitRescuableUnit = whichUnit
bj_makeUnitRescuableFlag = isRescuable
ForForce ( whichForce , MakeUnitRescuableToForceBJEnum )
end

InitRescuableBehaviorBJ  = function ( )
local index
index = 0
for _i = 1, 10000 do


if ( GetPlayerController ( Player ( index ) ) == MAP_CONTROL_RESCUABLE ) then
TryInitRescuableTriggersBJ ( )
do return end
end
index = index + 1
if index == bj_MAX_PLAYERS then break end
end
end






SetPlayerTechResearchedSwap  = function ( techid , levels , whichPlayer )
SetPlayerTechResearched ( whichPlayer , techid , levels )
end

SetPlayerTechMaxAllowedSwap  = function ( techid , maximum , whichPlayer )
SetPlayerTechMaxAllowed ( whichPlayer , techid , maximum )
end

SetPlayerMaxHeroesAllowed  = function ( maximum , whichPlayer )
SetPlayerTechMaxAllowed ( whichPlayer , 1212502607 , maximum )
end

GetPlayerTechCountSimple  = function ( techid , whichPlayer )
do return GetPlayerTechCount ( whichPlayer , techid , true ) end
end

GetPlayerTechMaxAllowedSwap  = function ( techid , whichPlayer )
do return GetPlayerTechMaxAllowed ( whichPlayer , techid ) end
end

SetPlayerAbilityAvailableBJ  = function ( avail , abilid , whichPlayer )
SetPlayerAbilityAvailable ( whichPlayer , abilid , avail )
end





SetCampaignMenuRaceBJ  = function ( campaignNumber )
if ( campaignNumber == bj_CAMPAIGN_INDEX_T ) then
SetCampaignMenuRace ( RACE_OTHER )
elseif ( campaignNumber == bj_CAMPAIGN_INDEX_H ) then
SetCampaignMenuRace ( RACE_HUMAN )
elseif ( campaignNumber == bj_CAMPAIGN_INDEX_U ) then
SetCampaignMenuRace ( RACE_UNDEAD )
elseif ( campaignNumber == bj_CAMPAIGN_INDEX_O ) then
SetCampaignMenuRace ( RACE_ORC )
elseif ( campaignNumber == bj_CAMPAIGN_INDEX_N ) then
SetCampaignMenuRace ( RACE_NIGHTELF )
elseif ( campaignNumber == bj_CAMPAIGN_INDEX_XN ) then
SetCampaignMenuRaceEx ( bj_CAMPAIGN_OFFSET_XN )
elseif ( campaignNumber == bj_CAMPAIGN_INDEX_XH ) then
SetCampaignMenuRaceEx ( bj_CAMPAIGN_OFFSET_XH )
elseif ( campaignNumber == bj_CAMPAIGN_INDEX_XU ) then
SetCampaignMenuRaceEx ( bj_CAMPAIGN_OFFSET_XU )
elseif ( campaignNumber == bj_CAMPAIGN_INDEX_XO ) then
SetCampaignMenuRaceEx ( bj_CAMPAIGN_OFFSET_XO )
else

end
end







SetMissionAvailableBJ  = function ( available , missionIndex )
local campaignNumber = math.modf ( missionIndex / 1000 )
local missionNumber = missionIndex - campaignNumber * 1000
SetMissionAvailable ( campaignNumber , missionNumber , available )
end

SetCampaignAvailableBJ  = function ( available , campaignNumber )
local campaignOffset
if ( campaignNumber == bj_CAMPAIGN_INDEX_H ) then
SetTutorialCleared ( true )
end
if ( campaignNumber == bj_CAMPAIGN_INDEX_XN ) then
campaignOffset = bj_CAMPAIGN_OFFSET_XN
elseif ( campaignNumber == bj_CAMPAIGN_INDEX_XH ) then
campaignOffset = bj_CAMPAIGN_OFFSET_XH
elseif ( campaignNumber == bj_CAMPAIGN_INDEX_XU ) then
campaignOffset = bj_CAMPAIGN_OFFSET_XU
elseif ( campaignNumber == bj_CAMPAIGN_INDEX_XO ) then
campaignOffset = bj_CAMPAIGN_OFFSET_XO
else
campaignOffset = campaignNumber
end
SetCampaignAvailable ( campaignOffset , available )
SetCampaignMenuRaceBJ ( campaignNumber )
ForceCampaignSelectScreen ( )
end

SetCinematicAvailableBJ  = function ( available , cinematicIndex )
if ( cinematicIndex == bj_CINEMATICINDEX_TOP ) then
SetOpCinematicAvailable ( bj_CAMPAIGN_INDEX_T , available )
PlayCinematic ( "TutorialOp" )
elseif ( cinematicIndex == bj_CINEMATICINDEX_HOP ) then
SetOpCinematicAvailable ( bj_CAMPAIGN_INDEX_H , available )
PlayCinematic ( "HumanOp" )
elseif ( cinematicIndex == bj_CINEMATICINDEX_HED ) then
SetEdCinematicAvailable ( bj_CAMPAIGN_INDEX_H , available )
PlayCinematic ( "HumanEd" )
elseif ( cinematicIndex == bj_CINEMATICINDEX_OOP ) then
SetOpCinematicAvailable ( bj_CAMPAIGN_INDEX_O , available )
PlayCinematic ( "OrcOp" )
elseif ( cinematicIndex == bj_CINEMATICINDEX_OED ) then
SetEdCinematicAvailable ( bj_CAMPAIGN_INDEX_O , available )
PlayCinematic ( "OrcEd" )
elseif ( cinematicIndex == bj_CINEMATICINDEX_UOP ) then
SetEdCinematicAvailable ( bj_CAMPAIGN_INDEX_U , available )
PlayCinematic ( "UndeadOp" )
elseif ( cinematicIndex == bj_CINEMATICINDEX_UED ) then
SetEdCinematicAvailable ( bj_CAMPAIGN_INDEX_U , available )
PlayCinematic ( "UndeadEd" )
elseif ( cinematicIndex == bj_CINEMATICINDEX_NOP ) then
SetEdCinematicAvailable ( bj_CAMPAIGN_INDEX_N , available )
PlayCinematic ( "NightElfOp" )
elseif ( cinematicIndex == bj_CINEMATICINDEX_NED ) then
SetEdCinematicAvailable ( bj_CAMPAIGN_INDEX_N , available )
PlayCinematic ( "NightElfEd" )
elseif ( cinematicIndex == bj_CINEMATICINDEX_XOP ) then
SetOpCinematicAvailable ( bj_CAMPAIGN_OFFSET_XN , available )
PlayCinematic ( "IntroX" )
elseif ( cinematicIndex == bj_CINEMATICINDEX_XED ) then
SetEdCinematicAvailable ( bj_CAMPAIGN_OFFSET_XU , available )
PlayCinematic ( "OutroX" )
else

end
end

InitGameCacheBJ  = function ( campaignFile )
bj_lastCreatedGameCache = InitGameCache ( campaignFile )
do return bj_lastCreatedGameCache end
end

SaveGameCacheBJ  = function ( cache )
do return SaveGameCache ( cache ) end
end

GetLastCreatedGameCacheBJ  = function ( )
do return bj_lastCreatedGameCache end
end

InitHashtableBJ  = function ( )
bj_lastCreatedHashtable = InitHashtable ( )
do return bj_lastCreatedHashtable end
end

GetLastCreatedHashtableBJ  = function ( )
do return bj_lastCreatedHashtable end
end

StoreRealBJ  = function ( value , key , missionKey , cache )
StoreReal ( cache , missionKey , key , value )
end

StoreIntegerBJ  = function ( value , key , missionKey , cache )
StoreInteger ( cache , missionKey , key , value )
end

StoreBooleanBJ  = function ( value , key , missionKey , cache )
StoreBoolean ( cache , missionKey , key , value )
end

StoreStringBJ  = function ( value , key , missionKey , cache )
do return StoreString ( cache , missionKey , key , value ) end
end

StoreUnitBJ  = function ( whichUnit , key , missionKey , cache )
do return StoreUnit ( cache , missionKey , key , whichUnit ) end
end

SaveRealBJ  = function ( value , key , missionKey , table )
SaveReal ( table , missionKey , key , value )
end

SaveIntegerBJ  = function ( value , key , missionKey , table )
SaveInteger ( table , missionKey , key , value )
end

SaveBooleanBJ  = function ( value , key , missionKey , table )
SaveBoolean ( table , missionKey , key , value )
end

SaveStringBJ  = function ( value , key , missionKey , table )
do return SaveStr ( table , missionKey , key , value ) end
end

SavePlayerHandleBJ  = function ( whichPlayer , key , missionKey , table )
do return SavePlayerHandle ( table , missionKey , key , whichPlayer ) end
end

SaveWidgetHandleBJ  = function ( whichWidget , key , missionKey , table )
do return SaveWidgetHandle ( table , missionKey , key , whichWidget ) end
end

SaveDestructableHandleBJ  = function ( whichDestructable , key , missionKey , table )
do return SaveDestructableHandle ( table , missionKey , key , whichDestructable ) end
end

SaveItemHandleBJ  = function ( whichItem , key , missionKey , table )
do return SaveItemHandle ( table , missionKey , key , whichItem ) end
end

SaveUnitHandleBJ  = function ( whichUnit , key , missionKey , table )
do return SaveUnitHandle ( table , missionKey , key , whichUnit ) end
end

SaveAbilityHandleBJ  = function ( whichAbility , key , missionKey , table )
do return SaveAbilityHandle ( table , missionKey , key , whichAbility ) end
end

SaveTimerHandleBJ  = function ( whichTimer , key , missionKey , table )
do return SaveTimerHandle ( table , missionKey , key , whichTimer ) end
end

SaveTriggerHandleBJ  = function ( whichTrigger , key , missionKey , table )
do return SaveTriggerHandle ( table , missionKey , key , whichTrigger ) end
end

SaveTriggerConditionHandleBJ  = function ( whichTriggercondition , key , missionKey , table )
do return SaveTriggerConditionHandle ( table , missionKey , key , whichTriggercondition ) end
end

SaveTriggerActionHandleBJ  = function ( whichTriggeraction , key , missionKey , table )
do return SaveTriggerActionHandle ( table , missionKey , key , whichTriggeraction ) end
end

SaveTriggerEventHandleBJ  = function ( whichEvent , key , missionKey , table )
do return SaveTriggerEventHandle ( table , missionKey , key , whichEvent ) end
end

SaveForceHandleBJ  = function ( whichForce , key , missionKey , table )
do return SaveForceHandle ( table , missionKey , key , whichForce ) end
end

SaveGroupHandleBJ  = function ( whichGroup , key , missionKey , table )
do return SaveGroupHandle ( table , missionKey , key , whichGroup ) end
end

SaveLocationHandleBJ  = function ( whichLocation , key , missionKey , table )
do return SaveLocationHandle ( table , missionKey , key , whichLocation ) end
end

SaveRectHandleBJ  = function ( whichRect , key , missionKey , table )
do return SaveRectHandle ( table , missionKey , key , whichRect ) end
end

SaveBooleanExprHandleBJ  = function ( whichBoolexpr , key , missionKey , table )
do return SaveBooleanExprHandle ( table , missionKey , key , whichBoolexpr ) end
end

SaveSoundHandleBJ  = function ( whichSound , key , missionKey , table )
do return SaveSoundHandle ( table , missionKey , key , whichSound ) end
end

SaveEffectHandleBJ  = function ( whichEffect , key , missionKey , table )
do return SaveEffectHandle ( table , missionKey , key , whichEffect ) end
end

SaveUnitPoolHandleBJ  = function ( whichUnitpool , key , missionKey , table )
do return SaveUnitPoolHandle ( table , missionKey , key , whichUnitpool ) end
end

SaveItemPoolHandleBJ  = function ( whichItempool , key , missionKey , table )
do return SaveItemPoolHandle ( table , missionKey , key , whichItempool ) end
end

SaveQuestHandleBJ  = function ( whichQuest , key , missionKey , table )
do return SaveQuestHandle ( table , missionKey , key , whichQuest ) end
end

SaveQuestItemHandleBJ  = function ( whichQuestitem , key , missionKey , table )
do return SaveQuestItemHandle ( table , missionKey , key , whichQuestitem ) end
end

SaveDefeatConditionHandleBJ  = function ( whichDefeatcondition , key , missionKey , table )
do return SaveDefeatConditionHandle ( table , missionKey , key , whichDefeatcondition ) end
end

SaveTimerDialogHandleBJ  = function ( whichTimerdialog , key , missionKey , table )
do return SaveTimerDialogHandle ( table , missionKey , key , whichTimerdialog ) end
end

SaveLeaderboardHandleBJ  = function ( whichLeaderboard , key , missionKey , table )
do return SaveLeaderboardHandle ( table , missionKey , key , whichLeaderboard ) end
end

SaveMultiboardHandleBJ  = function ( whichMultiboard , key , missionKey , table )
do return SaveMultiboardHandle ( table , missionKey , key , whichMultiboard ) end
end

SaveMultiboardItemHandleBJ  = function ( whichMultiboarditem , key , missionKey , table )
do return SaveMultiboardItemHandle ( table , missionKey , key , whichMultiboarditem ) end
end

SaveTrackableHandleBJ  = function ( whichTrackable , key , missionKey , table )
do return SaveTrackableHandle ( table , missionKey , key , whichTrackable ) end
end

SaveDialogHandleBJ  = function ( whichDialog , key , missionKey , table )
do return SaveDialogHandle ( table , missionKey , key , whichDialog ) end
end

SaveButtonHandleBJ  = function ( whichButton , key , missionKey , table )
do return SaveButtonHandle ( table , missionKey , key , whichButton ) end
end

SaveTextTagHandleBJ  = function ( whichTexttag , key , missionKey , table )
do return SaveTextTagHandle ( table , missionKey , key , whichTexttag ) end
end

SaveLightningHandleBJ  = function ( whichLightning , key , missionKey , table )
do return SaveLightningHandle ( table , missionKey , key , whichLightning ) end
end

SaveImageHandleBJ  = function ( whichImage , key , missionKey , table )
do return SaveImageHandle ( table , missionKey , key , whichImage ) end
end

SaveUbersplatHandleBJ  = function ( whichUbersplat , key , missionKey , table )
do return SaveUbersplatHandle ( table , missionKey , key , whichUbersplat ) end
end

SaveRegionHandleBJ  = function ( whichRegion , key , missionKey , table )
do return SaveRegionHandle ( table , missionKey , key , whichRegion ) end
end

SaveFogStateHandleBJ  = function ( whichFogState , key , missionKey , table )
do return SaveFogStateHandle ( table , missionKey , key , whichFogState ) end
end

SaveFogModifierHandleBJ  = function ( whichFogModifier , key , missionKey , table )
do return SaveFogModifierHandle ( table , missionKey , key , whichFogModifier ) end
end

SaveAgentHandleBJ  = function ( whichAgent , key , missionKey , table )
do return SaveAgentHandle ( table , missionKey , key , whichAgent ) end
end

SaveHashtableHandleBJ  = function ( whichHashtable , key , missionKey , table )
do return SaveHashtableHandle ( table , missionKey , key , whichHashtable ) end
end

GetStoredRealBJ  = function ( key , missionKey , cache )

do return GetStoredReal ( cache , missionKey , key ) end
end

GetStoredIntegerBJ  = function ( key , missionKey , cache )

do return GetStoredInteger ( cache , missionKey , key ) end
end

GetStoredBooleanBJ  = function ( key , missionKey , cache )

do return GetStoredBoolean ( cache , missionKey , key ) end
end

GetStoredStringBJ  = function ( key , missionKey , cache )
local s

s = GetStoredString ( cache , missionKey , key )
if ( s == nil ) then
do return "" end
else
do return s end
end
end

LoadRealBJ  = function ( key , missionKey , table )

do return LoadReal ( table , missionKey , key ) end
end

LoadIntegerBJ  = function ( key , missionKey , table )

do return LoadInteger ( table , missionKey , key ) end
end

LoadBooleanBJ  = function ( key , missionKey , table )

do return LoadBoolean ( table , missionKey , key ) end
end

LoadStringBJ  = function ( key , missionKey , table )
local s

s = LoadStr ( table , missionKey , key )
if ( s == nil ) then
do return "" end
else
do return s end
end
end

LoadPlayerHandleBJ  = function ( key , missionKey , table )
do return LoadPlayerHandle ( table , missionKey , key ) end
end

LoadWidgetHandleBJ  = function ( key , missionKey , table )
do return LoadWidgetHandle ( table , missionKey , key ) end
end

LoadDestructableHandleBJ  = function ( key , missionKey , table )
do return LoadDestructableHandle ( table , missionKey , key ) end
end

LoadItemHandleBJ  = function ( key , missionKey , table )
do return LoadItemHandle ( table , missionKey , key ) end
end

LoadUnitHandleBJ  = function ( key , missionKey , table )
do return LoadUnitHandle ( table , missionKey , key ) end
end

LoadAbilityHandleBJ  = function ( key , missionKey , table )
do return LoadAbilityHandle ( table , missionKey , key ) end
end

LoadTimerHandleBJ  = function ( key , missionKey , table )
do return LoadTimerHandle ( table , missionKey , key ) end
end

LoadTriggerHandleBJ  = function ( key , missionKey , table )
do return LoadTriggerHandle ( table , missionKey , key ) end
end

LoadTriggerConditionHandleBJ  = function ( key , missionKey , table )
do return LoadTriggerConditionHandle ( table , missionKey , key ) end
end

LoadTriggerActionHandleBJ  = function ( key , missionKey , table )
do return LoadTriggerActionHandle ( table , missionKey , key ) end
end

LoadTriggerEventHandleBJ  = function ( key , missionKey , table )
do return LoadTriggerEventHandle ( table , missionKey , key ) end
end

LoadForceHandleBJ  = function ( key , missionKey , table )
do return LoadForceHandle ( table , missionKey , key ) end
end

LoadGroupHandleBJ  = function ( key , missionKey , table )
do return LoadGroupHandle ( table , missionKey , key ) end
end

LoadLocationHandleBJ  = function ( key , missionKey , table )
do return LoadLocationHandle ( table , missionKey , key ) end
end

LoadRectHandleBJ  = function ( key , missionKey , table )
do return LoadRectHandle ( table , missionKey , key ) end
end

LoadBooleanExprHandleBJ  = function ( key , missionKey , table )
do return LoadBooleanExprHandle ( table , missionKey , key ) end
end

LoadSoundHandleBJ  = function ( key , missionKey , table )
do return LoadSoundHandle ( table , missionKey , key ) end
end

LoadEffectHandleBJ  = function ( key , missionKey , table )
do return LoadEffectHandle ( table , missionKey , key ) end
end

LoadUnitPoolHandleBJ  = function ( key , missionKey , table )
do return LoadUnitPoolHandle ( table , missionKey , key ) end
end

LoadItemPoolHandleBJ  = function ( key , missionKey , table )
do return LoadItemPoolHandle ( table , missionKey , key ) end
end

LoadQuestHandleBJ  = function ( key , missionKey , table )
do return LoadQuestHandle ( table , missionKey , key ) end
end

LoadQuestItemHandleBJ  = function ( key , missionKey , table )
do return LoadQuestItemHandle ( table , missionKey , key ) end
end

LoadDefeatConditionHandleBJ  = function ( key , missionKey , table )
do return LoadDefeatConditionHandle ( table , missionKey , key ) end
end

LoadTimerDialogHandleBJ  = function ( key , missionKey , table )
do return LoadTimerDialogHandle ( table , missionKey , key ) end
end

LoadLeaderboardHandleBJ  = function ( key , missionKey , table )
do return LoadLeaderboardHandle ( table , missionKey , key ) end
end

LoadMultiboardHandleBJ  = function ( key , missionKey , table )
do return LoadMultiboardHandle ( table , missionKey , key ) end
end

LoadMultiboardItemHandleBJ  = function ( key , missionKey , table )
do return LoadMultiboardItemHandle ( table , missionKey , key ) end
end

LoadTrackableHandleBJ  = function ( key , missionKey , table )
do return LoadTrackableHandle ( table , missionKey , key ) end
end

LoadDialogHandleBJ  = function ( key , missionKey , table )
do return LoadDialogHandle ( table , missionKey , key ) end
end

LoadButtonHandleBJ  = function ( key , missionKey , table )
do return LoadButtonHandle ( table , missionKey , key ) end
end

LoadTextTagHandleBJ  = function ( key , missionKey , table )
do return LoadTextTagHandle ( table , missionKey , key ) end
end

LoadLightningHandleBJ  = function ( key , missionKey , table )
do return LoadLightningHandle ( table , missionKey , key ) end
end

LoadImageHandleBJ  = function ( key , missionKey , table )
do return LoadImageHandle ( table , missionKey , key ) end
end

LoadUbersplatHandleBJ  = function ( key , missionKey , table )
do return LoadUbersplatHandle ( table , missionKey , key ) end
end

LoadRegionHandleBJ  = function ( key , missionKey , table )
do return LoadRegionHandle ( table , missionKey , key ) end
end

LoadFogStateHandleBJ  = function ( key , missionKey , table )
do return LoadFogStateHandle ( table , missionKey , key ) end
end

LoadFogModifierHandleBJ  = function ( key , missionKey , table )
do return LoadFogModifierHandle ( table , missionKey , key ) end
end

LoadHashtableHandleBJ  = function ( key , missionKey , table )
do return LoadHashtableHandle ( table , missionKey , key ) end
end

RestoreUnitLocFacingAngleBJ  = function ( key , missionKey , cache , forWhichPlayer , loc , facing )

bj_lastLoadedUnit = RestoreUnit ( cache , missionKey , key , forWhichPlayer , GetLocationX ( loc ) , GetLocationY ( loc ) , facing )
do return bj_lastLoadedUnit end
end

RestoreUnitLocFacingPointBJ  = function ( key , missionKey , cache , forWhichPlayer , loc , lookAt )

do return RestoreUnitLocFacingAngleBJ ( key , missionKey , cache , forWhichPlayer , loc , AngleBetweenPoints ( loc , lookAt ) ) end
end

GetLastRestoredUnitBJ  = function ( )
do return bj_lastLoadedUnit end
end

FlushGameCacheBJ  = function ( cache )
FlushGameCache ( cache )
end

FlushStoredMissionBJ  = function ( missionKey , cache )
FlushStoredMission ( cache , missionKey )
end

FlushParentHashtableBJ  = function ( table )
FlushParentHashtable ( table )
end

FlushChildHashtableBJ  = function ( missionKey , table )
FlushChildHashtable ( table , missionKey )
end

HaveStoredValue  = function ( key , valueType , missionKey , cache )
if ( valueType == bj_GAMECACHE_BOOLEAN ) then
do return HaveStoredBoolean ( cache , missionKey , key ) end
elseif ( valueType == bj_GAMECACHE_INTEGER ) then
do return HaveStoredInteger ( cache , missionKey , key ) end
elseif ( valueType == bj_GAMECACHE_REAL ) then
do return HaveStoredReal ( cache , missionKey , key ) end
elseif ( valueType == bj_GAMECACHE_UNIT ) then
do return HaveStoredUnit ( cache , missionKey , key ) end
elseif ( valueType == bj_GAMECACHE_STRING ) then
do return HaveStoredString ( cache , missionKey , key ) end
else

do return false end
end
end

HaveSavedValue  = function ( key , valueType , missionKey , table )
if ( valueType == bj_HASHTABLE_BOOLEAN ) then
do return HaveSavedBoolean ( table , missionKey , key ) end
elseif ( valueType == bj_HASHTABLE_INTEGER ) then
do return HaveSavedInteger ( table , missionKey , key ) end
elseif ( valueType == bj_HASHTABLE_REAL ) then
do return HaveSavedReal ( table , missionKey , key ) end
elseif ( valueType == bj_HASHTABLE_STRING ) then
do return HaveSavedString ( table , missionKey , key ) end
elseif ( valueType == bj_HASHTABLE_HANDLE ) then
do return HaveSavedHandle ( table , missionKey , key ) end
else

do return false end
end
end

ShowCustomCampaignButton  = function ( show , whichButton )
SetCustomCampaignButtonVisible ( whichButton - 1 , show )
end

IsCustomCampaignButtonVisibile  = function ( whichButton )
do return GetCustomCampaignButtonVisible ( whichButton - 1 ) end
end

LoadGameBJ  = function ( loadFileName , doScoreScreen )
LoadGame ( loadFileName , doScoreScreen )
end

SaveAndChangeLevelBJ  = function ( saveFileName , newLevel , doScoreScreen )
SaveGame ( saveFileName )
ChangeLevel ( newLevel , doScoreScreen )
end

SaveAndLoadGameBJ  = function ( saveFileName , loadFileName , doScoreScreen )
SaveGame ( saveFileName )
LoadGame ( loadFileName , doScoreScreen )
end

RenameSaveDirectoryBJ  = function ( sourceDirName , destDirName )
do return RenameSaveDirectory ( sourceDirName , destDirName ) end
end

RemoveSaveDirectoryBJ  = function ( sourceDirName )
do return RemoveSaveDirectory ( sourceDirName ) end
end

CopySaveGameBJ  = function ( sourceSaveName , destSaveName )
do return CopySaveGame ( sourceSaveName , destSaveName ) end
end






GetPlayerStartLocationX  = function ( whichPlayer )
do return GetStartLocationX ( GetPlayerStartLocation ( whichPlayer ) ) end
end

GetPlayerStartLocationY  = function ( whichPlayer )
do return GetStartLocationY ( GetPlayerStartLocation ( whichPlayer ) ) end
end

GetPlayerStartLocationLoc  = function ( whichPlayer )
do return GetStartLocationLoc ( GetPlayerStartLocation ( whichPlayer ) ) end
end

GetRectCenter  = function ( whichRect )
do return Location ( GetRectCenterX ( whichRect ) , GetRectCenterY ( whichRect ) ) end
end

IsPlayerSlotState  = function ( whichPlayer , whichState )
do return GetPlayerSlotState ( whichPlayer ) == whichState end
end

GetFadeFromSeconds  = function ( seconds )
if ( seconds ~= 0 ) then
do return math.modf ( 128 / R2I ( seconds ) ) end
end
do return 10000 end
end

GetFadeFromSecondsAsReal  = function ( seconds )
if ( seconds ~= 0 ) then
do return 128.00 / seconds end
end
do return 10000.00 end
end

AdjustPlayerStateSimpleBJ  = function ( whichPlayer , whichPlayerState , delta )
SetPlayerState ( whichPlayer , whichPlayerState , GetPlayerState ( whichPlayer , whichPlayerState ) + delta )
end

AdjustPlayerStateBJ  = function ( delta , whichPlayer , whichPlayerState )


if ( delta > 0 ) then
if ( whichPlayerState == PLAYER_STATE_RESOURCE_GOLD ) then
AdjustPlayerStateSimpleBJ ( whichPlayer , PLAYER_STATE_GOLD_GATHERED , delta )
elseif ( whichPlayerState == PLAYER_STATE_RESOURCE_LUMBER ) then
AdjustPlayerStateSimpleBJ ( whichPlayer , PLAYER_STATE_LUMBER_GATHERED , delta )
end
end
AdjustPlayerStateSimpleBJ ( whichPlayer , whichPlayerState , delta )
end

SetPlayerStateBJ  = function ( whichPlayer , whichPlayerState , value )
local oldValue = GetPlayerState ( whichPlayer , whichPlayerState )
AdjustPlayerStateBJ ( value - oldValue , whichPlayer , whichPlayerState )
end

SetPlayerFlagBJ  = function ( whichPlayerFlag , flag , whichPlayer )
SetPlayerState ( whichPlayer , whichPlayerFlag , IntegerTertiaryOp ( flag , 1 , 0 ) )
end

SetPlayerTaxRateBJ  = function ( rate , whichResource , sourcePlayer , otherPlayer )
SetPlayerTaxRate ( sourcePlayer , otherPlayer , whichResource , rate )
end

GetPlayerTaxRateBJ  = function ( whichResource , sourcePlayer , otherPlayer )
do return GetPlayerTaxRate ( sourcePlayer , otherPlayer , whichResource ) end
end

IsPlayerFlagSetBJ  = function ( whichPlayerFlag , whichPlayer )
do return GetPlayerState ( whichPlayer , whichPlayerFlag ) == 1 end
end

AddResourceAmountBJ  = function ( delta , whichUnit )
AddResourceAmount ( whichUnit , delta )
end

GetConvertedPlayerId  = function ( whichPlayer )
do return GetPlayerId ( whichPlayer ) + 1 end
end

ConvertedPlayer  = function ( convertedPlayerId )
do return Player ( convertedPlayerId - 1 ) end
end

GetRectWidthBJ  = function ( r )
do return GetRectMaxX ( r ) - GetRectMinX ( r ) end
end

GetRectHeightBJ  = function ( r )
do return GetRectMaxY ( r ) - GetRectMinY ( r ) end
end



BlightGoldMineForPlayerBJ  = function ( goldMine , whichPlayer )
local mineX
local mineY
local mineGold
local newMine

if GetUnitTypeId ( goldMine ) ~= 1852272492 then
do return nil end
end

mineX = GetUnitX ( goldMine )
mineY = GetUnitY ( goldMine )
mineGold = GetResourceAmount ( goldMine )
RemoveUnit ( goldMine )

newMine = CreateBlightedGoldmine ( whichPlayer , mineX , mineY , bj_UNIT_FACING )
SetResourceAmount ( newMine , mineGold )
do return newMine end
end

BlightGoldMineForPlayer  = function ( goldMine , whichPlayer )
bj_lastHauntedGoldMine = BlightGoldMineForPlayerBJ ( goldMine , whichPlayer )
do return bj_lastHauntedGoldMine end
end

GetLastHauntedGoldMine  = function ( )
do return bj_lastHauntedGoldMine end
end

IsPointBlightedBJ  = function ( where )
do return IsPointBlighted ( GetLocationX ( where ) , GetLocationY ( where ) ) end
end

SetPlayerColorBJEnum  = function ( )
SetUnitColor ( GetEnumUnit ( ) , bj_setPlayerTargetColor )
end

SetPlayerColorBJ  = function ( whichPlayer , color , changeExisting )
local g
SetPlayerColor ( whichPlayer , color )
if changeExisting then
bj_setPlayerTargetColor = color
g = CreateGroup ( )
GroupEnumUnitsOfPlayer ( g , whichPlayer , nil )
ForGroup ( g , SetPlayerColorBJEnum )
DestroyGroup ( g )
end
end

SetPlayerUnitAvailableBJ  = function ( unitId , allowed , whichPlayer )
if allowed then
SetPlayerTechMaxAllowed ( whichPlayer , unitId , - 1 )
else
SetPlayerTechMaxAllowed ( whichPlayer , unitId , 0 )
end
end

LockGameSpeedBJ  = function ( )
SetMapFlag ( MAP_LOCK_SPEED , true )
end

UnlockGameSpeedBJ  = function ( )
SetMapFlag ( MAP_LOCK_SPEED , false )
end

IssueTargetOrderBJ  = function ( whichUnit , order , targetWidget )
do return IssueTargetOrder ( whichUnit , order , targetWidget ) end
end

IssuePointOrderLocBJ  = function ( whichUnit , order , whichLocation )
do return IssuePointOrderLoc ( whichUnit , order , whichLocation ) end
end




IssueTargetDestructableOrder  = function ( whichUnit , order , targetWidget )
do return IssueTargetOrder ( whichUnit , order , targetWidget ) end
end
IssueTargetItemOrder  = function ( whichUnit , order , targetWidget )
do return IssueTargetOrder ( whichUnit , order , targetWidget ) end
end

IssueImmediateOrderBJ  = function ( whichUnit , order )
do return IssueImmediateOrder ( whichUnit , order ) end
end

GroupTargetOrderBJ  = function ( whichGroup , order , targetWidget )
do return GroupTargetOrder ( whichGroup , order , targetWidget ) end
end

GroupPointOrderLocBJ  = function ( whichGroup , order , whichLocation )
do return GroupPointOrderLoc ( whichGroup , order , whichLocation ) end
end

GroupImmediateOrderBJ  = function ( whichGroup , order )
do return GroupImmediateOrder ( whichGroup , order ) end
end




GroupTargetDestructableOrder  = function ( whichGroup , order , targetWidget )
do return GroupTargetOrder ( whichGroup , order , targetWidget ) end
end
GroupTargetItemOrder  = function ( whichGroup , order , targetWidget )
do return GroupTargetOrder ( whichGroup , order , targetWidget ) end
end

GetDyingDestructable  = function ( )
do return GetTriggerDestructable ( ) end
end



SetUnitRallyPoint  = function ( whichUnit , targPos )
IssuePointOrderLocBJ ( whichUnit , "setrally" , targPos )
end

SetUnitRallyUnit  = function ( whichUnit , targUnit )
IssueTargetOrder ( whichUnit , "setrally" , targUnit )
end

SetUnitRallyDestructable  = function ( whichUnit , targDest )
IssueTargetOrder ( whichUnit , "setrally" , targDest )
end





SaveDyingWidget  = function ( )
bj_lastDyingWidget = GetTriggerWidget ( )
end

SetBlightRectBJ  = function ( addBlight , whichPlayer , r )
SetBlightRect ( whichPlayer , r , addBlight )
end

SetBlightRadiusLocBJ  = function ( addBlight , whichPlayer , loc , radius )
SetBlightLoc ( whichPlayer , loc , radius , addBlight )
end

GetAbilityName  = function ( abilcode )
do return GetObjectName ( abilcode ) end
end






MeleeStartingVisibility  = function ( )

SetFloatGameState ( GAME_STATE_TIME_OF_DAY , bj_MELEE_STARTING_TOD )


end






MeleeStartingResources  = function ( )
local index
local indexPlayer
local v
local startingGold
local startingLumber
v = VersionGet ( )
if ( v == VERSION_REIGN_OF_CHAOS ) then
startingGold = bj_MELEE_STARTING_GOLD_V0
startingLumber = bj_MELEE_STARTING_LUMBER_V0
else
startingGold = bj_MELEE_STARTING_GOLD_V1
startingLumber = bj_MELEE_STARTING_LUMBER_V1
end

index = 0
for _i = 1, 10000 do
indexPlayer = Player ( index )
if ( GetPlayerSlotState ( indexPlayer ) == PLAYER_SLOT_STATE_PLAYING ) then
SetPlayerState ( indexPlayer , PLAYER_STATE_RESOURCE_GOLD , startingGold )
SetPlayerState ( indexPlayer , PLAYER_STATE_RESOURCE_LUMBER , startingLumber )
end
index = index + 1
if index == bj_MAX_PLAYERS then break end
end
end






ReducePlayerTechMaxAllowed  = function ( whichPlayer , techId , limit )
local oldMax = GetPlayerTechMaxAllowed ( whichPlayer , techId )

if ( oldMax < 0 or oldMax > limit ) then
SetPlayerTechMaxAllowed ( whichPlayer , techId , limit )
end
end

MeleeStartingHeroLimit  = function ( )
local index
index = 0
for _i = 1, 10000 do

SetPlayerMaxHeroesAllowed ( bj_MELEE_HERO_LIMIT , Player ( index ) )

ReducePlayerTechMaxAllowed ( Player ( index ) , 1214344551 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1215130471 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1215324524 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1214409837 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1331850337 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1332109682 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1333027688 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1332963428 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1164207469 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1164666213 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1164799855 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1165451634 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1432642913 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1432646245 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1433168227 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1432580716 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1315988077 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1315074670 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1315858291 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1315990632 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1315074932 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1315007587 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1316252014 , bj_MELEE_HERO_TYPE_LIMIT )
ReducePlayerTechMaxAllowed ( Player ( index ) , 1315334514 , bj_MELEE_HERO_TYPE_LIMIT )
index = index + 1
if index == bj_MAX_PLAYERS then break end
end
end






MeleeTrainedUnitIsHeroBJFilter  = function ( )
do return IsUnitType ( GetFilterUnit ( ) , UNIT_TYPE_HERO ) end
end





MeleeGrantItemsToHero  = function ( whichUnit )
local owner = GetPlayerId ( GetOwningPlayer ( whichUnit ) )

if ( bj_meleeTwinkedHeroes [ owner ] < bj_MELEE_MAX_TWINKED_HEROES ) then
UnitAddItemById ( whichUnit , 1937012592 )
bj_meleeTwinkedHeroes [ owner ] = bj_meleeTwinkedHeroes [ owner ] + 1
end
end

MeleeGrantItemsToTrainedHero  = function ( )
MeleeGrantItemsToHero ( GetTrainedUnit ( ) )
end

MeleeGrantItemsToHiredHero  = function ( )
MeleeGrantItemsToHero ( GetSoldUnit ( ) )
end

MeleeGrantHeroItems  = function ( )
local index
local trig

index = 0
for _i = 1, 10000 do
bj_meleeTwinkedHeroes [ index ] = 0
index = index + 1
if index == bj_MAX_PLAYER_SLOTS then break end
end


index = 0
for _i = 1, 10000 do
trig = CreateTrigger ( )
TriggerRegisterPlayerUnitEvent ( trig , Player ( index ) , EVENT_PLAYER_UNIT_TRAIN_FINISH , filterMeleeTrainedUnitIsHeroBJ )
TriggerAddAction ( trig , MeleeGrantItemsToTrainedHero )
index = index + 1
if index == bj_MAX_PLAYERS then break end
end


trig = CreateTrigger ( )
TriggerRegisterPlayerUnitEvent ( trig , Player ( PLAYER_NEUTRAL_PASSIVE ) , EVENT_PLAYER_UNIT_SELL , filterMeleeTrainedUnitIsHeroBJ )
TriggerAddAction ( trig , MeleeGrantItemsToHiredHero )


bj_meleeGrantHeroItems = true
end






MeleeClearExcessUnit  = function ( )
local theUnit = GetEnumUnit ( )
local owner = GetPlayerId ( GetOwningPlayer ( theUnit ) )
if ( owner == PLAYER_NEUTRAL_AGGRESSIVE ) then

RemoveUnit ( GetEnumUnit ( ) )
elseif ( owner == PLAYER_NEUTRAL_PASSIVE ) then

if not IsUnitType ( theUnit , UNIT_TYPE_STRUCTURE ) then
RemoveUnit ( GetEnumUnit ( ) )
end
end
end

MeleeClearNearbyUnits  = function ( x , y , range )
local nearbyUnits

nearbyUnits = CreateGroup ( )
GroupEnumUnitsInRange ( nearbyUnits , x , y , range , nil )
ForGroup ( nearbyUnits , MeleeClearExcessUnit )
DestroyGroup ( nearbyUnits )
end

MeleeClearExcessUnits  = function ( )
local index
local locX
local locY
local indexPlayer
index = 0
for _i = 1, 10000 do
indexPlayer = Player ( index )

if ( GetPlayerSlotState ( indexPlayer ) == PLAYER_SLOT_STATE_PLAYING ) then
locX = GetStartLocationX ( GetPlayerStartLocation ( indexPlayer ) )
locY = GetStartLocationY ( GetPlayerStartLocation ( indexPlayer ) )
MeleeClearNearbyUnits ( locX , locY , bj_MELEE_CLEAR_UNITS_RADIUS )
end
index = index + 1
if index == bj_MAX_PLAYERS then break end
end
end






MeleeEnumFindNearestMine  = function ( )
local enumUnit = GetEnumUnit ( )
local dist
local unitLoc
if ( GetUnitTypeId ( enumUnit ) == 1852272492 ) then
unitLoc = GetUnitLoc ( enumUnit )
dist = DistanceBetweenPoints ( unitLoc , bj_meleeNearestMineToLoc )
RemoveLocation ( unitLoc )

if ( bj_meleeNearestMineDist < 0 ) or ( dist < bj_meleeNearestMineDist ) then
bj_meleeNearestMine = enumUnit
bj_meleeNearestMineDist = dist
end
end
end

MeleeFindNearestMine  = function ( src , range )
local nearbyMines
bj_meleeNearestMine = nil
bj_meleeNearestMineDist = - 1
bj_meleeNearestMineToLoc = src
nearbyMines = CreateGroup ( )
GroupEnumUnitsInRangeOfLoc ( nearbyMines , src , range , nil )
ForGroup ( nearbyMines , MeleeEnumFindNearestMine )
DestroyGroup ( nearbyMines )
do return bj_meleeNearestMine end
end

MeleeRandomHeroLoc  = function ( p , id1 , id2 , id3 , id4 , loc )
local hero = nil
local roll
local pick
local v

v = VersionGet ( )
if ( v == VERSION_REIGN_OF_CHAOS ) then
roll = GetRandomInt ( 1 , 3 )
else
roll = GetRandomInt ( 1 , 4 )
end

if roll == 1 then
pick = id1
elseif roll == 2 then
pick = id2
elseif roll == 3 then
pick = id3
elseif roll == 4 then
pick = id4
else

pick = id1
end

hero = CreateUnitAtLoc ( p , pick , loc , bj_UNIT_FACING )
if bj_meleeGrantHeroItems then
MeleeGrantItemsToHero ( hero )
end
do return hero end
end



MeleeGetProjectedLoc  = function ( src , targ , distance , deltaAngle )
local srcX = GetLocationX ( src )
local srcY = GetLocationY ( src )
local direction = Atan2 ( GetLocationY ( targ ) - srcY , GetLocationX ( targ ) - srcX ) + deltaAngle
do return Location ( srcX + distance * Cos ( direction ) , srcY + distance * Sin ( direction ) ) end
end

MeleeGetNearestValueWithin  = function ( val , minVal , maxVal )
if ( val < minVal ) then
do return minVal end
elseif ( val > maxVal ) then
do return maxVal end
else
do return val end
end
end

MeleeGetLocWithinRect  = function ( src , r )
local withinX = MeleeGetNearestValueWithin ( GetLocationX ( src ) , GetRectMinX ( r ) , GetRectMaxX ( r ) )
local withinY = MeleeGetNearestValueWithin ( GetLocationY ( src ) , GetRectMinY ( r ) , GetRectMaxY ( r ) )
do return Location ( withinX , withinY ) end
end





MeleeStartingUnitsHuman  = function ( whichPlayer , startLoc , doHeroes , doCamera , doPreload )
local useRandomHero = IsMapFlagSet ( MAP_RANDOM_HERO )
local unitSpacing = 64.00
local nearestMine
local nearMineLoc
local heroLoc
local peonX
local peonY
local townHall = nil
if ( doPreload ) then
Preloader ( "scripts\\HumanMelee.pld" )
end
nearestMine = MeleeFindNearestMine ( startLoc , bj_MELEE_MINE_SEARCH_RADIUS )
if ( nearestMine ~= nil ) then

townHall = CreateUnitAtLoc ( whichPlayer , 1752461175 , startLoc , bj_UNIT_FACING )


nearMineLoc = MeleeGetProjectedLoc ( GetUnitLoc ( nearestMine ) , startLoc , 320 , 0 )
peonX = GetLocationX ( nearMineLoc )
peonY = GetLocationY ( nearMineLoc )
CreateUnit ( whichPlayer , 1752196449 , peonX + 0.00 * unitSpacing , peonY + 1.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1752196449 , peonX + 1.00 * unitSpacing , peonY + 0.15 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1752196449 , peonX - 1.00 * unitSpacing , peonY + 0.15 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1752196449 , peonX + 0.60 * unitSpacing , peonY - 1.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1752196449 , peonX - 0.60 * unitSpacing , peonY - 1.00 * unitSpacing , bj_UNIT_FACING )

heroLoc = MeleeGetProjectedLoc ( GetUnitLoc ( nearestMine ) , startLoc , 384 , 45 )
else

townHall = CreateUnitAtLoc ( whichPlayer , 1752461175 , startLoc , bj_UNIT_FACING )


peonX = GetLocationX ( startLoc )
peonY = GetLocationY ( startLoc ) - 224.00
CreateUnit ( whichPlayer , 1752196449 , peonX + 2.00 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1752196449 , peonX + 1.00 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1752196449 , peonX + 0.00 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1752196449 , peonX - 1.00 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1752196449 , peonX - 2.00 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )

heroLoc = Location ( peonX , peonY - 2.00 * unitSpacing )
end
if ( townHall ~= nil ) then
UnitAddAbilityBJ ( 1097689443 , townHall )
UnitMakeAbilityPermanentBJ ( true , 1097689443 , townHall )
end
if ( doHeroes ) then


if useRandomHero then
MeleeRandomHeroLoc ( whichPlayer , 1214344551 , 1215130471 , 1215324524 , 1214409837 , heroLoc )
else
SetPlayerState ( whichPlayer , PLAYER_STATE_RESOURCE_HERO_TOKENS , bj_MELEE_STARTING_HERO_TOKENS )
end
end
if ( doCamera ) then

SetCameraPositionForPlayer ( whichPlayer , peonX , peonY )
SetCameraQuickPositionForPlayer ( whichPlayer , peonX , peonY )
end
end





MeleeStartingUnitsOrc  = function ( whichPlayer , startLoc , doHeroes , doCamera , doPreload )
local useRandomHero = IsMapFlagSet ( MAP_RANDOM_HERO )
local unitSpacing = 64.00
local nearestMine
local nearMineLoc
local heroLoc
local peonX
local peonY
if ( doPreload ) then
Preloader ( "scripts\\OrcMelee.pld" )
end
nearestMine = MeleeFindNearestMine ( startLoc , bj_MELEE_MINE_SEARCH_RADIUS )
if ( nearestMine ~= nil ) then

CreateUnitAtLoc ( whichPlayer , 1869050469 , startLoc , bj_UNIT_FACING )


nearMineLoc = MeleeGetProjectedLoc ( GetUnitLoc ( nearestMine ) , startLoc , 320 , 0 )
peonX = GetLocationX ( nearMineLoc )
peonY = GetLocationY ( nearMineLoc )
CreateUnit ( whichPlayer , 1869636975 , peonX + 0.00 * unitSpacing , peonY + 1.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1869636975 , peonX + 1.00 * unitSpacing , peonY + 0.15 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1869636975 , peonX - 1.00 * unitSpacing , peonY + 0.15 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1869636975 , peonX + 0.60 * unitSpacing , peonY - 1.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1869636975 , peonX - 0.60 * unitSpacing , peonY - 1.00 * unitSpacing , bj_UNIT_FACING )

heroLoc = MeleeGetProjectedLoc ( GetUnitLoc ( nearestMine ) , startLoc , 384 , 45 )
else

CreateUnitAtLoc ( whichPlayer , 1869050469 , startLoc , bj_UNIT_FACING )


peonX = GetLocationX ( startLoc )
peonY = GetLocationY ( startLoc ) - 224.00
CreateUnit ( whichPlayer , 1869636975 , peonX + 2.00 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1869636975 , peonX + 1.00 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1869636975 , peonX + 0.00 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1869636975 , peonX - 1.00 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1869636975 , peonX - 2.00 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )

heroLoc = Location ( peonX , peonY - 2.00 * unitSpacing )
end
if ( doHeroes ) then


if useRandomHero then
MeleeRandomHeroLoc ( whichPlayer , 1331850337 , 1332109682 , 1333027688 , 1332963428 , heroLoc )
else
SetPlayerState ( whichPlayer , PLAYER_STATE_RESOURCE_HERO_TOKENS , bj_MELEE_STARTING_HERO_TOKENS )
end
end
if ( doCamera ) then

SetCameraPositionForPlayer ( whichPlayer , peonX , peonY )
SetCameraQuickPositionForPlayer ( whichPlayer , peonX , peonY )
end
end








MeleeStartingUnitsUndead  = function ( whichPlayer , startLoc , doHeroes , doCamera , doPreload )
local useRandomHero = IsMapFlagSet ( MAP_RANDOM_HERO )
local unitSpacing = 64.00
local nearestMine
local nearMineLoc
local nearTownLoc
local heroLoc
local peonX
local peonY
local ghoulX
local ghoulY
if ( doPreload ) then
Preloader ( "scripts\\UndeadMelee.pld" )
end
nearestMine = MeleeFindNearestMine ( startLoc , bj_MELEE_MINE_SEARCH_RADIUS )
if ( nearestMine ~= nil ) then

CreateUnitAtLoc ( whichPlayer , 1970172012 , startLoc , bj_UNIT_FACING )


nearestMine = BlightGoldMineForPlayerBJ ( nearestMine , whichPlayer )

nearTownLoc = MeleeGetProjectedLoc ( startLoc , GetUnitLoc ( nearestMine ) , 288 , 0 )
ghoulX = GetLocationX ( nearTownLoc )
ghoulY = GetLocationY ( nearTownLoc )
bj_ghoul [ GetPlayerId ( whichPlayer ) ] = CreateUnit ( whichPlayer , 1969711215 , ghoulX + 0.00 * unitSpacing , ghoulY + 0.00 * unitSpacing , bj_UNIT_FACING )

nearMineLoc = MeleeGetProjectedLoc ( GetUnitLoc ( nearestMine ) , startLoc , 320 , 0 )
peonX = GetLocationX ( nearMineLoc )
peonY = GetLocationY ( nearMineLoc )
CreateUnit ( whichPlayer , 1969316719 , peonX + 0.00 * unitSpacing , peonY + 0.50 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1969316719 , peonX + 0.65 * unitSpacing , peonY - 0.50 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1969316719 , peonX - 0.65 * unitSpacing , peonY - 0.50 * unitSpacing , bj_UNIT_FACING )

SetBlightLoc ( whichPlayer , nearMineLoc , 768 , true )

heroLoc = MeleeGetProjectedLoc ( GetUnitLoc ( nearestMine ) , startLoc , 384 , 45 )
else

CreateUnitAtLoc ( whichPlayer , 1970172012 , startLoc , bj_UNIT_FACING )


peonX = GetLocationX ( startLoc )
peonY = GetLocationY ( startLoc ) - 224.00
CreateUnit ( whichPlayer , 1969316719 , peonX - 1.50 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1969316719 , peonX - 0.50 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1969316719 , peonX + 0.50 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1969711215 , peonX + 1.50 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )

SetBlightLoc ( whichPlayer , startLoc , 768 , true )

heroLoc = Location ( peonX , peonY - 2.00 * unitSpacing )
end
if ( doHeroes ) then


if useRandomHero then
MeleeRandomHeroLoc ( whichPlayer , 1432642913 , 1432646245 , 1433168227 , 1432580716 , heroLoc )
else
SetPlayerState ( whichPlayer , PLAYER_STATE_RESOURCE_HERO_TOKENS , bj_MELEE_STARTING_HERO_TOKENS )
end
end
if ( doCamera ) then

SetCameraPositionForPlayer ( whichPlayer , peonX , peonY )
SetCameraQuickPositionForPlayer ( whichPlayer , peonX , peonY )
end
end





MeleeStartingUnitsNightElf  = function ( whichPlayer , startLoc , doHeroes , doCamera , doPreload )
local useRandomHero = IsMapFlagSet ( MAP_RANDOM_HERO )
local unitSpacing = 64.00
local minTreeDist = 3.50 * bj_CELLWIDTH
local minWispDist = 1.75 * bj_CELLWIDTH
local nearestMine
local nearMineLoc
local wispLoc
local heroLoc
local peonX
local peonY
local tree
if ( doPreload ) then
Preloader ( "scripts\\NightElfMelee.pld" )
end
nearestMine = MeleeFindNearestMine ( startLoc , bj_MELEE_MINE_SEARCH_RADIUS )
if ( nearestMine ~= nil ) then



nearMineLoc = MeleeGetProjectedLoc ( GetUnitLoc ( nearestMine ) , startLoc , 650 , 0 )
nearMineLoc = MeleeGetLocWithinRect ( nearMineLoc , GetRectFromCircleBJ ( GetUnitLoc ( nearestMine ) , minTreeDist ) )
tree = CreateUnitAtLoc ( whichPlayer , 1702129516 , nearMineLoc , bj_UNIT_FACING )
IssueTargetOrder ( tree , "entangleinstant" , nearestMine )

wispLoc = MeleeGetProjectedLoc ( GetUnitLoc ( nearestMine ) , startLoc , 320 , 0 )
wispLoc = MeleeGetLocWithinRect ( wispLoc , GetRectFromCircleBJ ( GetUnitLoc ( nearestMine ) , minWispDist ) )
peonX = GetLocationX ( wispLoc )
peonY = GetLocationY ( wispLoc )
CreateUnit ( whichPlayer , 1702327152 , peonX + 0.00 * unitSpacing , peonY + 1.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1702327152 , peonX + 1.00 * unitSpacing , peonY + 0.15 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1702327152 , peonX - 1.00 * unitSpacing , peonY + 0.15 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1702327152 , peonX + 0.58 * unitSpacing , peonY - 1.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1702327152 , peonX - 0.58 * unitSpacing , peonY - 1.00 * unitSpacing , bj_UNIT_FACING )

heroLoc = MeleeGetProjectedLoc ( GetUnitLoc ( nearestMine ) , startLoc , 384 , 45 )
else

CreateUnitAtLoc ( whichPlayer , 1702129516 , startLoc , bj_UNIT_FACING )

peonX = GetLocationX ( startLoc )
peonY = GetLocationY ( startLoc ) - 224.00
CreateUnit ( whichPlayer , 1702327152 , peonX - 2.00 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1702327152 , peonX - 1.00 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1702327152 , peonX + 0.00 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1702327152 , peonX + 1.00 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )
CreateUnit ( whichPlayer , 1702327152 , peonX + 2.00 * unitSpacing , peonY + 0.00 * unitSpacing , bj_UNIT_FACING )

heroLoc = Location ( peonX , peonY - 2.00 * unitSpacing )
end
if ( doHeroes ) then


if useRandomHero then
MeleeRandomHeroLoc ( whichPlayer , 1164207469 , 1164666213 , 1164799855 , 1165451634 , heroLoc )
else
SetPlayerState ( whichPlayer , PLAYER_STATE_RESOURCE_HERO_TOKENS , bj_MELEE_STARTING_HERO_TOKENS )
end
end
if ( doCamera ) then

SetCameraPositionForPlayer ( whichPlayer , peonX , peonY )
SetCameraQuickPositionForPlayer ( whichPlayer , peonX , peonY )
end
end




MeleeStartingUnitsUnknownRace  = function ( whichPlayer , startLoc , doHeroes , doCamera , doPreload )
local index
if ( doPreload ) then
end
index = 0
for _i = 1, 10000 do
CreateUnit ( whichPlayer , 1853057125 , GetLocationX ( startLoc ) + GetRandomReal ( - 256 , 256 ) , GetLocationY ( startLoc ) + GetRandomReal ( - 256 , 256 ) , GetRandomReal ( 0 , 360 ) )
index = index + 1
if index == 12 then break end
end
if ( doHeroes ) then

SetPlayerState ( whichPlayer , PLAYER_STATE_RESOURCE_HERO_TOKENS , bj_MELEE_STARTING_HERO_TOKENS )
end
if ( doCamera ) then

SetCameraPositionLocForPlayer ( whichPlayer , startLoc )
SetCameraQuickPositionLocForPlayer ( whichPlayer , startLoc )
end
end

MeleeStartingUnits  = function ( )
local index
local indexPlayer
local indexStartLoc
local indexRace
Preloader ( "scripts\\SharedMelee.pld" )
index = 0
for _i = 1, 10000 do
indexPlayer = Player ( index )
if ( GetPlayerSlotState ( indexPlayer ) == PLAYER_SLOT_STATE_PLAYING ) then
indexStartLoc = GetStartLocationLoc ( GetPlayerStartLocation ( indexPlayer ) )
indexRace = GetPlayerRace ( indexPlayer )

if ( indexRace == RACE_HUMAN ) then
MeleeStartingUnitsHuman ( indexPlayer , indexStartLoc , true , true , true )
elseif ( indexRace == RACE_ORC ) then
MeleeStartingUnitsOrc ( indexPlayer , indexStartLoc , true , true , true )
elseif ( indexRace == RACE_UNDEAD ) then
MeleeStartingUnitsUndead ( indexPlayer , indexStartLoc , true , true , true )
elseif ( indexRace == RACE_NIGHTELF ) then
MeleeStartingUnitsNightElf ( indexPlayer , indexStartLoc , true , true , true )
else
MeleeStartingUnitsUnknownRace ( indexPlayer , indexStartLoc , true , true , true )
end
end
index = index + 1
if index == bj_MAX_PLAYERS then break end
end

end

MeleeStartingUnitsForPlayer  = function ( whichRace , whichPlayer , loc , doHeroes )

if ( whichRace == RACE_HUMAN ) then
MeleeStartingUnitsHuman ( whichPlayer , loc , doHeroes , false , false )
elseif ( whichRace == RACE_ORC ) then
MeleeStartingUnitsOrc ( whichPlayer , loc , doHeroes , false , false )
elseif ( whichRace == RACE_UNDEAD ) then
MeleeStartingUnitsUndead ( whichPlayer , loc , doHeroes , false , false )
elseif ( whichRace == RACE_NIGHTELF ) then
MeleeStartingUnitsNightElf ( whichPlayer , loc , doHeroes , false , false )
else

end
end






PickMeleeAI  = function ( num , s1 , s2 , s3 )
local pick



if GetAIDifficulty ( num ) == AI_DIFFICULTY_NEWBIE then
StartMeleeAI ( num , s1 )
do return end
end
if s2 == nil then
pick = 1
elseif s3 == nil then
pick = GetRandomInt ( 1 , 2 )
else
pick = GetRandomInt ( 1 , 3 )
end
if pick == 1 then
StartMeleeAI ( num , s1 )
elseif pick == 2 then
StartMeleeAI ( num , s2 )
else
StartMeleeAI ( num , s3 )
end
end

MeleeStartingAI  = function ( )
local index
local indexPlayer
local indexRace
index = 0
for _i = 1, 10000 do
indexPlayer = Player ( index )
if ( GetPlayerSlotState ( indexPlayer ) == PLAYER_SLOT_STATE_PLAYING ) then
indexRace = GetPlayerRace ( indexPlayer )
if ( GetPlayerController ( indexPlayer ) == MAP_CONTROL_COMPUTER ) then

if ( indexRace == RACE_HUMAN ) then
PickMeleeAI ( indexPlayer , "human.ai" , nil , nil )
elseif ( indexRace == RACE_ORC ) then
PickMeleeAI ( indexPlayer , "orc.ai" , nil , nil )
elseif ( indexRace == RACE_UNDEAD ) then
PickMeleeAI ( indexPlayer , "undead.ai" , nil , nil )
RecycleGuardPosition ( bj_ghoul [ index ] )
elseif ( indexRace == RACE_NIGHTELF ) then
PickMeleeAI ( indexPlayer , "elf.ai" , nil , nil )
else

end
ShareEverythingWithTeamAI ( indexPlayer )
end
end
index = index + 1
if index == bj_MAX_PLAYERS then break end
end
end
LockGuardPosition  = function ( targ )
SetUnitCreepGuard ( targ , true )
end






MeleePlayerIsOpponent  = function ( playerIndex , opponentIndex )
local thePlayer = Player ( playerIndex )
local theOpponent = Player ( opponentIndex )

if ( playerIndex == opponentIndex ) then
do return false end
end

if ( GetPlayerSlotState ( theOpponent ) ~= PLAYER_SLOT_STATE_PLAYING ) then
do return false end
end

if ( bj_meleeDefeated [ opponentIndex ] ) then
do return false end
end

if GetPlayerAlliance ( thePlayer , theOpponent , ALLIANCE_PASSIVE ) then
if GetPlayerAlliance ( theOpponent , thePlayer , ALLIANCE_PASSIVE ) then
if ( GetPlayerState ( thePlayer , PLAYER_STATE_ALLIED_VICTORY ) == 1 ) then
if ( GetPlayerState ( theOpponent , PLAYER_STATE_ALLIED_VICTORY ) == 1 ) then
do return false end
end
end
end
end
do return true end
end



MeleeGetAllyStructureCount  = function ( whichPlayer )
local playerIndex
local buildingCount
local indexPlayer

buildingCount = 0
playerIndex = 0
for _i = 1, 10000 do
indexPlayer = Player ( playerIndex )


if ( PlayersAreCoAllied ( whichPlayer , indexPlayer ) ) then
buildingCount = buildingCount + GetPlayerStructureCount ( indexPlayer , true )
end

playerIndex = playerIndex + 1
if playerIndex == bj_MAX_PLAYERS then break end
end
do return buildingCount end
end



MeleeGetAllyCount  = function ( whichPlayer )
local playerIndex
local playerCount
local indexPlayer

playerCount = 0
playerIndex = 0
for _i = 1, 10000 do
indexPlayer = Player ( playerIndex )
if PlayersAreCoAllied ( whichPlayer , indexPlayer ) and not bj_meleeDefeated [ playerIndex ] and ( whichPlayer ~= indexPlayer ) then
playerCount = playerCount + 1
end
playerIndex = playerIndex + 1
if playerIndex == bj_MAX_PLAYERS then break end
end
do return playerCount end
end






MeleeGetAllyKeyStructureCount  = function ( whichPlayer )
local playerIndex
local indexPlayer
local keyStructs

keyStructs = 0
playerIndex = 0
for _i = 1, 10000 do
indexPlayer = Player ( playerIndex )
if ( PlayersAreCoAllied ( whichPlayer , indexPlayer ) ) then
keyStructs = keyStructs + GetPlayerTypedUnitCount ( indexPlayer , "townhall" , true , true )
keyStructs = keyStructs + GetPlayerTypedUnitCount ( indexPlayer , "greathall" , true , true )
keyStructs = keyStructs + GetPlayerTypedUnitCount ( indexPlayer , "treeoflife" , true , true )
keyStructs = keyStructs + GetPlayerTypedUnitCount ( indexPlayer , "necropolis" , true , true )
end

playerIndex = playerIndex + 1
if playerIndex == bj_MAX_PLAYERS then break end
end
do return keyStructs end
end



MeleeDoDrawEnum  = function ( )
local thePlayer = GetEnumPlayer ( )
CachePlayerHeroData ( thePlayer )
RemovePlayerPreserveUnitsBJ ( thePlayer , PLAYER_GAME_RESULT_TIE , false )
end



MeleeDoVictoryEnum  = function ( )
local thePlayer = GetEnumPlayer ( )
local playerIndex = GetPlayerId ( thePlayer )
if ( not bj_meleeVictoried [ playerIndex ] ) then
bj_meleeVictoried [ playerIndex ] = true
CachePlayerHeroData ( thePlayer )
RemovePlayerPreserveUnitsBJ ( thePlayer , PLAYER_GAME_RESULT_VICTORY , false )
end
end



MeleeDoDefeat  = function ( whichPlayer )
bj_meleeDefeated [ GetPlayerId ( whichPlayer ) ] = true
RemovePlayerPreserveUnitsBJ ( whichPlayer , PLAYER_GAME_RESULT_DEFEAT , false )
end



MeleeDoDefeatEnum  = function ( )
local thePlayer = GetEnumPlayer ( )

CachePlayerHeroData ( thePlayer )
MakeUnitsPassiveForTeam ( thePlayer )
MeleeDoDefeat ( thePlayer )
end



MeleeDoLeave  = function ( whichPlayer )
if ( GetIntegerGameState ( GAME_STATE_DISCONNECTED ) ~= 0 ) then
GameOverDialogBJ ( whichPlayer , true )
else
bj_meleeDefeated [ GetPlayerId ( whichPlayer ) ] = true
RemovePlayerPreserveUnitsBJ ( whichPlayer , PLAYER_GAME_RESULT_DEFEAT , true )
end
end



MeleeRemoveObservers  = function ( )
local playerIndex
local indexPlayer

playerIndex = 0
for _i = 1, 10000 do
indexPlayer = Player ( playerIndex )
if ( IsPlayerObserver ( indexPlayer ) ) then
RemovePlayerPreserveUnitsBJ ( indexPlayer , PLAYER_GAME_RESULT_NEUTRAL , false )
end
playerIndex = playerIndex + 1
if playerIndex == bj_MAX_PLAYERS then break end
end
end






MeleeCheckForVictors  = function ( )
local playerIndex
local opponentIndex
local opponentlessPlayers = CreateForce ( )
local gameOver = false

playerIndex = 0
for _i = 1, 10000 do
if ( not bj_meleeDefeated [ playerIndex ] ) then

opponentIndex = 0
for _i = 1, 10000 do

if MeleePlayerIsOpponent ( playerIndex , opponentIndex ) then
do return CreateForce ( ) end
end
opponentIndex = opponentIndex + 1
if opponentIndex == bj_MAX_PLAYERS then break end
end


ForceAddPlayer ( opponentlessPlayers , Player ( playerIndex ) )
gameOver = true
end
playerIndex = playerIndex + 1
if playerIndex == bj_MAX_PLAYERS then break end
end

bj_meleeGameOver = gameOver
do return opponentlessPlayers end
end



MeleeCheckForLosersAndVictors  = function ( )
local playerIndex
local indexPlayer
local defeatedPlayers = CreateForce ( )
local victoriousPlayers
local gameOver = false

if ( bj_meleeGameOver ) then
do return end
end



if ( GetIntegerGameState ( GAME_STATE_DISCONNECTED ) ~= 0 ) then
bj_meleeGameOver = true
do return end
end

playerIndex = 0
for _i = 1, 10000 do
indexPlayer = Player ( playerIndex )
if ( not bj_meleeDefeated [ playerIndex ] and not bj_meleeVictoried [ playerIndex ] ) then

if ( MeleeGetAllyStructureCount ( indexPlayer ) <= 0 ) then


ForceAddPlayer ( defeatedPlayers , Player ( playerIndex ) )


bj_meleeDefeated [ playerIndex ] = true
end
end

playerIndex = playerIndex + 1
if playerIndex == bj_MAX_PLAYERS then break end
end

victoriousPlayers = MeleeCheckForVictors ( )

ForForce ( defeatedPlayers , MeleeDoDefeatEnum )

ForForce ( victoriousPlayers , MeleeDoVictoryEnum )

if ( bj_meleeGameOver ) then
MeleeRemoveObservers ( )
end
end



MeleeGetCrippledWarningMessage  = function ( whichPlayer )
local r = GetPlayerRace ( whichPlayer )
if ( r == RACE_HUMAN ) then
do return GetLocalizedString ( "CRIPPLE_WARNING_HUMAN" ) end
elseif ( r == RACE_ORC ) then
do return GetLocalizedString ( "CRIPPLE_WARNING_ORC" ) end
elseif ( r == RACE_NIGHTELF ) then
do return GetLocalizedString ( "CRIPPLE_WARNING_NIGHTELF" ) end
elseif ( r == RACE_UNDEAD ) then
do return GetLocalizedString ( "CRIPPLE_WARNING_UNDEAD" ) end
else

do return "" end
end
end



MeleeGetCrippledTimerMessage  = function ( whichPlayer )
local r = GetPlayerRace ( whichPlayer )
if ( r == RACE_HUMAN ) then
do return GetLocalizedString ( "CRIPPLE_TIMER_HUMAN" ) end
elseif ( r == RACE_ORC ) then
do return GetLocalizedString ( "CRIPPLE_TIMER_ORC" ) end
elseif ( r == RACE_NIGHTELF ) then
do return GetLocalizedString ( "CRIPPLE_TIMER_NIGHTELF" ) end
elseif ( r == RACE_UNDEAD ) then
do return GetLocalizedString ( "CRIPPLE_TIMER_UNDEAD" ) end
else

do return "" end
end
end



MeleeGetCrippledRevealedMessage  = function ( whichPlayer )
do return GetLocalizedString ( "CRIPPLE_REVEALING_PREFIX" ) .. GetPlayerName ( whichPlayer ) .. GetLocalizedString ( "CRIPPLE_REVEALING_POSTFIX" ) end
end

MeleeExposePlayer  = function ( whichPlayer , expose )
local playerIndex
local indexPlayer
local toExposeTo = CreateForce ( )
CripplePlayer ( whichPlayer , toExposeTo , false )
bj_playerIsExposed [ GetPlayerId ( whichPlayer ) ] = expose
playerIndex = 0
for _i = 1, 10000 do
indexPlayer = Player ( playerIndex )
if ( not PlayersAreCoAllied ( whichPlayer , indexPlayer ) ) then
ForceAddPlayer ( toExposeTo , indexPlayer )
end
playerIndex = playerIndex + 1
if playerIndex == bj_MAX_PLAYERS then break end
end
CripplePlayer ( whichPlayer , toExposeTo , expose )
DestroyForce ( toExposeTo )
end

MeleeExposeAllPlayers  = function ( )
local playerIndex
local indexPlayer
local playerIndex2
local indexPlayer2
local toExposeTo = CreateForce ( )
playerIndex = 0
for _i = 1, 10000 do
indexPlayer = Player ( playerIndex )
ForceClear ( toExposeTo )
CripplePlayer ( indexPlayer , toExposeTo , false )
playerIndex2 = 0
for _i = 1, 10000 do
indexPlayer2 = Player ( playerIndex2 )
if playerIndex ~= playerIndex2 then
if ( not PlayersAreCoAllied ( indexPlayer , indexPlayer2 ) ) then
ForceAddPlayer ( toExposeTo , indexPlayer2 )
end
end
playerIndex2 = playerIndex2 + 1
if playerIndex2 == bj_MAX_PLAYERS then break end
end
CripplePlayer ( indexPlayer , toExposeTo , true )
playerIndex = playerIndex + 1
if playerIndex == bj_MAX_PLAYERS then break end
end
DestroyForce ( toExposeTo )
end

MeleeCrippledPlayerTimeout  = function ( )
local expiredTimer = GetExpiredTimer ( )
local playerIndex
local exposedPlayer

playerIndex = 0
for _i = 1, 10000 do
if ( bj_crippledTimer [ playerIndex ] == expiredTimer ) then
if true then break end
end
playerIndex = playerIndex + 1
if playerIndex == bj_MAX_PLAYERS then break end
end
if ( playerIndex == bj_MAX_PLAYERS ) then
do return end
end
exposedPlayer = Player ( playerIndex )
if ( GetLocalPlayer ( ) == exposedPlayer ) then


TimerDialogDisplay ( bj_crippledTimerWindows [ playerIndex ] , false )
end

DisplayTimedTextToPlayer ( GetLocalPlayer ( ) , 0 , 0 , bj_MELEE_CRIPPLE_MSG_DURATION , MeleeGetCrippledRevealedMessage ( exposedPlayer ) )

MeleeExposePlayer ( exposedPlayer , true )
end

MeleePlayerIsCrippled  = function ( whichPlayer )
local allyStructures = MeleeGetAllyStructureCount ( whichPlayer )
local allyKeyStructures = MeleeGetAllyKeyStructureCount ( whichPlayer )

do return ( allyStructures > 0 ) and ( allyKeyStructures <= 0 ) end
end



MeleeCheckForCrippledPlayers  = function ( )
local playerIndex
local indexPlayer
local crippledPlayers = CreateForce ( )
local isNowCrippled
local indexRace

if bj_finishSoonAllExposed then
do return end
end

playerIndex = 0
for _i = 1, 10000 do
indexPlayer = Player ( playerIndex )
isNowCrippled = MeleePlayerIsCrippled ( indexPlayer )
if ( not bj_playerIsCrippled [ playerIndex ] and isNowCrippled ) then

bj_playerIsCrippled [ playerIndex ] = true
TimerStart ( bj_crippledTimer [ playerIndex ] , bj_MELEE_CRIPPLE_TIMEOUT , false , MeleeCrippledPlayerTimeout )
if ( GetLocalPlayer ( ) == indexPlayer ) then


TimerDialogDisplay ( bj_crippledTimerWindows [ playerIndex ] , true )

DisplayTimedTextToPlayer ( indexPlayer , 0 , 0 , bj_MELEE_CRIPPLE_MSG_DURATION , MeleeGetCrippledWarningMessage ( indexPlayer ) )
end
elseif ( bj_playerIsCrippled [ playerIndex ] and not isNowCrippled ) then

bj_playerIsCrippled [ playerIndex ] = false
PauseTimer ( bj_crippledTimer [ playerIndex ] )
if ( GetLocalPlayer ( ) == indexPlayer ) then


TimerDialogDisplay ( bj_crippledTimerWindows [ playerIndex ] , false )

if ( MeleeGetAllyStructureCount ( indexPlayer ) > 0 ) then
if ( bj_playerIsExposed [ playerIndex ] ) then
DisplayTimedTextToPlayer ( indexPlayer , 0 , 0 , bj_MELEE_CRIPPLE_MSG_DURATION , GetLocalizedString ( "CRIPPLE_UNREVEALED" ) )
else
DisplayTimedTextToPlayer ( indexPlayer , 0 , 0 , bj_MELEE_CRIPPLE_MSG_DURATION , GetLocalizedString ( "CRIPPLE_UNCRIPPLED" ) )
end
end
end

MeleeExposePlayer ( indexPlayer , false )
end

playerIndex = playerIndex + 1
if playerIndex == bj_MAX_PLAYERS then break end
end
end



MeleeCheckLostUnit  = function ( lostUnit )
local lostUnitOwner = GetOwningPlayer ( lostUnit )

if ( GetPlayerStructureCount ( lostUnitOwner , true ) <= 0 ) then
MeleeCheckForLosersAndVictors ( )
end


MeleeCheckForCrippledPlayers ( )
end




MeleeCheckAddedUnit  = function ( addedUnit )
local addedUnitOwner = GetOwningPlayer ( addedUnit )

if ( bj_playerIsCrippled [ GetPlayerId ( addedUnitOwner ) ] ) then
MeleeCheckForCrippledPlayers ( )
end
end

MeleeTriggerActionConstructCancel  = function ( )
MeleeCheckLostUnit ( GetCancelledStructure ( ) )
end

MeleeTriggerActionUnitDeath  = function ( )
if ( IsUnitType ( GetDyingUnit ( ) , UNIT_TYPE_STRUCTURE ) ) then
MeleeCheckLostUnit ( GetDyingUnit ( ) )
end
end

MeleeTriggerActionUnitConstructionStart  = function ( )
MeleeCheckAddedUnit ( GetConstructingStructure ( ) )
end

MeleeTriggerActionPlayerDefeated  = function ( )
local thePlayer = GetTriggerPlayer ( )
CachePlayerHeroData ( thePlayer )
if ( MeleeGetAllyCount ( thePlayer ) > 0 ) then


ShareEverythingWithTeam ( thePlayer )
if ( not bj_meleeDefeated [ GetPlayerId ( thePlayer ) ] ) then
MeleeDoDefeat ( thePlayer )
end
else


MakeUnitsPassiveForTeam ( thePlayer )
if ( not bj_meleeDefeated [ GetPlayerId ( thePlayer ) ] ) then
MeleeDoDefeat ( thePlayer )
end
end
MeleeCheckForLosersAndVictors ( )
end

MeleeTriggerActionPlayerLeft  = function ( )
local thePlayer = GetTriggerPlayer ( )

if ( IsPlayerObserver ( thePlayer ) ) then
RemovePlayerPreserveUnitsBJ ( thePlayer , PLAYER_GAME_RESULT_NEUTRAL , false )
do return end
end
CachePlayerHeroData ( thePlayer )


if ( MeleeGetAllyCount ( thePlayer ) > 0 ) then


ShareEverythingWithTeam ( thePlayer )
MeleeDoLeave ( thePlayer )
else


MakeUnitsPassiveForTeam ( thePlayer )
MeleeDoLeave ( thePlayer )
end
MeleeCheckForLosersAndVictors ( )
end

MeleeTriggerActionAllianceChange  = function ( )
MeleeCheckForLosersAndVictors ( )
MeleeCheckForCrippledPlayers ( )
end

MeleeTriggerTournamentFinishSoon  = function ( )

local playerIndex
local indexPlayer
local timeRemaining = GetTournamentFinishSoonTimeRemaining ( )
if not bj_finishSoonAllExposed then
bj_finishSoonAllExposed = true

playerIndex = 0
for _i = 1, 10000 do
indexPlayer = Player ( playerIndex )
if bj_playerIsCrippled [ playerIndex ] then

bj_playerIsCrippled [ playerIndex ] = false
PauseTimer ( bj_crippledTimer [ playerIndex ] )
if ( GetLocalPlayer ( ) == indexPlayer ) then


TimerDialogDisplay ( bj_crippledTimerWindows [ playerIndex ] , false )
end
end
playerIndex = playerIndex + 1
if playerIndex == bj_MAX_PLAYERS then break end
end

MeleeExposeAllPlayers ( )
end

TimerDialogDisplay ( bj_finishSoonTimerDialog , true )
TimerDialogSetRealTimeRemaining ( bj_finishSoonTimerDialog , timeRemaining )
end

MeleeWasUserPlayer  = function ( whichPlayer )
local slotState
if ( GetPlayerController ( whichPlayer ) ~= MAP_CONTROL_USER ) then
do return false end
end
slotState = GetPlayerSlotState ( whichPlayer )
do return ( slotState == PLAYER_SLOT_STATE_PLAYING or slotState == PLAYER_SLOT_STATE_LEFT ) end
end

MeleeTournamentFinishNowRuleA  = function ( multiplier )
local playerScore = setmetatable({}, _mt_number)
local teamScore = setmetatable({}, _mt_number)
local teamForce = {}
local teamCount
local index
local indexPlayer
local index2
local indexPlayer2
local bestTeam
local bestScore
local draw

index = 0
for _i = 1, 10000 do
indexPlayer = Player ( index )
if MeleeWasUserPlayer ( indexPlayer ) then
playerScore [ index ] = GetTournamentScore ( indexPlayer )
if playerScore [ index ] <= 0 then
playerScore [ index ] = 1
end
else
playerScore [ index ] = 0
end
index = index + 1
if index == bj_MAX_PLAYERS then break end
end

teamCount = 0
index = 0
for _i = 1, 10000 do
if playerScore [ index ] ~= 0 then
indexPlayer = Player ( index )
teamScore [ teamCount ] = 0
teamForce [ teamCount ] = CreateForce ( )
index2 = index
for _i = 1, 10000 do
if playerScore [ index2 ] ~= 0 then
indexPlayer2 = Player ( index2 )
if PlayersAreCoAllied ( indexPlayer , indexPlayer2 ) then
teamScore [ teamCount ] = teamScore [ teamCount ] + playerScore [ index2 ]
ForceAddPlayer ( teamForce [ teamCount ] , indexPlayer2 )
playerScore [ index2 ] = 0
end
end
index2 = index2 + 1
if index2 == bj_MAX_PLAYERS then break end
end
teamCount = teamCount + 1
end
index = index + 1
if index == bj_MAX_PLAYERS then break end
end

bj_meleeGameOver = true

if teamCount ~= 0 then

bestTeam = - 1
bestScore = - 1
index = 0
for _i = 1, 10000 do
if teamScore [ index ] > bestScore then
bestTeam = index
bestScore = teamScore [ index ]
end
index = index + 1
if index == teamCount then break end
end



draw = false
index = 0
for _i = 1, 10000 do
if index ~= bestTeam then
if bestScore < ( multiplier * teamScore [ index ] ) then
draw = true
end
end
index = index + 1
if index == teamCount then break end
end
if draw then

index = 0
for _i = 1, 10000 do
ForForce ( teamForce [ index ] , MeleeDoDrawEnum )
index = index + 1
if index == teamCount then break end
end
else

index = 0
for _i = 1, 10000 do
if index ~= bestTeam then
ForForce ( teamForce [ index ] , MeleeDoDefeatEnum )
end
index = index + 1
if index == teamCount then break end
end

ForForce ( teamForce [ bestTeam ] , MeleeDoVictoryEnum )
end
end
end

MeleeTriggerTournamentFinishNow  = function ( )
local rule = GetTournamentFinishNowRule ( )

if bj_meleeGameOver then
do return end
end
if ( rule == 1 ) then

MeleeTournamentFinishNowRuleA ( 1 )
else

MeleeTournamentFinishNowRuleA ( 3 )
end

MeleeRemoveObservers ( )
end

MeleeInitVictoryDefeat  = function ( )
local trig
local index
local indexPlayer


bj_finishSoonTimerDialog = CreateTimerDialog ( nil )

trig = CreateTrigger ( )
TriggerRegisterGameEvent ( trig , EVENT_GAME_TOURNAMENT_FINISH_SOON )
TriggerAddAction ( trig , MeleeTriggerTournamentFinishSoon )

trig = CreateTrigger ( )
TriggerRegisterGameEvent ( trig , EVENT_GAME_TOURNAMENT_FINISH_NOW )
TriggerAddAction ( trig , MeleeTriggerTournamentFinishNow )

index = 0
for _i = 1, 10000 do
indexPlayer = Player ( index )

if ( GetPlayerSlotState ( indexPlayer ) == PLAYER_SLOT_STATE_PLAYING ) then
bj_meleeDefeated [ index ] = false
bj_meleeVictoried [ index ] = false

bj_playerIsCrippled [ index ] = false
bj_playerIsExposed [ index ] = false
bj_crippledTimer [ index ] = CreateTimer ( )
bj_crippledTimerWindows [ index ] = CreateTimerDialog ( bj_crippledTimer [ index ] )
TimerDialogSetTitle ( bj_crippledTimerWindows [ index ] , MeleeGetCrippledTimerMessage ( indexPlayer ) )

trig = CreateTrigger ( )
TriggerRegisterPlayerUnitEvent ( trig , indexPlayer , EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL , nil )
TriggerAddAction ( trig , MeleeTriggerActionConstructCancel )

trig = CreateTrigger ( )
TriggerRegisterPlayerUnitEvent ( trig , indexPlayer , EVENT_PLAYER_UNIT_DEATH , nil )
TriggerAddAction ( trig , MeleeTriggerActionUnitDeath )

trig = CreateTrigger ( )
TriggerRegisterPlayerUnitEvent ( trig , indexPlayer , EVENT_PLAYER_UNIT_CONSTRUCT_START , nil )
TriggerAddAction ( trig , MeleeTriggerActionUnitConstructionStart )

trig = CreateTrigger ( )
TriggerRegisterPlayerEvent ( trig , indexPlayer , EVENT_PLAYER_DEFEAT )
TriggerAddAction ( trig , MeleeTriggerActionPlayerDefeated )

trig = CreateTrigger ( )
TriggerRegisterPlayerEvent ( trig , indexPlayer , EVENT_PLAYER_LEAVE )
TriggerAddAction ( trig , MeleeTriggerActionPlayerLeft )

trig = CreateTrigger ( )
TriggerRegisterPlayerAllianceChange ( trig , indexPlayer , ALLIANCE_PASSIVE )
TriggerRegisterPlayerStateEvent ( trig , indexPlayer , PLAYER_STATE_ALLIED_VICTORY , EQUAL , 1 )
TriggerAddAction ( trig , MeleeTriggerActionAllianceChange )
else
bj_meleeDefeated [ index ] = true
bj_meleeVictoried [ index ] = false

if ( IsPlayerObserver ( indexPlayer ) ) then

trig = CreateTrigger ( )
TriggerRegisterPlayerEvent ( trig , indexPlayer , EVENT_PLAYER_LEAVE )
TriggerAddAction ( trig , MeleeTriggerActionPlayerLeft )
end
end
index = index + 1
if index == bj_MAX_PLAYERS then break end
end


TimerStart ( CreateTimer ( ) , 2.0 , false , MeleeTriggerActionAllianceChange )
end






CheckInitPlayerSlotAvailability  = function ( )
local index
if ( not bj_slotControlReady ) then
index = 0
for _i = 1, 10000 do
bj_slotControlUsed [ index ] = false
bj_slotControl [ index ] = MAP_CONTROL_USER
index = index + 1
if index == bj_MAX_PLAYERS then break end
end
bj_slotControlReady = true
end
end

SetPlayerSlotAvailable  = function ( whichPlayer , control )
local playerIndex = GetPlayerId ( whichPlayer )
CheckInitPlayerSlotAvailability ( )
bj_slotControlUsed [ playerIndex ] = true
bj_slotControl [ playerIndex ] = control
end






TeamInitPlayerSlots  = function ( teamCount )
local index
local indexPlayer
local team
SetTeams ( teamCount )
CheckInitPlayerSlotAvailability ( )
index = 0
team = 0
for _i = 1, 10000 do
if ( bj_slotControlUsed [ index ] ) then
indexPlayer = Player ( index )
SetPlayerTeam ( indexPlayer , team )
team = team + 1
if ( team >= teamCount ) then
team = 0
end
end
index = index + 1
if index == bj_MAX_PLAYERS then break end
end
end

MeleeInitPlayerSlots  = function ( )
TeamInitPlayerSlots ( bj_MAX_PLAYERS )
end

FFAInitPlayerSlots  = function ( )
TeamInitPlayerSlots ( bj_MAX_PLAYERS )
end

OneOnOneInitPlayerSlots  = function ( )

SetTeams ( 2 )
SetPlayers ( 2 )
TeamInitPlayerSlots ( 2 )
end

InitGenericPlayerSlots  = function ( )
local gType = GetGameTypeSelected ( )
if ( gType == GAME_TYPE_MELEE ) then
MeleeInitPlayerSlots ( )
elseif ( gType == GAME_TYPE_FFA ) then
FFAInitPlayerSlots ( )
elseif ( gType == GAME_TYPE_USE_MAP_SETTINGS ) then

elseif ( gType == GAME_TYPE_ONE_ON_ONE ) then
OneOnOneInitPlayerSlots ( )
elseif ( gType == GAME_TYPE_TWO_TEAM_PLAY ) then
TeamInitPlayerSlots ( 2 )
elseif ( gType == GAME_TYPE_THREE_TEAM_PLAY ) then
TeamInitPlayerSlots ( 3 )
elseif ( gType == GAME_TYPE_FOUR_TEAM_PLAY ) then
TeamInitPlayerSlots ( 4 )
else

end
end






SetDNCSoundsDawn  = function ( )
if bj_useDawnDuskSounds then
StartSound ( bj_dawnSound )
end
end

SetDNCSoundsDusk  = function ( )
if bj_useDawnDuskSounds then
StartSound ( bj_duskSound )
end
end

SetDNCSoundsDay  = function ( )
local ToD = GetTimeOfDay ( )
if ( ToD >= bj_TOD_DAWN and ToD < bj_TOD_DUSK ) and not bj_dncIsDaytime then
bj_dncIsDaytime = true

StopSound ( bj_nightAmbientSound , false , true )
StartSound ( bj_dayAmbientSound )
end
end

SetDNCSoundsNight  = function ( )
local ToD = GetTimeOfDay ( )
if ( ToD < bj_TOD_DAWN or ToD >= bj_TOD_DUSK ) and bj_dncIsDaytime then
bj_dncIsDaytime = false

StopSound ( bj_dayAmbientSound , false , true )
StartSound ( bj_nightAmbientSound )
end
end

InitDNCSounds  = function ( )

bj_dawnSound = CreateSoundFromLabel ( "RoosterSound" , false , false , false , 10000 , 10000 )
bj_duskSound = CreateSoundFromLabel ( "WolfSound" , false , false , false , 10000 , 10000 )

bj_dncSoundsDawn = CreateTrigger ( )
TriggerRegisterGameStateEvent ( bj_dncSoundsDawn , GAME_STATE_TIME_OF_DAY , EQUAL , bj_TOD_DAWN )
TriggerAddAction ( bj_dncSoundsDawn , SetDNCSoundsDawn )
bj_dncSoundsDusk = CreateTrigger ( )
TriggerRegisterGameStateEvent ( bj_dncSoundsDusk , GAME_STATE_TIME_OF_DAY , EQUAL , bj_TOD_DUSK )
TriggerAddAction ( bj_dncSoundsDusk , SetDNCSoundsDusk )

bj_dncSoundsDay = CreateTrigger ( )
TriggerRegisterGameStateEvent ( bj_dncSoundsDay , GAME_STATE_TIME_OF_DAY , GREATER_THAN_OR_EQUAL , bj_TOD_DAWN )
TriggerRegisterGameStateEvent ( bj_dncSoundsDay , GAME_STATE_TIME_OF_DAY , LESS_THAN , bj_TOD_DUSK )
TriggerAddAction ( bj_dncSoundsDay , SetDNCSoundsDay )
bj_dncSoundsNight = CreateTrigger ( )
TriggerRegisterGameStateEvent ( bj_dncSoundsNight , GAME_STATE_TIME_OF_DAY , LESS_THAN , bj_TOD_DAWN )
TriggerRegisterGameStateEvent ( bj_dncSoundsNight , GAME_STATE_TIME_OF_DAY , GREATER_THAN_OR_EQUAL , bj_TOD_DUSK )
TriggerAddAction ( bj_dncSoundsNight , SetDNCSoundsNight )
end

InitBlizzardGlobals  = function ( )
local index
local userControlledPlayers
local v

filterIssueHauntOrderAtLocBJ = Filter ( IssueHauntOrderAtLocBJFilter )
filterEnumDestructablesInCircleBJ = Filter ( EnumDestructablesInCircleBJFilter )
filterGetUnitsInRectOfPlayer = Filter ( GetUnitsInRectOfPlayerFilter )
filterGetUnitsOfTypeIdAll = Filter ( GetUnitsOfTypeIdAllFilter )
filterGetUnitsOfPlayerAndTypeId = Filter ( GetUnitsOfPlayerAndTypeIdFilter )
filterMeleeTrainedUnitIsHeroBJ = Filter ( MeleeTrainedUnitIsHeroBJFilter )
filterLivingPlayerUnitsOfTypeId = Filter ( LivingPlayerUnitsOfTypeIdFilter )

index = 0
for _i = 1, 10000 do
if index == bj_MAX_PLAYER_SLOTS then break end
bj_FORCE_PLAYER [ index ] = CreateForce ( )
ForceAddPlayer ( bj_FORCE_PLAYER [ index ] , Player ( index ) )
index = index + 1
end
bj_FORCE_ALL_PLAYERS = CreateForce ( )
ForceEnumPlayers ( bj_FORCE_ALL_PLAYERS , nil )

bj_cineModePriorSpeed = GetGameSpeed ( )
bj_cineModePriorFogSetting = IsFogEnabled ( )
bj_cineModePriorMaskSetting = IsFogMaskEnabled ( )

index = 0
for _i = 1, 10000 do
if index >= bj_MAX_QUEUED_TRIGGERS then break end
bj_queuedExecTriggers [ index ] = nil
bj_queuedExecUseConds [ index ] = false
index = index + 1
end

bj_isSinglePlayer = false
userControlledPlayers = 0
index = 0
for _i = 1, 10000 do
if index >= bj_MAX_PLAYERS then break end
if ( GetPlayerController ( Player ( index ) ) == MAP_CONTROL_USER and GetPlayerSlotState ( Player ( index ) ) == PLAYER_SLOT_STATE_PLAYING ) then
userControlledPlayers = userControlledPlayers + 1
end
index = index + 1
end
bj_isSinglePlayer = ( userControlledPlayers == 1 )


bj_rescueSound = CreateSoundFromLabel ( "Rescue" , false , false , false , 10000 , 10000 )
bj_questDiscoveredSound = CreateSoundFromLabel ( "QuestNew" , false , false , false , 10000 , 10000 )
bj_questUpdatedSound = CreateSoundFromLabel ( "QuestUpdate" , false , false , false , 10000 , 10000 )
bj_questCompletedSound = CreateSoundFromLabel ( "QuestCompleted" , false , false , false , 10000 , 10000 )
bj_questFailedSound = CreateSoundFromLabel ( "QuestFailed" , false , false , false , 10000 , 10000 )
bj_questHintSound = CreateSoundFromLabel ( "Hint" , false , false , false , 10000 , 10000 )
bj_questSecretSound = CreateSoundFromLabel ( "SecretFound" , false , false , false , 10000 , 10000 )
bj_questItemAcquiredSound = CreateSoundFromLabel ( "ItemReward" , false , false , false , 10000 , 10000 )
bj_questWarningSound = CreateSoundFromLabel ( "Warning" , false , false , false , 10000 , 10000 )
bj_victoryDialogSound = CreateSoundFromLabel ( "QuestCompleted" , false , false , false , 10000 , 10000 )
bj_defeatDialogSound = CreateSoundFromLabel ( "QuestFailed" , false , false , false , 10000 , 10000 )

DelayedSuspendDecayCreate ( )

v = VersionGet ( )
if ( v == VERSION_REIGN_OF_CHAOS ) then
bj_MELEE_MAX_TWINKED_HEROES = bj_MELEE_MAX_TWINKED_HEROES_V0
else
bj_MELEE_MAX_TWINKED_HEROES = bj_MELEE_MAX_TWINKED_HEROES_V1
end
end

InitQueuedTriggers  = function ( )
bj_queuedExecTimeout = CreateTrigger ( )
TriggerRegisterTimerExpireEvent ( bj_queuedExecTimeout , bj_queuedExecTimeoutTimer )
TriggerAddAction ( bj_queuedExecTimeout , QueuedTriggerDoneBJ )
end

InitMapRects  = function ( )
bj_mapInitialPlayableArea = Rect ( GetCameraBoundMinX ( ) - GetCameraMargin ( CAMERA_MARGIN_LEFT ) , GetCameraBoundMinY ( ) - GetCameraMargin ( CAMERA_MARGIN_BOTTOM ) , GetCameraBoundMaxX ( ) + GetCameraMargin ( CAMERA_MARGIN_RIGHT ) , GetCameraBoundMaxY ( ) + GetCameraMargin ( CAMERA_MARGIN_TOP ) )
bj_mapInitialCameraBounds = GetCurrentCameraBoundsMapRectBJ ( )
end

InitSummonableCaps  = function ( )
local index
index = 0
for _i = 1, 10000 do



if ( not GetPlayerTechResearched ( Player ( index ) , 1382576756 , true ) ) then
SetPlayerTechMaxAllowed ( Player ( index ) , 1752331380 , 0 )
end

if ( not GetPlayerTechResearched ( Player ( index ) , 1383031403 , true ) ) then
SetPlayerTechMaxAllowed ( Player ( index ) , 1869898347 , 0 )
end

SetPlayerTechMaxAllowed ( Player ( index ) , 1970498405 , bj_MAX_SKELETONS )
index = index + 1
if index == bj_MAX_PLAYERS then break end
end
end



UpdateStockAvailability  = function ( whichItem )
local iType = GetItemType ( whichItem )
local iLevel = GetItemLevel ( whichItem )

if ( iType == ITEM_TYPE_PERMANENT ) then
bj_stockAllowedPermanent [ iLevel ] = true
elseif ( iType == ITEM_TYPE_CHARGED ) then
bj_stockAllowedCharged [ iLevel ] = true
elseif ( iType == ITEM_TYPE_ARTIFACT ) then
bj_stockAllowedArtifact [ iLevel ] = true
else

end
end



UpdateEachStockBuildingEnum  = function ( )
local iteration = 0
local pickedItemId
for _i = 1, 10000 do
pickedItemId = ChooseRandomItemEx ( bj_stockPickedItemType , bj_stockPickedItemLevel )
if IsItemIdSellable ( pickedItemId ) then break end


iteration = iteration + 1
if ( iteration > bj_STOCK_MAX_ITERATIONS ) then
do return end
end
end
AddItemToStock ( GetEnumUnit ( ) , pickedItemId , 1 , 1 )
end

UpdateEachStockBuilding  = function ( iType , iLevel )
local g
bj_stockPickedItemType = iType
bj_stockPickedItemLevel = iLevel
g = CreateGroup ( )
GroupEnumUnitsOfType ( g , "marketplace" , nil )
ForGroup ( g , UpdateEachStockBuildingEnum )
DestroyGroup ( g )
end



PerformStockUpdates  = function ( )
local pickedItemId
local pickedItemType
local pickedItemLevel = 0
local allowedCombinations = 0
local iLevel

iLevel = 1
for _i = 1, 10000 do
if ( bj_stockAllowedPermanent [ iLevel ] ) then
allowedCombinations = allowedCombinations + 1
if ( GetRandomInt ( 1 , allowedCombinations ) == 1 ) then
pickedItemType = ITEM_TYPE_PERMANENT
pickedItemLevel = iLevel
end
end
if ( bj_stockAllowedCharged [ iLevel ] ) then
allowedCombinations = allowedCombinations + 1
if ( GetRandomInt ( 1 , allowedCombinations ) == 1 ) then
pickedItemType = ITEM_TYPE_CHARGED
pickedItemLevel = iLevel
end
end
if ( bj_stockAllowedArtifact [ iLevel ] ) then
allowedCombinations = allowedCombinations + 1
if ( GetRandomInt ( 1 , allowedCombinations ) == 1 ) then
pickedItemType = ITEM_TYPE_ARTIFACT
pickedItemLevel = iLevel
end
end
iLevel = iLevel + 1
if iLevel > bj_MAX_ITEM_LEVEL then break end
end

if ( allowedCombinations == 0 ) then
do return end
end
UpdateEachStockBuilding ( pickedItemType , pickedItemLevel )
end



StartStockUpdates  = function ( )
PerformStockUpdates ( )
TimerStart ( bj_stockUpdateTimer , bj_STOCK_RESTOCK_INTERVAL , true , PerformStockUpdates )
end

RemovePurchasedItem  = function ( )
RemoveItemFromStock ( GetSellingUnit ( ) , GetItemTypeId ( GetSoldItem ( ) ) )
end

InitNeutralBuildings  = function ( )
local iLevel

iLevel = 0
for _i = 1, 10000 do
bj_stockAllowedPermanent [ iLevel ] = false
bj_stockAllowedCharged [ iLevel ] = false
bj_stockAllowedArtifact [ iLevel ] = false
iLevel = iLevel + 1
if iLevel > bj_MAX_ITEM_LEVEL then break end
end

SetAllItemTypeSlots ( bj_MAX_STOCK_ITEM_SLOTS )
SetAllUnitTypeSlots ( bj_MAX_STOCK_UNIT_SLOTS )

bj_stockUpdateTimer = CreateTimer ( )
TimerStart ( bj_stockUpdateTimer , bj_STOCK_RESTOCK_INITIAL_DELAY , false , StartStockUpdates )

bj_stockItemPurchased = CreateTrigger ( )
TriggerRegisterPlayerUnitEvent ( bj_stockItemPurchased , Player ( PLAYER_NEUTRAL_PASSIVE ) , EVENT_PLAYER_UNIT_SELL_ITEM , nil )
TriggerAddAction ( bj_stockItemPurchased , RemovePurchasedItem )
end

MarkGameStarted  = function ( )
bj_gameStarted = true
DestroyTimer ( bj_gameStartedTimer )
end

DetectGameStarted  = function ( )
bj_gameStartedTimer = CreateTimer ( )
TimerStart ( bj_gameStartedTimer , bj_GAME_STARTED_THRESHOLD , false , MarkGameStarted )
end

InitBlizzard  = function ( )



ConfigureNeutralVictim ( )
InitBlizzardGlobals ( )
InitQueuedTriggers ( )
InitRescuableBehaviorBJ ( )
InitDNCSounds ( )
InitMapRects ( )
InitSummonableCaps ( )
InitNeutralBuildings ( )
DetectGameStarted ( )
end



















RandomDistReset  = function ( )
bj_randDistCount = 0
end

RandomDistAddItem  = function ( inID , inChance )
bj_randDistID [ bj_randDistCount ] = inID
bj_randDistChance [ bj_randDistCount ] = inChance
bj_randDistCount = bj_randDistCount + 1
end

RandomDistChoose  = function ( )
local sum = 0
local chance = 0
local index
local foundID = - 1
local done

if ( bj_randDistCount == 0 ) then
do return - 1 end
end

index = 0
for _i = 1, 10000 do
sum = sum + bj_randDistChance [ index ]
index = index + 1
if index == bj_randDistCount then break end
end

chance = GetRandomInt ( 1 , sum )

index = 0
sum = 0
done = false
for _i = 1, 10000 do
sum = sum + bj_randDistChance [ index ]
if ( chance <= sum ) then
foundID = bj_randDistID [ index ]
done = true
end
index = index + 1
if ( index == bj_randDistCount ) then
done = true
end
if done == true then break end
end
do return foundID end
end











UnitDropItem  = function ( inUnit , inItemID )
local x
local y
local radius = 32
local unitX
local unitY
local droppedItem
if ( inItemID == - 1 ) then
do return nil end
end
unitX = GetUnitX ( inUnit )
unitY = GetUnitY ( inUnit )
x = GetRandomReal ( unitX - radius , unitX + radius )
y = GetRandomReal ( unitY - radius , unitY + radius )
droppedItem = CreateItem ( inItemID , x , y )
SetItemDropID ( droppedItem , GetUnitTypeId ( inUnit ) )
UpdateStockAvailability ( droppedItem )
do return droppedItem end
end

WidgetDropItem  = function ( inWidget , inItemID )
local x
local y
local radius = 32
local widgetX
local widgetY
if ( inItemID == - 1 ) then
do return nil end
end
widgetX = GetWidgetX ( inWidget )
widgetY = GetWidgetY ( inWidget )
x = GetRandomReal ( widgetX - radius , widgetX + radius )
y = GetRandomReal ( widgetY - radius , widgetY + radius )
do return CreateItem ( inItemID , x , y ) end
end
