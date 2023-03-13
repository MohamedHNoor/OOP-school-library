require_relative './app'

def main
  puts "\nWelcome to school library app!\n\n"
  app = App.new
  app.run
end

main
