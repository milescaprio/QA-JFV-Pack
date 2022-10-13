#needs counting to already be done
#errors that are already procedurally checked to be logically impossible are not checked here
#on rare cases, a trade_confirm'ed player may leave and not have tag removed, then join back and accept a trade, and it will auto confirm, but this isn't really a problem. It could be remedied with a error handle of trade_confirm people who aren't yet accepting.
#only runs during trade duration, prevent other trade actions from happening by checking there is an active trade and clearing trade tags wheneever a new trade is processed
scoreboard players set #global error_code 0
execute if score #global offerer_flag_counter matches 2.. run scoreboard players set #global error_code 1
execute if score #global accepter_flag_counter matches 2.. run scoreboard players set #global error_code 2
execute if score #global offerer_flag_counter matches 1 if score #global offerer_counter matches 0 run scoreboard players set #global error_code 3
execute if score #global accepter_flag_counter matches 1 if score #global accepter_counter matches 0 run scoreboard players set #global error_code 4
execute if score #global offerer_flag_counter matches 0 if score #global offerer_counter matches 1 run scoreboard players set #global error_code 5
execute if score #global accepter_flag_counter matches 0 if score #global accepter_counter matches 1 run scoreboard players set #global error_code 6
execute if score #global offerer_counter matches 0 if score #global accepter_counter matches 1 run scoreboard players set #global error_code 7
execute if score #global error_code matches 1 run tellraw @a {"text":"Error! Multiple offering chests found! All active trades are now reset!", "color":"red"}
execute if score #global error_code matches 2 run tellraw @a {"text":"Error! Multiple accepting chests found! All active trades are now reset!", "color":"red"}
execute if score #global error_code matches 3 run tellraw @a {"text":"Error! Stray offering chest! All active trades are now reset!", "color":"red"}
execute if score #global error_code matches 4 run tellraw @a {"text":"Error! Stray accepting chest! All active trades are now reset!", "color":"red"}
execute if score #global error_code matches 5 run tellraw @a {"text":"Error! Stray offerer! All active trades are now reset!", "color":"red"}
execute if score #global error_code matches 6 run tellraw @a {"text":"Error! Stray accepter! All active trades are now reset!", "color":"red"}
execute if score #global error_code matches 7 run tellraw @a {"text":"Error! Hanging accepter! All active trades are now reset!", "color":"red"}
execute if score #global error_code matches 1.. run function jfv:end_trade