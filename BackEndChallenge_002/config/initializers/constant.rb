#The current player's move is the first half of each combo, and adversary's move is the second half of each combo

# T is tie
# W is Win
# L is Loose

GAME_RULE = {
  "RockRock"  => "T", "RockPaper" => "L", "RockScissors"  => "W", "RockLizard"  => "W", "RockSpock"  => "L",
  "PaperRock"  => "W", "PaperPaper"  => "T", "PaperScissors"  => "L", "PaperLizard"  => "L", "PaperSpock"  => "W",
  "ScissorsRock"  => "L", "ScissorsPaper"  => "W", "ScissorsScissors"  => "T", "ScissorsLizard"  => "W", "ScissorsSpock"  => "L",
  "LizardRock"  => "L", "LizardPaper"  => "W", "LizardScissors"  => "L", "LizardLizard"  => "T", "LizardSpock" => "W",
  "SpockRock" => "W", "SpockPaper" => "L", "SpockScissors" => "W", "SpockLizard" => "L", "SpockSpock" => "T"
}