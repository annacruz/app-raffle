class Raffle

  def self.do_raffle!(names)
    drawn = "Empty list"

    if names.size > 0
      random_index = generate_random_number(names.size - 1)
      drawn = names[random_index]
      names.delete_at(random_index)
    end

    return drawn
  end
  class <<self
    private
    def generate_random_number(max)
      rand(0..max)
    end
  end

end
