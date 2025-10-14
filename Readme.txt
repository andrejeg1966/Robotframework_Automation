1. Install Python
2. Install PyCharm
3. C:\Windows\System32 -> pip install selenium
4. C:\Windows\System32 -> pip install robotframework 
   check the Installation: pip show robotframework
   Multiple Options for install robot Framework:
   pip install --upgrade roborframework
   pip install robotframework==2.9.2
   pip uninstall robotframework
   Other pip potions:
   pip list
   pip check robotframework
   pip install -U robotframework-datadriver[XLS] -> to support XLSX 
5. C:\Windows\System32 -> pip install robotframework-seleniumlibrary
6. For each Project add following packages: 
File/Setting/Python Interpreter
selenium, robotframework and robotframework-seleniumlibrary and for data Driver robotframework-datadriver
6. in PyCharm add Plugin IntelliBotSeleniumLibrary ( inSettings from PyCharm)

File extensions
test case --> .robot
Excel --> .xls
Notepad --> .txt
python --> .py

Driver set into C:\Program Files (x86)\Python\Python313\Scripts and configure path Environment

*** Settings ***
Library  SeleniumLibrary -> for selenium

Validation: with Keyword <should>

Parallel Execution
1. Install in PyCharm File/Setting/Python Interpreter: robotframework-pabot
2. pip install -U robotframework-pabot

Database
1. Install in PyCharm File/Setting/Python Interpreter: robotframework-databaselibrary
2. Install in PyCharm File/Setting/Python Interpreter: PyMySQL





