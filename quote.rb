class Quote
  def initialize(attributes = {})
    @text = attributes["quote"]
    @author = attributes["author"]
  end

  def to_s
    "\"#{@text}\" - #{@author}"
  end
end
