# File: card.gd
extends Node

# Card properties
@export var image: Texture
@export var story_text: String
@export var option_a_text: String
@export var option_a_effects = {}
@export var option_b_text: String
@export var option_b_effects = {}
@export var next_card_index: int
