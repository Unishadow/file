if ( SERVER ) then

	AddCSLuaFile( "shared.lua" )
	
end

if CLIENT then
SWEP.WepSelectIcon		= surface.GetTextureID( "emp_rocket" )	 
killicon.Add( "emp_rocket", "vgui/hud/emp_rocket", color_white )
end

SWEP.HoldType			= "ar2"
SWEP.Base				= "weapon_swsft3_base"
SWEP.Category			= "Star Wars"

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false

SWEP.ViewModel			= ""
SWEP.WorldModel			= "models/npc/bf2/emp.mdl"

SWEP.Weight			= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

local FireSound 		= Sound ("weapons/republic_launcher_fire.wav");
local ReloadSound		= Sound ("weapons/E60R_reload.wav");

SWEP.Primary.Recoil		= 50
SWEP.Primary.Damage		= 100
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone		= 0.15
SWEP.Primary.ClipSize		= 2
SWEP.Primary.Delay		= 2
SWEP.FireDelay 					= 0
SWEP.Primary.DefaultClip	= 8
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo		= "rpg_round"

SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

function SWEP:PrimaryAttack()
	
	if not self:CanPrimaryAttack() then
		self:NpcReload()
		return
	end
	
	local curtime = CurTime()
	
	if self.FireDelay > curtime then
		return
	end
	
	if self.Owner:IsNPC() and IsValid(self.Owner:GetEnemy()) then
		
		self.FireDelay = curtime + self.Primary.Delay
		
		self:FireRocket()
		self:TakePrimaryAmmo( 1 )
	end
	
end

function SWEP:FireRocket()
	local aim = self.Owner:GetAimVector()
	local side = aim:Cross(Vector(0,0,1))
	local up = side:Cross(aim)
	local pos = self.Owner:GetShootPos() +  aim * 24 + side * 8 + up * -1	--offsets the rocket so it spawns from the muzzle (hopefully)
	local rocket = ents.Create("emp_rocket")
		if !rocket:IsValid() then return false end
		rocket:SetAngles(aim:Angle())
		rocket:SetPos(pos)
	rocket:SetOwner(self.Owner)
	rocket:Spawn()
	rocket:Activate()
	rocket:SetVelocity(rocket:GetForward()*100)
end

function SWEP:Reload()
		self.Weapon:DefaultReload( ACT_VM_RELOAD );
		self:SetIronsights( false )

end

function SWEP:Think()	
	local ClipPercentage = ((100/self.Primary.ClipSize)*self.Weapon:Clip1());
	
	if (ClipPercentage < 1) then
		self.Owner:GetViewModel():SetSkin( 5 )
		return
	end
	if (ClipPercentage < 21) then
		self.Owner:GetViewModel():SetSkin( 4 )
		return
	end
	if (ClipPercentage < 41) then
		self.Owner:GetViewModel():SetSkin( 3 )
		return
	end
	if (ClipPercentage < 61) then
		self.Owner:GetViewModel():SetSkin( 2 )
		return
	end
	if (ClipPercentage < 81) then
		self.Owner:GetViewModel():SetSkin( 1 )
		return
	end
	if (ClipPercentage < 101) then
		self.Owner:GetViewModel():SetSkin( 0 )
	end
end

function SWEP:CanPrimaryAttack()

	if self:Clip1() <= 0 then
	
		return false
	
	end
	
	return true

end