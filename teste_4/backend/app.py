from flask import Flask
from flask_cors import CORS
import pandas as pd

file_path = r'C:\data\Relatorio_cadop teste 4.csv'

df = pd.read_csv(file_path,
                 encoding='LATIN-1',
                 sep=';',
                 engine='python',
                 on_bad_lines='skip',
                 skiprows=[0, 1])  # turning the csv to a data frame to modify it

cols  = df.columns
df.columns = cols.map(lambda x: x.replace(' ', '_') if isinstance(x, (str)) else x) #remove the bad characters from the columns names

app = Flask(__name__)
CORS(app)

# whenever it recieves the input by the url it searches the finds strings which the substring op_name is contained
@app.route('/get/<string:op_name>', methods = ['GET'])
def get_names(op_name):
    op_name = op_name.upper()
    df2 = df.loc[df['Razão_Social'].str.contains(op_name)].head() # gets the top 5
    df2 = df2['Razão_Social']
    return df2.to_dict()

if __name__ == "__main__":
    app.run(debug=False)
