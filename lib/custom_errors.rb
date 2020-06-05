class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
    self.partner = person
    # this will raise the PartnerError class below when arguments are given incorrectly
    if person.class != Person
      # rescue code inside truthy statment
      # rescue method creates instance of PartnerError class & calls message on that instance
      begin
        raise PartnerError
      rescue PartnerError => error
        puts error.message
      end
    else
      person.partner = self
    end
  end

  # puting PartnerError class inside Person class so can use with #get_married?
  class PartnerError < StandardError
    # outputs customer error message when error occurs
    def message
      "you must give the get_married method an argument of an instance of the person class!"
    end
  end

end


beyonce = Person.new("Beyonce")
# we're trying to pass a string, not an instance of the person class
# will produce undefined method error
beyonce.get_married("Jay-Z")
puts beyonce.name




