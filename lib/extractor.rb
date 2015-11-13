class Extractor

  def self.get_names(file)
    names = []
    File.readlines(file).drop(2).each do |line|
        names.push(line.split(";")[0])
    end
    return names
  end

end
