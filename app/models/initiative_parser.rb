class InitiativeParser
  def self.run
    dataset = CKAN::Action.action_get('package_show', id: 'congreso-abierto')
    resources = dataset['result']['resources']

    resources.each do |resource|
      initiatives_resource = Net::HTTP.get(URI(resource['url']))
      initiatives_resource = JSON.parse(initiatives_resource)

      initiatives_resource.each do |initiative_resource|
        initiative = Initiative.create do |i|
          i.decree = initiative_resource['decreto']
          i.date = Time.at(initiative_resource['fecha'])
          i.period = initiative_resource['periodo']
          i.year = initiative_resource['ano']
          i.legislature = initiative_resource['legislatura']
        end
        initiative_resource['votos'].each do |tipo, votos_partido|
          votos_partido.each do |voto_partido|
            voto_partido['votaciones'].each do |voto|
              initiative.votes.create do |v|
                # v.initiative_id = initiative.id
                v.vote_type = tipo
                v.deputy = Deputy.find_or_create_by(name: voto,
                                                    party: voto_partido['partido'])
                # v.vote_type = votes.tipo_voto
              end
            end
          end
        end
      end
    end
  end
end
