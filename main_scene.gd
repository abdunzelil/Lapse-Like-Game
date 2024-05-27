
# File: MainScene.gd
extends Node2D
var Card = preload("res://Scripts/card.gd")
# Array to hold card instances
var cards = []
var current_card = null
var temp_card = null
var scores = {"Health": 50, "Mana": 50, "Gold": 50, "Strength": 50}
var specialItems = {"GemstoneFromMermaid": false, "GoldPouch": false}

func _ready():
	# Initialize card instances
	initialize_cards()
	
	# Display a random card at the start
	#show_random_card()
	update_card_display()

func initialize_cards():
	
	var gameOverCard = Card.new()
	gameOverCard.image = load("res://images/gameOver.jpg")
	gameOverCard.story_text = "Oyun bitti, kaybettin!."
	gameOverCard.option_a_text = "Ne..."
	gameOverCard.option_a_effects = {} # GEMSTONE SHOULD BE ADDED
	gameOverCard.option_b_text = "Olamaz..."
	gameOverCard.option_b_effects = {} # WE SHOULD BE CURSED!
	cards.append(gameOverCard)
	
	var card1 = Card.new()
	card1.image = load("res://images/image1.jpg")
	card1.story_text = "Bir hazine sandığı!"
	card1.option_a_text = "Aç!"
	card1.option_a_effects = {"Gold": 20}
	card1.option_b_text = "Boş ver."
	card1.option_b_effects = {}
	cards.append(card1)

	var card2 = Card.new()
	card2.image = load("res://images/image2.jpg")
	card2.story_text = "Ormanda devasa bir yaratık karşına çıktı!"
	card2.option_a_text = "Savaş!"
	card2.option_a_effects = {"Health": -15, "Mana": -15, "Gold": 30}
	card2.option_b_text = "Kaç!"
	card2.option_b_effects = {"Strength": -15}
	cards.append(card2)

	var card3 = Card.new()
	card3.image = load("res://images/image3.jpg")
	card3.story_text = "Bir tüccar sana bir miktar altın karşılığında zırh satmayı teklif ediyor."
	card3.option_a_text = "Kabul et."
	card3.option_a_effects = {"Gold": -10, "Strength": 10}
	card3.option_b_text = "Reddet."
	card3.option_b_effects = {"Strength": -5}
	cards.append(card3)
	
	var card4 = Card.new()
	card4.image = load("res://images/image4.jpg")
	card4.story_text = "İki goblin yolunu kesiyor ve kılıçlarını sallayarak biraz paraya ihtiyaçları olduğunu söylüyorlar."
	card4.option_a_text = "Hırsızlara para yok!"
	card4.option_a_effects = {"Health": -10, "Mana": -10, "Strength": - 10}
	card4.option_b_text = "İstediklerini verelim gitsin."
	card4.option_b_effects = {"Gold": -20}
	cards.append(card4)
	
	var card5 = Card.new()
	card5.image = load("res://images/image5.jpg")
	card5.story_text = "Bir deniz kızı! Kocasını canavarlardan kurtarırsan sana sihirli bir yakut vereceğini söylüyor."
	card5.option_a_text = "Savaşıp taşı alalım!"
	card5.option_a_effects = {"Health": -10, "Strength": -10} # GEMSTONE SHOULD BE ADDED
	card5.option_b_text = "Salla."
	card5.option_b_effects = {} # WE SHOULD BE CURSED!
	cards.append(card5)
	
	var card6 = Card.new()
	card6.image = load("res://images/image6.jpg")
	card6.story_text = "Ormanda bir sihirbazla karşılaştın. Biraz mana ve altın karşılığında gücünü artıran bir büyü yapabileceğini söylüyor."
	card6.option_a_text = "Büyüyü yap!"
	card6.option_a_effects = {"Mana": -10, "Gold": -10, "Strength": 15} # GEMSTONE SHOULD BE ADDED
	card6.option_b_text = "İstemiyorum."
	card6.option_b_effects = {} # WE SHOULD BE CURSED!
	cards.append(card6)
	
	var card7 = Card.new()
	card7.image = load("res://images/image7.jpg")
	card7.story_text = "Emekli bir gladyatör ücret karşılığında savaş antrenmanı yapmayı teklif ediyor."
	card7.option_a_text = "Kabul et."
	card7.option_a_effects = {"Gold": -10, "Strength": 10} # GEMSTONE SHOULD BE ADDED
	card7.option_b_text = "Boş işler."
	card7.option_b_effects = {} # WE SHOULD BE CURSED!
	cards.append(card7)
	
	var card8 = Card.new()
	card8.image = load("res://images/image8.jpg")
	card8.story_text = "Sarayın cadısı gücünü hizmetine sunarsan mananı tazelemeyi teklif etti."
	card8.option_a_text = "Kabul et."
	card8.option_a_effects = {"Mana": 20, "Strength": -10} # GEMSTONE SHOULD BE ADDED
	card8.option_b_text = "Yok."
	card8.option_b_effects = {} # WE SHOULD BE CURSED!
	cards.append(card8)
	
	var card9 = Card.new()
	card9.image = load("res://images/image9.jpg")
	card9.story_text = "Yetimhaneden arkadaşın akşamüstü balık tutmaya gidecek ve seni de davet ediyor."
	card9.option_a_text = "Onunla balık tutmaya git."
	card9.option_a_effects = {"Health": 20, "Strength": 10} 
	card9.option_b_text = "Boş işlere vaktim yok."
	card9.option_b_effects = {} 
	cards.append(card9)
	
	var card10 = Card.new()
	card10.image = load("res://images/image10.jpg")
	card10.story_text = "Seni çok seven amcan şehirdeki yeni handa yemek yemek istiyor. Bilgeliğinden faydalanmak kulağa hoş gelse de hanın menüsü biraz pahalı duruyor."
	card10.option_a_text = "Amcamın bilgeliğinden faydalanmalıyım."
	card10.option_a_effects = {"Gold": -10, "Mana": 15} 
	card10.option_b_text = "Dışarıda yemeğe para veremem."
	card10.option_b_effects = {"Mana": -10, "Gold": 15} 
	cards.append(card10)
	
	var card11 = Card.new()
	card11.image = load("res://images/image11.jpg")
	card11.story_text = "Ormanda bir mağaraya rastlıyorsun. Kapısında 'İçeride kesinlikle çok fazla altını olan bir troll kalmıyor.' yazıyor."
	card11.option_a_text = "Altınların şıkırtısını duyabiliyorum. İçeri!"
	card11.option_a_effects = {"Gold": 30, "Mana": -15, "Health": -15, "Strength": -15} 
	card11.option_b_text = "Ormanda gezintiye devam et."
	card11.option_b_effects = {"Health": 10} 
	cards.append(card11)
	
	var card12 = Card.new()
	card12.image = load("res://images/image12.jpg")
	card12.story_text = "Kasabanın kahvehanesinde biraz kart oyunu oynamaya ne dersin?."
	card12.option_a_text = "Hadi biraz para kazanalım!"
	card12.option_a_effects = {"Gold": randi_range(-15, 15)} 
	card12.option_b_text = "Boş ver."
	card12.option_b_effects = {} 
	cards.append(card12)
	
	var skeletonCard = Card.new()
	skeletonCard.image = load("res://images/image14.jpg")
	skeletonCard.story_text = "Harabelerin içinde bir iskelet!."
	skeletonCard.option_a_text = "Saldır!"
	skeletonCard.option_a_effects = {"Gold": 15, "Health": -10, "Mana": -10} 
	skeletonCard.option_b_text = "Kaçalım!"
	skeletonCard.option_b_effects = {"Strength": -10} 
	cards.append(skeletonCard)
	
	var card13 = Card.new()
	card13.image = load("res://images/image13.jpg")
	card13.story_text = "köyden uzaklaşmak için gezintiye çıkmıştın ve yıkık dökük bir yer buldun."
	card13.option_a_text = "İçeri bir bakalım."
	card13.option_a_effects = {"Gold": randi_range(-15, 15)} 
	card13.option_b_text = "Uzaklaş."
	card13.option_b_effects = {} 
	card13.next_card_index = 14
	cards.append(card13)
	
var rng = RandomNumberGenerator.new()

func update_card_display():
	if (scores.get("Health") <= 0 or scores.get("Gold") <= 0 or scores.get("Mana") <= 0 or scores.get("Strength") <= 0):
		$ImageCard.texture = cards[0].image
		$Labels/Story.text = cards[0].story_text
		$"Option Buttons/OptionA".text = cards[0].option_a_text
		$"Option Buttons/OptionB".text = cards[0].option_b_text
		await get_tree().create_timer(4).timeout
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
	temp_card = current_card
	if current_card == null: # Oyunun başında
		current_card = cards[randi_range(1, cards.size() - 1)]
	while (current_card == temp_card): # Bir önceki kartla aynı çıkmaması kontrolü
		if (current_card.next_card_index == 14):
			current_card = cards[13] #skeletonCards index
		else:
			current_card = cards[randi_range(1, cards.size() - 1)]

		
	$ImageCard.texture = current_card.image
	$Labels/Story.text = current_card.story_text
	$"Option Buttons/OptionA".text = current_card.option_a_text
	$"Option Buttons/OptionB".text = current_card.option_b_text

func _on_optionA_pressed():
	apply_effects(current_card.option_a_effects)
	update_card_display()

func _on_option_b_pressed():
	apply_effects(current_card.option_b_effects)
	update_card_display()

func apply_effects(effects):
	for key in effects.keys():
		scores[key] += effects[key]
	update_score_display()

func update_score_display():
	if ($Labels/Health.text != str(scores["Health"])):
		pass
	$Labels/Health.text = str(scores["Health"])
	$Labels/Mana.text = str(scores["Mana"])
	if ($Labels/Gold.text != str(scores["Gold"])):
		$Labels/Gold/AnimationPlayer.play("glow")
	$Labels/Gold.text = str(scores["Gold"])
	$Labels/Strength.text = str(scores["Strength"])
	
	


