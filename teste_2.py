from tabula import *
from shutil import make_archive
import pandas as pd

file_path = r'C:\ic_exam\Anexo_I_Rol_2021RN_465.2021_RN473_RN478_RN480_RN513_RN536.pdf'  # annex that will be modified
convert_into(file_path, r'C:\ic_exam\Anexo_I_exercice2.csv', output_format='csv', pages='all',
             java_options="-Dfile.encoding=UTF-8")  # pdf to csv

print('pdf converted')
df = pd.read_csv(r'C:\ic_exam\Anexo_I_exercice2.csv',  # ESCAPECHAR LINE
                 encoding='UTF-8',
                 sep=',',
                 engine='python',
                 on_bad_lines='skip')  # turning the csv to a data frame to modify it

print('csv turned into a data frame')

# those liines correct and adjust the data frame to fit the csv purpose, basically, cleaning data
df.replace('OD', value='Seg. Odontológica', inplace=True, regex=True)  # doing the bonus
df.replace('AMB', value='Seg. Ambulatorial', inplace=True, regex=True)  # doing the bonus

df.replace(r'RN\r(alteração)', value='RN', inplace=True, regex=True)  # protecting the scripts from scapechars
df.replace(r'\r', value=' ', inplace=True, regex=True)  # prevents eventual non wanted line jumps because windows´s \r == \
df.replace(r'\\', value=' ', inplace=True, regex=True)  # protecting the scripts from scapechars
df.replace(r'/', value=' ', inplace=True, regex=True)  # protecting the scripts from scapechars
df.replace(r'\f', value=' ', inplace=True, regex=True)  # protecting the scripts from scapechars
df.replace(r'\r\n', value=' ', inplace=True, regex=True)  # protecting the scripts from scapechars
df.replace(r'\n\r', value=' ', inplace=True, regex=True)  # protecting the scripts from scapechars

df.drop([2933, 2935], axis=0, inplace=True)
df.drop(df.index[df['DUT'] == 'DUT'], inplace=True) # as the pdf has multiple headings, we need to delete the duplicate heading rows

print('bonus done')

header = ['PROCEDIMENTO', 'RN', 'VIGÊNCIA', 'OD', 'AMB', 'HCO', 'HSO', 'REF', 'PAC', 'DUT', 'SUBGRUPO', 'GRUPO',
          'CAPÍTULO']  # sheet headers
df.to_csv(r'C:\ic_exam\Anexo_I_exercice2.csv', encoding='UTF-8', sep=';', header=header, line_terminator='\n')

print('edited data frame turned into a CSV file at C:/ic_exam')

make_archive(r'C:\zipped_files\Teste_Leonardo_Nunes_Muniz', 'zip', r'C:\ic_exam', r'C:\ic_exam\Anexo_I_exercice2.csv')  # zips it

print('csv zipped at C:/zipped_files')
