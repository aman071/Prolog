import networkx as nx
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.pyplot import figure
import csv

G = nx.Graph()
df=pd.read_csv('roaddistance1.csv')

leftmost_cities=list(df['Cities'])
columns_cities_cities=list(df.columns)
columns_cities=columns_cities_cities[1:]

df.set_index('Cities', inplace=True)

for i in range(len(leftmost_cities)):
	for j in range(len(columns_cities)):
		if leftmost_cities[i] != columns_cities[j]:
			G.add_edge(leftmost_cities[i], columns_cities[j])
			# print(df.loc[leftmost_cities[i], columns_cities[j]], leftmost_cities[i], columns_cities[j])
			G[leftmost_cities[i]][columns_cities[j]]['weight']=int(df.loc[leftmost_cities[i], columns_cities[j]])

# print('# of edges: {}'.format(G.number_of_edges()))
# print('# of nodes: {}'.format(G.number_of_nodes()))

# figure(figsize=(47, 20))
# nx.draw(G)
# plt.show()

# print(nx.dijkstra_path(G, 'Agartala', 'Ahmedabad', 'weight'))
# print(nx.dijkstra_path_length(G, 'Agartala', 'Ahmedabad', 'weight'))

# print(leftmost_cities)
# print(columns_cities)
with open('heuristic.csv', 'w', newline='\n') as file:
	writer = csv.writer(file)
	writer.writerow(columns_cities_cities)

	for i in range(len(leftmost_cities)):
		length=list()
		for j in range(len(columns_cities)):
			if leftmost_cities[i] != columns_cities[j]:
				# print('doing ',leftmost_cities[i], columns_cities[j], i,j)
				length.append( nx.dijkstra_path_length(G, leftmost_cities[i], columns_cities[j], 'weight') )

			else:
				length.append('-')
		
		length.insert(0, leftmost_cities[i])
		writer.writerow(length)

