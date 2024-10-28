import json


with open('/data/mgovind/EgoExo_QA_pairs/bestexo_keysteps.json', 'r') as f :
    best_exo_data = json.load(f)


best_exo_keysteps = []

for split , ids in data.items():
    best_exo_keysteps.extend(ids)

print(len(best_exo_keysteps))


with 


for name in best_exo_keysteps:
    name_list = name.split('_')
    if 'exo' in name_list[-1] :
        name_list[-1] = 'ego.mp4'
        ego_video = '_'.join(name_list)



for split , ids in data.items():
        best_exo_keysteps.extend(ids)