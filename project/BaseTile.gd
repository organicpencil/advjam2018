extends Node2D

enum CUSTOMEFFECTS {
	NONE, WATER, STICKY_SURFACE, TOXIC_SURFACE, SPIKE_TRAP, TOXIC_TRAP}

export var solid = false
export var walkable = true
export var customEffects = [CUSTOMEFFECTS.NONE]
