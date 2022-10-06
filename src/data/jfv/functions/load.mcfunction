scoreboard objectives add hometimer dummy
scoreboard players set @a hometimer -1
scoreboard objectives add shoptimer dummy
scoreboard players set @a shoptimer -1
scoreboard objectives add fighttimer dummy
scoreboard players set @a fighttimer -1
scoreboard objectives add respawntimer dummy
scoreboard players set @a respawntimer -1
scoreboard objectives add offer_trade_timer dummy
scoreboard players set @a offer_trade_timer -1

scoreboard objectives add deduceSucess dummy
scoreboard objectives add Diamond_Bank dummy
scoreboard objectives add Deaths deathCount 
scoreboard objectives add Health health 

scoreboard objectives setdisplay list Deaths

scoreboard objectives add deposit trigger
scoreboard objectives add withdraw trigger
scoreboard objectives add quicktransfer trigger
scoreboard objectives add cancel trigger
scoreboard objectives add home trigger
scoreboard objectives add shop trigger
scoreboard objectives add fight trigger
scoreboard objectives add help trigger
scoreboard objectives add craft trigger
scoreboard objectives add enderchest trigger
scoreboard objectives add respawn trigger

scoreboard objectives add trade_help trigger
scoreboard objectives add offer_trade trigger
scoreboard objectives add view_trade trigger
scoreboard objectives add accept_trade trigger
scoreboard objectives add confirm_trade trigger
scoreboard objectives add cancel_trade trigger

scoreboard objectives add offerer_counter dummy
scoreboard objectives add accepter_counter dummy
scoreboard objectives add offerer_flag_counter dummy
scoreboard objectives add accepter_flag_counter dummy
scoreboard objectives add error_code dummy

scoreboard objectives setdisplay sidebar Diamond_Bank
tell @a Reloaded QA-JFV-dp
