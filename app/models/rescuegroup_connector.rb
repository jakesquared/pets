class RescuegroupConnector

  def initialize
    @page = 1
    @type = 'animals'
    @limit = 100
  end

  def url_params(options = {})
    params = {}
    params[:key] = key
    params[:type] =  type(options[:type])
    params[:limit] = limit(options[:limit])
    params[:page] = page(options[:page])
    params
  end

  def url
    'http://api.rescuegroups.org/'
  end

  def key
    'RgKK5PGU'
  end

  def type(type = nil)
    @type = type if type
    @type
  end

  def limit(limit = nil)
    @limit = limit if limit
    @limit
  end

  def page(page = nil)
    @page = page if page
    @page
  end

  def transform(data)
    {
      :name => data["name"],
      :species => data["species"].downcase,
      :breed => data["breed"],
      :gender => data["sex"],
      :photo => data["pic1"],
      :zip => data["locationZipcode"],
      :remote_id => data["animalID"],
      :kill_date =>data["killDate"] ,
      :kill_reason => data["killReason"],
      :description => data["description"],
      :click_url => data["petURL"],
      :age => data["age"],
      :remote_id => data["animalID"],
    }
  end
end