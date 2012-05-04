class Requester
  include HTTParty
   parser(
    Proc.new do |body, _|
      Crack::XML.parse(body)
    end
  )
  debug_output $stderr

  def initialize(connector)
    @connector = connector
    self.class.base_uri(@connector.url)
  end

  def make_request
    data= self.class.get('/rest/', :timeout => 100, :query => @connector.url_params({:limit => 10}))
    parse_response(data)
  rescue Timeout
      make_request
  end

  def parse_response(data)
    data["pets"]["pet"].each do |pet|
      to_model(pet)
    end
  end

  def to_model(data)
    attributes = @connector.transform(data)
    Pet.create(attributes)
  end

end