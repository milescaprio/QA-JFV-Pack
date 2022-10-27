#tellraw conventions: 
#red: error on your or server's part
#dark_purple: teleporting
#green: command success
#blue: other things happening
#light_purple: response to your command
#aqua: command follow-up info
#gold: important notifications

#handletrigger files: execute for all that used the trigger
#handletriggerall files: execute once if at least one person used the trigger, runs as one of those people
#handletimer files: execute for each player at 0 timer

#remove these tags, theyll get added back when they need to
tag @a remove spawnZone
tag @a remove fightZone
tag @a remove depositing
tag @a remove withdrawing
tag @a remove quicktransferring
tag @a remove paying
tag @a remove offering_trade
tag @a remove accepting_trade
tag @a remove temp


function jfv:new_players



#spawn zone tag and gamemode setting based on tag and op
tag @a[x=24,y=-100,z=-8,dx=55,dy=500,dz=55] add spawnZone
tag @a[x=0,y=265,z=100,dx=100,dy=20,dz=50] add fightZone
gamemode adventure @a[tag=spawnZone,tag=!op,gamemode=!adventure]
gamemode adventure @a[tag=fightZone,tag=!op,gamemode=!adventure]
gamemode survival @a[tag=!spawnZone,tag=!fightZone,tag=!op,gamemode=!survival]



execute as @a[scores={deposit=1..}] run function jfv:handle/handletrigger_deposit

execute as @a[scores={quicktransfer=1..}] run function jfv:handle/handletrigger_quicktransfer

execute as @a[scores={withdraw=1..}] run function jfv:handle/handletrigger_withdraw

execute as @a[scores={home=1..}] run function jfv:handle/handletrigger_home
execute as @a[scores={hometimer=0..}] run function jfv:handle/handletimer_home

execute as @a[scores={shop=1..}] run function jfv:handle/handletrigger_shop
execute as @a[scores={shoptimer=0..}] run function jfv:handle/handletimer_shop

execute as @a[scores={fight=1..}] run function jfv:handle/handletrigger_fight
execute as @a[scores={fighttimer=0..}] run function jfv:handle/handletimer_fight

execute as @a[scores={respawn=1..}] run function jfv:handle/handletrigger_respawn
execute as @a[scores={respawntimer=0..}] run function jfv:handle/handletimer_respawn

execute as @a[scores={cancel=1..}] run function jfv:handle/handletrigger_cancel



#manage enderchest and craft trigger, deprecated
#execute as @a[scores={craft=1..},gamemode=!adventure] run setblock ~ ~ ~ crafting_table destroy
#scoreboard players set @a[scores={craft=1..}] craft 0
#execute as @a[scores={enderchest=1..},gamemode=!adventure] run setblock ~ ~ ~ ender_chest destroy
#scoreboard players set @a[scores={enderchest=1..}] enderchest 0



#manage active trading triggers
#tick down trade timeout timer
execute if score #global offer_trade_timer matches 1.. run scoreboard players remove #global offer_trade_timer 1
execute if score #global offer_trade_timer matches 0.. run function jfv:count_trades
execute if score #global offer_trade_timer matches 0.. run function jfv:handle/handle_trade_errors
execute if score #global offer_trade_timer matches 0 run tellraw @a {"text":"","color":"blue","extra":[{"selector":"@a[tag=offerer]"},{"text":"'s trade has expired!"}]}
execute if score #global offer_trade_timer matches 0 run function jfv:end_trade

execute as @a[scores={offer_trade=1..},limit=1] run function jfv:handle/handletriggerall_offer_trade

execute as @a[scores={accept_trade=1..},limit=1] run function jfv:handle/handletriggerall_accept_trade

execute as @a[scores={cancel_trade=1..}] run function jfv:handle/handletrigger_cancel_trade

execute as @a[scores={confirm_trade=1..}] run function jfv:handle/handletrigger_confirm_trade

execute as @a[scores={view_trade=1..}] run function jfv:handle/handletrigger_view_trade

execute as @a[scores={trade_help=1..}] run function jfv:handle/handletrigger_trade_help

execute as @a[scores={help=1..}] run function jfv:handle/handletrigger_help
