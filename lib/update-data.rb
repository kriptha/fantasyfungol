#
# This lib is to update all data from fantasy servers while crawling jsons and storing them.
#
def updatedata
  Dir.mkdir(DATA_DIR) unless File.exists?(DATA_DIR)
  (1..650).each do |i|
    player_url = BASE_URL + "#{i}"
    puts "Fetching #{player_url}" 
    begin
      player_data = JSON.parse(open(player_url).read)
      player_content = open(player_url).read
    rescue Exception=>e
        puts "Error: #{e}"
        sleep 5
    else
      player_name = player_data.fetch("web_name")
      puts "Player name : #{player_name}"
      local_fname = "#{DATA_DIR}#{File.basename(player_name)}"
      File.open(local_fname, 'w'){|file| file.write(player_content)}
      puts "\t...Success, saved to #{local_fname}"
    ensure
      sleep 1.0 + rand
    end
  end
end
