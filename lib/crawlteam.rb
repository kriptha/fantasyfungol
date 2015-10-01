#
# function crawlteam returns an array of players in current team
#
def crawlteam
  event = gameweek
  a_player = Array.new
  page = Nokogiri::HTML(open("http://es.fantasy.premierleague.com/entry/#{TEAM}/event-history/#{event}/"))
  page.css('div.ismPlayerContainer dl.ismElementDetail dt span.ismElementText.ismPitchWebName.JS_ISM_NAME').each do |playername|
    playername = playername.text
    playername = playername[0...-1]
    playername[0] = ''
    a_player.insert(-1, playername)
  end
  return a_player
end
