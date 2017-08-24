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
Degradation.create(name: "Graffitis / tags / Affiches")
Degradation.create(name: "Décharges sauvages / Objets abandonés")
Degradation.create(name: "Stationnement / Epave")
Degradation.create(name: "Animal errant / Essaim / Rongeurs")
Degradation.create(name: "Propreté")
Degradation.create(name: "Nuisance sonore")
Degradation.create(name: "Sécurité")
puts "all degradations are created"

