class InitiativeParser
  dataset = CKAN::Action.action_get("package_show",{"id"=>"congreso-abierto"})
  resources = dataset["result"]["resources"]

  # esto va a cambiar a ser dinamico
  resourceURL = resources[0]["url"]
  resource = Net::HTTP.get(URI(resourceURL))
  resource = JSON.parse(resource)
  resource = resource[0]
  # ^^^^^

  Initiative.create do |i|
    i.decree = resource["decreto"]
    i.date = resource["fecha"]
    i.period = resource["periodo"]
    i.year = resource["ano"]
    i.legislature = resource["legislatura"]
  end
end
