# README

Projeto teste para a Vaga Ruby on Rails BackEnd Developer

### Descrição:
    Api que faz webscrapping de uma página de citações e retona ao usuário os dados formatados.

[![Documentação da API](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/cb2c7f35fd10849d7c28)


Requisitos de Sistema:

* Ruby 2.5.0

* Rails 5.2.2
  
* Redis

* MongoDB


#### Features

* É possível requisitar todas as citações.

* Ao buscar uma tag de citação caso não seja encontrada na base, a api faz o scraping dos dados e retorna ao usuário.

* Em segundo plano as tags buscadas que não existem em base são adicionadas via Job do Sidekiq.

Obs.: É necessário que o serviço do redis esteja rodando 

#### Setup da aplicação

``` 
$ git clone https://github.com/inovamind_teste.git 

$ cd inovamind_teste

$ bundle

// Em um terminal separado digite

$ bundle exec sidekiq 
``` 
#### Criação de usuário para desenvolvimento
```
rails c
$ User.create!(name: "teste", email: "teste@teste.com", password: "123456", password_confirmation: "123456")
```

#### Testes
A aplicação está configurada com RSPEC e Guard. Para rodar os testes é encessário roda:

```
bundle exec guard
```

#### Segurança

Não é possível solicitar nenhuma citação ou buscar por citação caso o usuário esteja cadastrado e possua um Token JWT no Header da requisição.

