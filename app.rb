require_relative 'models'

class Pumatra < Sinatra::Base

  configure do
    # setting one option
    # set :option, 'value'

    # setting multiple options
    # set :a => 1, :b => 2

    # same as `set :option, true`
    # enable :option

    # same as `set :option, false`
    # disable :option

    # you can also have dynamic settings with blocks
    # set(:css_dir) { File.join(views, 'css') }

    set :server, :puma
  end


  # Here you can add your before methods
  # before do
  #   # code...
  # end
end

require_relative 'routes'