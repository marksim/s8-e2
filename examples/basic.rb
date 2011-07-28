require 'space_truckin'

def title(text)
  puts "\n-------------------------------------------------------"
  puts text
  puts "-------------------------------------------------------"
end

SpaceTruckin.play("John", "Paul", "George") do |game|
  title "Welcome to Space Truckin'!"

  until game.finished?
    puts "Starting Round"
    game.reset_stages

    game.players.each do |player|
      title "#{player.name}'s turn"

      puts "Available Stages: #{game.available_stages}"
      stage_name = game.available_stages[rand(game.available_stages.length)]


      title "Playing #{stage_name}"
      case stage_name
      when "Demand"

        game.play_stage(stage_name, player) do |stage|
          random_planet = game.planets[rand(game.planets.length)]
          game.add_demand_to(random_planet)

          puts "Added demand to #{random_planet.name} - #{random_planet.demand}"

          stage.players.each do |stage_player|
            # each player draws 1 resource
            stage_player.draw
            puts "#{stage_player.name} added 2 cards and how has #{stage_player.resources}"
          end
        end
      when "Control"
        game.play_stage(stage_name, player) do |stage|
          stage.players.each do |stage_player|
            stage_player.location.routes.each do |route|
              if stage_player.can_control?(route)
                stage_player.control(route)
                puts "#{stage_player.name} now controls #{route}"
              end
            end
          end
        end
      when "Ship"
        game.play_stage(stage_name, player) do |stage|
          stage.players.each do |stage_player|
            stage_player.location.routes.each do |route|
              next unless route.usable?
              if stage_player.can_travel?(route)
                stage_player.travel(route)
                puts "#{stage_player.name} traveled to #{stage_player.location.name} along #{route}"
                retrieved_cargo = stage_player.location.get_cargo(:half)
                stage_player.cargo += retrieved_cargo
                puts "#{stage_player.name} got #{retrieved_cargo} cargo" if retrieved_cargo > 0
                if state_player.location.has_demand? 
                  cargo_to_sell = [3, stage_player.cargo].max
                  stage_player.sell(cargo_to_sell)
                  puts "#{stage_player.name} sold #{cargo_to_sell} cargo and now has #{stage_player.victory_points}"
                end
              end
            end
          end
        end
      when "Protect"
        game.play_stage(stage_name, player) do |stage|
          stage.players.each do |stage_player|
            stage_player.controlled_routes.each do |route|
              if !route.protected? && stage_player.can_protect?(route)
                stage_player.protect(route)
                puts "#{stage_player.name} placed space mines along #{route}"
              end
            end
          end
        end
      when "Attack"
        game.play_stage(stage_name, player) do |stage|
          player = stage.players.first

          stage.players[1..-1].each do |stage_player|
            if stage_player.should_discard_under_attack?
              cards_to_discard = stage_player.resources[0..(stage_player.resources.length/2)-1]
              puts "#{stage_player.name} discarded #{cards_to_discard}"
              stage_player.discard(cards_to_discard.map(&:type))
            end
          end

          case stage.attack_type
          when :attack
            game.controlled_routes.each do |route|
              if route.controlled_by != player
                game.clear_attacked_routes
                route.attack
                puts "#{player.name} attacked #{route}, which is now #{route.state}"
              end
            end
          when :remove
            game.clear_attacked_routes
            puts "#{player.name} removed the attacking aliens from the universe."
          end
        end
      else
        raise "Unknown Stage!"
      end
    end

    game.rotate_players
    puts "End of round - Players rotated!"
  end

  title "Game over!  Standings..."
  game.standings.each_with_index do |player, place|
    puts "#{place+1} - #{player.name} (#{player.victory_points})"
  end
end