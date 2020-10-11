class RegisterController < ApplicationController

  # Maximum number of kids per tribe.
  MAX_NODES = 12000

  # POST to create a registration. Assign left and right nodes based on id.
  # IDs are divided by two and taken the ceiling to assign it to a parent node.
  # If it is an ID of 1, then it is a root node.
  def new
    if params["Tribes"] == 'Judah'
      new_node = Judah.new
      new_node.id = Judah.count + 1
    elsif params["Tribes"] == 'Reuben'
      new_node = Reuben.new
      new_node.id = Reuben.count + 1
    elsif params["Tribes"] == 'Gad'
      new_node = Gad.new
      new_node.id = Gad.count + 1
    elsif params["Tribes"] == 'Asher'
      new_node = Asher.new
      new_node.id = Asher.count + 1
    elsif params["Tribes"] == 'Naphtali'
      new_node = Naphtali.new
      new_node.id = Naphtali.count + 1
    elsif params["Tribes"] == 'Manasseh'
      new_node = Manasseh.new
      new_node.id = Manasseh.count + 1
    elsif params["Tribes"] == 'Simeon'
      new_node = Simeon.new
      new_node.id = Simeon.count + 1
    elsif params["Tribes"] == 'Levi'
      new_node = Levi.new
      new_node.id = Levi.count + 1
    elsif params["Tribes"] == 'Issachar'
      new_node = Issachar.new
      new_node.id = Issachar.count + 1
    elsif params["Tribes"] == 'Zebulun'
      new_node = Zebulun.new
      new_node.id = Zebulun.count + 1
    elsif params["Tribes"] == 'Joseph'
      new_node = Joseph.new
      new_node.id = Joseph.count + 1
    elsif params["Tribes"] == 'Benjamin'
      new_node = Benjamin.new
      new_node.id = Benjamin.count + 1
    else
      raise "Tribe was not assgined probably due to a typo."
    end

    new_node.first_name = params["firstname"]
    new_node.last_name = params["lastname"]
    new_node.email = params["email"]
    new_node.left_id = 0
    new_node.right_id = 0
    new_node.save!

    parent = assign_parent(new_node)
    if parent == nil
      welcome_first_tribe_member(parent)
    else
      notify_parent(parent, new_node)
      notify_child(parent, new_node)
    end
    redirect_to success_path
  end

  # GET page to show to register.
  def register
    # Figure out the list of available tribes.
    @tribes = get_tribes()
    render 'register'
  end

  # GET page to show on success.
  def success
    render 'success'
  end

private
  # Assign the parent node to a new child node.
  def assign_parent(child)
    return nil
    # TODO 
  end

  # Notify the parent node they have a new direct report.
  def notify_parent(parent, child)
    #TODO
  end

  # Notify the child they have a supervisor.
  def notify_child(parent, child)
    #TODO
  end

  # Welcome the first member of the tribe with id = 0
  def welcome_first_tribe_member(parent)
    #TODO
  end

  # Get the list of tribes one can join.
  def get_tribes()
    tribes = []
    if Judah.last == nil || Judah.count < MAX_NODES
      tribes.push("Judah") 
    end

    if Reuben.last == nil || Reuben.count < MAX_NODES
      tribes.push("Reuben")
    end

    if Gad.last == nil || Gad.count < MAX_NODES
      tribes.push("Gad")
    end

    if Asher.last == nil || Asher.count < MAX_NODES
      tribes.push("Asher")
    end

    if Naphtali.last == nil || Naphtali.count < MAX_NODES
      tribes.push("Naphtali")
    end

    if Manasseh.last == nil || Manasseh.count < MAX_NODES
      tribes.push("Manasseh")
    end

    if Simeon.last == nil || Simeon.count < MAX_NODES
      tribes.push("Simeon")
    end

    if Levi.last == nil || Levi.count < MAX_NODES
      tribes.push("Levi")
    end

    if Issachar.last == nil || Issachar.count < MAX_NODES
      tribes.push("Issachar")
    end

    if Zebulun.last == nil || Zebulun.count < MAX_NODES
      tribes.push("Zebulun")
    end

    if Joseph.last == nil || Joseph.count < MAX_NODES
      tribes.push("Joseph")
    end

    if Benjamin == nil || Benjamin.count < MAX_NODES
      tribes.push("Benjamin")
    end

    return tribes.shuffle
  end
end
