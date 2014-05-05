module ApplicationHelper
  def game_acts
    all_acts = ""
    GameAct.all.find_each do |act|
      all_acts = "#{all_acts}<button type='button' class='game_acts' data-name='#{act.name}'>#{act.name}</button>"
    end
    raw all_acts
  end
  def current_player(params)
    top_left = ""
    if params[:is_waiting] == "true"
      top_left = "<h2>Waiting for adversary</h2>"
    else
      if @status == "Win"
        top_left = "<h2>You win</h2>"
      elsif @status == "Loose"
        top_left = "<h2>You lost</h2>... please head to the closest extermination point"
      else
        top_left = "<h2>Tie</h2>"
      end
    end
    render :partial => "/game/shared/current_player", :locals => {:top_left => top_left}
  end
  def adversary_player(params)
    if @status == "Win"
      top_right = "<h2>Your adversary loose</h2>"
    elsif @status == "Loose"
      top_right = "<h2>Your adversary win</h2>"
    else 
      top_right = "<h2>Tie</h2>"
    end 
    
    if params[:is_waiting]=="true"
      render :partial => "/game/shared/adversary_player_case1", :locals => {:top_right => top_right}
    else
      render :partial => "/game/shared/adversary_player_case2", :locals => {:top_right => top_right}
    end
  end
end
