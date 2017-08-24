
#status
puts "Destroy all status"
Status.destroy_all
puts "Start create status"
Status.create(name: "En attente de traitement")
Status.create(name: "Commande en cours")
Status.create(name: "Intervention programmée")
Status.create(name: "Intervention en cours")
Status.create(name: "Résolu")
Status.create(name: "Annulé")
puts "all status are created"

#priority
puts "Destroy all priority"
Priority.destroy_all
puts "Start create priority"
Priority.create(name: "Faible")
Priority.create(name: "Normale")
Priority.create(name: "Haute")
Priority.create(name: "Urgente")
puts "all priority are created"

#furnitures
puts "Destroy all furnitures"
Furniture.destroy_all
puts "Start create furnitures"
Furniture.create(name: "Immeuble / Commerce / Monument")
Furniture.create(name: "Chaussée / Voirie")
Furniture.create(name: "Signalétique / Eclairage")
Furniture.create(name: "Parcs / Jardins")
Furniture.create(name: "Mobiliers urbains")
puts "all furnitures are created"


#degradations
puts "Destroy all degradations"
Degradation.destroy_all
puts "Start create degradations"
Degradation.create(name: "Détérioration / Casse")
Degradation.create(name: "Vol / Disparition")
Degradation.create(name: "Fuite d'eau")
Degradation.create(name: "Graffitis / Affiches")
Degradation.create(name: "Décharge sauvage / Objets abandonnés")
Degradation.create(name: "Stationnement / Epave")
Degradation.create(name: "Animal errant / Essaim / Rongeurs")
Degradation.create(name: "Propreté")
Degradation.create(name: "Nuisance sonore")
Degradation.create(name: "Sécurité")
puts "all degradations are created"


# puts "Destroy all cities"
# City.destroy_all
# puts "Start create cities"
# City.create(name: "Guran", zip_code: 31440, insee_code: 31235, population: 47,
#   density: 9, area: 5.3, region: "Midi-Pyrénées", department: "Haute-Garonne",
#   council_address: "Place de la Mairie", council_website: "Site non renseigné",
#   council_email: "commune-de-guran@orange.fr", council_phone: "05 61 88 59 77",
#   city_latitude: 42.895421056, city_longitude: 0.722774837437)
# puts "cities are created"


# puts "Destroy all reports"
# Report.destroy_all
# puts "Start create reports"
# Report.create(submit_date: Date.today, address: "12, place de la mairie, 31440 Guran",
#   report_latitude: 42.895321056 , report_longitude: 0.782784837437, description: "c'est la catastrophe",
#   degradation_id: 1, furniture_id: 1, city_id: 1, priority_id: 2, status_id: 1)

# Report.create(submit_date: Date.today, address: "12, place de la mairie, 31440 Guran",
#   report_latitude: 42.695321056 , report_longitude: 0.752784837437, description: "c'est deugeul",
#   degradation_id: 2, furniture_id: 2, city_id: 1, priority_id: 3, status_id: 1)

# Report.create(submit_date: Date.today, address: "2, place de la mairie, 31440 Guran",
#   report_latitude: 42.295321056 , report_longitude: 0.722784837437, description: "Au secours",
#   degradation_id: 3, furniture_id: 3, city_id: 1, priority_id: 2, status_id: 2)

# Report.create(submit_date: Date.today, address: "2, place de la mairie, 31440 Guran",
#   report_latitude: 42.285321056 , report_longitude: 0.722784837437, description: "Au secours",
#   degradation_id: 4, furniture_id: 4, city_id: 1, priority_id: 2, status_id: 3)

# Report.create(submit_date: Date.today, address: "2, place de la mairie, 31440 Guran",
#   report_latitude: 42.785321056 , report_longitude: 0.822784837437, description: "Au secours",
#   degradation_id: 5, furniture_id: 5, city_id: 1, priority_id: 2, status_id: 5)

# Report.create(submit_date: Date.today, address: "2, place de la mairie, 31440 Guran",
#   report_latitude: 42.485321056 , report_longitude: 0.622784837437, description: "Au secours",
#   degradation_id: 6, furniture_id: 3, city_id: 1, priority_id: 2, status_id: 4)

# puts "all reports are created"
