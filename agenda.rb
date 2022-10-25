# Adicionar ou remover Contato;
# Contato terão as seguintes informações: nome e telefone;
# Poderemos ver todos os contatos registrados ou somente um contato;
# Teste de chave ssg
@agenda = [
  {nome: "Diego",   telefone: "999988911"},
  {nome: "Gustavo", telefone: "999988922"},
]

def todos_contatos
  @agenda.each do |contato| 
    puts "#{contato[:nome]} - #{contato[:telefone]}"
  end
  puts "-----------------------------------------"
end 

def adicionar_contato
  print "Nome: "
  nome = gets.chomp
  print "Telefone: "
  telefone = gets.chomp

  @agenda << {nome: nome, telefone: telefone}
end

def ver_contato
  print "Qual nome você deseja: "
  nome = gets.chomp

  @agenda.each do |contato|
    if contato[:nome].downcase == (nome.downcase)
      puts "#{contato[:nome]} - #{contato[:telefone]}"
    end
  end
  puts "-----------------------------------------"
end

def editar_contato 
  print "Qual o nome você deseja editar: "
  nome = gets.chomp

  @agenda.each do |contato|
    if contato[:nome].downcase == (nome.downcase)
      print "Nome para editar (Se quiser manter o mesmo nome, aperte enter): "
      nome_salvo = contato[:nome]

      contato[:nome] = gets.chomp
      contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]

      print "Telefone para editar (Se quiser manter o mesmo telefone, aperte enter): "
      telefone_salvo = contato[:telefone]

      contato[:telefone] = gets.chomp
      contato[:telefone] = contato[:telefone].empty? ? telefone_salvo : contato[:telefone]
    end
  end
  puts "--------------------------------------"
end 

def remover_contato
  print "Qual nome deseja remover: "
  nome = gets.chomp

  @agenda.each do |contato|
    if contato[:nome].downcase == (nome.downcase)
      indice = @agenda.index(contato)
      @agenda.delete_at(indice)
      break
    end
  end
end 


loop do

puts "1. Contatos\n2. Adicionar\n3. Ver Contato\n4. Editar Contato\n5. Remover Contato\n0. Sair"
  codigo = gets.chomp.to_i

  case
  when codigo == 0 
    puts "Até mais!"
    break
    when codigo == 1 
      todos_contatos
    when codigo == 2 
      adicionar_contato
    when codigo == 3 
      ver_contato
    when codigo == 4
      editar_contato 
    when codigo == 5 
      remover_contato
    else 
      puts "Função não existe, use uma função válida: "
  end
end 