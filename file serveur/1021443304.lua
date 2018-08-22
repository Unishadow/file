if !ConVarExists("gunship_unit_deployment") then	
   CreateClientConVar("gunship_unit_deployment", "models/npc/smitty/bf2_reg/sm_ct_trooper/sm_ct_trooper.mdl", (FCVAR_GAMEDLL), "Troopers in gunship", true, true)
end
if !ConVarExists("sentinel_unit_deployment") then	
   CreateClientConVar("sentinel_unit_deployment", "models/npc/fatal/troopers/trooper.mdl", (FCVAR_GAMEDLL), "Troopers in sentinel", true, true)
end
if !ConVarExists("rebel_unit_deployment") then	
   CreateClientConVar("rebel_unit_deployment", "models/rebel_npc/sgg/starwars/rebels/r_soldier_urban/male_01.mdl", (FCVAR_GAMEDLL), "Troopers in rebellion", true, true)
end

function populateStarfightersPanel(panel)
	panel:AddControl( "PropSelect", {Label = "Troops the Laat will deploy (More available in addons with Republic Base)", Height = 4, ConVar = "gunship_unit_deployment", Models = list.Get( "clone_troopers_available" )} )
	panel:AddControl( "PropSelect", {Label = "Troops the Sentinel will deploy (More available in Imperial Stormtrooper NPCs)", Height = 4, ConVar = "sentinel_unit_deployment", Models = list.Get( "stormtroopers_available" )} )
	panel:AddControl( "PropSelect", {Label = "Troops the U-Wing will deploy", Height = 4, ConVar = "rebel_unit_deployment", Models = list.Get( "rebels_available" )} )
	end

hook.Add("PopulateToolMenu", "Starfighters Tool Options", function()
	spawnmenu.AddToolMenuOption("Options", "Star Wars Starfighers", "Starfighter Options", "Settings", "", "", populateStarfightersPanel)
end)

if ConVarExists("332nd_battalion_enable") then
list.Set( "clone_troopers_available", "models/npc/gonzo/swbf2ahsoka/trooper/alpha.mdl", {} )
end
if ConVarExists("ea_bf2_phase1_troopers_enable") then
list.Set( "clone_troopers_available", "models/npc/smitty/bf2_reg/bf2_p1_trooper/bf2_p1_trooper.mdl", {} )	
end
if ConVarExists("ea_bf2_phase1_cg_troopers_enable") then
list.Set( "clone_troopers_available", "models/npc/worthy/cgtrooper/bf2_p1_cgtrooper.mdl", {} )	
end

list.Set( "clone_troopers_available", "models/npc/smitty/bf2_reg/sm_ct_trooper/sm_ct_trooper.mdl", {} )	
if ConVarExists("ea_bf2_phase1_regimental_pack_enable") then
list.Set( "clone_troopers_available", "models/npc/worthy/phase_1/91st/bf2_p1_trooper.mdl", {} )	
list.Set( "clone_troopers_available", "models/npc/worthy/phase_1/104th/bf2_p1_trooper.mdl", {} )
list.Set( "clone_troopers_available", "models/npc/worthy/phase_1/187th/bf2_p1_trooper.mdl", {} )
list.Set( "clone_troopers_available", "models/npc/worthy/phase_1/212th/bf2_p1_trooper.mdl", {} )
list.Set( "clone_troopers_available", "models/npc/worthy/phase_1/327th/bf2_p1_trooper.mdl", {} )
list.Set( "clone_troopers_available", "models/npc/worthy/phase_1/327th_red/bf2_p1_trooper.mdl", {} )
list.Set( "clone_troopers_available", "models/npc/worthy/phase_1/442nd/bf2_p1_trooper.mdl", {} )
list.Set( "clone_troopers_available", "models/npc/worthy/phase_1/501st/bf2_p1_trooper.mdl", {} )
list.Set( "clone_troopers_available", "models/npc/worthy/phase_1/kamino/bf2_p1_trooper.mdl", {} )
list.Set( "clone_troopers_available", "models/npc/worthy/phase_1/shock/bf2_p1_trooper.mdl", {} )
end
if ConVarExists("HD_clone_troopers_enable") then
list.Set( "clone_troopers_available", "models/npc/player/sono/starwars/clean_trooper.mdl", {} )	
list.Set( "clone_troopers_available", "models/npc/player/sono/starwars/212th_trooper.mdl", {} )	
list.Set( "clone_troopers_available", "models/npc/player/sono/starwars/327th_trooper.mdl", {} )	
list.Set( "clone_troopers_available", "models/npc/player/sono/starwars/501st_trooper.mdl", {} )	
list.Set( "clone_troopers_available", "models/npc/player/sono/starwars/187th_trooper.mdl", {} )	
list.Set( "clone_troopers_available", "models/npc/player/sono/starwars/green_company_trooper.mdl", {} )	
list.Set( "clone_troopers_available", "models/npc/player/sono/starwars/442nd_trooper.mdl", {} )	
list.Set( "clone_troopers_available", "models/npc/player/sono/starwars/shocktrooper.mdl", {} )	
end
if ConVarExists("special_clone_troopers_enable") then
list.Set( "clone_troopers_available", "models/npc/grady/starwars/ft_trooper.mdl", {} )	
list.Set( "clone_troopers_available", "models/snpc/weegee/osoct/osoct.mdl", {} )
list.Set( "clone_troopers_available", "models/snpc/weegee/bsocs/bsocs.mdl", {} )
list.Set( "clone_troopers_available", "models/npc/grady/starwars/so_trooper.mdl", {} )
end
if ConVarExists("clone_ordnance_specialist_enable") then
list.Set( "clone_troopers_available", "models/npc/sono/swbf2/eod_clone_phase1.mdl", {} )	
end
if ConVarExists("galactic_marines_enable") then
list.Set( "clone_troopers_available", "models/npc/shader/starwars/1_gm_trooper.mdl", {} )	
end
list.Set( "stormtroopers_available", "models/npc/fatal/troopers/trooper.mdl", {} )	
if ConVarExists("imperial_might_enable") then
list.Set( "stormtroopers_available", "models/npc/sono/troopers/navy.mdl", {} )	
list.Set( "stormtroopers_available", "models/npc/sono/troopers/red.mdl", {} )	
list.Set( "stormtroopers_available", "models/npc/sono/troopers/utapau.mdl", {} )	
list.Set( "stormtroopers_available", "models/npc/sono/troopers/forest.mdl", {} )	
end	
list.Set( "rebels_available", "models/rebel_npc/sgg/starwars/rebels/r_soldier_urban/male_01.mdl", {} )	
list.Set( "rebels_available", "models/rebel_npc/roger/swbf_rebel_soldiersand_roger/swbf_rebel_soldiersand_roger.mdl", {} )	
list.Set( "rebels_available", "models/rebel_npc/roger/swbf_rebel_soldierforest_roger/swbf_rebel_soldierforest_roger.mdl", {} )	
list.Set( "rebels_available", "models/rebel_npc/roger/swbf_rebel_soldiermagma_roger/swbf_rebel_soldiermagma_roger.mdl", {} )	
list.Set( "rebels_available", "models/rebel_npc/roger/swbf_rebel_soldiersnow_roger/swbf_rebel_soldiersnow_roger.mdl", {} )	
list.Set( "rebels_available", "models/rebel_npc/sgg/starwars/rebels/r_trooper/male_01.mdl", {} )	
list.Set( "rebels_available", "models/rebel_npc/swbf_rebel_bespinwingguard_roger/swbf_rebel_bespinwingguard_roger_npc.mdl", {} )	