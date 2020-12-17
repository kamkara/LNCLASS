596bebb3-b051-4729-88ea-74a637e1c178


 material_id: "3132c5a9-22ae-4ba0-b0cf-e19ad1f58c31"

 level_id: "596bebb3-b051-4729-88ea-74a637e1c178"


 level_id: "596bebb3-b051-4729-88ea-74a637e1c178",
  material_id: "3132c5a9-22ae-4ba0-b0cf-e19ad1f58c31"

 level_id: "596bebb3-b051-4729-88ea-74a637e1c178",
  material_id: "3132c5a9-22ae-4ba0-b0cf-e19ad1f58c31"

 level_id: "596bebb3-b051-4729-88ea-74a637e1c178",
  material_id: "3132c5a9-22ae-4ba0-b0cf-e19ad1f58c31"

   if current_user.role=="0"
      #student
      @materials = Material.all.order('created_at desc')
      #select all course only user.level DESC
      @courses = Course.where("course.level_id=?", current_user.level_id).order('created_at desc')
      #where("course.level_id=?", current_user.level_id)
    elsif current_user.role == '1'
      #select all course DESC
      #teacher
      @courses = Course.all.order('created_at desc')
      #where("course.material_id=?", current_user.material_id).order('created_at desc')
      @materials = Material.all.order('created_at desc')
      #where("course.material_id=?", current_user.material_id).order('created_at desc')

    elsif current_user.role == '2'
      #admin and other
    end
