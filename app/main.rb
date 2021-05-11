#require 'app/ball.rb'

def tick args
  initialize args
  player_sprite args
  player_controller args
  enemy args
  debug args
end

def initialize(args)

  args.state.player ||= args.state.new_entity :player, x: 640, y: 100
  args.state.enemy ||= args.state.new_entity :enemy, x: 640, y: 500

end

def player_controller(args)

  if args.inputs.right && args.state.player.x <= 1100
    args.state.player.x += 10
  elsif args.inputs.left && args.state.player.x >= 80
    args.state.player.x -= 10
  end

  if args.inputs.keyboard.a
    shoot
  end

end

def player_sprite(args)
  args.outputs.sprites << [args.state.player.x,
                           args.state.player.y,
                           100,
                           25,
                           'sprites/square/black.png']


end

def debug(args)
  args.outputs.labels << [10, 710, "Actual Player X: #{args.state.player.x}"]
end

def enemy(args)
  @speed = 1

  args.outputs.sprites << [args.state.enemy.x,
                           args.state.enemy.y,
                           150,
                           25,
                           'sprites/square/blue.png']

end

def shoot(args)

end
