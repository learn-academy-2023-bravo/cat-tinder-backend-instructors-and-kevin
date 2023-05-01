cats = [
  {
    name:"Kevin",
    age:9,
    enjoys: "talk to the dogs who walk by the window",
    image: "https://c2.peakpx.com/wallpaper/591/784/17/cat-animal-pet-cat-face-head-black-wallpaper-preview.jpg"
  },
  {
    name: "Mister",
    age:12,
    enjoys: "stealing human food from the table",
    image: "https://www.publicdomainpictures.net/pictures/200000/nahled/ragdoll-cat-with-green-eyes-14766395657Vf.jpg"
  },
  {
    name:"Luna",
    age:5,
    enjoys: "eating house plants and breaking stuff",
    image: 'https://petkeen.com/wp-content/uploads/2021/04/Blue-norwegian-forest-cat_Elisa-Putti_Shutterstock-760x507.jpg'
  },
  {
    name:"Maki",
    age: 1,
    enjoys: "talking to himself and singing",
    image: "https://c2.peakpx.com/wallpaper/296/908/856/cat-big-eyes-female-animal-fur-wallpaper-preview.jpg"
  },
]

cats.each do |cat|
  Cat.create cat
  puts "creating cat #{cat}"
end