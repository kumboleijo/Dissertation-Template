#!/Library/Frameworks/Python.framework/Versions/3.6/bin/python3
import os
from shutil import copyfile, copy

version = '1.1.0'

print('------------------------------')
print('Update script for LaTex project by Kumboleijo')
print('Version: ' + version)
print('------------------------------')
print()

# clone git repo
os.system("git clone https://github.com/kumboleijo/dissertation-template.git")

# vars
source = 'dissertation-template/'
counter = 0
specialCounter = 0

# common files
ausarbeitung = 'Ausarbeitung.tex'
expose = 'Expose.tex'
exzerpt = 'Exzerpt.tex'
notes = 'Notes.tex'
compile = 'compile.sh'
countWords = 'countWords.sh'
update = 'update.py'
dependecies = '00_Data/dependencies.tex'

# special files
vars = '00_Data/vars.tex'
toggles = '00_Data/toggles.tex'
customTitlepage = '00_Data/00_Chapters/customTitlepage.tex'
abstractContent = '00_Data/00_Chapters/abstract.tex'
exposeContent = '00_Data/00_Chapters/expose.tex'
exzerptContent = '00_Data/00_Chapters/exzerpt.tex'
notesContent = '00_Data/00_Chapters/notes.tex'
appendixContent = '00_Data/00_Chapters/appendix.tex'

commonFiles = [ausarbeitung, expose, exzerpt,
               notes, compile, countWords, update, dependecies]
specialFiles = [vars, toggles, customTitlepage, abstractContent, exposeContent,
                exzerptContent, notesContent, appendixContent]

commonFilesToUpdate = []
specialFilesToUpdate = []

print('------------------------------')
print('update latex project...')
print(' ')
print('------------------------------')
print('source project: ' + source)
print('common files: which files do you want to update? (press enter to update file / type n to ignore this file)')
print('------------------------------')
for file in commonFiles:
    select = input(str(counter) + '\t' + file)
    counter = counter+1

    if select == '':
        commonFilesToUpdate.append(file)
    elif select == 'n':
        pass
    pass
counter = 0
print('------------------------------')
print('selected common files:')
print('------------------------------')
for file in commonFilesToUpdate:
    print(str(counter) + '\t' + file)
    counter = counter+1
counter = 0
print('------------------------------')
print('update common files...')
print('------------------------------')
for file in commonFilesToUpdate:
    status = os.path.isfile(source+file)
    print(str(counter) + '\t' + str(status) + '\t' + file)
    counter = counter+1

    if status:
        copy(source+file, file)
    pass
print('------------------------------')
print('special files: which files do you want to update? (press enter to IGNORE the file / type y to update)')
print('------------------------------')
for file in specialFiles:
    select = input(str(specialCounter) + '\t' + file)
    specialCounter = specialCounter+1

    if select == 'y':
        specialFilesToUpdate.append(file)
    elif select == '':
        pass
    pass
specialCounter = 0
print('------------------------------')
print('selected special files:')
print('------------------------------')
for file in specialFilesToUpdate:
    print(str(specialCounter) + '\t' + file)
    specialCounter = specialCounter+1
specialCounter = 0
print('------------------------------')
print('update special files...')
print('------------------------------')
for file in specialFilesToUpdate:
    status = os.path.isfile(source+file)
    print(str(specialCounter) + '\t' + str(status) + '\t' + file)
    specialCounter = specialCounter+1

    if status:
        copy(source+file, file)
    pass
print('------------------------------')

# delete cloned git repo
os.system("rm -rf " + source)

#os.system("bash compile.sh all")
# copy( source, destination )

print
print('------------------------------')
print('Update script for LaTex project by Kumboleijo')
print('Version: ' + version)
print('------------------------------')
print()
