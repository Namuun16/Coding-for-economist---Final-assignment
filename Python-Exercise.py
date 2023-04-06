import requests
import csv

url = 'https://github.com/Namuun16/Coding-for-economist---Final-assignment/blob/main/city-size-japan.csv'
response = requests.get(url)

csv_data = response.content.decode('utf-8')
reader = csv.reader(csv_data.splitlines(), delimiter=',')

for row in reader:
	print(row)

host_name = url[8:17]
