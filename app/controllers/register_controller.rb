class RegisterController < ApplicationController

  # Maximum number of kids per tribe.
  MAX_NODES = 12000

  # POST to create a registration. Assign left and right nodes based on id.
  # IDs are divided by two and taken the floor to assign it to a parent node.
  # If it is an ID of 1, then it is a root node.
  def new
    parent_id = 0
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

    new_node.first_name = params["first_name"]
    new_node.last_name = params["last_name"]
    new_node.email = params["email"]
    new_node.left_id = 0
    new_node.right_id = 0
    new_node.save!

    parent = assign_parent(new_node)
    if parent == nil
      welcome_first_tribe_member
    else
      notify_team_lead(parent)
      notify_new_member(parent)
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
    if child.id == 1
      return nil
    end
    parent = nil
    parent_id = (child.id.to_f/2.0).floor()
    if params["Tribes"] == 'Judah'
      parent = Judah.find_by_id(parent_id)
    elsif params["Tribes"] == 'Reuben'
      parent = Reuben.find_by_id(parent_id)
    elsif params["Tribes"] == 'Gad'
      parent = Gad.find_by_id(parent_id)
    elsif params["Tribes"] == 'Asher'
      parent = Asher.find_by_id(parent_id)
    elsif params["Tribes"] == 'Naphtali'
      parent = Naphtali.find_by_id(parent_id)
    elsif params["Tribes"] == 'Manasseh'
      parent = Manasseh.find_by_id(parent_id)
    elsif params["Tribes"] == 'Simeon'
      parent = Simeon.find_by_id(parent_id)
    elsif params["Tribes"] == 'Levi'
      parent = Levi.find_by_id(parent_id)
    elsif params["Tribes"] == 'Issachar'
      parent = Issachar.find_by_id(parent_id)
    elsif params["Tribes"] == 'Zebulun'
      parent = Zebulun.find_by_id(parent_id)
    elsif params["Tribes"] == 'Joseph'
      parent = Joseph.find_by_id(parent_id)
    elsif params["Tribes"] == 'Benjamin'
      parent = Benjamin.find_by_id(parent_id)
    else
      raise "Tribe was not assgined probably due to a typo."
    end
    if parent.left_id == 0
      parent.left_id = child.id
    elsif parent.right_id == 0
      parent.right_id = child.id
    else
      raise "Both left and right nodes were already assigned"
    end
    parent.save!
    return parent
  end

  # Notify the parent node they have a new direct report.
  def notify_team_lead(parent)
    NotifyTeamLeaderMailer.notify_team_leader(parent.email,
                                              parent.first_name,
                                              params["email"],
                                              params["first_name"],
                                              params["last_name"],
                                              params["Tribes"]).deliver
  end

  # Notify the child they have a supervisor.
  def notify_new_member(parent)
    NotifyNewMemberMailer.notify_new_member(params["email"],
                                            params["first_name"],
                                            parent.email,
                                            parent.first_name,
                                            parent.last_name,
                                            params["Tribes"]).deliver

  end

  # Welcome the first member of the tribe with id = 0
  def welcome_first_tribe_member
    WelcomeFirstTribeMemberMailer.welcome_first_tribe_member(params["email"],
                                                             params["first_name"],
                                                             params["Tribes"]).deliver
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
