namespace :initiative_parser do
  desc 'TODO'
  task run: :environment do
    run
  end

  def run
    puts 'Iniciando parse de iniciativas'
    dataset = CKAN::Action.action_get('package_show', id: 'congreso-abierto')
    resources_ckan = dataset['result']['resources']
    resource_count = dataset['result']['num_resources'].to_int
    resources_ckan.each do |resource_ckan|
      resource = Resource.where(guid: resource_ckan['id'])
      puts "Faltan #{resource_count} recursos"
      resource_count -= 1
      next unless resource.empty?
      resource.create

      initiatives_resource = get_initiaves_resource(resource_ckan['url'])

      initiatives_resource.each do |initiative_resource|
        print '.'
        initiative = create_initiatives(initiative_resource)
        initiative_resource['votos'].each do |tipo, votos_partido|
          create_votes_and_deputies(tipo, votos_partido, initiative)
        end
      end
      puts ''
    end
  end

  def get_initiaves_resource(url)
    initiatives_resource = Net::HTTP.get(URI(url))
    JSON.parse(initiatives_resource)
  end

  def create_initiatives(initiative_resource)
    initiative = Initiative.create do |i|
      i.decree = initiative_resource['decreto']
      i.date = Time.at(initiative_resource['fecha'])
      i.period = initiative_resource['periodo']
      i.year = initiative_resource['ano']
      i.legislature = initiative_resource['legislatura']
    end
    initiative
  end

  def create_votes_and_deputies(tipo, votos_partido, initiative)
    votos_partido.each do |voto_partido|
      voto_partido['votaciones'].each do |voto|
        initiative.votes.create do |v|
          v.vote_type = tipo
          v.deputy = Deputy.find_or_create_by(name: voto,
                                              party: voto_partido['partido'])
        end
      end
    end
  end
end
