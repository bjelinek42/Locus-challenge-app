# frozen_string_literal: true

home_chores = TaskList.create(name: 'Home Chores')
home_chores.tasks.create(description: 'Take out the trash', due_date: Date.current)
home_chores.tasks.create(description: 'Walk the dogs', due_date: Date.tomorrow)
home_chores.tasks.create(description: 'Do the dishes', due_date: Date.yesterday)
home_chores.tasks.create(description: 'Mow the lawn', due_date: 5.days.from_now)

work_tasks = TaskList.create(name: 'Work Tasks')
work_tasks.tasks.create(description: 'Sales meeting', due_date: Date.current)
work_tasks.tasks.create(description: 'Sales meeting', due_date: Date.tomorrow)
work_tasks.tasks.create(description: 'Call client', due_date: Date.yesterday)
work_tasks.tasks.create(description: 'Review leads', due_date: 3.days.ago)

school_tasks = TaskList.create(name: 'School Tasks')
school_tasks.tasks.create(description: 'Homework', due_date: Date.current)
school_tasks.tasks.create(description: 'Project', due_date: Date.tomorrow)
school_tasks.tasks.create(description: 'Email progrssor', due_date: Date.yesterday)
school_tasks.tasks.create(description: 'Register for classes', due_date: 5.days.ago)
