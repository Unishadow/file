DEFINE_BASECLASS("npc_sniper_base")

if CLIENT then
SWEP.WepSelectIcon		= surface.GetTextureID( "npc_sw_weapon_cisshot" )
	 
killicon.Add( "npc_sw_weapon_cisshot", "vgui/hud/cisshotgun", color_white )
end

SWEP.WorldModel					= "models/swbf3/weapons/cisshotgun.mdl"
SWEP.HoldType					= "ar2"

SWEP.MuzzleEffect    			= ""
SWEP.ShellEffect				= ""
SWEP.Tracer						= "effect_sw_laser_red"

SWEP.Damage						= 20
SWEP.Force						= 1
SWEP.Spread						= Vector(0,0,0)
SWEP.Spread0					= Vector(0.105,0.16,0.16)
SWEP.Spread1					= Vector(0.09,0.145,0.145)
SWEP.Spread2					= Vector(0.075,0.13,0.13)
SWEP.Spread3					= Vector(0.06,0.115,0.115)
SWEP.Spread4					= Vector(0.045,0.1,0.1)
SWEP.SpreadMPenalty				= 1.1
SWEP.BurstCount					= 0
SWEP.BurstDelay					= 0
SWEP.Primary.NumShots			= 5
SWEP.Primary.ClipSize			= 15
SWEP.Primary.DefaultClip		= 100
SWEP.Primary.Delay				= 1
SWEP.Primary.Sound				= "weapons/shotgun.wav"