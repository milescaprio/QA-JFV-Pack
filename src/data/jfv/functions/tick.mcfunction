#remove these tags, theyll get added back
tag @a remove spawnZone
tag @a remove fightZone
tag @a remove depositing
tag @a remove withdrawing
tag @a remove homing
tag @a remove shopping
tag @a remove fighting
tag @a remove respawning
tag @a remove quicktransferring
tag @a remove paying
tag @a remove helping
tag @a remove cancelling
#enable scoreboards for new players
scoreboard players enable @a deposit
scoreboard players enable @a withdraw
scoreboard players enable @a home
scoreboard players enable @a help
scoreboard players enable @a shop
scoreboard players enable @a fight
scoreboard players enable @a respawn
scoreboard players enable @a quicktransfer
scoreboard players enable @a cancel
scoreboard players enable @a craft
scoreboard players enable @a enderchest

#spawn zone tag and gamemode setting based on tag and op
tag @a[x=24,y=-100,z=-8,dx=55,dy=500,dz=55] add spawnZone
tag @a[x=0,y=265,z=100,dx=100,dy=20,dz=50] add fightZone
gamemode adventure @a[tag=spawnZone,tag=!op,gamemode=!adventure]
gamemode adventure @a[tag=fightZone,tag=!op,gamemode=!adventure]
gamemode survival @a[tag=!spawnZone,tag=!op,gamemode=!survival]
gamemode survival @a[tag=!fightZone,tag=!op,gamemode=!survival]

#deposit trigger management
execute as @a[scores={deposit=1..}] run execute store success score @s deduceSucess run clear @s diamond 1
execute as @a[scores={deposit=1..}] run execute if score @s deduceSucess matches 1 run tag @s add depositing
scoreboard players reset @a[scores={deposit=1..}] deduceSucess
execute as @a[tag=depositing] run scoreboard players add @s Diamond_Bank 1
execute as @a[tag=depositing] run scoreboard players remove @s deposit 1
tell @a[tag=!depositing,scores={deposit=1..}] You don't have that many to deposit!
execute as @a[tag=!depositing,scores={deposit=1..}] run scoreboard players set @s deposit 0

#quicktransfer trigger management
scoreboard players remove @a[scores={quicktransfer=1..}] Diamond_Bank 1
tag @a[scores={quicktransfer=1..,Diamond_Bank=0..}] add quicktransferring
execute as @a[tag=quicktransferring] run scoreboard players add @p[tag=!quicktransferring] Diamond_Bank 1
scoreboard players remove @a[tag=quicktransferring] quicktransfer 1
scoreboard players add @a[tag=!quicktransferring,scores={quicktransfer=1..}] Diamond_Bank 1
tell @a[tag=!quicktransferring,scores={quicktransfer=1..}] You don't have that many to transfer!
scoreboard players set @a[tag=!quicktransferring,scores={quicktransfer=1..}] quicktransfer 0

#withdraw trigger management
scoreboard players remove @a[scores={withdraw=1..}] Diamond_Bank 1
tag @a[scores={withdraw=1..,Diamond_Bank=0..}] add withdrawing
give @a[tag=withdrawing] diamond
scoreboard players remove @a[tag=withdrawing] withdraw 1
scoreboard players add @a[tag=!withdrawing,scores={withdraw=1..}] Diamond_Bank 1
tell @a[tag=!withdrawing,scores={withdraw=1..}] You don't have that many to withdraw!
scoreboard players set @a[tag=!withdrawing,scores={withdraw=1..}] withdraw 0

#teleport people home or initialize warmup
tag @a[scores={home=1..}] add homing
scoreboard players set @a[tag=homing] home 0
scoreboard players set @a[tag=homing,scores={Health=..15}] hometimer 400
scoreboard players set @a[tag=homing,scores={Health=16..}] hometimer 100
tell @a[tag=homing,scores={Health=..15}] Teleporting home in 20 seconds!
tell @a[tag=homing,scores={Health=16..}] Teleporting home in 5 seconds, you have 80% or more health!
scoreboard players remove @a[scores={hometimer=0..}] hometimer 1
execute as @a[scores={hometimer=0}] run tp 56 84 24
tell @a[scores={hometimer=0}] Teleporting home!

#teleport people to shop or initialize warmup
tag @a[scores={shop=1..}] add shopping
scoreboard players set @a[tag=shopping] shop 0
scoreboard players set @a[tag=shopping,scores={Health=..15}] shoptimer 400
scoreboard players set @a[tag=shopping,scores={Health=16..}] shoptimer 100
tell @a[tag=shopping,scores={Health=..15}] Teleporting to the Shopping District in 20 seconds!
tell @a[tag=shopping,scores={Health=16..}] Teleporting to the Shopping District in 5 seconds, you have 80% or more health!
scoreboard players remove @a[scores={shoptimer=0..}] shoptimer 1
execute as @a[scores={shoptimer=0}] run tp 50 70 120
tell @a[scores={shoptimer=0}] Teleporting to the Shopping District!

#teleport people to fight or initialize warmup
tag @a[scores={fight=1..}] add fighting
scoreboard players set @a[tag=fighting] fight 0
scoreboard players set @a[tag=fighting,scores={Health=..15}] fighttimer 400
scoreboard players set @a[tag=fighting,scores={Health=16..}] fighttimer 100
tell @a[tag=fighting,scores={Health=..15}] Teleporting to the Fight Zone in 20 seconds!
tell @a[tag=fighting,scores={Health=16..}] Teleporting to the Fight Zone in 5 seconds, you have 80% or more health!
scoreboard players remove @a[scores={fighttimer=0..}] fighttimer 1
execute as @a[scores={fighttimer=0}] run tp 50 270 120
tell @a[scores={fighttimer=0}] Teleporting to the Fight Zone!

#teleport people to respawn or initialize warmup
tag @a[scores={respawn=1..}] add respawning
scoreboard players set @a[tag=respawning] respawn 0
scoreboard players set @a[tag=respawning,scores={Health=..15}] respawntimer 400
scoreboard players set @a[tag=respawning,scores={Health=16..}] respawntimer 100
tell @a[tag=respawning,scores={Health=..15}] Teleporting to Respawn in 20 seconds!
tell @a[tag=respawning,scores={Health=16..}] Teleporting to Respawn in 5 seconds, you have 80% or more health! 
scoreboard players remove @a[scores={respawntimer=0..}] respawntimer 1
#on, kill, off, they go home, and death counter decrements
tell @a[scores={respawntimer=12}] Teleporting to Respawn!
execute as @a[scores={respawntimer=8}] run gamerule keepInventory true 
execute as @a[scores={respawntimer=8}] run gamerule doImmediateRespawn true
kill @a[scores={respawntimer=4}]
execute as @a[scores={respawntimer=0}] run gamerule keepInventory false
execute as @a[scores={respawntimer=0}] run gamerule doImmediateRespawn false
scoreboard players remove @a[scores={respawntimer=0}] Deaths 1

#manage cancel trigger
tag @a[scores={cancel=1..}] add cancelling
scoreboard players set @a[tag=cancelling] shoptimer 0
scoreboard players set @a[tag=cancelling] hometimer 0
scoreboard players set @a[tag=cancelling] respawntimer 0
scoreboard players set @a[tag=cancelling] cancel 0
tell @a[tag=cancelling] Cancelling!

#manage enderchest and craft trigger, right now not working
execute as @a[scores={craft=1..},gamemode=!adventure] run setblock ~ ~ ~ crafting_table destroy
scoreboard players set @a[scores={craft=1..}] craft 0
execute as @a[scores={enderchest=1..},gamemode=!adventure] run setblock ~ ~ ~ ender_chest destroy
scoreboard players set @a[scores={enderchest=1..}] enderchest 0

#manage helping trigger
tag @a[scores={help=1..}] add helping
tellraw @a[tag=helping] {"text":"Commands:","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger deposit set <value> : Deposits diamonds to bank, <value> should be amount","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger withdraw set <value> : Withdraws diamonds from bank, <value> should be amount","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger quicktransfer set <value> : Transfers diamonds to nearest player, <value> should be amount","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger home : Teleports home in 20 seconds.","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger shop : Teleports to the Shopping District in 20 seconds.","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger respawn : Teleports to your spawn point in 20 seconds.","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger cancel : Stop Teleporting","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger craft : Set current block to crafting table, for easy crafting","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger enderchest : Set current block to enderchest, for easy inventory management","color":"yellow"}
tellraw @a[tag=helping] {"text":"/trigger help : Bring up this menu","color":"yellow"}
execute as @a[scores={help=1..}] run scoreboard players set @s help 0