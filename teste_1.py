from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.service import Service
import os
from shutil import make_archive
from time import sleep

# creates the directory that will recieve the files if it doesnt exist
try:
    os.makedirs(r'C:\ic_exam')
    os.makedirs(r'C:\zipped_files')
    print('Directorys created')
except FileExistsError:
    print('Directorys already exists')

URL = 'https://www.gov.br/ans/pt-br/assuntos/consumidor/o-que-o-seu-plano-de-saude-deve-cobrir-1/o-que-e-o-rol-de-procedimentos-e-evento-em-saude'
S = Service(r'C:\chromedriver_win32/chromedriver.exe')  # chromedrive path

chrome_profile = webdriver.ChromeOptions()
profile = {"plugins.always_open_pdf_externally": True,  # disables the preview pluggin
           "download.default_directory": r'C:\ic_exam'}  # sets the default donwload folder
chrome_profile.add_experimental_option("prefs", profile)
chrome_profile.headless = False
driver = webdriver.Chrome(service=S, options=chrome_profile)
driver.get(URL)  # open the URL

print('opened the URL')

sleep(1.4)  # waits for the page to load, prevents errors in case of slow internet
annex = driver.find_elements(By.CLASS_NAME, 'callout')  # gets all the elements with 'callout' in te class name

for elements in annex:  # those 'callout' elements were containers, so we need to access the information in it
    a = elements.find_element(By.TAG_NAME, 'a')
    if 'Anexo' in a.get_attribute('innerHTML'):
        driver.get(a.get_attribute('href'))  # opens the annex
        print(f'downloaded {a.get_attribute("href")} succefully')

haviest_file = r'C:\ic_exam\Anexo_II_DUT_2021_RN_465.2021_tea.br_RN473_RN477_RN478_RN480_RN513_RN536.pdf.crdownload'
sleep(4) # waiting for the files to donwload
print('starting to zip the files, this can take a while...')
make_archive(r'C:\zipped_files\files', 'zip', r'C:\ic_exam',
             r'C:\ic_exam')  # zipps the folder and sends it to another folder
print('.zip created at C:/zipped_files')
driver.quit()
