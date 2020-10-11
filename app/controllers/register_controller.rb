class RegisterController < ApplicationController

  # Maximum number of kids per tribe.
  MAX_NODES = 144000

  # POST to create a registration.
  def new
  end

  # GET page to show to register.
  def register
    # Figure out the list of available tribes.
    @tribes = get_tribes()
    render 'register'
  end

  # GET page to show on success.
  def success
  end

private
  # Get the list of tribes one can join.
  def get_tribes()
    tribes = []

    if Judah.last.id != MAX_NODES
      tribes.push("Judah") 
    end

    if Reuben.last.id != MAX_NODES
      tribes.push("Reuben")
    end

    if Gad.last.id != MAX_NODES
      tribes.push("Gad")
    end

    if Asher.last.id != MAX_NODES
      tribes.push("Asher")
    end

    if Naphtali.last.id != MAX_NODES
      tribes.push("Naphtali")
    end

    if Manasseh.last.id != MAX_NODES
      tribes.push("Manasseh")
    end

    if Simeon.last.id != MAX_NODES
      tribes.push("Simeon"
    end

    if Levi.last.id != MAX_NODES
      tribes.push("Levi")
    end

    if Issachar.last.id != MAX_NODES
      tribes.push("Issachar")
    end

    if Zebulun.last.id != MAX_NODES
      tribes.push("Zebulun")
    end

    if Joseph.last.id != MAX_NODES
      tribes.push("Joseph")
    end

    if Benjamin.last.id != MAX_NODES
      tribes.push("Benjamin")
    end

    return tribes
  end
end
