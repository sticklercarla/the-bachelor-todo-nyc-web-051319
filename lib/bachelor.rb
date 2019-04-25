require "pry"
def get_first_name_of_season_winner(data, season)
  first_name = []
  data[season].each do |contestant|
    if contestant["status"].downcase == "winner"
      first_name << contestant["name"].split(' ')[0]
    end
  end
  first_name[0]
end

def get_contestant_name(data, occupation)
  full_name = []
  data.each do |season, contestants|
    contestants.each do |stats, data|
      if stats["occupation"] == occupation
        full_name << stats["name"]
      end
    end
  end
  full_name[0]
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season, contestants|
    contestants.each do |stats, data|
      if stats["hometown"] == hometown
        counter += 1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  occupation = []
  data.each do |season, contestants|
    contestants.each do |stats, data|
      if stats["hometown"] == hometown
        occupation << stats["occupation"]
      end
    end
  end
  occupation[0]
end

def get_average_age_for_season(data, season)
  age_total = 0
  contestant_count = 0
  data[season].each do |contestants|
    age_total += contestants["age"].to_i
    contestant_count += 1
  end
  (age_total/contestant_count.to_f).round(0)
end
