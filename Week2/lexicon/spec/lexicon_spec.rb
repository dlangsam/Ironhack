require_relative("../lib/lexicon.rb")


RSpec.describe Lexiconomitron  do  
before :each do
    @lexi = Lexiconomitron.new
  end
 describe "#eat_t"  do 
    it "removes every letter t from the input"  do 
      
      expect( @lexi.eat_t( "great scott!" )).to eq( "grea sco!" )
     end 
  end 

  describe "#shazam"  do 
    it "reverses each word in the array and returns the first and last"  do 
  
      expect( @lexi.shazam(["This", "is", "a", "boring", "test"])).to eq(["sih", "se"])
     end 
  end

  describe "#shazam"  do 
    it "reverses each word in the array and returns the first and last"  do 

      expect( @lexi.oompa_loompa(["if", "you", "wanna", "be", "my", "lover"])).to eq(["if", "you", "be", "my"])
     end 
  end 
end