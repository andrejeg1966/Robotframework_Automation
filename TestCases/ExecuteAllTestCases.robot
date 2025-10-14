
#execute all test cases from directory. Terminal command: robot <Directory>\

#execute with regular expreson: command: robot <Directory>\DDT*.robot

#parallel execution: pabot --processes 2 <Directory>DDT*.robot
#2 means two test cases should be executed
#create a specific output folder: pabot --processes 2 --outputdir Result <Directory>DDT*.robot

#run bat file
#create a bat file. see example in project folder run.bat
#from pYCharm use command run cmd file