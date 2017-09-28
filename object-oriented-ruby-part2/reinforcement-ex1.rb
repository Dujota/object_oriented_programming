project = {
  committee: ["Stella", "Salma", "Kai"],
  title: "Very Important Project",
  due_date: "December 1, 2019",
  id: "3284",

  steps: [
    {description: "conduct interviews",
    due_date: "August 1, 2018",},

    {description: "code of conduct",
    due_date: "January 1, 2018",},

    {description: "compile results" ,
    due_date: "November 10, 2018",},

    {description: "version 1" ,
    due_date: "January 15, 2019",},

    {description: "revisions" ,
    due_date: "March 30, 2019",},

    {description: "version 2" ,
    due_date: "July 12, 2019",},

    {description: "final edit" ,
    due_date: "October 1, 2019",},

    {description: "final version",
    due_date: "November 20, 2019",},

    {description: "ROI",
    due_date: "Jan 1, 2020",},
  ]
}


# Update this hash so that each step has the name of a committee member associated with it (i.e. by adding an additional person key in each step hash), and each committee member has an equal number of tasks. Avoid typing out the committee members' names elsewhere in your code.

# add a person key to steps hash
# add 1 person per step


#first step, output the target entry, in this case the has with :steps as the key, then try to see if we can add the new key with a test string to see if it works
count = 0

puts project[:steps].each { |add_member|
  add_member[:person] = project[:committee][count]
  count +=1 # if i just add count to count, only the 1st 3 will populate a vlaue after that it will put nil
  if count > 2
    count = 0
  end
  }
