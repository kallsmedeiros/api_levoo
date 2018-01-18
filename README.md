# README LEVOO API

#SURVIVORS

# GET /api/v1/survivors # INDEX
  mostra todos os sobreviventes

# GET /api/v1/survivors/1 # SHOW
  mostra sobrevivente com id 1

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

# PATCH/PUT /api/v1/survivors/1 # update
  atualizar sobrevivente com id 1
  Atualizacao só permite o sobrevivente atualizar sua localicacao

  survivor[latitude] = 1223124
  survivor[longitude] = 124354534
