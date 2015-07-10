

# 1 has 1 cup
# 2 has 4 cups
# 3 has 9 cups

class Jibe::BeerPyramid

  def self.levels(num_beers)
    level_num = 0

    while(num_beers > 0) do
      num_beers -= ((level_num + 1)**2)
      level_num += 1 if num_beers >= 0
    end

    level_num
  end

end