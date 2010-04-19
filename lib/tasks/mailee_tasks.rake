def obtain_after
  after = ENV['AFTER'] || ENV['after']
  @after = after ? eval(after) : nil
end

namespace :mailee do
  desc <<-DESC
Sincroniza os items da tabela "users" com os contatos do Mailee.
Você pode também especificar o env AFTER para enviar apenas os contatos atualizados após uma data.
E.g. rake mailee:send CLASS=Contact AFTER=1.day.
  DESC
  task :send => :environment do
    after = obtain_after
    raise "A classe #{klass.name} deve ser sincronizada com o Mailee. Adicione o código 'sync_with_mailee'" if ! User.syncd?
    print "Enviando\n"
    User.send_all_to_mailee(after) do
      print "."
      STDOUT.flush
    end
  end
end
