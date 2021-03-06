//
//  AppLogic.swift
//  Project-X
//
//  Created by majeed on 14/03/2016.
//  Copyright © 2016 Almond Media Ltd. All rights reserved.
//

import Foundation

class App{
    static var Data : AppModel = AppModel()
    static var Memory : AppMemory = AppMemory();
    
    static func StartUp()
    {
        
        App.PrepareTemplates();
        App.GenerateAssignees();
        App.PrepareProjects();
        App.PrepareCustomUI();
        
    }
    
    static func PrepareTemplates()
    {
        let template1 = ProjectTemplate()
        template1.Title = "Building"
        template1.Description = "Lorem ipsum det imet gout et las vivas dout items"
        App.Data.Templates.append(template1)
        
        
        let template4 = ProjectTemplate()
        template4.Title = "Landscaping"
        template4.Description = "Lorem ipsum det imet gout et las vivas dout items"
        App.Data.Templates.append(template4)
        
        
        
        let template3 = ProjectTemplate()
        template3.Title = "Gardning"
        template3.Description = "Lorem ipsum det imet gout et las vivas dout items"
        App.Data.Templates.append(template3)
        
        
        let template5 = ProjectTemplate()
        template5.Title = "Renovation"
        template5.Description = "Lorem ipsum det imet gout et las vivas dout items"
        App.Data.Templates.append(template5)
        
        
        let template2 = ProjectTemplate()
        template2.Title = "Extension"
        template2.Description = "Lorem ipsum det imet gout et las vivas dout items"
        App.Data.Templates.append(template2)
        
        
        let template6 = ProjectTemplate()
        template6.Title = "Repairs"
        template6.Description = "Lorem ipsum det imet gout et las vivas dout items"
        App.Data.Templates.append(template6)
        
        
        
    }
    
    static func PrepareProjects()
    {
        let project1 = App.CreateProject("Sample Project", date: NSDate().addDays(13), budget: 8200.0, template: App.Data.Templates[4])
        App.Data.Projects = [project1]
        
        App.GenerateTasks(App.Data.Projects[0]);
        
    }
    
    static func GenerateTasks(project: Project)
    {
        let tasks : [Task] = [Task(), Task(), Task(), Task(), Task(), Task(), Task() ]
        
        tasks[0].Title = "Design"
        tasks[0].EndDate = NSDate().addDays(7);
        tasks[0].Assignee_Id = 1;
        
        tasks[1].Title = "Building"
        tasks[1].EndDate = NSDate().addDays(20);
        tasks[1].Assignee_Id = 2;
        
        tasks[2].Title = "Plumbing"
        tasks[2].EndDate = NSDate().addDays(30);
        tasks[2].Assignee_Id = 5;
        
        tasks[3].Title = "Carpentry"
        tasks[3].EndDate = NSDate().addDays(35);
        tasks[3].Assignee_Id = 7;
        
        tasks[4].Title = "Electrical"
        tasks[4].EndDate = NSDate().addDays(45);
        tasks[4].Assignee_Id = 4;
        
        tasks[5].Title = "Painting"
        tasks[5].EndDate = NSDate().addDays(48);
        tasks[5].Assignee_Id = 6;
        
        tasks[6].Title = "Decorating"
        tasks[6].EndDate = NSDate().addDays(52);
        tasks[6].Assignee_Id = 3;
        
        for index in 0 ... 5 {
            GenerateActivities(tasks[index])
        }
        
        project.ProjectItems = [ProjectItem()];
        project.ProjectItems[0].Tasks = tasks;
    }
    
    static func GenerateActivities(task : Task)
    {
        let activities : [Activity] = [Activity(), Activity(), Activity(), Activity(), Activity()]
        
        activities[0].Title = "Purchase Resources"
        activities[0].EndDate = NSDate().addDays(0);
        activities[0].Cost = 1200;
        activities[0].IsCompleted = true;
        
        activities[1].Title = "Basement Work"
        activities[1].EndDate = NSDate().addDays(0);
        activities[1].Cost = 200;
        
        activities[2].Title = "Ground Floor Work"
        activities[2].EndDate = NSDate().addDays(1);
        activities[2].Cost = 300;
        
        activities[3].Title = "Upstairs Work"
        activities[3].EndDate = NSDate().addDays(5);
        activities[3].Cost = 350;
        
        activities[4].Title = "Outside Work"
        activities[4].EndDate = task.EndDate
        activities[4].Cost = 700;
        
        task.Activities = activities;
        
    }
    
    static func GenerateAssignees()
    {
        let assignees : [Assignee] = [Assignee(), Assignee(), Assignee(), Assignee(), Assignee(), Assignee(), Assignee()];
        
        assignees[0].Id = 1
        assignees[0].Name = "Craig Federighi";
        assignees[0].JobTitle = "Architect";
        
        assignees[1].Id = 2
        assignees[1].Name = "Emannuel Ebate";
        assignees[1].JobTitle = "Constructor";
        
        assignees[5].Id = 3
        assignees[5].Name = "Angela Ahrendts";
        assignees[5].JobTitle = "Interior Designer";
        
        assignees[2].Id = 4
        assignees[2].Name = "Arun Gupta";
        assignees[2].JobTitle = "Electrician";
        
        assignees[3].Id = 5
        assignees[3].Name = "Marek Kowalek";
        assignees[3].JobTitle = "Plumber";
        
        assignees[4].Id = 6
        assignees[4].Name = "Jonny Doe";
        assignees[4].JobTitle = "Painter";
        
        assignees[6].Id = 7
        assignees[6].Name = "Adam White";
        assignees[6].JobTitle = "Carpenter";
        
        App.Data.Assignees = assignees;
    }
    
    
}