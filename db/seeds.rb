User.delete_all
Category.delete_all
Business.delete_all
Service.delete_all
Employee.delete_all
Appointment.delete_all

# User.create!(name: "Lauren Smith", email: "lauren@gmail.com", password: "password")


#  HAIR SALONS

manchester_salon = Business.create!(business_name: "Manchester Salon", password: "password", email: "admin@manchester.com", address: "300 W Grand Ave, Chicago, IL 60654", open_at: DateTime.parse("08:00:00"), close_at: DateTime.parse("20:00:00"), lat: "41.891790", long: "-87.635979", website: "manchestersalon.com", phone: "(312) 291-9662")

xo_salon = Business.create!(business_name: "XO Studio", password: "password", email: "admin@xostudio.com", address: "1065 W. Jackson Blvd, Chicago, IL 60607", open_at: DateTime.parse("10:00:00"), close_at: DateTime.parse("21:00:00"), lat: "41.877837", long: "-87.654234", website: "xostudiochicago.com", phone: "773-935-9077")

cellar_salon = Business.create!(business_name: "Cellar Door Salon & Studio", password: "password", email: "admin@cellardoorsalon.com", address: "1000 W. Adams St., Chicago, IL 60607", open_at: DateTime.parse("11:00:00"), close_at: DateTime.parse("20:00:00"), lat: "41.879149", long: "-87.652479", website: "cellardoorsalon.com", phone: "773-227-9223")

aria_salon = Business.create!(business_name:"Aria Salon", password: "password", email: "admin@ariasalon.com", address: "315 S. Peoria St., Chicago, IL 60607", open_at: DateTime.parse("12:00:00"), close_at: DateTime.parse("21:00:00"), lat: "41.877423", long: "-87.649400", website: "ariasalonchicago.com", phone: "773-544-7532")

twisted_salon = Business.create!(business_name: "Twisted Scissors", password: "password", email: "admin@twistecscissors.com", address: "866 W. Harrison St., Chicago, IL 60607", open_at: DateTime.parse("11:00:00"), close_at: DateTime.parse("20:00:00"), lat: "41.874459", long: "-87.650881", website: "twistedscissorschicago.com", phone: "773-227-1077")

# TATTOO PARLORS

taylor_body_mod = Business.create!(business_name: "Taylor Street Tattoo", password: "password", email: "admin@taylorstreettattoo.com", address: "1150 W Taylor St, Chicago, IL 60607", open_at: DateTime.parse("11:00:00"), close_at: DateTime.parse("20:00:00"), lat: "41.869622", long: "-87.656237", website: "taylorsttattoo.com", phone: "312-455-8288")

great_body_mod = Business.create!(business_name: "Great Lakes Tattoo", password: "password", email: "admin@greatlakestattoo.com", address: "1148 W Grand Ave, Chicago, IL 60642", open_at: DateTime.parse("10:00:00"), close_at: DateTime.parse("21:00:00"), lat: "41.891402", long: "-87.656549", website: "greatlakestattoo.com", phone: "(312) 870-0458")

code_body_mod = Business.create!(business_name: "Code of Conduct", password: "password", email: "admin@codeofconduct.com", address: "14 E 11th St, Chicago, IL 60605", open_at: DateTime.parse("12:00:00"), close_at: DateTime.parse("23:00:00"), lat: "41.869418", long: "-87.626827", website: "codeofconducttattoo.com", phone: "(312) 929-2073")

may_body_mod = Business.create!(business_name: "Mayday Tattoo Co", password: "password", email: "admin@mayday.com", address: "1610 W Grand Ave, Chicago, IL 60622", open_at: DateTime.parse("10:00:00"), close_at: DateTime.parse("21:00:00"), lat: "41.891172", long: "-87.667746", website: "maydaytattooco.com", phone: "(312) 496-3335")

insight_body_mod = Business.create!(business_name: "Insight Studios", password: "password", email: "admin@insightstudio.com", address: "1062 N Milwaukee Ave, Chicago, IL 60642", open_at: DateTime.parse("11:00:00"), close_at: DateTime.parse("22:00:00"), lat: "41.901056", long: "-87.663276", website: "insightstudiosonline.com", phone: "(773) 342-4444")

#  NAILS

jewel_nail = Business.create!(business_name: "Jewel Nail Spa", password: "password", email: "admin@jewelnailspa.com", address: "838 W Adams St, Chicago, IL 60607", open_at: DateTime.parse("09:00:00"), close_at: DateTime.parse("18:00:00"), lat: "41.879312", long: "-87.648838", website: "none.com", phone: "(815) 900-9758")

lacquer_nail = Business.create!(business_name: "Nail Lacquer Salon", password: "password", email: "admin@naillacquer.com", address: "1004 W Monroe St, Chicago, IL 60607", open_at: DateTime.parse("10:00:00"), close_at: DateTime.parse("21:00:00"), lat: "41.880521", long: "-87.652392", website: "none.com", phone: "(312) 850-0897")

hm_nails = Business.create!(business_name: "HM Day Spa", password: "password", email: "admin@hmspa.com", address: "917 W Madison St, Chicago, IL 60607", open_at: DateTime.parse("08:00:00"), close_at: DateTime.parse("18:00:00"), lat: "41.881486", long: "-87.650510", website: "none.com", phone: "(312) 733-9720")

saraya_nail = Business.create!(business_name: "Saraya Salon & Spa", password: "password", email: "admin@saraya.com", address: "1463 S State St, Chicago, IL 60605", open_at: DateTime.parse("09:00:00"), close_at: DateTime.parse("19:00:00"), lat: "41.862354", long: "-87.627224", website: "sarayasalon.com", phone: "(312) 753-3363")

loft_nails = Business.create!(business_name: "The Hair Loft", password: "password", email: "admin@hairloft.com", address: "33 N. Carpenter st, Chicago, IL 60607", open_at: DateTime.parse("09:00:00"), close_at: DateTime.parse("19:00:00"), lat: "41.882514", long: "-87.652943", website: "thehairloftltd.com", phone: "(312) 243-5050")

# SKINCARE

zana_skin = Business.create!(business_name: "Zana", password: "password", email: "admin@zana.com", address: "15 S Racine Ave, Chicago, IL 60607", open_at: DateTime.parse("10:00:00"), close_at: DateTime.parse("18:00:00"), lat: "41.881041", long: "-87.656858", website: "skinbyzana.com", phone: "(312) 428-9262")

lilli_skin = Business.create!(business_name: "lillieAnn’s Massage & Skincare", password: "password", email: "admin@lillieann.com", address: "1260 W Washington Blvd, Chicago, IL 60607", open_at: DateTime.parse("11:00:00"), close_at: DateTime.parse("20:00:00"), lat: "41.883222", long: "-87.659096", website: "lillieanns.com", phone: "(312) 243-1940")

lustre_skin = Business.create!(business_name: "Lustre Skin Boutique", password: "password", email: "admin@lustre.com", address: "1006 W Lake St, Chicago, IL 60607", open_at: DateTime.parse("10:00:00"), close_at: DateTime.parse("20:00:00"), lat: "41.885785", long: "-87.652483", website: "lustreskinboutique.com", phone: "(773) 278-8777")

smuve_skin = Business.create!(business_name: "Smuve Skincare Studio", password: "password", email: "admin@smuve.com", address: "111 N Wabash Ave, Chicago, IL 60602", open_at: DateTime.parse("08:00:00"), close_at: DateTime.parse("20:00:00"), lat: "41.883518", long: "-87.625873", website: "smuveskincare.com", phone: "(312) 912-7101")

hand_skin = Business.create!(business_name: "Hand & Stone Massage & Facial", password: "password", email: "admin@handandstone.com", address: "1130 S Michigan Ave, Chicago, IL 60605", open_at: DateTime.parse("10:00:00"), close_at: DateTime.parse("18:00:00"), lat: "41.868568", long: "-87.624520", website: "handandstone.com", phone: "(312) 753-3312")

# MASSAGE

health_massage = Business.create!(business_name: "Healthy Zu Spa", password: "password", email: "admin@healthyzu.com", address: "120 N Halsted St, Chicago, IL 60661", open_at: DateTime.parse("12:00:00"), close_at: DateTime.parse("21:00:00"), lat: "41.883691", long: "-87.647659", website: "healthyzuspa.com", phone: "(312) 631-3040")

chicago_massage = Business.create!(business_name: "Chicago Touch", password: "password", email: "admin@chicagotouch.com", address: "1335 W Lake St, Chicago, IL 60607", open_at: DateTime.parse("11:00:00"), close_at: DateTime.parse("21:00:00"), lat: "41.885239", long: "-87.660354", website: "chicagotouch.com", phone: "(312) 929-3083")

oxygen_massage = Business.create!(business_name: "Oxygen Spa", password: "password", email: "admin@oxygenspa.com", address: "400 S Green St, Chicago, IL 60607", open_at: DateTime.parse("11:00:00"), close_at: DateTime.parse("21:00:00"), lat: "41.876265", long: "-87.648709", website: "oxygenspastudio.com", phone: "(312) 846-1047")

green_massage = Business.create!(business_name: "Green Spa", password: "password", email: "admin@greenspa.com", address: "114 N Halsted, Chicago, IL 60661", open_at: DateTime.parse("10:00:00"), close_at: DateTime.parse("19:00:00"), lat: "41.883652", long: "-87.647636", website: "massagegreenspa.com", phone: "(312) 226-3651")

vie_massage = Business.create!(business_name: "La Vie Massage", password: "password", email: "admin@lavie.com", address: "123 W Madison St, Chicago, IL 60602", open_at: DateTime.parse("11:00:00"), close_at: DateTime.parse("20:00:00"), lat: "41.881740", long: "-87.631963", website: "laviemassage.com", phone: "(312) 332-1234")

# EMPLOYEES

duke_stylist = manchester_salon.employees.create!(name: "Duke", description: "Incredible stylist with an impressive portfolio who once styled Rihanna.", photo: "https://0.gravatar.com/avatar/6aedd7cf05e69e3af3c91b002a2b87bb?s=256&d=identicon&r=G")

ellie_tattoo =  code_body_mod.employees.create!(name: "Ellie", description: "Best artist in Chicago. Trust her with your next tattoo. She inked 80% of Dennis Rodman", photo: "https://devbootcamp.com/assets/staff/ellie-poley-c0a5b60a6e1eb5a299d3f4d4ec9bddd2.png")

alyssa_facial = zana_skin.employees.create!(name: "Alyssa", description: "Your skin will glow with our best aesthetician. Just ask Cate Blanchet, who is actually 87 years old.", photo: "https://devbootcamp.com/assets/staff/alyssa-diaz-e80c0e9b96ee877b13bc0845245f4866.png")

avner_facial = lilli_skin.employees.create!(name: "Avner", description: "One of the best laser therapy treatments you'll ever have, Avner truly understands skin and will make you look ten years younger. He definitely WON'T burn your skin.", photo: "https://lh6.googleusercontent.com/-uNa5z4apGKc/AAAAAAAAAAI/AAAAAAAAAPU/POHF_19og8s/photo.jpg")

matt_masseuse = vie_massage.employees.create!(name: "Matt", description: "Matt does not mess around. If you have a knot in your back, he WILL find it and un-fuck it.", photo: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQS-jiPQJD0r3alR_DqcmL8ka71NcqvJHqTcWQGplKHEMktEoE0" )

pete_piercer = may_body_mod.employees.create!(name: "Pete", description: "If you need literally anything pierced, come to our most experienced body modifier, Pete. He'll poke holes in your body code.", photo: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAIwAAAAJGU5YWU1ZmE4LTRiYTUtNDJkNS05MzMyLWM2YWU0ODUzMWRiMw.jpg")

jones_nails = loft_nails.employees.create!(name: "Jones", description: "Your delicate fingers are in great hands (forgive the pun) with Jones.", photo: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAegAAAAJGJmZjJiNWMzLWRmYmYtNGE4My05MjkyLTVlMGZhNTNlMDdmMA.jpg")

molly_massage = chicago_massage.employees.create!(name: "Molly", description: "Her experienced and magic fingers will fix you right up", photo: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAkKAAAAJGU4OGNjOGM2LWQ4YmItNDZjNC1hMjJhLWYwNGY3NWY3YmQ4Nw.jpg")


rachel_hair = cellar_salon.employees.create!(name: "Rachel", description: "She works magic with hair, you'll never want to see another stylist.", photo: "https://devbootcamp.com/assets/staff/rachel-feigenbaum-96511c356fe94687c05fc1eb70958c10.png")

katie_massage = green_massage.employees.create!(name: "Katie", description: "Our most experienced massuese, Katie will untangle all your knots.", photo: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAemAAAAJDBmZjdkY2NiLTZlMDEtNDkwMC1iMTZhLTliNjQ2YWVjYWQ3Ng.jpg")

jeff_waxing = lustre_skin.employees.create!(name: "Jeff", description: "Jeff is our most seasoned waxing specialist. He'll painlessly remove your unwanted beard hair using only the hottest of waxes.", photo: "https://media05.regionaut.meinbezirk.at/2014/11/23/7554925_web.jpg?1416754988")

ken_massage = health_massage.employees.create!(name: "Ken", description: "Our most experienced masseuse, appointments are hard to get with Ken, so book if you can!", photo: "https://media.licdn.com/media/p/5/000/28e/17a/32059bc.jpg")

naomi_hair = xo_salon.employees.create!(name: "Naomi", description: "Naomi is one of the premier stylists in Chicago. She invented the side-shave craze for women.", photo: "https://devbootcamp.com/assets/staff/naomi-david-2ebb30e33a0ea39cf2d2d5b92d01622a.png")

bobby_hair = aria_salon.employees.create!(name: "Bobby Gervais", description: "He has tamed his own mane, and can tame yours too.", photo: "https://s-media-cache-ak0.pinimg.com/originals/3c/b2/54/3cb254b0d377a2dedf77bf1b622c515e.png")

nick_massage = oxygen_massage.employees.create!(name: "Nick", description: "Nick began his massage career in the military and has successfully become of the most coveted massage therapists in the Great Chicagoland Area.", photo: "https://media.licdn.com/media/AAEAAQAAAAAAAAfJAAAAJDE0MzFjN2FlLTFhMDItNDhmNC04OWY3LTRmZjJiY2E0MDMyOA.jpg")

west_facial = hand_skin.employees.create!(name: "West", description: "One of the best skincare specialists around, and brightens up the entire room when she's here.", photo: "https://media.licdn.com/media/p/3/000/017/37a/2be7712.jpg")

emily_facial = smuve_skin.employees.create!(name: "Emily", description: "The smiliest one in the room, Emily not only rejeuvenates your skin, but leaves you smiling and glowing.", photo: "https://media.licdn.com/media/p/8/005/07c/173/3432621.jpg")

nick_nails = saraya_nail.employees.create!(name: "Nick", description: "With tender loving care, Nick is one of the foremost nail artists in the greater tri-state area.", photo: "https://pbs.twimg.com/profile_images/778764375649902596/HTXzyDpP.jpg" )

justin_nails = hm_nails.employees.create!(name: "Justin", description: "Justin is not only an artist in the world, he is an artist with your nails. Trust your hands in his.", photo: "https://media.licdn.com/media/AAEAAQAAAAAAAAlHAAAAJDg5ZTljZDA2LWVkMDItNDJmNS04MDhhLTZmMTE2MjYyYmU0MQ.jpg")

waleeta_nails = lacquer_nail.employees.create!(name: "Waleeta", description: "Waleeta has the delicate touch needed for perfect nail styling.", photo: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAkrAAAAJGY4MGViOWU4LTg3OWMtNDcwNC05NGNiLWRjYjliMGYxYTM3NA.jpg")

sam_nails = jewel_nail.employees.create!(name: "Sam", description: "Sam is the Picasso of nail art. But she stays within the lines.", photo: "https://media.licdn.com/media/AAEAAQAAAAAAAAc-AAAAJDgyZmRlZDRkLTcxMWQtNDRjYS1iMTYwLWNkMzYyNDQwZWZhMg.jpg")


em_pierce = insight_body_mod.employees.create!(name: "Em", description: "There's no body part Em can't pierce.", photo: "https://media.licdn.com/media/p/8/005/017/3dc/10e7355.jpg")

noah_tat = great_body_mod.employees.create!(name: "Noah Guy", description: "Don't worry about finding your next great tattoo artist. You already Noah Guy.", photo: "http://static.wixstatic.com/media/7de50c_3124cf4ef8a54cebb1e5ef8fefdd3e8e~mv2_d_2703_1886_s_2.png_srz_376_227_85_22_0.50_1.20_0.00_png_srz")

tyler_tat = taylor_body_mod.employees.create!(name: "Tyler", description: "If you're not careful, Tyler will tattoo something so incredible on you, you'll be on display at MOMA.", photo: "https://media.licdn.com/media/AAEAAQAAAAAAAAjhAAAAJGM5ZmJlZDc3LTc0YWEtNDc2NC1hMTAwLWE1NjE5MGJmMTg5Ng.jpg")

erin_hair = twisted_salon.employees.create!(name: "Erin", description: "Erin will give your flat tresses dimension, your color some pop, and your style some flare.", photo: "https://media.licdn.com/media/p/6/005/061/1f6/0f93f7b.jpg")


#  CATEGORIES
salon = Category.create!(category_type: "Salon Services")
body_mod = Category.create!(category_type: "Body Modification")
nails = Category.create!(category_type: "Nails")
skin_care = Category.create!(category_type: "Skin Care")
massage = Category.create!(category_type: "Massage")


# haircut = Service.create!(service_type: "haircut", category_id: 1)
# hair_color = Service.create!(service_type: "hair color", category_id: 1)
# hair_style = Service.create!(service_type: "hair style", category_id: 1)

# manicure = Service.create!(service_type: "manicure", category_id: 3)

# pedicure = Service.create!(service_type: "pedicure", category_id: 3)

# wax = Service.create!(service_type: "wax", category_id: 1)
# tattoo = Service.create!(service_type: "tattoo", category_id: 2)
# piercing = Service.create!(service_type: "piercing", category_id: 2)
# swedish_massage = Service.create!(service_type: "swedish massage", category_id: 5)
# deep_tissue_massage = Service.create!(service_type: "deep tissue massage", category_id: 5)
# facial = Service.create!(service_type: "facial", category_id: 4)
# laser_treatment = Service.create!(service_type: "laser treatment", category_id: 4)


duke_stylist.services.create!(service_type: "hair", category_id: 1)
duke_stylist.services.create!(service_type: "haircut", category_id: 1)
duke_stylist.services.create!(service_type: "hair style", category_id: 1)
duke_stylist.services.create!(service_type: "hair color", category_id: 1)

ellie_tattoo.services.create!(service_type: "tattoo", category_id: 2)

alyssa_facial.services.create!(service_type: "facial", category_id: 4, business_id: 16)

avner_facial.services.create!(service_type: "laser treatment", category_id: 4, business_id: 17)

matt_masseuse.services.create!(service_type: "swedish massage", category_id: 5, business_id: 21)

pete_piercer.services.create!(service_type: "piercing", category_id: 2, business_id: 7)

jones_nails.services.create!(service_type: "manicure", category_id: 3, business_id: 11)
jones_nails.services.create!(service_type: "pedicure", category_id: 3, business_id: 11)

molly_massage.services.create!(service_type: "deep tissue massage", category_id: 5, business_id: 22)


rachel_hair.services.create!(service_type: "hair cut", category_id: 1, business_id: 2)
rachel_hair.services.create!(service_type: "hair style", category_id: 1, business_id: 2)
rachel_hair.services.create!(service_type: "hair color", category_id: 1, business_id: 2)

katie_massage.services.create!(service_type: "swedish massage", category_id: 5, business_id: 23)

jeff_waxing.services.create!(service_type: "wax", category_id: 1, business_id: 21)

ken_massage.services.create!(service_type: "swedish massage", category_id: 5, business_id: 24)

naomi_hair.services.create!(service_type: "hair cut", category_id: 1, business_id: 4)
naomi_hair.services.create!(service_type: "hair color", category_id: 1, business_id: 4)
naomi_hair.services.create!(service_type: "hair style", category_id: 1, business_id: 4)

bobby_hair.services.create!(service_type: "hair style", category_id: 1, business_id: 5)
bobby_hair.services.create!(service_type: "hair color", category_id: 1, business_id: 5)
bobby_hair.services.create!(service_type: "hair cut", category_id: 1, business_id: 5)

nick_massage.services.create!(service_type: "deep tissue", category_id: 5, business_id: 25)

west_facial.services.create!(service_type: "facial", category_id: 4, business_id: 18)
west_facial.services.create!(service_type: "laser treatment", category_id: 4, business_id: 18)

emily_facial.services.create!(service_type: "facial", category_id: 4, business_id: 19)
emily_facial.services.create!(service_type: "laser treatment", category_id: 4, business_id: 19)

nick_nails.services.create!(service_type: "manicure", category_id: 3, business_id: 12)
nick_nails.services.create!(service_type: "pedicure", category_id: 3, business_id: 12)

justin_nails.services.create!(service_type: "manicure", category_id: 3, business_id: 13)
justin_nails.services.create!(service_type: "pedicure", category_id: 3, business_id: 13)

waleeta_nails.services.create!(service_type: "manicure", category_id: 3, business_id: 14)
waleeta_nails.services.create!(service_type: "pedicure", category_id: 3, business_id: 14)

sam_nails.services.create!(service_type: "manicure", category_id: 3, business_id: 15)
sam_nails.services.create!(service_type: "pedicure", category_id: 3, business_id: 15)

em_pierce.services.create!(service_type: "piercing", category_id: 2, business_id: 8)

noah_tat.services.create!(service_type: "tattoo", category_id: 2, business_id: 9)

tyler_tat.services.create!(service_type: "tattoo", category_id: 2, business_id: 10)

erin_hair.services.create!(service_type: "hair cut", category_id: 1, business_id: 2)
erin_hair.services.create!(service_type: "hair color", category_id: 1, business_id: 2)
erin_hair.services.create!(service_type: "hair style", category_id: 1, business_id: 2)

client = User.create!(name: "samleetin", password: "password", email: "samleetin@gmail.com")

client.appointments.create!(booked: true, start_time: DateTime.parse("2016-12-31 09:00:00"), end_time: DateTime.parse("2016-12-31 11:00:00"), service_id: 1, employee_id: 1)

client.appointments.create!(booked: true, start_time: DateTime.parse("2016-12-23 09:00:00"), end_time: DateTime.parse("2016-12-23 11:00:00"), service_id: 12, employee_id: 7)

matt_masseuse.appointments.create!(start_time: DateTime.parse("2017-01-20 18:00:00"), end_time: DateTime.parse("2017-01-20 19:00:00"), service_id: 7)

matt_masseuse.appointments.create!(start_time: DateTime.parse("2017-01-21 09:00:00"), end_time: DateTime.parse("2017-01-20 10:00:00"), service_id: 7)

erin_hair.appointments.create!(start_time: DateTime.parse("2017-01-21 11:00:00"), end_time: DateTime.parse("2017-01-20 12:00:00"), service_id: 2)

erin_hair.appointments.create!(start_time: DateTime.parse("2017-01-21 14:00:00"), end_time: DateTime.parse("2017-01-20 15:00:00"), service_id: 4)

noah_tat.appointments.create!(start_time: DateTime.parse("2017-01-20 19:00:00"), end_time: DateTime.parse("2017-01-20 21:00:00"), service_id: 5)

avner_facial.appointments.create!(start_time: DateTime.parse("2017-01-20 18:00:00"), end_time: DateTime.parse("2017-01-20 19:00:00"), service_id: 6)

duke_stylist.appointments.create!(start_time: DateTime.parse("2017-01-21 11:00:00"), end_time: DateTime.parse("2017-01-20 12:00:00"), service_id: 2)

ellie_tattoo.appointments.create!(start_time: DateTime.parse("2017-01-21 14:00:00"), end_time: DateTime.parse("2017-01-20 16:00:00"), service_id: 5)

bobby_hair.appointments.create!(start_time: DateTime.parse("2017-01-21 10:00:00"), end_time: DateTime.parse("2017-01-20 11:00:00"), service_id: 3)

