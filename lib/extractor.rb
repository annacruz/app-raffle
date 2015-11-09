class Extractor

  def extract_names(file)
    file  = "participantes.csv"
    names = []
    File.readlines(file).drop(2).each do |line|
        names.push(line.split(";")[0])
    end
    return names
  end

end
