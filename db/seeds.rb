# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# SHELTERS
Shelter.create! name: "Control Animal Municipal Tijuana", link: "http://www.tijuana.gob.mx/dependencias/CAM/Principal.aspx", description: "Adopta una Mascota..."
shelter_camt = User.new email: "shelter@mail.com", password: "12345678", address: "Control Animal Municipal, Boulevard Insurgentes, Río Tijuana 3a. Etapa, Tijuana, Baja California", lonlat: RGeo::Geographic.spherical_factory(srid: 4326).point(-116.9011420564275, 32.460726068030425), phone: "6649737006"
shelter_camt.userable = Shelter.last
shelter_camt.save!

10.times do |t|
  Pet.create! user_id: User.last.id, specie: "dog", name: "max #{t}", breed: "mix", gender: "female", age: "young", size: "small", coat: "short", color: "brown", special_needs: false, description: "#{t} Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla finibus neque dolor, tempus pulvinar quam faucibus euismod. Fusce luctus sapien eu vulputate aliquam.", is_adopted: false
  Pet.last.images.attach(io: File.open(File.join(Rails.root, "app/assets/images/camt-1.jpeg")), filename: "max.jpg")
  Pet.create! user_id: User.last.id, specie: "dog", name: "clara #{t}", breed: "mix", gender: "female", age: "young", size: "small", coat: "short", color: "black", special_needs: false, description: "#{t} Pellentesque in leo lorem. Ut quis ex dolor. Etiam quis purus sit amet lorem laoreet aliquam. Ut nulla neque, dapibus ultricies lorem a, volutpat ullamcorper leo.", is_adopted: false
  Pet.last.images.attach(io: File.open(File.join(Rails.root, "app/assets/images/camt-2.jpeg")), filename: "clara.jpg")
  Pet.create! user_id: User.last.id, specie: "dog", name: "chuck #{t}", breed: "mix", gender: "male", age: "adult", size: "small", coat: "curly", color: "white", special_needs: false, description: "#{t} In interdum urna sed nisl tempor, non cursus sem malesuada. Suspendisse efficitur rutrum lectus sit amet aliquam. Nulla ornare tempus dui eget tincidunt.", is_adopted: false
  Pet.last.images.attach(io: File.open(File.join(Rails.root, "app/assets/images/camt-3.jpg")), filename: "chuck.jpg")
end

Shelter.create! name: "Bastet Cat Cafe", link: "http://bastetcatcafe.com/", description: "Somos un café temático que promueve la concientización y bienestar de las mascotas."
shelter_bastet = User.new email: "info@bastetcatcafe.com", password: "12345678", address: "Bastet Cat Café, Gladiolas, El Prado, Tijuana, Baja California", lonlat: RGeo::Geographic.spherical_factory(srid: 4326).point(-116.9877720147634, 32.51030143749322), phone: "6645266353"
shelter_bastet.userable = Shelter.last
shelter_bastet.save!

Pet.create! user_id: User.last.id, specie: "cat", name: "teddy", breed: "Russian Blue", gender: "male", age: "adult", size: "medium", coat: "short", color: "gray, silver", special_needs: false, description: "This is Teddy! He is a 5 yr old Russian Blue, and he has the stunning good looks to match his tremendous personality. Teddy is so big (17 lbs) and bold, that he would prefer to be your only pet, as he requires all of the attention. Also, Teddy's preferences gear towards grownups, so an adult-only home, please. Teddy is quite the character, and will bring you much laughter and joy, so please call 310-278-2935 if interested in meeting him! ", is_adopted: false
Pet.last.images.attach(io: File.open(File.join(Rails.root, "app/assets/images/bastet-1.jpg")), filename: "teddy.jpg")
Pet.create! user_id: User.last.id, specie: "cat", name: "bella", breed: "mix", gender: "female", age: "young", size: "small", coat: "short", color: "orange, red", special_needs: false, description: "This orange beauty is Bella! She is 6 weeks old and will be looking for her new home very soon! Bella has two siblings, Alice and Rosalie, and she would love to go home with one of them if you do not already have another feline friend at home. Please call 310-278-2935!", is_adopted: false
Pet.last.images.attach(io: File.open(File.join(Rails.root, "app/assets/images/bastet-2.jpg")), filename: "bella.jpg")
Pet.create! user_id: User.last.id, specie: "cat", name: "moose", breed: "domestic", gender: "male", age: "adult", size: "medium", coat: "large", color: "black", special_needs: false, description: "Moose loves his sisters, Squirrel and Natasha but is still a little timid with people and would benefit from some quiet, gentle handling. He is a goofy boy who loves food and treats.", is_adopted: false
Pet.last.images.attach(io: File.open(File.join(Rails.root, "app/assets/images/bastet-3.jpg")), filename: "moose.jpg")

Shelter.create! name: "Pitbulls Nueva Vida", link: "https://pitbulls-nueva-vida.ueniweb.com/", description: "Mejor refugio de animales en Tijuana"
shelter_pnv = User.new email: "peimbert_13@hotmail.com", password: "12345678", address: "Pitbulls Nueva Vida, Poblado Delejido Francisco Villa, Tijuana, Baja California", lonlat: RGeo::Geographic.spherical_factory(srid: 4326).point(-116.89525803699777, 32.51646391920694), phone: "6646010866"
shelter_pnv.userable = Shelter.last
shelter_pnv.save!

Pet.create! user_id: User.last.id, specie: "dog", name: "hattie", breed: "Husky, German shepherd", gender: "female", age: "young", size: "large", coat: "medium", color: "white, cream", special_needs: false, description: "This is Hattie!!! Hattie is 10 month old female Husky/German Shepherd mix that came in recently with an injured front leg. Her leg has healed and she is definitely ready to find her new home. Hattie is INCREDIBLY sweet with people and she is just fine around large dogs.", is_adopted: false
Pet.last.images.attach(io: File.open(File.join(Rails.root, "app/assets/images/pnv-1.jpg")), filename: "hattie.jpg")
Pet.create! user_id: User.last.id, specie: "dog", name: "colin", breed: "pit bull terrier", gender: "male", age: "young", size: "large", coat: "short", color: "gray, white", special_needs: false, description: "This boy was found as a stray in a rural field and was seized using a catch pole and brought into one of the deadliest kill shelters in in Southern California, He was shut down and terrified of all people and dogs.", is_adopted: false
Pet.last.images.attach(io: File.open(File.join(Rails.root, "app/assets/images/pnv-2.jpg")), filename: "colin.jpg")
Pet.create! user_id: User.last.id, specie: "dog", name: "lou", breed: "pit bull terrier", gender: "male", age: "adult", size: "large", coat: "short", color: "black, white, cream", special_needs: false, description: "Lou is a 6 year old pitbull mix. He has all of his basic training, walks great on a leash, and is very polite in the house. He is happy to go for long walks, or to chill and watch TV. Lou will be an excellent companion to someone looking for a loyal dog who wants a simple life with his best friend.", is_adopted: false
Pet.last.images.attach(io: File.open(File.join(Rails.root, "app/assets/images/pnv-3.jpg")), filename: "lou.jpg")

# RESCUERS
Rescuer.create! name: "Sophia Duncan"
rescuer_sd = User.new email: "rescuer@mail.com", password: "12345678", address: "Parque de la Amistad, Boulevard Alberto Limón Padilla, Mesa de Otay, Tijuana, Baja California", lonlat: RGeo::Geographic.spherical_factory(srid: 4326).point(-116.94080614070096, 32.535240699240795), phone: "6643334444"
rescuer_sd.userable = Rescuer.last
rescuer_sd.save!

10.times do |t|
  Pet.create! user_id: User.last.id, specie: "cat", name: "duchess #{t}", breed: "mix", gender: "female", age: "young", size: "medium", coat: "short", color: "white", special_needs: false, description: "#{t} This beautiful, curly-eared princess is looking for her forever home. She is super affectionate and loves to play and cuddle all day long.", is_adopted: false
  Pet.last.images.attach(io: File.open(File.join(Rails.root, "app/assets/images/sd-1.jpg")), filename: "duchess.jpg")
  Pet.create! user_id: User.last.id, specie: "cat", name: "freddy #{t}", breed: "mix", gender: "male", age: "young", size: "medium", coat: "short", color: "gray", special_needs: false, description: " #{t} Freddy is a sweet, handsome silver boy who loves his brother, Mercury.", is_adopted: false
  Pet.last.images.attach(io: File.open(File.join(Rails.root, "app/assets/images/sd-2.jpg")), filename: "freddy.jpg")
  Pet.create! user_id: User.last.id, specie: "cat", name: "garfield #{t}", breed: "mix", gender: "male", age: "young", size: "small", coat: "long", color: "orange, white", special_needs: false, description: " #{t} Exceptionally LOVING and social Garfield was rescued from a high Kill shelter.", is_adopted: false
  Pet.last.images.attach(io: File.open(File.join(Rails.root, "app/assets/images/sd-3.jpg")), filename: "garfield.jpg")
end

Rescuer.create! name: "Kate Smith"
rescuer_ks = User.new email: "kate@mail.com", password: "12345678", address: "Parque Teniente Guerrero, Carrillo Puerto, Zona Centro, Tijuana, Baja California", lonlat: RGeo::Geographic.spherical_factory(srid: 4326).point(-117.0455319301074, 32.53284297005623), phone: "6643334444"
rescuer_ks.userable = Rescuer.last
rescuer_ks.save!

Pet.create! user_id: User.last.id, specie: "cat", name: "frankie", breed: "mix", gender: "male", age: "puppy", size: "small", coat: "long", color: "black, white", special_needs: false, description: "This tiny baby was found alone on the streets of Tijuana. He is tiny and so sweet! Too young for vaccination but Felv/Fiv negative.", is_adopted: false
Pet.last.images.attach(io: File.open(File.join(Rails.root, "app/assets/images/ks-1.jpg")), filename: "frankie.jpg")
Pet.create! user_id: User.last.id, specie: "cat", name: "mariana", breed: "mix", gender: "female", age: "puppy", size: "small", coat: "short", color: "brown", special_needs: false, description: "Meet Mariana! This shy little kitten takes a little while to warm up but is cute as a button. She was found on the streets of South LA fending for herself and is now so grateful for a foster home. She would love to be adopted to a home with another kitten or playful adult cat!", is_adopted: false
Pet.last.images.attach(io: File.open(File.join(Rails.root, "app/assets/images/ks-2.jpg")), filename: "mariana.jpg")
Pet.create! user_id: User.last.id, specie: "cat", name: "lasagna", breed: "mix", gender: "male", age: "puppy", size: "small", coat: "short", color: "orange, red", special_needs: false, description: "Lorem ipsum", is_adopted: false
Pet.last.images.attach(io: File.open(File.join(Rails.root, "app/assets/images/ks-3.jpg")), filename: "lasagna.jpg")

# ADOPTER

Adopter.create! name: "Amelia", last_name: "Cooper"
adopter_user = User.new email: "adopter@mail.com", password: "12345678", address: "Parque Morelos, Avenida de los Insurgentes, Guadalajara, Tijuana, Baja California", lonlat: RGeo::Geographic.spherical_factory(srid: 4326).point(-116.93915575633058, 32.49838201377921), phone: "0003334444"
adopter_user.userable = Adopter.last
adopter_user.save!
