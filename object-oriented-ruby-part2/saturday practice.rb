class Book

@@on_shelf = []
@@on_loan = []

attr_accessor :due_date, :tilte, :author, :isbn

def intitialize(author, title, isbn)
  @atuhor = author
  @title = title
  @isbm = isbm
end

#---------- CLASS Methods ----------
def self.create(atuhor, title, isbn)
  @on_shelf << Book.new(author, title, isbn)
  return @on_shelf.last
end

def self.current_due_date

end

def self.overdue_books

end

def self.browse

end

def self.available

end

def self.borrowed

end




#---- INSANCE METHODS BEGIN HERE --------
def borrow

end

def return_to_library

end

def lent_out?

end


end


sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431"
