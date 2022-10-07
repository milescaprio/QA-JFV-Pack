kill @e[tag=offerer_flag]
kill @e[tag=accepter_flag]
tag @a remove offerer
tag @a remove accepter
tag @a remove trade_confirmed
scoreboard players set #global offer_trade_timer -1