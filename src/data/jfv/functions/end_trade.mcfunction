execute at @e[tag=offerer_flag,limit=1] run data remove block ~ ~-0.5 ~ Lock
execute at @e[tag=accepter_flag,limit=1] run data remove block ~ ~-0.5 ~ Lock
kill @e[tag=offerer_flag]
kill @e[tag=accepter_flag]
tag @a remove offerer
tag @a remove accepter
tag @a remove trade_confirmed
scoreboard players set #global offer_trade_timer -1