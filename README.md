# rails-intro
TechSchool JSChile 2024

Requirements

[Ruby 2.7 or major](https://www.ruby-lang.org/en/documentation/installation/)

[SQLite 3](https://www.sqlite.org/download.html)

[Gem Rails](https://guides.rubyonrails.org/getting_started.html)

# ERD

![techschool](https://github.com/meraioth/rails-intro/assets/11747949/abbe805d-f9fe-46af-b9d1-99828353fbe2)

## Step by step

    rails new rails-intro --css tailwind

    bin/rails server

    bin/rails tailwindcss:watch

Rails monta el servidor usando el puerto 3000
Al ir a localhost:3000 podremos ver la página por defecto del proyecto
![Rails startup page screenshot](https://guides.rubyonrails.org/images/getting_started/rails_welcome.png)

Agregamos librería para autenticación

    bundle add devise
    rails generate devise:install
    rails generate devise User
Esto nos creará el modelo user, que usaremos más adelante

Opcionalmente podemos exportar las vistas para posterior modificación

    rails g devise:views

Crearemos nuestro primer modelo, usando scaffold

    rails generate scaffold Post name:string title:string content:text

Esto creará muchos archivos, modelos, migraciones, controladores, vistas y test son lo más relevante

En localhost:3000/posts veremos todos los posts creados

Podemos crear nuevos modelos utilizando nuestra consola de rails

    bin/rails console
    Post.create(name: 'Nuevo Post', title: 'Aprendiendo Rails', content: 'Lorem Ipsum')

Crearemos nuestro modelo comments usando nuevamente scaffold

    rails generate scaffold Comments content:text reaction:integer
    rails db:mmigrate

Luego creamos una relación entre comentarios y posts, es decir un comentario pertenece a un post, y un post puede tener muchos comentarios

    rails generate migration AddPostToComments post:references
    rails db:migrate

Intetemos crear un post via consola

    Comment.create(content: 'esto es un comentario')
    Comment.create(content: 'esto es un comentario', post_id: Post.first.id)
    Comment.create(content: 'esto es otro comentario', post: Post.first)

Agregamos relación entre user y posts

    rails generate migration AddUserToPost user:references
    rails db:migrate

Ups falló porque existen post que no tienen user_id
Borramos todo y corremos migración

    Comment.delete_all
    Post.delete_all



