#!/Library/Frameworks/Python.framework/Versions/3.6/bin/python3
import os
from shutil import copyfile, copy

# vars
source = '/Users/jonas/Documents/GitLab/01_Private/wissenschaftliche-arbeit-template-latex/'
counter = 0

# files
ausarbeitung = 'Ausarbeitung.tex'
expose = 'Expose.tex'
notes = 'Notes.tex'
dependecies = '00_Data/dependencies.tex'
vars = '00_Data/vars.tex'

files = [ausarbeitung,expose,notes,dependecies,vars]
filesToUpdate = []

print( '------------------------------' )
print( 'update latex project...' )
print ( ' ' )
print( '------------------------------' )
print( 'source project: ' + source )
print( 'which files do you want to update? (press enter to update file / type n to ignore this file)' )
print( '------------------------------' )
for file in files:
    select = input( str(counter) + '\t' + file )
    counter = counter+1

    if select == '':
        filesToUpdate.append(file)
    elif select == 'n':
        pass
    pass
counter = 0
print( '------------------------------' )
print( 'selected files:' ) 
print( '------------------------------' )
for file in filesToUpdate:
    print( str(counter) + '\t' + file )
    counter = counter+1
counter = 0
print( '------------------------------' )
print( 'update files...' )
print( '------------------------------' )
for file in filesToUpdate:
    status = os.path.isfile( source+file )
    print( str(counter) + '\t' + str(status) + '\t' + file )
    counter = counter+1

    if status: 
        copy( source+file, file )
    pass
print( '------------------------------' )

# copy( source, destination )
