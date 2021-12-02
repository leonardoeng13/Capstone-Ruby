#-------------------------------------------------------------------------------------#
#                           Capstone Ruby Project  2.0 version                        #
# Project Participants: Leo de Andrade                                                #
#                       Herbert Orellana                                              #
#                       Laylo Khodjaeva                                               #
#                       Juan Luis G                                                   #
#                                                                                     #
# In this project, you will create a console app that will help you to keep a record  #
# of different types of things you won: books, music albums, movies, and games.       #
# Everything will be based on the UML class diagram presented below. The data will be #
# stored in JSON files but you will also prepare a database with tables structure     #
# analogical to your program's class structure.                                       #
#                                                                                     #
#-------------------------------------------------------------------------------------#

require_relative './module/app'

def main
  app = App.new
  app.run
end

main
