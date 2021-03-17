# Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)

# General info
This project attempts to model financial models using a simple *ARIMA* model. 

# Technologies
Project is created with:
* Python version: 3.8.*
* R version: 4.0.4
	
# Setup
It is a best practice to run program files in a virtual environment as
it allows the program to run with it's own separate dependencies.

To initialize a virtual environment use the command:
```console
cd path_to_project/
python -m venv .venv
```
To activate the environment:

Mac/Linux:
```console
source my_env/bin/activate
```
Windows:
```console
.\venv\Scripts\activate
```
To verify that your virtual environment is activated, your command line
should look like the following.
```console
(.venv) ~path_to_project\Stats-6A03>
```
Then, to install the required dependices, run the following command.
```console
pip install -r requirements.txt
```
To deactivate simply use the command:
```console
deactivate
```