class Raffle

  def initialize
  end

  def do_raffle!(names)
    random_index = generate_random_number(names.size)
    drawn = names[random_index]
    names.delete_at(random_index)
    return drawn
  end

  private
  def generate_random_number(max)
    rand(0..max)
  end

end
