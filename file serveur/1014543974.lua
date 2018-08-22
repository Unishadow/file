DEFINE_BASECLASS("npc_dual_base8")

if CLIENT then
SWEP.WepSelectIcon		= surface.GetTextureID( "npc_dual_se14c" )
	 
killicon.Add( "npc_dual_se14c", "vgui/hud/dual_se14c", color_white )
end

--[[
--ELITES
--]]

SWEP.WorldModel = "models/weapons/w_SE14C.mdl"

--SWEP.HoldType					= "smg"

SWEP.MuzzleEffect    			= ""
SWEP.ShellEffect				= ""
SWEP.Tracer						= "effect_sw_laser_red"

SWEP.Damage						= 12
SWEP.Force						= 5
SWEP.Spread						= Vector(0, 0, 0)
SWEP.Primary.Cone			= 0.0125
SWEP.SpreadMPenalty				= 1.1
SWEP.BurstCount					= 1
SWEP.BurstDelay					= 0.15
SWEP.Primary.NumShots			= 1
SWEP.Primary.ClipSize			= 50
SWEP.Primary.DefaultClip		= 150
SWEP.Primary.Delay				= 0.2
SWEP.Primary.Sound				= "weapons/SE14C_fire.wav"