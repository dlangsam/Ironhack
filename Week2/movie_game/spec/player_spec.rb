require_relative("../lib/player.rb")



RSpec.describe 'Player tests' do


  let :player do 
    Player.new
  end
 it "player starts up with zero questions or score" do
 
    expect(player.score).to eq(0)
    expect(player.questions_answered). to eq(0)
  end
   it "tests answered_wrong method to make sure score doesn't increase but questions_answered does" do
 	player.answered_wrong
    expect(player.score).to eq(0)
    expect(player.questions_answered). to eq(1)
  end

  it "tests answered_right method to make sure score and questions_answered increases" do
 	player.answered_right
    expect(player.score).to eq(1)
    expect(player.questions_answered). to eq(1)
  end
  it "tests clear method to make sure score and questions_answered is reset to zero" do
 	player.answered_right
 	player.clear_score
    expect(player.score).to eq(0)
    expect(player.questions_answered). to eq(0)
  end
end