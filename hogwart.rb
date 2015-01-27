require "sinatra"
require "pry"


students = {
  0=>{
    id:0,
    name:"Harry Potter",
    age:"18",
    spell: "Accio"
  }
}
counter = 1

get "/students" do

  erb:index, locals:{students:students}

end

post "/student" do
  newstudent = {
    id:counter,
    name:params["name"],
    age:params["age"],
    spell:params["spell"]
  }
  students[counter] = newstudent
  counter += 1
  redirect "/students"

end

get "/student/:id" do #show individual student information

  this_student = students[params[:id].to_i] # its string we need to converted to number.

  erb :show, locals:{this_student:this_student}
end

put "/student/:id" do # this is updating
  student = students[params[:id].to_i]
  student [:name] = params["newname"]
  redirect "/students"

end

delete "/student/:id" do

  students.delete(params[:id].to_i)
  redirect "/students"
end
