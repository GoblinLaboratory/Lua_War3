-- 简易的blizzard.lua，若需要完整的blizzard.lua，可以使用jass2lua工具，自行转换。
local CJ = require "jass.common"
local BJ = {}

-- ===========================================================================
-- Blizzard.j ( define Jass2 functions that need to be in every map script )
-- ===========================================================================

-------------------------------------------------------------------------
-- Constants
--

-- Misc constants
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

-- Game constants
bj_MAX_INVENTORY = 6
bj_MAX_PLAYERS = 12
bj_PLAYER_NEUTRAL_VICTIM = 13
bj_PLAYER_NEUTRAL_EXTRA = 14
bj_MAX_PLAYER_SLOTS = 16
bj_MAX_SKELETONS = 25
bj_MAX_STOCK_ITEM_SLOTS = 11
bj_MAX_STOCK_UNIT_SLOTS = 11
bj_MAX_ITEM_LEVEL = 10

-- Ideally these would be looked up from Units/MiscData.txt,
-- but there is currently no script functionality exposed to do that
bj_TOD_DAWN = 6.00
bj_TOD_DUSK = 18.00

-- Melee game settings:
--   - Starting Time of Day (TOD)
--   - Starting Gold
--   - Starting Lumber
--   - Starting Hero Tokens (free heroes)
--   - Max heroes allowed per
--   - Max heroes allowed per hero type
--   - Distance from start loc to search for nearby mines
--
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

-- Delay between a creep's death and the time it may drop an  .
bj_CREEP_ITEM_DELAY = 0.50

-- Timing settings for Marketplace inventories.
bj_STOCK_RESTOCK_INITIAL_DELAY = 120
bj_STOCK_RESTOCK_INTERVAL = 30
bj_STOCK_MAX_ITERATIONS = 20

-- Max events registered by a single "dest dies in  "  .
bj_MAX_DEST_IN_REGION_EVENTS = 64

-- Camera settings
bj_CAMERA_MIN_FARZ = 100
bj_CAMERA_DEFAULT_DISTANCE = 1650
bj_CAMERA_DEFAULT_FARZ = 5000
bj_CAMERA_DEFAULT_AOA = 304
bj_CAMERA_DEFAULT_FOV = 70
bj_CAMERA_DEFAULT_ROLL = 0
bj_CAMERA_DEFAULT_ROTATION = 90

-- Rescue
bj_RESCUE_PING_TIME = 2.00

-- Transmission behavior settings
bj_NOTHING_SOUND_DURATION = 5.00
bj_TRANSMISSION_PING_TIME = 1.00
bj_TRANSMISSION_IND_RED = 255
bj_TRANSMISSION_IND_BLUE = 255
bj_TRANSMISSION_IND_GREEN = 255
bj_TRANSMISSION_IND_ALPHA = 255
bj_TRANSMISSION_PORT_HANGTIME = 1.50

-- Cinematic mode settings
bj_CINEMODE_INTERFACEFADE = 0.50
bj_CINEMODE_GAMESPEED = MAP_SPEED_NORMAL

-- Cinematic mode volume levels
bj_CINEMODE_VOLUME_UNITMOVEMENT = 0.40
bj_CINEMODE_VOLUME_UNITSOUNDS = 0.00
bj_CINEMODE_VOLUME_COMBAT = 0.40
bj_CINEMODE_VOLUME_SPELLS = 0.40
bj_CINEMODE_VOLUME_UI = 0.00
bj_CINEMODE_VOLUME_MUSIC = 0.55
bj_CINEMODE_VOLUME_AMBIENTSOUNDS = 1.00
bj_CINEMODE_VOLUME_FIRE = 0.60

-- Speech mode volume levels
bj_SPEECH_VOLUME_UNITMOVEMENT = 0.25
bj_SPEECH_VOLUME_UNITSOUNDS = 0.00
bj_SPEECH_VOLUME_COMBAT = 0.25
bj_SPEECH_VOLUME_SPELLS = 0.25
bj_SPEECH_VOLUME_UI = 0.00
bj_SPEECH_VOLUME_MUSIC = 0.55
bj_SPEECH_VOLUME_AMBIENTSOUNDS = 1.00
bj_SPEECH_VOLUME_FIRE = 0.60

-- Smart pan settings
bj_SMARTPAN_TRESHOLD_PAN = 500
bj_SMARTPAN_TRESHOLD_SNAP = 3500

-- QueuedTriggerExecute settings
bj_MAX_QUEUED_TRIGGERS = 100
bj_QUEUED_TRIGGER_TIMEOUT = 180.00

-- Campaign indexing constants
bj_CAMPAIGN_INDEX_T = 0
bj_CAMPAIGN_INDEX_H = 1
bj_CAMPAIGN_INDEX_U = 2
bj_CAMPAIGN_INDEX_O = 3
bj_CAMPAIGN_INDEX_N = 4
bj_CAMPAIGN_INDEX_XN = 5
bj_CAMPAIGN_INDEX_XH = 6
bj_CAMPAIGN_INDEX_XU = 7
bj_CAMPAIGN_INDEX_XO = 8

-- Campaign offset constants (for mission indexing)
bj_CAMPAIGN_OFFSET_T = 0
bj_CAMPAIGN_OFFSET_H = 1
bj_CAMPAIGN_OFFSET_U = 2
bj_CAMPAIGN_OFFSET_O = 3
bj_CAMPAIGN_OFFSET_N = 4
bj_CAMPAIGN_OFFSET_XN = 0
bj_CAMPAIGN_OFFSET_XH = 1
bj_CAMPAIGN_OFFSET_XU = 2
bj_CAMPAIGN_OFFSET_XO = 3

-- Mission indexing constants
-- Tutorial
bj_MISSION_INDEX_T00 = bj_CAMPAIGN_OFFSET_T * 1000 + 0
bj_MISSION_INDEX_T01 = bj_CAMPAIGN_OFFSET_T * 1000 + 1
-- Human
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
-- Undead
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
-- Orc
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
-- Night Elf
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
-- Expansion Night Elf
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
-- Expansion Human
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
-- Expansion Undead
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

-- Expansion Orc
bj_MISSION_INDEX_XO00 = bj_CAMPAIGN_OFFSET_XO * 1000 + 0

-- Cinematic indexing constants
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

-- Alliance settings
bj_ALLIANCE_UNALLIED = 0
bj_ALLIANCE_UNALLIED_VISION = 1
bj_ALLIANCE_ALLIED = 2
bj_ALLIANCE_ALLIED_VISION = 3
bj_ALLIANCE_ALLIED_UNITS = 4
bj_ALLIANCE_ALLIED_ADVUNITS = 5
bj_ALLIANCE_NEUTRAL = 6
bj_ALLIANCE_NEUTRAL_VISION = 7

-- Keyboard Event Types
bj_KEYEVENTTYPE_DEPRESS = 0
bj_KEYEVENTTYPE_RELEASE = 1

-- Keyboard Event Keys
bj_KEYEVENTKEY_LEFT = 0
bj_KEYEVENTKEY_RIGHT = 1
bj_KEYEVENTKEY_DOWN = 2
bj_KEYEVENTKEY_UP = 3

-- Transmission timing methods
bj_TIMETYPE_ADD = 0
bj_TIMETYPE_SET = 1
bj_TIMETYPE_SUB = 2

-- Camera bounds adjustment methods
bj_CAMERABOUNDS_ADJUST_ADD = 0
bj_CAMERABOUNDS_ADJUST_SUB = 1

-- Quest creation states
bj_QUESTTYPE_REQ_DISCOVERED = 0
bj_QUESTTYPE_REQ_UNDISCOVERED = 1
bj_QUESTTYPE_OPT_DISCOVERED = 2
bj_QUESTTYPE_OPT_UNDISCOVERED = 3

-- Quest message types
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

-- Leaderboard sorting methods
bj_SORTTYPE_SORTBYVALUE = 0
bj_SORTTYPE_SORTBYPLAYER = 1
bj_SORTTYPE_SORTBYLABEL = 2

-- Cinematic fade filter methods
bj_CINEFADETYPE_FADEIN = 0
bj_CINEFADETYPE_FADEOUT = 1
bj_CINEFADETYPE_FADEOUTIN = 2

-- Buff removal methods
bj_REMOVEBUFFS_POSITIVE = 0
bj_REMOVEBUFFS_NEGATIVE = 1
bj_REMOVEBUFFS_ALL = 2
bj_REMOVEBUFFS_NONTLIFE = 3

-- Buff properties - polarity
bj_BUFF_POLARITY_POSITIVE = 0
bj_BUFF_POLARITY_NEGATIVE = 1
bj_BUFF_POLARITY_EITHER = 2

-- Buff properties - resist type
bj_BUFF_RESIST_MAGIC = 0
bj_BUFF_RESIST_PHYSICAL = 1
bj_BUFF_RESIST_EITHER = 2
bj_BUFF_RESIST_BOTH = 3

-- Hero stats
bj_HEROSTAT_STR = 0
bj_HEROSTAT_AGI = 1
bj_HEROSTAT_INT = 2

-- Hero skill point modification methods
bj_MODIFYMETHOD_ADD = 0
bj_MODIFYMETHOD_SUB = 1
bj_MODIFYMETHOD_SET = 2

-- Unit state adjustment methods (for replaced units)
bj_UNIT_STATE_METHOD_ABSOLUTE = 0
bj_UNIT_STATE_METHOD_RELATIVE = 1
bj_UNIT_STATE_METHOD_DEFAULTS = 2
bj_UNIT_STATE_METHOD_MAXIMUM = 3

-- Gate operations
bj_GATEOPERATION_CLOSE = 0
bj_GATEOPERATION_OPEN = 1
bj_GATEOPERATION_DESTROY = 2

-- Game cache value types
bj_GAMECACHE_BOOLEAN = 0
bj_GAMECACHE_INTEGER = 1
bj_GAMECACHE_REAL = 2
bj_GAMECACHE_UNIT = 3
bj_GAMECACHE_STRING = 4

-- Hashtable value types
bj_HASHTABLE_BOOLEAN = 0
bj_HASHTABLE_INTEGER = 1
bj_HASHTABLE_REAL = 2
bj_HASHTABLE_STRING = 3
bj_HASHTABLE_HANDLE = 4

-- Item status types
bj_ITEM_STATUS_HIDDEN = 0
bj_ITEM_STATUS_OWNED = 1
bj_ITEM_STATUS_INVULNERABLE = 2
bj_ITEM_STATUS_POWERUP = 3
bj_ITEM_STATUS_SELLABLE = 4
bj_ITEM_STATUS_PAWNABLE = 5

-- Itemcode status types
bj_ITEMCODE_STATUS_POWERUP = 0
bj_ITEMCODE_STATUS_SELLABLE = 1
bj_ITEMCODE_STATUS_PAWNABLE = 2

-- Minimap ping styles
bj_MINIMAPPINGSTYLE_SIMPLE = 0
bj_MINIMAPPINGSTYLE_FLASHY = 1
bj_MINIMAPPINGSTYLE_ATTACK = 2

-- Corpse creation settings
bj_CORPSE_MAX_DEATH_TIME = 8.00

-- Corpse creation styles
bj_CORPSETYPE_FLESH = 0
bj_CORPSETYPE_BONE = 1

-- Elevator pathing-blocker
bj_ELEVATOR_BLOCKER_CODE = 'DTep'
bj_ELEVATOR_CODE01 = 'DTrf'
bj_ELEVATOR_CODE02 = 'DTrx'

-- Elevator wall codes
bj_ELEVATOR_WALL_TYPE_ALL = 0
bj_ELEVATOR_WALL_TYPE_EAST = 1
bj_ELEVATOR_WALL_TYPE_NORTH = 2
bj_ELEVATOR_WALL_TYPE_SOUTH = 3
bj_ELEVATOR_WALL_TYPE_WEST = 4

-------------------------------------------------------------------------
-- Variables
--

-- Force predefs
bj_FORCE_ALL_PLAYERS = nil
bj_FORCE_PLAYER = {}

bj_MELEE_MAX_TWINKED_HEROES = 0

-- Map area rects
bj_mapInitialPlayableArea = nil
bj_mapInitialCameraBounds = nil

-- Utility function BJ.vars
bj_forLoopAIndex = 0
bj_forLoopBIndex = 0
bj_forLoopAIndexEnd = 0
bj_forLoopBIndexEnd = 0

bj_slotControlReady = false
bj_slotControlUsed = {}
bj_slotControl = {}

-- Game started detection vars
bj_gameStartedTimer = nil
bj_gameStarted = false
bj_volumeGroupsTimer = CJ.CreateTimer()

-- Singleplayer check
bj_isSinglePlayer = false

-- Day/Night Cycle vars
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

-- Triggered sounds
--               bj_pingMinimapSound         = nil
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

-- Marketplace vars
bj_stockItemPurchased = nil
bj_stockUpdateTimer = nil
bj_stockAllowedPermanent = {}
bj_stockAllowedCharged = {}
bj_stockAllowedArtifact = {}
bj_stockPickedItemLevel = 0
bj_stockPickedItemType = nil

-- Melee vars
bj_meleeVisibilityTrained = nil
bj_meleeVisibilityIsDay = true
bj_meleeGrantHeroItems = false
bj_meleeNearestMineToLoc = nil
bj_meleeNearestMine = nil
bj_meleeNearestMineDist = 0.00
bj_meleeGameOver = false
bj_meleeDefeated = {}
bj_meleeVictoried = {}
bj_ghoul = {}
bj_crippledTimer = {}
bj_crippledTimerWindows = {}
bj_playerIsCrippled = {}
bj_playerIsExposed = {}
bj_finishSoonAllExposed = false
bj_finishSoonTimerDialog = nil
bj_meleeTwinkedHeroes = {}

-- Rescue behavior vars
bj_rescueUnitBehavior = nil
bj_rescueChangeColorUnit = true
bj_rescueChangeColorBldg = true

-- Transmission vars
bj_cineSceneEndingTimer = nil
bj_cineSceneLastSound = nil
bj_cineSceneBeingSkipped = nil

-- Cinematic mode vars
bj_cineModePriorSpeed = MAP_SPEED_NORMAL
bj_cineModePriorFogSetting = false
bj_cineModePriorMaskSetting = false
bj_cineModeAlreadyIn = false
bj_cineModePriorDawnDusk = false
bj_cineModeSavedSeed = 0

-- Cinematic fade vars
bj_cineFadeFinishTimer = nil
bj_cineFadeContinueTimer = nil
bj_cineFadeContinueRed = 0
bj_cineFadeContinueGreen = 0
bj_cineFadeContinueBlue = 0
bj_cineFadeContinueTrans = 0
bj_cineFadeContinueDuration = 0
bj_cineFadeContinueTex = ""

-- QueuedTriggerExecute vars
bj_queuedExecTotal = 0
bj_queuedExecTriggers = {}
bj_queuedExecUseConds = {}
bj_queuedExecTimeoutTimer = CJ.CreateTimer()
bj_queuedExecTimeout = nil

-- Helper vars (for Filter and Enum funcs)
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
bj_suspendDecayFleshGroup = CJ.CreateGroup()
bj_suspendDecayBoneGroup = CJ.CreateGroup()
bj_delayedSuspendDecayTimer = CJ.CreateTimer()
bj_delayedSuspendDecayTrig = nil
bj_livingPlayerUnitsTypeId = 0
bj_lastDyingWidget = nil

-- Random distribution vars
bj_randDistCount = 0
bj_randDistID = {}
bj_randDistChance = {}

-- Last X'd vars
bj_lastCreatedUnit = nil
bj_lastCreatedItem = nil
bj_lastRemovedItem = nil
bj_lastHauntedGoldMine = nil
bj_lastCreatedDestructable = nil
bj_lastCreatedGroup = CJ.CreateGroup()
bj_lastCreatedFogModifier = nil
bj_lastCreatedEffect = nil
bj_lastCreatedWeatherEffect = nil
bj_lastCreatedTerrainDeformation = nil
bj_lastCreatedQuest = nil
bj_lastCreatedQuestItem = nil
bj_lastCreatedDefeatCondition = nil
bj_lastStartedTimer = CJ.CreateTimer()
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

-- Filter function BJ.vars
filterIssueHauntOrderAtLocBJ = nil
filterEnumDestructablesInCircleBJ = nil
filterGetUnitsInRectOfPlayer = nil
filterGetUnitsOfTypeIdAll = nil
filterGetUnitsOfPlayerAndTypeId = nil
filterMeleeTrainedUnitIsHeroBJ = nil
filterLivingPlayerUnitsOfTypeId = nil

-- Memory cleanup vars
bj_wantDestroyGroup = false

BJ.bj_MAX_PLAYER_SLOTS = 16
function BJ.TriggerRegisterAnyUnitEventBJ(trig, event)
    for i = 0, BJ.bj_MAX_PLAYER_SLOTS - 1 do
        CJ.TriggerRegisterPlayerUnitEvent(trig, CJ.Player(i), event, nil)
    end
end

function BJ.GetConvertedPlayerId(whichPlayer)
    return CJ.GetPlayerId(whichPlayer) + 1
end

function BJ.TriggerRegisterPlayerEventEndCinematic(trig, whichPlayer)
    return CJ.TriggerRegisterPlayerEvent(trig, whichPlayer,
                                         CJ.EVENT_PLAYER_END_CINEMATIC)
end

function BJ.CreateItemLoc(itemId, loc)
    bj_lastCreatedItem = CJ.CreateItem(itemId, CJ.GetLocationX(loc),
                                       CJ.GetLocationY(loc))
    return bj_lastCreatedItem
end
function BJ.GetLastCreatedItem() return bj_lastCreatedItem end

function BJ.SetPlayerAbilityAvailableBJ(avail, abilid, whichPlayer)
    CJ.SetPlayerAbilityAvailable(whichPlayer, abilid, avail)
end

function BJ.ExplodeUnitBJ(whichUnit)
    CJ.SetUnitExploded(whichUnit, true)
    CJ.KillUnit(whichUnit)
end
-- ===========================================================================CreateNUnitsAtLoc
function BJ.CreateNUnitsAtLoc(count, unitId, whichPlayer, loc, face)
    CJ.GroupClear(bj_lastCreatedGroup)
    while true do
        count = count - 1
        if count < 0 then break end
        BJ.CreateUnitAtLocSaveLast(whichPlayer, unitId, loc, face)
        CJ.GroupAddUnit(bj_lastCreatedGroup, bj_lastCreatedUnit)
    end
    return bj_lastCreatedGroup
end
function BJ.CreateUnitAtLocSaveLast(id, unitid, loc, face)
    if (unitid == 'ugol') then
        bj_lastCreatedUnit = CJ.CreateBlightedGoldmine(id, CJ.GetLocationX(loc),
                                                       CJ.GetLocationY(loc),
                                                       face)
    else
        bj_lastCreatedUnit = CJ.CreateUnitAtLoc(id, unitid, loc, face)
    end

    return bj_lastCreatedUnit
end

function BJ.GetLastCreatedUnit() return bj_lastCreatedUnit end

-- ===========================================================================
function BJ.CreateNUnitsAtLocFacingLocBJ(count, unitId, whichPlayer, loc, lookAt)
    return CJ.CreateNUnitsAtLoc(count, unitId, whichPlayer, loc,
                                CJ.AngleBetweenPoints(loc, lookAt))
end

-- ===========================================================================
function BJ.AngleBetweenPoints(locA, locB)
    return bj_RADTODEG * CJ.Atan2(GetLocationY(locB) - CJ.GetLocationY(locA),
                                  CJ.GetLocationX(locB) - CJ.GetLocationX(locA))
end

function BJ.UnitRemoveItemSwapped(whichItem, whichHero)
    bj_lastRemovedItem = whichItem
    CJ.UnitRemoveItem(whichHero, whichItem)
end

function BJ.UnitAddItemByIdSwapped(itemId, whichHero)
    -- Create the   at the hero's feet first, and then give it to him.
    -- This is to ensure that the   will be left at the hero's feet if
    -- his inventory is full.
    bj_lastCreatedItem = CJ.CreateItem(itemId, CJ.GetUnitX(whichHero),
                                       CJ.GetUnitY(whichHero))
    CJ.UnitAddItem(whichHero, bj_lastCreatedItem)
    return bj_lastCreatedItem
end

function BJ.TriggerRegisterPlayerSelectionEventBJ(trig, whichPlayer, selected)
    if selected then
        return CJ.TriggerRegisterPlayerUnitEvent(trig, whichPlayer,
                                                 CJ.EVENT_PLAYER_UNIT_SELECTED,
                                                 null)
    else
        return CJ.TriggerRegisterPlayerUnitEvent(trig, whichPlayer,
                                                 CJ.EVENT_PLAYER_UNIT_DESELECTED,
                                                 null)
    end
end

function BJ.UnitHasBuffBJ(whichUnit, buffcode)
    return (CJ.GetUnitAbilityLevel(whichUnit, buffcode) > 0)
end
-- ***************************************************************************
-- *
-- *  Unit Utility Functions
-- *
-- ***************************************************************************

-- ===========================================================================
function BJ.UnitId2OrderIdBJ(unitId) return unitId end

-- ===========================================================================
function BJ.String2UnitIdBJ(unitIdString) return CJ.UnitId(unitIdString) end

-- ===========================================================================
function BJ.UnitId2StringBJ(unitId)
    local unitString = CJ.UnitId2String(unitId)

    if (unitString ~= nil) then return unitString end

    -- The unitId was not recognized - return an empty  .
    return ""
end

-- ===========================================================================
function BJ.String2OrderIdBJ(orderIdString)
    local orderId

    -- Check to see if it's a generic order.
    orderId = CJ.OrderId(orderIdString)
    if (orderId ~= 0) then return orderId end

    -- Check to see if it's a (train)   order.
    orderId = CJ.UnitId(orderIdString)
    if (orderId ~= 0) then return orderId end

    -- Unrecognized - return 0
    return 0
end

-- ===========================================================================
function BJ.OrderId2StringBJ(orderId)
    local orderString

    -- Check to see if it's a generic order.
    orderString = CJ.OrderId2String(orderId)
    if (orderString ~= nil) then return orderString end

    -- Check to see if it's a (train)   order.
    orderString = CJ.UnitId2String(orderId)
    if (orderString ~= nil) then return orderString end

    -- Unrecognized - return an empty  .
    return ""
end

-- ===========================================================================
-- ===========================================================================
function BJ.GetIssuedOrderIdBJ() return CJ.GetIssuedOrderId() end

-- ===========================================================================
function BJ.GetKillingUnitBJ() return CJ.GetKillingUnit() end

-- ===========================================================================

-- ===========================================================================
function BJ.TriggerRegisterTimerEventPeriodic(trig, timeout)
    return CJ.TriggerRegisterTimerEvent(trig, timeout, true)
end

-- ===========================================================================
function BJ.TriggerRegisterTimerEventSingle(trig, timeout)
    return CJ.TriggerRegisterTimerEvent(trig, timeout, false)
end

-- ===========================================================================
function BJ.TriggerRegisterTimerExpireEventBJ(trig, t)
    return CJ.TriggerRegisterTimerExpireEvent(trig, t)
end

-- ===========================================================================
function BJ.TriggerRegisterPlayerUnitEventSimple(trig, whichPlayer, whichEvent)
    return CJ.TriggerRegisterPlayerUnitEvent(trig, whichPlayer, whichEvent, nil)
end

-- ===========================================================================

-- ===========================================================================
function BJ.QuestMessageBJ(f, messageType, message)
    if (CJ.IsPlayerInForce(CJ.GetLocalPlayer(), f)) then
        -- Use only local   (no net traffic) within this block to avoid desyncs.

        if (messageType == bj_QUESTMESSAGE_DISCOVERED) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_QUEST, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_QUEST, message)
            CJ.StartSound(bj_questDiscoveredSound)
            CJ.FlashQuestDialogButton()

        elseif (messageType == bj_QUESTMESSAGE_UPDATED) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_QUESTUPDATE, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_QUESTUPDATE, message)
            CJ.StartSound(bj_questUpdatedSound)
            CJ.FlashQuestDialogButton()

        elseif (messageType == bj_QUESTMESSAGE_COMPLETED) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_QUESTDONE, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_QUESTDONE, message)
            CJ.StartSound(bj_questCompletedSound)
            CJ.FlashQuestDialogButton()

        elseif (messageType == bj_QUESTMESSAGE_FAILED) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_QUESTFAILED, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_QUESTFAILED, message)
            CJ.StartSound(bj_questFailedSound)
            CJ.FlashQuestDialogButton()

        elseif (messageType == bj_QUESTMESSAGE_REQUIREMENT) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_QUESTREQUIREMENT, message)

        elseif (messageType == bj_QUESTMESSAGE_MISSIONFAILED) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_MISSIONFAILED, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_MISSIONFAILED, message)
            CJ.StartSound(bj_questFailedSound)

        elseif (messageType == bj_QUESTMESSAGE_HINT) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_HINT, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_HINT, message)
            CJ.StartSound(bj_questHintSound)

        elseif (messageType == bj_QUESTMESSAGE_ALWAYSHINT) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_ALWAYSHINT, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_ALWAYSHINT, message)
            CJ.StartSound(bj_questHintSound)

        elseif (messageType == bj_QUESTMESSAGE_SECRET) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_SECRET, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_SECRET, message)
            CJ.StartSound(bj_questSecretSound)

        elseif (messageType == bj_QUESTMESSAGE_UNITACQUIRED) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_UNITACQUIRED, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_UNITACQUIRED, message)
            CJ.StartSound(bj_questHintSound)

        elseif (messageType == bj_QUESTMESSAGE_UNITAVAILABLE) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_UNITAVAILABLE, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_UNITAVAILABLE, message)
            CJ.StartSound(bj_questHintSound)

        elseif (messageType == bj_QUESTMESSAGE_ITEMACQUIRED) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_ITEMACQUIRED, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_ITEMACQUIRED, message)
            CJ.StartSound(bj_questItemAcquiredSound)

        elseif (messageType == bj_QUESTMESSAGE_WARNING) then
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_WARNING, " ")
            CJ.DisplayTimedTextToPlayer(CJ.GetLocalPlayer(), 0, 0,
                                        bj_TEXT_DELAY_WARNING, message)
            CJ.StartSound(bj_questWarningSound)

        else
            -- Unrecognized message type - ignore the request.
        end
    end
end
function BJ.GetPlayersAll() return bj_FORCE_ALL_PLAYERS end

-- ===========================================================================
function BJ.GetCurrentCameraBoundsMapRectBJ()
    return CJ.Rect(CJ.GetCameraBoundMinX(), CJ.GetCameraBoundMinY(),
                   CJ.GetCameraBoundMaxX(), CJ.GetCameraBoundMaxY())
end

function BJ.InitMapRects()
    bj_mapInitialPlayableArea = CJ.Rect(CJ.GetCameraBoundMinX() -
                                            CJ.GetCameraMargin(
                                                CAMERA_MARGIN_LEFT),
                                        CJ.GetCameraBoundMinY() -
                                            CJ.GetCameraMargin(
                                                CAMERA_MARGIN_BOTTOM),
                                        CJ.GetCameraBoundMaxX() +
                                            CJ.GetCameraMargin(
                                                CAMERA_MARGIN_RIGHT),
                                        CJ.GetCameraBoundMaxY() +
                                            CJ.GetCameraMargin(CAMERA_MARGIN_TOP))
    bj_mapInitialCameraBounds = BJ.GetCurrentCameraBoundsMapRectBJ()
end

-- ===========================================================================

function BJ.GetPlayableMapRect()
    -- return bj_mapInitialPlayableArea
    return CJ.Rect(CJ.GetCameraBoundMinX() -
                       CJ.GetCameraMargin(CAMERA_MARGIN_LEFT),
                   CJ.GetCameraBoundMinY() -
                       CJ.GetCameraMargin(CAMERA_MARGIN_BOTTOM),
                   CJ.GetCameraBoundMaxX() +
                       CJ.GetCameraMargin(CAMERA_MARGIN_RIGHT),
                   CJ.GetCameraBoundMaxY() +
                       CJ.GetCameraMargin(CAMERA_MARGIN_TOP))
end
function BJ.TriggerRegisterEnterRectSimple(trig, r)
    local rectRegion = CJ.CreateRegion()
    CJ.RegionAddRect(rectRegion, r)
    return CJ.TriggerRegisterEnterRegion(trig, rectRegion, nil)
end

BJ.CountUnitsInGroupEnum = function() bj_groupCountUnits =
    bj_groupCountUnits + 1 end

BJ.CountUnitsInGroup = function(g)

    local wantDestroy = bj_wantDestroyGroup
    bj_wantDestroyGroup = false
    bj_groupCountUnits = 0
    CJ.ForGroup(g, BJ.CountUnitsInGroupEnum)

    if (wantDestroy) then CJ.DestroyGroup(g) end
    do return bj_groupCountUnits end
end

BJ.ForGroupBJ = function(whichGroup, callback)

    local wantDestroy = bj_wantDestroyGroup
    bj_wantDestroyGroup = false
    CJ.ForGroup(whichGroup, callback)

    if (wantDestroy) then CJ.DestroyGroup(whichGroup) end
end

BJ.GroupAddUnitSimple = function(whichUnit, whichGroup)
    CJ.GroupAddUnit(whichGroup, whichUnit)
end

BJ.GroupRemoveUnitSimple = function(whichUnit, whichGroup)
    CJ.GroupRemoveUnit(whichGroup, whichUnit)
end

BJ.GroupAddGroupEnum = function()
    CJ.GroupAddUnit(bj_groupAddGroupDest, CJ.GetEnumUnit())
end

BJ.GroupAddGroup = function(sourceGroup, destGroup)

    local wantDestroy = bj_wantDestroyGroup
    bj_wantDestroyGroup = false
    bj_groupAddGroupDest = destGroup
    CJ.ForGroup(sourceGroup, BJ.GroupAddGroupEnum)

    if (wantDestroy) then CJ.DestroyGroup(sourceGroup) end
end

BJ.GroupRemoveGroupEnum = function()
    CJ.GroupRemoveUnit(bj_groupRemoveGroupDest, CJ.GetEnumUnit())
end

BJ.GroupRemoveGroup = function(sourceGroup, destGroup)

    local wantDestroy = bj_wantDestroyGroup
    bj_wantDestroyGroup = false
    bj_groupRemoveGroupDest = destGroup
    CJ.ForGroup(sourceGroup, BJ.GroupRemoveGroupEnum)

    if (wantDestroy) then CJ.DestroyGroup(sourceGroup) end
end

BJ.ForceAddPlayerSimple = function(whichPlayer, whichForce)
    CJ.ForceAddPlayer(whichForce, whichPlayer)
end

BJ.ForceRemovePlayerSimple = function(whichPlayer, whichForce)
    CJ.ForceRemovePlayer(whichForce, whichPlayer)
end

BJ.GetUnitsInRangeOfLocMatching = function(radius, whichLocation, filter)
    local g = CJ.CreateGroup()
    CJ.GroupEnumUnitsInRangeOfLoc(g, whichLocation, radius, filter)
    CJ.DestroyBoolExpr(filter)
    do return g end
end

BJ.DistanceBetweenPoints = function(locA, locB)
    local dx = CJ.GetLocationX(locB) - CJ.GetLocationX(locA)
    local dy = CJ.GetLocationY(locB) - CJ.GetLocationY(locA)
    do return CJ.SquareRoot(dx * dx + dy * dy) end
end

---------------------------
BJ.RMinBJ = function(a, b)
    if (a < b) then
        do return a end
    else
        do return b end
    end
end

BJ.RMinBJ = function(a, b)
    if (a < b) then
        do return a end
    else
        do return b end
    end
end

BJ.RMaxBJ = function(a, b)
    if (a < b) then
        do return b end
    else
        do return a end
    end
end

BJ.RAbsBJ = function(a)
    if (a >= 0) then
        do return a end
    else
        do return -a end
    end
end

BJ.RSignBJ = function(a)
    if (a >= 0.0) then
        do return 1.0 end
    else
        do return -1.0 end
    end
end

BJ.IMinBJ = function(a, b)
    if (a < b) then
        do return a end
    else
        do return b end
    end
end

BJ.IMaxBJ = function(a, b)
    if (a < b) then
        do return b end
    else
        do return a end
    end
end

BJ.IAbsBJ = function(a)
    if (a >= 0) then
        do return a end
    else
        do return -a end
    end
end

BJ.ISignBJ = function(a)
    if (a >= 0) then
        do return 1 end
    else
        do return -1 end
    end
end

BJ.SinBJ = function(degrees) do return BJ.Sin(degrees * bj_DEGTORAD) end end

BJ.CosBJ = function(degrees) do return BJ.Cos(degrees * bj_DEGTORAD) end end

BJ.TanBJ = function(degrees) do return BJ.Tan(degrees * bj_DEGTORAD) end end

BJ.AsinBJ = function(degrees) do return BJ.Asin(degrees) * bj_RADTODEG end end

BJ.AcosBJ = function(degrees) do return BJ.Acos(degrees) * bj_RADTODEG end end

BJ.AtanBJ = function(degrees) do return BJ.Atan(degrees) * bj_RADTODEG end end

BJ.Atan2BJ = function(y, x) do return BJ.Atan2(y, x) * bj_RADTODEG end end

BJ.SetUnitLifeBJ = function(whichUnit, newValue)
    CJ.SetUnitState(whichUnit, CJ.UNIT_STATE_LIFE, BJ.RMaxBJ(0, newValue))
end

BJ.UnitRemoveBuffBJ = function(buffcode, whichUnit)
    do return CJ.UnitRemoveAbility(whichUnit, buffcode) end

end

BJ.GetRectCenter = function(whichRect)
    do
        return CJ.Location(CJ.GetRectCenterX(whichRect),
                           CJ.GetRectCenterY(whichRect))
    end
end
BJ.IsUnitDeadBJ = function(whichUnit)
    do return CJ.GetUnitState(whichUnit, CJ.UNIT_STATE_LIFE) <= 0 end
end
BJ.GetAttackedUnitBJ = function() do return CJ.GetTriggerUnit() end end
return BJ
