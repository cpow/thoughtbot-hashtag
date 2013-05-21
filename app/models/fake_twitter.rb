class FakeTwitter
  def self.[]=(term, results)
    @data ||= {}
    @data[term] = results
  end

  def self.search(term)
    @data ||= {}
    results = @data.fetch(term, []).map {|hash| Twitter::Status.new(hash.merge(id: 1))}
    OpenStruct.new(results: results)
  end

  def self.clear
    @data = {}
  end
end
