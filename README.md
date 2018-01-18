# README LEVOO API

#SURVIVORS

# GET /api/v1/survivors # INDEX
  mostra todos os sobreviventes JSON

# GET /api/v1/survivors/1 # SHOW
  mostra sobrevivente com id 1 JSON

# POST /api/v1/survivors #CREATE
  cria survivor
  parametros = name, age, gender, infected, latitude, longitude

  exemplo de como enviar os paramentros:
  survivor[name] = "nome"
  survivor[age] = 22
  survivor[gender] = "f" ou "m"
  survivor[infected] = false
  survivor[latitude] = 1223124
  survivor[longitude] = 124354534

  retorna JSON com survivor criado

  apos criar o sobrevivente localize o valor do parametro #inventory_id

  e adicione no seguite caminho. MUITA ATENCAO voce estara adicionando itens ao seu inventario e so podera adicionar uma vez. a menos que voce troque com outro sobrevivente. mais informacoes na parte do #inventory

  # PATCH/PUT /api/v1/inventories/#inventory_id


# PATCH/PUT /api/v1/survivors/1 # update
  atualizar sobrevivente com id 1
  Atualizacao só permite o sobrevivente atualizar sua localicacao

  survivor[latitude] = 1223124
  survivor[longitude] = 124354534

  retorna JSON com survivor atualizado

# INVENTORY

# GET /api/v1/inventories/1 # SHOW
  mostra os item do survivor de id 1 em JSON

# PATCH/PUT /api/v1/inventories/1 #UPDATE
  parametros = hydration_liquid, food, medication, ammunition

  exemplo de como enviar os paramentros:  Valor de cada item
  inventory[hydration_liquid] = 1         # pontos 4
  inventory[food] = 1                     # pontos 3
  inventory[medication] = 1               # pontos 2
  inventory[ammunition] = 1               # pontos 1

# SUSPECT

# GET /api/v1/suspects # INDEX
  mostra todos os suspeitos de estarem contaminados quando a contagem de denucicas atigem a quantia de 3 o suspeito se torna infected/infectado

  retorna um Json de survivors listado como suspeitos

# GET /api/v1/suspects/1 # SHOW
  mostra o survivor suspeito de id 1 em JSON

# POST /api/v1/suspects # CREATE
  denuciar suspeito
  parametros = survivor_id

  exemplo de como enviar o paramentro:
  suspect[survivor_id] = 1

# GET /api/v1/report # INDEX
  retorna relatorio com as seguite informacoes em JSON

  quantidade de infectados #infected
  quantidade de sobrevivente nao infectados #survivor
  relacao de inventario #inventory
    total de cada item #all
    media de cada item por sobrevivente nao infectado #mean
    total de item perdidos por o usuarios esta contaminado #infected_unusable(lost_points)
