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
6. For each Project add following packages: File/Setting/Python Interpreter
   selenium, robotframework and robotframework-seleniumlibrary and for data Driver robotframework-datadriver
6. In PyCharm add Plugin IntelliBotSeleniumLibrary and other plugins. 

File extensions
test case --> .robot
Excel --> .xls
Notepad --> .txt
python --> .py

Web Driver set into C:\Program Files (x86)\Python\Python313\Scripts and configure path of environment variable


Library:
	SeleniumLibrary -> for selenium
	1. Install in PyCharm File/Setting/Python Interpreter: robotframework-seleniumlibrary

	Database
	1. Install in PyCharm File/Setting/Python Interpreter: robotframework-databaselibrary
	2. Install in PyCharm File/Setting/Python Interpreter: PyMySQL

	Webrowser.
	1. pip install robotframework-browser
	2. run command in cmd also in robotframework terminal: rfbrowser init

Parallel Execution
1. Install in PyCharm File/Setting/Python Interpreter: robotframework-pabot
2. pip install -U robotframework-pabot

**************Implemented****************
SeleniumLibrary
	DDT built
	DDT CSV
	DDT Excels
	POM
	Parallel Test
	Variable
	Foor llop
	If Else
	Web Elements
	Xpath
	CSS locators
	Timeouts
	BDD
	
Browser

RequestsLibrary
	 GET
	 POST
	 PUT
	 DELETE
	 JSONLibrary
	
Standard Library
	Built
	String
	DataTime
	Collections





